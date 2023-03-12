import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qhire/home.dart';
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
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    Home(),
    Text('Message'),
    Text('Notification'),
    Text('Profile')
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Q-Hire"),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Viewpro()),
            );
          },
          child: Icon(
            Icons.person,
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),

            label: "Home",
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
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,

      backgroundColor: Colors.blueGrey, // Change the color here
      selectedItemColor: Colors.black, // Change the color of the selected item here
      unselectedItemColor: Colors.grey, // Change the color of the unselected items here

      ),

      body:
      ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 300,
                  width: double.infinity,
                  margin: EdgeInsets.all(10.0),
                  padding: EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.blue.shade200,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'News',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(height: 16),
                      IconButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Viewnews()));
                        },
                        icon: Icon(Icons.arrow_forward),
                        color: Colors.blue,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 300,
                  width: double.infinity,
                  margin: EdgeInsets.all(10.0),
                  padding: EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.blue.shade200,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Posts',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(height: 16),
                      IconButton(
                        onPressed: () {
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Viewpost()));
                        },
                        icon: Icon(Icons.arrow_forward),
                        color: Colors.blue,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 300,
                  width: double.infinity,
                  margin: EdgeInsets.all(10.0),
                  padding: EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.blue.shade200,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Suggestion',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(height: 16),
                      IconButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Suggestion()));
                        },
                        icon: Icon(Icons.arrow_forward),
                        color: Colors.blue,
                      ),
                    ],
                  ),
                ),
              ],
            ),
      ],
      ),
    );
  }
}