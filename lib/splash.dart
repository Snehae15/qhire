import 'dart:async';
import 'package:flutter/material.dart';
import 'package:qhire/first.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState(){
    super.initState();
    Timer(const Duration(seconds: 4),
            ()=>Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>const First())));

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              color: Color(0x000b101c),
              gradient: LinearGradient(
                colors: [ Color(0xff101010),
                 Color(0x00ff8080)],
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
                backgroundColor: Colors.black87,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: ClipOval(
                    child: Image.asset(
                      'assets/logo.jpg', // Replace with your logo image path
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const Padding(
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