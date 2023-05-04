import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qhire/coursepage.dart';
import 'package:qhire/vieweducation.dart';
import 'package:qhire/viewinterest.dart';
import 'package:qhire/viewinterviewpreparation.dart';
import 'package:qhire/viewpost.dart';
import 'package:qhire/viewprofile.dart';
import 'package:qhire/viewskill.dart';

class Morepage extends StatefulWidget {
  const Morepage({Key? key}) : super(key: key);

  @override
  State<Morepage> createState() => _MorepageState();
}

class _MorepageState extends State<Morepage> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Viewpro()));
          },
          child: Icon(
            Icons.person,
          ),
        ),
      ),
      body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                height: 100,
                width: 1000,
                padding: EdgeInsets.all(2.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.blue,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(2),
                ),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Row(
                            children: [
                              Text(
                                'Course',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 5),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Coursepage()),
                            );
                          },
                          child: Text('View All'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

      Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
      height: 100,
      width: 1000,
      padding: EdgeInsets.all(2.0),
      decoration: BoxDecoration(
      border: Border.all(
      color: Colors.blue,
      width: 1,
      ),
      borderRadius: BorderRadius.circular(2),
      ),
      child: Row(
      children: [
      Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Padding(
      padding: const EdgeInsets.all(2.0),
      child: Row(
      children: [
      Text(
      'Interview preparation',
      style: TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.normal,
      ),
      ),
      ],
      ),
      ),
      SizedBox(height: 5),
      ElevatedButton(
      onPressed: () {
      Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => InterviewPreparationPage()),
      );
      },
      child: Text('View All'),
      ),
      ],
      ),
      ],
      ),
      ),
      ),

    Padding(
    padding: const EdgeInsets.all(5.0),


    child: Container(
              height: 100,
              width: 1000,
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.blue,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text(
                          'Alumini talk',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) => Viewpost()));
                          },
                          child: Text('View'),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              height: 100,
              width: 100,
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.blue,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(2),
              ),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text(
                          'Group Discussion',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                     ElevatedButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) => Vieweducation()));
                          },
                          child: Text('View'),
                        ),

                    ],
                  ),
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              height: 100,
              width: 100,
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.blue,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(2),
              ),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text(
                          'Skill Assessment',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (context) => Viewskill()));
                              },
                              child: Text('View'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
            ),
              ),

          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              height: 100,
              width: 100,
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.blue,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(2),
              ),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text(
                          'Interests',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      SizedBox(height: 2),
                       ElevatedButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) => Viewinterest()));
                          },
                          child: Text('All interest'),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
      ],
    ),
    );
  }
}
