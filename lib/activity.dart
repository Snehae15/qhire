import 'package:flutter/material.dart';

import 'package:qhire/add%20post.dart';
import 'package:qhire/addabout.dart';
import 'package:qhire/addeducation.dart';
import 'package:qhire/addinnovativeidea.dart';
import 'package:qhire/addinterest.dart';
import 'package:qhire/addskill.dart';
import 'package:qhire/viewabout.dart';
import 'package:qhire/vieweducation.dart';
import 'package:qhire/viewidea.dart';
import 'package:qhire/viewinterest.dart';
import 'package:qhire/viewpost.dart';
import 'package:qhire/viewskill.dart';

void main() {
  runApp(const MaterialApp(
    home: Activity(),
  ));
}

class Activity extends StatefulWidget {
  const Activity({Key? key}) : super(key: key);

  @override
  State<Activity> createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(top: 100),
                  child: Text(
                    "Hire character. Train skill. \n \t \t \t \t \t \t \t \t \t \t \t \t- Peter Schutz",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Container(
                  width: screenSize.width,
                  height: screenSize.height,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            _CircleNavigation(title: 'About', icon: Icons.info, onPressed: () {
                              // Navigate to the about page
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const Viewabout(),
                                ),
                              );
                            }),
                            _CircleNavigation(title: 'Education', icon: Icons.school, onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const Vieweducation(),
                                ),
                              );
                            }),
                            _CircleNavigation(title: 'Skills', icon: Icons.star, onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const Viewskill(),
                                ),
                              );
                            }),
                          ],
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0, right: 20),
                          child: GestureDetector(
                            onTap: () {
                              // Navigate to the view post page when the "Post" text is clicked
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                  const Viewpost(), // Replace with Page widget
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
                                  const Positioned(
                                    top: 40,
                                    left: 60,
                                    child: Text(
                                      'Post',
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
                                        // Navigate to the Add post page when the "+" button is clicked
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                            const AddPost(), // Replace with your Page widget
                                          ),
                                        );
                                      }, // Adjust this value for horizontal positioning
                                      child: Padding(
                                        padding:
                                        const EdgeInsets.only(left: 220.0),
                                        child: Container(
                                          width: 40,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            color: Colors.orange,
                                            borderRadius:
                                            BorderRadius.circular(20),
                                          ),
                                          child: const Center(
                                            child: Text(
                                              '+',
                                              style: TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
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
                              // Navigate to the view post page when the "Post" text is clicked
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                  const Viewidea(), // Replace with Page widget
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
                                  const Positioned(
                                    top: 40,
                                    left: 60,
                                    child: Text(
                                      'Innovative Idea',
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
                                        // Navigate to the Add post page when the "+" button is clicked
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                            const Addidea(), // Replace with your Page widget
                                          ),
                                        );
                                      },
                                      child: Padding(
                                        padding:
                                        const EdgeInsets.only(left: 220.0),
                                        child: Container(
                                          width: 40,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            color: Colors.orange,
                                            borderRadius:
                                            BorderRadius.circular(20),
                                          ),
                                          child: const Center(
                                            child: Text(
                                              '+',
                                              style: TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
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
                              // Navigate to the view post page when the "Post" text is clicked
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                  const Viewinterest(), // Replace with Page widget
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
                                  const Positioned(
                                    top: 40,
                                    left: 60,
                                    child: Text(
                                      'Interests',
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
                                        // Navigate to the Add post page when the "+" button is clicked
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                            const Addinterest(), // Replace with your Page widget
                                          ),
                                        );
                                      },
                                      child: Padding(
                                        padding:
                                        const EdgeInsets.only(left: 220.0),
                                        child: Container(
                                          width: 40,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            color: Colors.orange,
                                            borderRadius:
                                            BorderRadius.circular(20),
                                          ),
                                          child: const Center(
                                            child: Text(
                                              '+',
                                              style: TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
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

class _CircleNavigation extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onPressed;

  const _CircleNavigation({required this.title, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(30),
      child: Container(
        width: 100,
        height: 100,
        decoration: const BoxDecoration(
          color: Colors.orange,
          shape: BoxShape.circle,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              icon,
              color: Colors.white,
              size: 40,
            ),
            const SizedBox(height: 5),
            Text(
              title,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
