import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qhire/activity.dart';
import 'package:qhire/chatboat.dart';
import 'package:qhire/homepage1.dart';
import 'package:qhire/more.dart';
import 'package:qhire/viewjob.dart';

class Pagehome extends StatefulWidget {
  const Pagehome({Key? key}) : super(key: key);

  @override
  State<Pagehome> createState() => _HomeState();
}
class _HomeState extends State<Pagehome> {
  int currentindex=0;
  final pages=[
    Activity(),
    Viewjob(),
    Morepage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentindex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentindex,
        onTap: (newIndex){
          setState(() {
            currentindex=newIndex;
          });
        },
        items:[
          BottomNavigationBarItem(
            icon: Icon(Icons.local_activity),
            label: "Activity",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Jobs',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),

            label: "More",
          ),

        ],
        // currentIndex: _selectedIndex,
        // onTap: _onItemTapped,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.black,
      ),
    );
  }
}