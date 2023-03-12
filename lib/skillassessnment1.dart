import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qhire/home.dart';
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
    centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed:(){
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Home()));
          },
        ),
      ),
      body: Center(
        child: Column(
            children: [
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Text('PHP assessment\n'
                       'Topics: Arrays, Classes, Language Basics, Syntax, Utility Functions\n'
                       '15 multiple choice questions/n'
                       '1.5 minutes per question\n'
                       'Score in the top 30% to earn a badge\n'
                       'Before you start\n'
                       'You must complete this assessment in one session — make sure your internet is reliable.\n'
                       'You can retake this assessment once if you don’t earn a badge.\n'
                       'We won’t show your results to anyone without your permission.\n'),
                 ),
          Padding(
            padding: const EdgeInsets.only(left: 200.0),
            child: Row(
              children: [
                ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Practice()));
                }, child: Text("Practice")),
                Padding(
                  padding: const EdgeInsets.only(left:50.0),
                  child: ElevatedButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Questionnaire()));
                  }, child: Text("Start")),
                ),
              ],
            ),
          ),
              Padding(
                padding: const EdgeInsets.only(left: 250.0),
                child: Row(
                  children: [
                    ElevatedButton(onPressed: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
                    }, child: Padding(
                      padding: const EdgeInsets.only(left: 2.0),
                      child: Text("Back"),
                    ),
                    ),
                  ],
                ),
              ),
        ],
      ),
      ),
      );

  }
}
