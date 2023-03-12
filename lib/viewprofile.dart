import 'package:flutter/material.dart';
import 'package:qhire/home.dart';
import 'package:qhire/homepage.dart';

void main() => runApp(const Viewpro());

class Viewpro extends StatelessWidget {
  const Viewpro({super.key});

  static const String _title = 'View Profile';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     title: _title,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
          onPressed:(){
    Navigator.push(context,
    MaterialPageRoute(builder: (context) => Homepage()));
    },
        ),
        ),
       body: const MyStatelessWidget(),
      ),
    );
  }
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          body:
          ListView(
              children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                padding: EdgeInsets.fromLTRB(10,10,10,0),
          height: 220,
          width: double.maxFinite,
          child: Card(
            child: Column(
              children: [
              SizedBox(
              height: 200.0,
              child: Image.asset(
                'assets/drop.png',
                fit: BoxFit.cover,
              ),
            ),
               Padding(
                 padding: EdgeInsets.all(8.0),
                      child: Text('View Profile pic\n'
                          'First name\n'
                          'Last name\n'
                          'Email id\n'
                          'Username\n'
                          'DOB\n'
                          'Highest Qualification\n'
                          'Address\n'
                          'Current employment Status\n'),
          ),
            ],
          ),

      ),
    ),
              ),
    ],
    ),
        ),
    );

  }
}