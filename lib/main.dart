import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:namer_app/controller/login_controller.dart';
import 'package:namer_app/firebase_options.dart';
import 'package:namer_app/view/login_views/login_screen.dart';
import 'package:namer_app/constants/app_constants.dart';
import 'package:namer_app/controller/task_menu_controller.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginController(),
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
