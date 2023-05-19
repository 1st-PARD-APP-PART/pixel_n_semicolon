import 'package:flutter/material.dart';
import 'package:pixel_n_semicolon/lock_screen.dart';
import 'notifi_service.dart';

import 'home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService().initNotification();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final bool flag = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Notifications',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'DungGeunMo',
      ),
      home: flag
          ? const LockPage()
          : const MyHomePage(title: 'Flutter Local Notifications'),
    );
  }
}
