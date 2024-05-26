import 'package:flutter/material.dart';
import 'package:namer_app/model/task.dart';
import 'package:intl/intl.dart';

class TaskWidget extends StatefulWidget {
  final Task task;
  final StatefulWidget? popUpScreen;

  const TaskWidget({
    Key? key,
    required this.task,
    this.popUpScreen,
  }) : super(key: key);

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  bool checked = false;

  @override
  Widget build(BuildContext context) {
    print(widget.task.title);
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: ListTile(
          enabled: true,
          selected: checked,
          onTap: () async {
            if (widget.popUpScreen != null) {
              final updatedTask = await showDialog<Task>(
                context: context,
                builder: (BuildContext context) => widget.popUpScreen!,
              );
              if (updatedTask != null) {
                setState(() {
                  widget.task.title = updatedTask.title;
                  widget.task.description = updatedTask.description;
                  widget.task.date = updatedTask.date;
                });
              }
            }
          },
          title: Text(widget.task.title),
          subtitle: Text(widget.task.description),
          leading: Checkbox(
            shape: CircleBorder(),
            value: checked,
            onChanged: (bool? value) {
              setState(() {
                checked = value!;
              });
            },
          ),
          trailing: Text(widget.task.date != null
              ? DateFormat('dd-MM-yyyy').format(widget.task.getDate!)
              : ' '),
        ),
      ),
    ); // Replace with your widget
  }
}
