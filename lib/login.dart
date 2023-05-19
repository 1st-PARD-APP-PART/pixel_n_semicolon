import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 250.0),
            const SizedBox(height: 120.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 1,
                fixedSize: const Size(275, 50),
                shape: const BeveledRectangleBorder(),
                backgroundColor: const Color.fromARGB(213, 255, 134, 134),
              ),
              onPressed: () async {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('구글 로그인 되었습니다'),
                  ),
                );
                Navigator.pushNamed(context, '/add');
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 25,
                  ),
                  Text(
                    "GOOGLE",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15.0),
          ],
        ),
      ),
    );
  }
}
