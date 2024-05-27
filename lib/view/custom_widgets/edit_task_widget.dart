import 'package:flutter/material.dart';
import 'package:namer_app/view/custom_widgets/custom_datechooser.dart';
import 'package:namer_app/controller/task_menu_controller.dart';
import 'package:namer_app/model/task.dart';

class EditTaskDialog extends StatefulWidget {
  final int? id;
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
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            SizedBox(
              width: 20, // Add more space between the buttons
            ),
            if (widget.id != null) // Check if task is being edited
              FloatingActionButton(
                onPressed: () {
                  widget.taskMenuController!.deleteTask(widget.id!);
                  widget.onEdit!();
                  Navigator.of(context).pop();
                },
                child: Text('Delete'),
              ),
            SizedBox(
              width: 20, // Add more space between the buttons
            ),
            FloatingActionButton(
              onPressed: () {
                widget.taskMenuController!.editTask(
                  widget.id,
                  Task(
                    id: widget.id ?? 0,
                    title: _titleController.text,
                    description: _descriptionController.text,
                    date: dateTime,
                  ),
                );
                widget.onEdit!();
                Navigator.pop(context);
              },
              child: Text('Save'),
            ),
          ],
        ),
      ],
    );
  }
}
