import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:qhire/chatboat.dart';
import 'package:qhire/first.dart';
import 'package:qhire/view%20news.dart';
import 'package:qhire/viewpost.dart';
import 'package:qhire/viewprofile.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'const.dart';

class Homepage1 extends StatefulWidget {
  const Homepage1({Key? key}) : super(key: key);

  @override
  State<Homepage1> createState() => _HomeState();
}

class _HomeState extends State<Homepage1> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const First()),
    );
  }

  Future<dynamic> viewEducation() async {
    SharedPreferences spref = await SharedPreferences.getInstance();
    var sp = spref.getString('log_id');
    print(sp);

    var data = {
      "id": sp,
    };
    print('>>>>>>>>>>>>$data');

    var response = await post(Uri.parse('${Con.url}login.php'), body: data);
    print(response.body);
    var res = jsonDecode(response.body);
    return res;
    //print(res);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Q-Hire"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const UserAccountsDrawerHeader(
              currentAccountPicture: Icon(
                Icons.person,
                size: 48.0,
                color: Colors.white,
              ),
              accountName: Text("Welcome qhire"),
              accountEmail: Text("youremail@example.com"),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text("Profile"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Viewpro()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Logout"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const First()),
                );
              },
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 300,
                width: double.infinity,
                margin: const EdgeInsets.all(10.0),
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      'News',
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 16),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Viewnews()));
                      },
                      icon: const Icon(Icons.arrow_forward),
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
              Container(
                height: 300,
                width: double.infinity,
                margin: const EdgeInsets.all(10.0),
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      'Posts',
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 16),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Viewpost()));
                      },
                      icon: const Icon(Icons.arrow_forward),
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const ChatPage()));
        },
        backgroundColor: Colors.black,
        child: const Icon(Icons.message),
      ),
    );
  }
}
