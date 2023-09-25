import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:qhire/const.dart';
import 'package:qhire/first.dart';
import 'package:qhire/viewprofile.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(const Sidebar());

class Sidebar extends StatelessWidget {
  final appTitle = 'Flutter Drawer Demo';

  const Sidebar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      home: const SidebarPage(title: 'Sidebar Page'),
    );
  }
}

class SidebarPage extends StatefulWidget {
  final String title;

  const SidebarPage({Key? key, required this.title}) : super(key: key);

  @override
  _SidebarPageState createState() => _SidebarPageState();
}

class _SidebarPageState extends State<SidebarPage> {
  late Future<dynamic> _profileFuture;

  @override
  void initState() {
    super.initState();
    _profileFuture = _loadProfileData();
  }

  Future<dynamic> _loadProfileData() async {
    SharedPreferences spref = await SharedPreferences.getInstance();
    var sp = spref.getString('log_id');
    print(sp);
    var data = {
      "id": sp,
    };
    print('>>>>>>$data');

    var response =
    await http.post(Uri.parse('${Con.url}viewstudent.php'), body: data);
    print(response.body);
    return jsonDecode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.black87,
      ),
      body: FutureBuilder(
        future: _profileFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Center(
              child: Text(
                'Welcome ${snapshot.data![0]['name']}!',
                style: TextStyle(fontSize: 20.0),
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error loading profile data: ${snapshot.error}',
                style: TextStyle(fontSize: 20.0),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black87,
              ), //BoxDecoration
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.black54),
                accountName: Text(
                  'Name',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                accountEmail: Text(
                  'Email',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),

                ), //circleAvatar
              ), //UserAccountDrawerHeader

            ListTile(
              leading: const Icon(Icons.person),
              title: const Text(' My Profile '),
              onTap: () {
                Navigator.push(context,MaterialPageRoute(builder: (context)=>Viewpro()));
              },
            ),

            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('LogOut'),
              onTap: () {
                Navigator.push(context,MaterialPageRoute(builder: (context)=>First()));
              },
            ),
          ],
        ),
      ), //Drawer
    );
  }
}