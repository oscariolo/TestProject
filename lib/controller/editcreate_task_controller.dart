import 'package:flutter/material.dart';
import 'package:namer_app/model/task.dart';

class EditcreateTaskController {
  late BuildContext context;
  late int? id;
  late TextEditingController titleController;
  late TextEditingController descriptionController;

  EditcreateTaskController(
      {this.id,
      required this.context,
      required this.titleController,
      required this.descriptionController});

  void saveTask() {
    //si es que es editar un task, solo genera un task con los atributos necesarios para el cambio
    //si no, entonces el id no existe y se debe generar un nuevo id para el task
    var newtask = Task();
    if (id != null) {
      //significa que esta editando una tarea creada
      newtask = Task(
        title: titleController.text,
        description: descriptionController.text,
      );
    } else {
      newtask = Task(
          id: 100,
          title: titleController.text,
          description: descriptionController.text);
      print("new task created");
    }
    Navigator.of(context).pop(newtask);
  }

  void cancel() {
    Navigator.of(context).pop();
  }
}
