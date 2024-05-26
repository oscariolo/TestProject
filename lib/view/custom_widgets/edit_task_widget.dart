import 'package:flutter/material.dart';
import 'package:namer_app/controller/editcreate_task_controller.dart';
import 'package:namer_app/view/custom_widgets/custom_datechooser.dart';

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
      dateTime: widget.initialDate ?? DateTime.now(),
    );
    return AlertDialog(
      title: Text('Edit yout task'),
      content: Column(
        children: <Widget>[
          TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Title'),
              style: TextStyle(color: Theme.of(context).secondaryHeaderColor)),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: _descriptionController,
            decoration: InputDecoration(labelText: 'Description'),
            style: TextStyle(color: Theme.of(context).secondaryHeaderColor),
          ),
          SizedBox(
            height: 20,
          ),
          CustomDateChooser(
            controller: editController,
          ),

          // Add your date picker here
        ],
      ),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            FloatingActionButton(
              onPressed: editController.cancel,
              child: Text('Cancel'),
            ),
            SizedBox(
              width: 20, // Add more space between the buttons
            ),
            if (editController.id != null) // Check if task is being edited
              FloatingActionButton(
                onPressed: editController.deleteTask,
                child: Text('Delete'),
              ),
            SizedBox(
              width: 20, // Add more space between the buttons
            ),
            FloatingActionButton(
              onPressed: editController.saveTask,
              child: Text('Save'),
            ),
          ],
        ),
      ],
    );
  }
}
