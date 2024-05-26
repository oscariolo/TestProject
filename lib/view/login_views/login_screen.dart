import 'package:flutter/material.dart';
import 'package:namer_app/constants/app_constants.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                foregroundColor:
                    Theme.of(context).secondaryHeaderColor, // background color
                backgroundColor: Theme.of(context).focusColor,
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
