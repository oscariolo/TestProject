import 'package:flutter/material.dart';
import 'package:namer_app/constants/app_constants.dart';
import 'package:namer_app/controller/task_menu_controller.dart';
import 'package:namer_app/view/login_views/register_screen.dart';
import 'package:namer_app/view/main_views/main_task_view.dart';
import 'package:namer_app/controller/login_controller.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final LoginController _loginController;
  final TextEditingController user = TextEditingController();
  final TextEditingController password = TextEditingController();
  @override
  void initState() {
    super.initState();
    _loginController = Provider.of<LoginController>(context, listen: false);
  }

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
                    controller: user,
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
                    controller: password,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    var userLogged = await _loginController
                        .signInWithEmailAndPassword(user.text, password.text);
                    if (userLogged != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChangeNotifierProvider(
                            create: (context) => TaskMenuController(),
                            child: MainTaskView(),
                          ),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black, // background color
                    backgroundColor: Theme.of(context).secondaryHeaderColor,
                    minimumSize: Size(200, 50),
                  ),
                  child: const Text('Login'),
                ),
                SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RegisterScreen(_loginController),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black, // background color
                    backgroundColor: Theme.of(context).primaryColor,
                    minimumSize: Size(200, 50),
                  ),
                  child: const Text('Registrarse'),
                ),
              ],
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
              onPressed: () {},
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
