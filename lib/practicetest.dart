import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qhire/skillassessnment1.dart';
import 'package:qhire/tests.dart';

class Practice extends StatefulWidget {
  const Practice({Key? key}) : super(key: key);

  @override
  State<Practice> createState() => _Skill1State();
}

class _Skill1State extends State<Practice> {
  get children => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Practice test"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Try 2 questions without affecting your score\n'
                  'In practice mode/n'
                  'you can check your answer after each question.\n'),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 180.0),
              child: Row(
                children: [
                  ElevatedButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Skill1()));
                  }, child: Text("Back")),
                  Padding(
                    padding: const EdgeInsets.only(left:100.0),
                    child: ElevatedButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Questionnaire()));
                    }, child: Text("Practice")),
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