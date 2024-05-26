import 'package:flutter/material.dart';
import 'package:namer_app/controller/editcreate_task_controller.dart';

class EditTaskDialog extends StatefulWidget {
  final int? id;
  final String? initialTitle;
  final String? initialDescription;
  final DateTime? initialDate;

  EditTaskDialog(
      {this.id, this.initialDate, this.initialDescription, this.initialTitle});

  @override
  State<EditTaskDialog> createState() => _EditTaskDialogState();
}

class _EditTaskDialogState extends State<EditTaskDialog> {
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.initialTitle);
    _descriptionController =
        TextEditingController(text: widget.initialDescription);
  }

  @override
  Widget build(BuildContext context) {
    final editController = EditcreateTaskController(
      context: context,
      id: widget.id,
      titleController: _titleController,
      descriptionController: _descriptionController,
    );
    return AlertDialog(
      title: Text('Edit Task'),
      content: Column(
        children: <Widget>[
          TextField(
            controller: _titleController,
            decoration: InputDecoration(labelText: 'Title'),
          ),
          TextField(
            controller: _descriptionController,
            decoration: InputDecoration(labelText: 'Description'),
          ),
          // Add your date picker here
        ],
      ),
      actions: <Widget>[
        FloatingActionButton(
          onPressed: editController.cancel,
          child: Text('Cancel'),
        ),
        FloatingActionButton(
          onPressed: editController.saveTask,
          child: Text('Save'),
        ),
      ],
    );
  }
}
