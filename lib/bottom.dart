import 'package:flutter/material.dart';
import 'package:qhire/home.dart';
import 'package:qhire/homepage1.dart';
import 'package:qhire/more.dart';
import 'package:qhire/viewjob.dart';

class Pagehome extends StatefulWidget {
  const Pagehome({Key? key}) : super(key: key);

  @override
  State<Pagehome> createState() => _HomeState();
}

class _HomeState extends State<Pagehome> {
  int currentindex = 1;
  final pages = [
    const Home(),
    const Homepage1(),
    const Morepage(),
    const Viewjob(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentindex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentindex,
        onTap: (newIndex) {
          setState(() {
            currentindex = newIndex;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.local_activity),
            label: "Activity",
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
            icon: Icon(Icons.shopping_bag),
            label: 'Jobs',
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
