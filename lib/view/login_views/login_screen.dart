import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:namer_app/constants/app_constants.dart';
import 'package:namer_app/view/main_views/main_task_view.dart';
import 'package:namer_app/controller/login_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 20.0),
            Text(
              "Will-Do",
              style: TextStyle(
                color: Theme.of(context).secondaryHeaderColor,
                fontSize: 30,
              ),
            ),
            Divider(
              color: Theme.of(context).secondaryHeaderColor,
              height: 30,
            ),
            SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              width: 700,
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Usuario:",
                    style: TextStyle(fontSize: 20),
                  ),
                  TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Usuario o correo electronico'),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Contraseña:",
                    style: TextStyle(fontSize: 20),
                  ),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Contraseña',
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Recuerdame: "),
                      Text("Olivde mi contraseña"),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black, // background color
                backgroundColor: Theme.of(context).secondaryHeaderColor,
                minimumSize: Size(200, 50),
              ),
              child: const Text('Login'),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Divider(
                    color: Theme.of(context).secondaryHeaderColor,
                    height: 50,
                  ),
                ),
                Text(
                  "OR",
                  style: TextStyle(color: Appconstants.secondaryColor),
                ),
                Expanded(
                  child: Divider(
                    color: Theme.of(context).secondaryHeaderColor,
                    height: 50,
                  ),
                ),
              ],
            ),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => MainTaskView()));
              },
              label: Text(
                'Google',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              icon: SizedBox(
                width: 30,
                height: 30,
                child: Image.asset('lib/assets/icons/GoogleIcon.png'),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton.icon(
              onPressed: () {},
              label: Text(
                'X',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              icon: SizedBox(
                width: 30,
                height: 30,
                child: Image.asset('lib/assets/icons/X-Icon.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
