import 'package:flutter/material.dart';
import 'package:namer_app/model/task.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TaskMenuController extends ChangeNotifier {
  Map<String, Task> taskMap = {};
  String? userId;
  TaskMenuController({this.userId}) {
    fetchTasks();
  }

  List<Task> filterListCompleted(bool? completed) {
    if (completed != null) {
      return taskMap.values.where((task) => task.checked == completed).toList();
    }
    return taskMap.values.toList();
  }

  void toggleTaskCompletion(String id) async {
    taskMap[id]?.checked = !(taskMap[id]?.checked ?? false);
    await FirebaseFirestore.instance.collection('tasks').doc(id).update({
      'checked': taskMap[id]?.checked,
    });
    notifyListeners();
  }

  // void exampleGenerate() {
  //   taskMap[1] = Task(id: 1, title: 'Hola');
  //   taskMap[2] = Task(id: 2, title: 'Si', description: 'SDA');
  // }

  void deleteTask(String id) async {
    await FirebaseFirestore.instance.collection('tasks').doc(id).delete();

    taskMap.remove(id);
    notifyListeners();
  }

  void editTask(String? id, Task newTask) async {
    if (id == null) {
      addTask(newTask);
    } else {
      await FirebaseFirestore.instance.collection('tasks').doc(id).update({
        'title': newTask.title,
        'description': newTask.description,
        'date': newTask.date,
        'checked': newTask.checked,
      });

      taskMap[id] = newTask;
    }
    notifyListeners();
  }

  void addTask(Task newtask) async {
    String newIndex = await getNewIndex(newtask);
    taskMap[newIndex] = Task(
      id: newIndex,
      title: newtask.title,
      description: newtask.description,
      date: newtask.date,
      checked: newtask.checked,
    );
    notifyListeners();
  }

  List<dynamic> loadTasksFromDatabase() {
    print("reached here");
    fetchTasks();
    return taskMap.values.toList();
  }

  Future<void> fetchTasks() async {
    print('enters here');
    if (userId == '') return;

    final querySnapshot = await FirebaseFirestore.instance
        .collection('tasks')
        .where('userId', isEqualTo: userId)
        .get();

    taskMap = {};
    for (final doc in querySnapshot.docs) {
      final task = Task.fromMap(doc.data(), doc.id);
      taskMap[task.id] = task;
    }
    print(taskMap.values.toList());
  }

  Future<String> getNewIndex(Task newTask) async {
    DocumentReference docRef =
        await FirebaseFirestore.instance.collection('tasks').add({
      'title': newTask.title,
      'description': newTask.description,
      'date': newTask.date,
      'checked': newTask.checked,
      'userId': userId,
    });
    newTask.id = docRef.id;
    return docRef.id;
  }
}
