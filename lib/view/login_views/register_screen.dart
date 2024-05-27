import 'package:namer_app/controller/login_controller.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  final LoginController loginController;
  const RegisterScreen(this.loginController);

  @override
  Widget build(BuildContext context) {
    TextEditingController user = TextEditingController();
    TextEditingController password = TextEditingController();
    TextEditingController confirmPassword = TextEditingController();

    return Scaffold(
      body: Center(
        widthFactor: 700,
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
                        labelText: 'Correo electronico'),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Contraseña:",
                    style: TextStyle(fontSize: 20),
                  ),
                  TextField(
                    controller: password,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Contraseña'),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Confirmar contraseña:",
                    style: TextStyle(fontSize: 20),
                  ),
                  TextField(
                    controller: confirmPassword,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Confirmar contraseña'),
                  ),
                  SizedBox(height: 10),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () async {
                            var userRegistered = await loginController
                                .registerWithEmailAndPassword(user.text,
                                    password.text, confirmPassword.text);
                            if (userRegistered != null) {
                              Navigator.pop(context);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.black,
                            backgroundColor:
                                Theme.of(context).secondaryHeaderColor,
                          ),
                          child: Text('Registrarse'),
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.black,
                            backgroundColor: Theme.of(context).primaryColor,
                          ),
                          child: Text('Cancelar'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
