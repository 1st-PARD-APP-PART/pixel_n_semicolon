import 'package:flutter/material.dart';
import 'package:pixel_n_semicolon/home_screen.dart';

import 'lock_screen.dart';

class PixelNSemicolon extends StatelessWidget {
  const PixelNSemicolon({Key? key}) : super(key: key);

  final bool flag = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PixelNSemicolon',
      initialRoute: flag ? '/lock' : '/login',
      routes: {
        '/lock': (BuildContext context) => const LockPage(),
        '/home': (BuildContext context) =>
            const MyHomePage(title: 'Flutter Local Notifications'),
      },
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'DungGeunMo',
      ),
    );
  }
}
