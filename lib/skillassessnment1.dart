import 'package:flutter/material.dart';
import 'package:qhire/attendexam.dart';
import 'package:qhire/home.dart';
import 'package:qhire/practicetest.dart';

import 'bottom.dart';

class Skill1 extends StatefulWidget {
  const Skill1({Key? key}) : super(key: key);

  @override
  State<Skill1> createState() => _Skill1State();
}

class _Skill1State extends State<Skill1> {
  get children => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: const Text("Skill Assessment"),
backgroundColor: Colors.black,
    centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed:(){
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Pagehome()));
          },
        ),
      ),
      body: Center(
        child: Column(
            children: [
                 const Padding(
                   padding: EdgeInsets.all(8.0),
                   child: Text(
                       'Before you start\n'
                       'You must complete this assessment in one session — make sure your internet is reliable.\n'
                       'You can retake this assessment once if you don’t pass the skill assessment.\n'
                       'We won’t show your results to anyone without your permission.\n'),
                 ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Practice()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                ),
                child: const Text("Practice"),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 250.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const Attendexam()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                    ),
                    child: const Text("Start"),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Home()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                ),
                child: const Padding(
                  padding: EdgeInsets.only(left: 2.0),
                  child: Text("Back"),
                ),
              ),
                  ],
                ),
              ),

    );


  }
}
