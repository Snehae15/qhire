import 'package:flutter/material.dart';
//import 'package:qhire/q&a.dart';
//import 'package:qhire/editpost.dart';
//import 'package:qhire/viewprofile.dart';
//import 'package:qhire/user.dart';
//import 'package:qhire/add%20post.dart';
//import 'package:qhire/home.dart';
import 'package:qhire/register.dart';

//import 'login.dart';

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
      home: Reg(),
    );
  }
}

