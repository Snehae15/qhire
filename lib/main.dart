import 'package:flutter/material.dart';
import 'package:qhire/chatboat.dart';
//import 'package:qhire/addabout.dart';
//import 'package:qhire/addeducation.dart';
//import 'package:qhire/chatboat.dart';
import 'package:qhire/viewpost.dart';
//import 'package:qhire/q&a.dart';
//import 'package:qhire/view%20news.dart';
//import 'package:qhire/home.dart';
//import 'package:qhire/editpost.dart';
//import 'package:qhire/viewprofile.dart';
//import 'package:qhire/user.dart';
//import 'package:qhire/add%20post.dart';
//import 'package:qhire/home.dart';
//import 'package:qhire/register.dart';
//import 'package:qhire/view%20news.dart';

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
       home: Viewpost(),
    );
  }
}

