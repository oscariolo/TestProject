import 'package:flutter/material.dart';
import 'package:namer_app/model/task.dart';

class EditcreateTaskController {
  late BuildContext context;
  late int? id;
  late TextEditingController titleController;
  late TextEditingController descriptionController;
  late DateTime dateTime;

  EditcreateTaskController({
    this.id,
    required this.context,
    required this.titleController,
    required this.descriptionController,
    required this.dateTime,
  });

  void saveTask() {
    //si es que es editar un task, solo genera un task con los atributos necesarios para el cambio
    //si no, entonces el id no existe y se debe generar un nuevo id para el task
    var newtask = Task();
    if (id != null) {
      //significa que esta editando una tarea creada
      newtask = Task(
        id: id!,
        title: titleController.text,
        description: descriptionController.text,
        date: dateTime,
      );
    } else {
      newtask = Task(
        title: titleController.text,
        description: descriptionController.text,
        date: dateTime,
      );
    }
    Navigator.of(context).pop(newtask);
  }

  void deleteTask() {
    Navigator.of(context).pop(null);
  }

  void cancel() {
    Navigator.of(context).pop();
  }
}
