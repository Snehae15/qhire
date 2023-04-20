import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qhire/editprofile.dart';
import 'package:qhire/home.dart';
import 'package:qhire/homepage.dart';
import 'package:qhire/homepage1.dart';
import 'package:qhire/q&a.dart';
import 'package:qhire/suggestion.dart';

class Mainhome extends StatefulWidget {
  const Mainhome({Key? key}) : super(key: key);

  @override
  State<Mainhome> createState() => _MainhomeState();
}

class _MainhomeState extends State<Mainhome> {
  int currentindex=0;
  final pages=[

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    //     appBar: AppBar(
    //     title: Text("Q-Hire"),
    // centerTitle: true,

    );
  }
}
