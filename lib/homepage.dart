import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qhire/editprofile.dart';
import 'package:qhire/home.dart';
import 'package:qhire/homepage1.dart';
import 'package:qhire/pagehome.dart';
import 'package:qhire/q&a.dart';
import 'package:qhire/suggestion.dart';
import 'package:qhire/view%20news.dart';
import 'package:qhire/viewpost.dart';
import 'package:qhire/viewprofile.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomeState();
}

class _HomeState extends State<Homepage> {
  int currentindex=0;
  final pages=[
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Q-Hire"),
      //   centerTitle: true,
      //   leading: GestureDetector(
      //     onTap: () {
      //       Navigator.push(
      //         context,
      //         MaterialPageRoute(builder: (context) => Viewpro()),
      //       );
      //     },

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
                  // BottomNavigationBarItem(
                  // icon: Icon(Icons.add),
                  //
                  // label: "More",
                  // ),
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