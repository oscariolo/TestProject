import 'package:flutter/material.dart';
import 'package:namer_app/view/custom_widgets/task_widget.dart';
import 'package:namer_app/view/custom_widgets/custom_add_floatingbutton.dart';
import 'package:namer_app/controller/task_menu_controller.dart';
import 'package:namer_app/view/custom_widgets/edit_task_widget.dart';
import 'package:provider/provider.dart';

class MainTaskView extends StatefulWidget {
  const MainTaskView({super.key});

  @override
  State<MainTaskView> createState() => _MainTaskViewState();
}

class DropDownController extends ChangeNotifier {
  String dropdownValue = 'Todos';
}

class _MainTaskViewState extends State<MainTaskView> {
  String dropdownValue = 'Todos';
  var taskList = [];
  final List<String> list = <String>['Todos', 'Completadas', 'Pendientes'];
  @override
  Widget build(BuildContext context) {
    TaskMenuController taskMenuState = context.watch<TaskMenuController>();
    taskList = taskMenuState.loadTasksFromDatabase();
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FloatingActionButton(
                  backgroundColor: Theme.of(context).primaryColor,
                  child: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
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
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        setState(() {
                          dropdownValue = newValue;
                          switch (newValue) {
                            case 'Todos':
                              taskList =
                                  taskMenuState.filterListCompleted(null);
                            case 'Completadas':
                              taskList =
                                  taskMenuState.filterListCompleted(true);
                            case 'Pendientes':
                              taskList =
                                  taskMenuState.filterListCompleted(false);
                          }
                        });
                      }
                    },
                  ),
                ),
              ],
            ),
            Divider(
              height: 10,
              color: Theme.of(context).secondaryHeaderColor,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 50.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: taskList
                        .map((task) => TaskWidget(
                              task: task,
                              popUpScreen: EditTaskDialog(
                                id: task.getId,
                                taskMenuController: taskMenuState,
                                onEdit: () {
                                  updateTaskList(dropdownValue, taskMenuState);
                                },
                              ),
                              onChecked: (value) {
                                setState(() {
                                  taskMenuState
                                      .toggleTaskCompletion(task.getId);
                                  updateTaskList(dropdownValue, taskMenuState);
                                });
                              },
                            ))
                        .toList(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CustomFloatingActionButton(onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) => EditTaskDialog(
            taskMenuController: taskMenuState,
            onEdit: () {
              updateTaskList(dropdownValue, taskMenuState);
            },
          ),
        );
      }),
    );
  }

  void updateTaskList(String newValue, TaskMenuController taskMenuState) {
    setState(() {
      dropdownValue = newValue;
      switch (newValue) {
        case 'Todos':
          taskList = taskMenuState.filterListCompleted(null);
        case 'Completadas':
          taskList = taskMenuState.filterListCompleted(true);
        case 'Pendientes':
          taskList = taskMenuState.filterListCompleted(false);
      }
    });
  }
}
