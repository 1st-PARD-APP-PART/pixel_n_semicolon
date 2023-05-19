import 'package:flutter/material.dart';

import 'util/authentication.dart';
import 'util/google_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 200.0),
            Column(
              children: <Widget>[
                Image.asset('assets/splash.png'),
                const SizedBox(height: 16.0),
                const Text(
                  '‘ㅗ\' Task Manager',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 200.0),
            FutureBuilder(
              future: Authentication.initializeFirebase(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Text('Error initializing Firebase');
                } else if (snapshot.connectionState == ConnectionState.done) {
                  return const GoogleSignInButton();
                }
                return const CircularProgressIndicator(
                  color: Colors.orange,
                );
              },
            ),
            const SizedBox(height: 15.0),
          ],
        ),
      ),
    );
  }
}
