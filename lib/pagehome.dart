import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qhire/editprofile.dart';
import 'package:qhire/home.dart';
import 'package:qhire/homepage.dart';
import 'package:qhire/homepage1.dart';
import 'package:qhire/newpage.dart';
import 'package:qhire/q&a.dart';
import 'package:qhire/suggestion.dart';
import 'package:qhire/view%20news.dart';
import 'package:qhire/viewpost.dart';
import 'package:qhire/viewprofile.dart';

class Pagehome extends StatefulWidget {
  const Pagehome({Key? key}) : super(key: key);

  @override
  State<Pagehome> createState() => _HomeState();
}

class _HomeState extends State<Pagehome> {
  int currentindex=1;
  final pages=[
    Home(),
    Homepage1(),
    More(),
    ChatScreen(),
    Suggestion(),
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
            icon: Icon(Icons.person),
            label: "Profile",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),

            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),

            label: "More",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: "Message",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
        ],
        // currentIndex: _selectedIndex,
        // onTap: _onItemTapped,
        backgroundColor: Colors.blueGrey,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}