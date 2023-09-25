import 'dart:async';
import 'package:flutter/material.dart';
import 'package:qhire/first.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  void initState(){
    super.initState();
    Timer(Duration(seconds: 4),
            ()=>Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>First())));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(0, 255, 255, 255),
              gradient: LinearGradient(
                colors: [ Color.fromARGB(255, 255, 255, 255),
                 Color.fromARGB(0, 255, 255, 255)],
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 80, // Adjust the radius as per your requirement
                backgroundColor: const Color.fromARGB(221, 255, 255, 255),
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: ClipOval(
                    child: Image.asset(
                      'assets/logo1.png', // Replace with your logo image path
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.0),
              ),
              // Text(
              //   FlutterI18n.translate(context, "QHire"),
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 24.0,
              //   ),
              // ),
            ],
          ),
        ],
      ),
    );
  }
}