import 'package:flutter/material.dart';
import 'package:namer_app/view/login_views/login_screen.dart';
import 'package:namer_app/constants/app_constants.dart';
import 'package:namer_app/controller/task_menu_controller.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskMenuController(),
      child: MaterialApp(
        title: 'WillDo App',
        theme: ThemeData(
            primaryColor: Appconstants.primaryColor,
            secondaryHeaderColor: Appconstants.secondaryColor,
            focusColor: Appconstants.tertiaryColor,
            fontFamily: 'Virgil'),
        home: _getPage(),
      ),
    );
  }

  Widget _getPage() {
    return LoginScreen();
  }
}
