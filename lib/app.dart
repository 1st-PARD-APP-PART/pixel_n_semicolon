import 'package:flutter/material.dart';

import 'lock_screen.dart';

class PixelNSemicolon extends StatelessWidget {
  const PixelNSemicolon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PixelNSemicolon',
      initialRoute: '/login',
      routes: {
        '/lock': (BuildContext context) => const LockPage(),
      },
      theme: ThemeData.light(useMaterial3: true),
    );
  }
}
