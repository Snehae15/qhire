import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:qhire/home.dart';
import 'package:qhire/register.dart';

class Log extends StatefulWidget {
  const Log({Key? key}) : super(key: key);

  @override
  State<Log> createState() => _LogState();
}

class _LogState extends State<Log> {
  var user=TextEditingController();
  var password=TextEditingController();
  void getData(){
    print(user.text);
    print(password.text);
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("LOGIN"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding:const EdgeInsets.all(8.0),
              child: TextField(
                controller: user,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText:"User name",hintText: "Enter your user name",
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                controller: password,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText:"Password",hintText: "Enter password",
                ),
              ),
            ),
            ElevatedButton(onPressed: (){
              getData();
              Fluttertoast.showToast(msg: "Successfully Logined");
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
            }, child: Text("LOGIN")),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Dont have an account?"),
            ),
            ElevatedButton(onPressed: (){
              getData();
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Reg()));
            }, child: Text("Register")),
          ],
        ),
      ),
    );
  }
}

