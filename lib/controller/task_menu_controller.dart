import 'package:flutter/material.dart';
import 'package:namer_app/model/task.dart';

class TaskMenuController extends ChangeNotifier {
  List<Task> taskList = [];

  void toggleTaskCompletion(int index) {
    taskList[index].checked = !taskList[index].checked;
    notifyListeners();
  }

  void exampleGenerate() {
    taskList.add(Task(id: 1, title: 'Hola'));
    taskList.add(Task(id: 2, title: 'Si', description: 'SDA'));
  }

  void editTask(
      int index, String? newTitle, String? newDescription, DateTime? newDate) {
    if (newTitle != null) {
      taskList[index].title = newTitle;
    }
    if (newDescription != null) {
      taskList[index].description = newDescription;
    }
    if (newDate != null) {
      taskList[index].date = newDate;
    }
    notifyListeners();
  }

  void deleteTask(int index) {
    taskList.remove(index);
    notifyListeners();
  }
}
