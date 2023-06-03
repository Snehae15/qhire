import 'package:flutter/material.dart';
import 'package:qhire/home.dart';
import 'package:qhire/login.dart';
import 'package:qhire/loginstudent.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen1 extends StatefulWidget {
  const SplashScreen1({Key? key}) : super(key: key);

  @override
  _SplashScreen1State createState() => _SplashScreen1State();
}

class _SplashScreen1State extends State<SplashScreen1> {
  @override
  void initState() {
    super.initState();
    checkLoginType();
  }

  Future<void> checkLoginType() async {
    final prefs = await SharedPreferences.getInstance();
    final isStudent = prefs.getBool('isStudent') ?? true;

    if (isStudent) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Logstudent()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Log()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Qhire',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const SplashScreen1(),
      routes: {
        '/home': (BuildContext context) => const Home(),
        '/login': (BuildContext context) => const Log(),
        '/loginstudent': (BuildContext context) => const Logstudent(),
      },
    );
  }
}

void main() {
  runApp(const MyApp());
}
