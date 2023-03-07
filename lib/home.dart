import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qhire/login.dart';
import 'package:qhire/register.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home page"),
        centerTitle: true,
        leading: Icon(Icons.person),
        actions: [IconButton(onPressed: (){},
          icon : Icon(Icons.home),
        ),
        ],
    ),

      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.person
        ),
            label: "Contact"
        ),
        BottomNavigationBarItem(icon: Icon(Icons.home
        ),
            label: "Home"
        ),
        BottomNavigationBarItem(icon: Icon(Icons.message
        ),
            label: "Message"
        ),
      ],
      ),
      body: ListView(
        children: [
          Card(
            child: ListTile(
              title: Text("Login"),
              tileColor: Colors.blueGrey,
              trailing: Icon(
                  Icons.arrow_forward_ios
              ),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Log()));
              },
            ),
          ),
          Card(
            child: ListTile(
              title: Text("Registration"),
              tileColor: Colors.blue,
              trailing: Icon(
                  Icons.arrow_forward_ios
              ),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Reg()));
              },
            ),
          ),
          Card(
            child: ListTile(
              title: Text("number 2"),
              tileColor: Colors.amber,
              trailing: Icon(
                  Icons.arrow_forward_ios
              ),
            ),
          ),
        ],
      ),
    );
  }
}

