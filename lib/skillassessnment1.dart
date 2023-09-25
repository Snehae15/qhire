import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qhire/attendexam.dart';
import 'package:qhire/pagehome.dart';
import 'package:qhire/practicetest.dart';
import 'package:qhire/tests.dart';

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
      title: Text("Skill Assessment"),
backgroundColor: Colors.black,
    centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed:(){
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Pagehome()));
          },
        ),
      ),
      body: Center(
        child: Column(
            children: [
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Text(
                       'Before you start\n'
                       'You must complete this assessment in one session — make sure your internet is reliable.\n'
                       'You can retake this assessment once if you don’t pass the skill assessment.\n'
                       'We won’t show your results to anyone without your permission.\n'),
                 ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Practice()));
                },
                child: Text("Practice"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 250.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Attendexam()));
                    },
                    child: Text("Start"),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Pagehome()));
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 2.0),
                  child: Text("Back"),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                ),
              ),
                  ],
                ),
              ),

    );


  }
}
