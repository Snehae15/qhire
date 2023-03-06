import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
          icon : Icon(Icons.home),icon: Icon(Icons.notification_add),
          Icon(Icons.message),
    ),
    ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.person
        ),
            label: "Contact"
        ),
        BottomNavigationBarItem(icon: Icon(Icons.home
        ),
            label: "Chats"
        ),
        BottomNavigationBarItem(icon: Icon(Icons.message
        ),
            label: "Home"
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
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
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

