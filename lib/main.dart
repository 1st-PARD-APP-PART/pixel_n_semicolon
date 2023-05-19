import 'package:flutter/material.dart';
import 'package:pixel_n_semicolon/lock_screen.dart';
import 'notifi_service.dart';
import 'home_screen.dart';
import 'app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService().initNotification();
  runApp(const PixelNSemicolon());
}
