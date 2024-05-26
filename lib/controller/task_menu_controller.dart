import 'package:flutter/material.dart';
import 'package:namer_app/model/task.dart';

class TaskMenuController extends ChangeNotifier {
  Map<int, Task> taskMap = {};

  List<Task> filterListCompleted(bool? completed) {
    if (completed != null) {
      return taskMap.values.where((task) => task.checked == completed).toList();
    }
    return taskMap.values.toList();
  }

  void toggleTaskCompletion(int id) {
    taskMap[id]?.checked = !(taskMap[id]?.checked ?? false);
    notifyListeners();
  }

  void exampleGenerate() {
    taskMap[1] = Task(id: 1, title: 'Hola');
    taskMap[2] = Task(id: 2, title: 'Si', description: 'SDA');
  }

  int getNewIndex() {
    for (int i = 1; i <= taskMap.length + 1; i++) {
      if (!taskMap.containsKey(i)) {
        return i;
      }
    }
    return 1;
  }

  void addTask(Task newtask) {
    int newIndex = getNewIndex();
    taskMap[newIndex] = Task(
      id: newIndex,
      title: newtask.title,
      description: newtask.description,
      checked: newtask.checked,
    );
    notifyListeners();
  }
}
