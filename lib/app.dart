import 'package:flutter/material.dart';

import 'add.dart';
import 'group.dart';
import 'login.dart';
import 'ranking.dart';
import 'todo.dart';

class PixelNSemicolon extends StatelessWidget {
  const PixelNSemicolon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PixelNSemicolon',
      initialRoute: '/login',
      routes: {
        '/login': (BuildContext context) => const LoginPage(),
        '/group': (BuildContext context) => const GroupPage(),
        '/ranking': (BuildContext context) => const RankingPage(),
        '/todo': (BuildContext context) => const TodoPage(),
        '/add': (BuildContext context) => const AddPage(),
      },
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'DungGeunMo',
      ),
    );
  }
}
