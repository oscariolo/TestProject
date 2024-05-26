import 'package:flutter/material.dart';
import 'package:namer_app/view/custom_widgets/task_widget.dart';
import 'package:namer_app/view/custom_widgets/custom_add_floatingbutton.dart';
import 'package:namer_app/controller/task_menu_controller.dart';
import 'package:namer_app/view/custom_widgets/edit_task_widget.dart';

class MainTaskView extends StatefulWidget {
  final TaskMenuController taskController;

  const MainTaskView({super.key, required this.taskController});

  @override
  State<MainTaskView> createState() => _MainTaskViewState();
}

class _MainTaskViewState extends State<MainTaskView> {
  @override
  Widget build(BuildContext context) {
    final taskList = widget.taskController.taskList;
    widget.taskController.exampleGenerate();
    const List<String> list = <String>['Todos', 'Completadas', 'Pendientes'];
    String dropdownValue = 'Todos';
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                focusColor: Theme.of(context).primaryColor,
                value: dropdownValue,
                items: list.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {},
              ),
            ),
            Divider(
              height: 10,
              color: Theme.of(context).secondaryHeaderColor,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50.0),
              child: Column(
                children: taskList
                    .map((task) => TaskWidget(
                          task: task,
                          popUpScreen: EditTaskDialog(
                            id: task.getId,
                            initialTitle: task.title,
                            initialDescription: task.description,
                            initialDate: task.date,
                          ),
                        ))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CustomFloatingActionButton(
        onPressed: () {},
      ),
    );
  }
}
