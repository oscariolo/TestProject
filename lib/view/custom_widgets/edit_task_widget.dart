import 'package:flutter/material.dart';
import 'package:namer_app/view/custom_widgets/custom_datechooser.dart';
import 'package:namer_app/controller/task_menu_controller.dart';
import 'package:namer_app/model/task.dart';

class EditTaskDialog extends StatefulWidget {
  final String? id;
  final TaskMenuController? taskMenuController;
  final Function()? onEdit;

  EditTaskDialog({
    this.id,
    this.taskMenuController,
    this.onEdit,
  });

  @override
  State<EditTaskDialog> createState() => _EditTaskDialogState();
}

class _EditTaskDialogState extends State<EditTaskDialog> {
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  late DateTime dateTime;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(
        text: widget.taskMenuController!.taskMap[widget.id]?.title ?? '');
    _descriptionController = TextEditingController(
        text: widget.taskMenuController!.taskMap[widget.id]?.description ?? '');
    dateTime =
        widget.taskMenuController!.taskMap[widget.id]?.date ?? DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Edit your task'),
      content: Column(
        children: <Widget>[
          TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Title',
                labelStyle:
                    TextStyle(color: Theme.of(context).secondaryHeaderColor),
              ),
              style: TextStyle(color: Colors.black)),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: _descriptionController,
            decoration: InputDecoration(
              labelText: 'Description',
              labelStyle:
                  TextStyle(color: Theme.of(context).secondaryHeaderColor),
            ),
            style: TextStyle(color: Colors.black),
          ),
          SizedBox(
            height: 20,
          ),
          CustomDateChooser(
            initialDate: dateTime,
            onDateChanged: (newDate) {
              setState(() {
                dateTime = newDate;
              });
            },
          ),

          // Add your date picker here
        ],
      ),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            FloatingActionButton(
              backgroundColor: Theme.of(context).primaryColor,
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Cancel',
                style: TextStyle(color: Theme.of(context).secondaryHeaderColor),
              ),
            ),
            SizedBox(
              width: 20, // Add more space between the buttons
            ),
            if (widget.id != null) // Check if task is being edited
              FloatingActionButton(
                backgroundColor: Theme.of(context).primaryColor,
                onPressed: () {
                  widget.taskMenuController!.deleteTask(widget.id!);
                  widget.onEdit!();
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Delete',
                  style: TextStyle(
                    color: Theme.of(context).secondaryHeaderColor,
                  ),
                ),
              ),
            SizedBox(
              width: 20, // Add more space between the buttons
            ),
            FloatingActionButton(
              backgroundColor: Theme.of(context).primaryColor,
              onPressed: () {
                widget.taskMenuController!.editTask(
                  widget.id,
                  Task(
                    id: widget.id ?? '',
                    title: _titleController.text,
                    description: _descriptionController.text,
                    date: dateTime,
                  ),
                );
                widget.onEdit!();
                Navigator.pop(context);
              },
              child: Text(
                'Save',
                style: TextStyle(color: Theme.of(context).secondaryHeaderColor),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
