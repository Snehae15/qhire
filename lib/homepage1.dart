import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qhire/view%20news.dart';
import 'package:qhire/viewpost.dart';
import 'package:qhire/viewprofile.dart';

class Homepage1 extends StatefulWidget {
  const Homepage1({Key? key}) : super(key: key);

  @override
  State<Homepage1> createState() => _HomeState();
}

class _HomeState extends State<Homepage1> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[];

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
        actions: [
          IconButton(
            onPressed: () {
              // Add your search functionality here
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: ListView(
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
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Viewnews()));
                      },
                      icon: Icon(Icons.arrow_forward), color: Colors.black,
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
                    Text('Posts',style: TextStyle(fontSize: 18),),
                    SizedBox(height: 16),
                    IconButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Viewpost()));
                      },
                      icon: Icon(Icons.arrow_forward),
                      color: Colors.black,
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
