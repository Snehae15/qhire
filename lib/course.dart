import 'package:flutter/material.dart';
import 'package:qhire/c.dart';
import 'package:qhire/datascience.dart';
import 'package:qhire/flutter.dart';
import 'package:qhire/login.dart';
import 'package:qhire/mern.dart';
import 'package:qhire/coursepage.dart';

class Courses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Course'),
      ),
      body: ListView(
          padding: EdgeInsets.all(10.0),
          children: [
          GestureDetector(
          onTap: () {
    Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Coursepage()),
              );
              },
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 140.0,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Center(
                child: Text(
                  'PHP',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 10.0),
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Url2()),
                );
              },
              child: Container(
                height: 140.0,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Center(
                  child: Text(
                    'C',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
    GestureDetector(
    onTap: () {
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Log()),
    );
    },
    child: Row(
    children: [
    Expanded(
    child: Container(
    height: 140.0,
    decoration: BoxDecoration(
    color: Colors.grey,
    borderRadius: BorderRadius.circular(10.0),
    ),
    child: Center(
    child: Text(
    'FLUTTER',
    style: TextStyle(
    color: Colors.white,
    fontSize: 20.0,
    ),
    ),
    ),
    ),
    ),
    SizedBox(width: 10.0),
    Expanded(
    child: GestureDetector(
    onTap: () {
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Url3()),
    );
    },
    child: Container(
    height: 150.0,
    decoration: BoxDecoration(
    color: Colors.grey,
    borderRadius: BorderRadius.circular(10.0),
    ),
    child: Center(
    child: Text(
    'MERN',
    style: TextStyle(
    color: Colors.white,
    fontSize: 20.0,
    ),
    ),
    ),
    ),
    ),
    ),
    ],
    ),
    ),
    GestureDetector(
    onTap: () {
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Url4()),
    );
    },
    child: Row(
    children: [
    Expanded(
    child: Container(
    height: 140.0,
    decoration: BoxDecoration(
    color: Colors.grey,
    borderRadius: BorderRadius.circular(10.0),
    ),
    child: Center(
    child: Text(
    'DATA SCIENCE',
    style: TextStyle(
    color: Colors.white,
    fontSize: 20.0,
    ),
    ),
    ),
    ),
    ),
    SizedBox(width: 10.0),
    Expanded(
    child: GestureDetector(
    onTap: () {
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Url5()),
    );
    },
    child: Container(
    // Your child widget for the Expanded widget goes here
    ),
    ),
    ),
    ],
    ),
    ),
    ],
    ),
    );
  }
}
