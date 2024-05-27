import 'package:flutter/material.dart';
import 'package:namer_app/model/task.dart';
import 'package:intl/intl.dart';

class TaskWidget extends StatefulWidget {
  final Task task;
  final StatefulWidget? popUpScreen;
  final Function(bool?)? onChecked;
  final Function(Task?)? onEdit;

  const TaskWidget({
    Key? key,
    required this.task,
    this.popUpScreen,
    this.onChecked,
    this.onEdit,
  }) : super(key: key);

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: ListTile(
          enabled: true,
          onTap: () async {
            print('reached inside task widget');
            if (widget.popUpScreen != null) {
              //espera a cambios en el editor de la tarea
              await showDialog(
                context: context,
                builder: (context) => widget.popUpScreen!,
              );
            }
          },
          title: Text(widget.task.title),
          subtitle: Text(widget.task.description),
          leading: Checkbox(
            shape: CircleBorder(),
            value: widget.task.checked,
            onChanged: widget.onChecked,
          ),
          trailing: Text(DateFormat('dd-MM-yyyy').format(widget.task.getDate!)),
        ),
      ),
    ); // Replace with your widget
  }
}
