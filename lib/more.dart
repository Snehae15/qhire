import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qhire/aluminitalk.dart';
import 'package:qhire/coursepage.dart';
import 'package:qhire/gd.dart';
import 'package:qhire/vieweducation.dart';
import 'package:qhire/viewinterest.dart';
import 'package:qhire/viewinterviewpreparation.dart';
import 'package:qhire/viewprofile.dart';
import 'package:qhire/viewskill.dart';

class Morepage extends StatefulWidget {
  const Morepage({Key? key}) : super(key: key);

  @override
  State<Morepage> createState() => _MorepageState();
}

class _MorepageState extends State<Morepage> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: screenSize.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFFFA756), // Starting color
                Colors.white, // Ending color
              ],
            ),
          ),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(top: 100, left: 20),
                  child: Text(
                    "The future depends on what you do today. \n \t \t \t \t \t \t \t \t \t \t \t \t-  Mahatma Gandhi",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  width: screenSize.width,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0, left: 7),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(
                          height: 50,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0, right: 20),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>  Coursepage(),
                                ),
                              );
                            },
                            child: Container(
                              width: 500,
                              height: 100,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(
                                  color: Colors.orange,
                                ),
                              ),
                              child: Stack(
                                children: <Widget>[
                                  Positioned(
                                    top: 40,
                                    left: 60,
                                    child: Text(
                                      'Course',
                                      style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.normal,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0, right: 20),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const Interview(),
                                ),
                              );
                            },
                            child: Container(
                              width: 500,
                              height: 100,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(
                                  color: Colors.orange,
                                ),
                              ),
                              child: Stack(
                                children: <Widget>[
                                  Positioned(
                                    top: 40,
                                    left: 60,
                                    child: Text(
                                      'Interview Preparation',
                                      style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.normal,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 30,
                                    left: 80,
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) => const Interview(),
                                          ),
                                        );
                                      },

                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 50, // Adjust the spacing as needed
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0, right: 20),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const Aluminitalk(),
                                ),
                              );
                            },
                            child: Container(
                              width: 500,
                              height: 100,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(
                                  color: Colors.orange,
                                ),
                              ),
                              child: Stack(
                                children: <Widget>[
                                  Positioned(
                                    top: 40,
                                    left: 60,
                                    child: Text(
                                      'Alumni Talk',
                                      style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.normal,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 30,
                                    left: 80,
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) => const Aluminitalk(),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0, right: 20),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>  Groupdiscuttion(),
                                ),
                              );
                            },
                            child: Container(
                              width: 500,
                              height: 100,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(
                                  color: Colors.orange,
                                ),
                              ),
                              child: Stack(
                                children: <Widget>[
                                  Positioned(
                                    top: 40,
                                    left: 60,
                                    child: Text(
                                      'Group Discussion',
                                      style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.normal,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 30,
                                    left: 80,
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) =>  Groupdiscuttion(),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
