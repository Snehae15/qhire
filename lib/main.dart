import 'package:flutter/material.dart';
import 'package:qhire/splash.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Qhire',
      theme: ThemeData(
      ),
       home: Splash(),
    );
  }
}

