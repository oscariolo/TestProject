import 'package:flutter/material.dart';
import 'package:namer_app/model/task.dart';

class EditcreateTaskController {
  Task? task;
  late BuildContext context;
  late TextEditingController titleController;
  late TextEditingController descriptionController;

  EditcreateTaskController(
      {this.task,
      required this.context,
      required this.titleController,
      required this.descriptionController});

  void saveTask() {
    //method to save the new or edited task and send it back to the main menu

    Navigator.of(context).pop(task);
  }

  void cancel() {
    Navigator.of(context).pop();
  }
}
