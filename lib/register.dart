import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qhire/login.dart';

class Reg extends StatefulWidget {
  const Reg({Key? key}) : super(key: key);

  @override
  State<Reg> createState() => _RegState();
}

class _RegState extends State<Reg> {
  var firstname = TextEditingController();
  var lastname = TextEditingController();
  var email = TextEditingController();
  var username = TextEditingController();
  var password = TextEditingController();
  var conformpassword = TextEditingController();
  var dob = TextEditingController();
  var highestQualification = TextEditingController();
  var address = TextEditingController();
  var employstatus = TextEditingController();
  void getData() {
    print(firstname.text);
    print(lastname.text);
    print(email.text);
    print(username.text);
    print(password.text);
    print(conformpassword.text);
    print(dob.text);
    print(highestQualification.text);
    print(address.text);
    print(employstatus.text);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
        centerTitle: true,
        leading: Icon(
            Icons.home
        ),
        actions: [Icon(Icons.more_vert,),
        ],
      ),
      body:
      Center(
        child: ListView(
            children:  [
              Padding(
                padding:const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: firstname,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText:"First name",hintText: "Enter your first name",
                    ),
                  ),
                ),

              Padding(
                padding: EdgeInsets.all(8.0),
                  child: TextField(
                    controller: lastname,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText:"Last Name",hintText: "Enter your last name",
                    ),
                  ),
                ),

              Padding(
                padding: EdgeInsets.all(8.0),
                  child: TextField(
                    controller: email,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText:"Email id",hintText: "Enter Email id",
                    ),
                  ),
                ),

        Padding(
                padding: EdgeInsets.all(8.0),

                  child: TextField(
                    controller: username,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),

                      labelText:"User name",hintText: "Enter Username",
                    ),
                  ),
                ),

              Padding(
                padding: EdgeInsets.all(8.0),
                  child: TextField(
                    controller: password,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),

                      labelText:"Password",hintText: "Enter Password",
                    ),
                    obscureText: true,
                  ),
                ),

              Padding(
                padding: EdgeInsets.all(8.0),

                  child: TextField(
                    controller: conformpassword,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),

                      labelText:"Conform Password",hintText: "Enter Conform Password",
                    ),
                    obscureText: true,
                  ),
                ),
              Padding(
                padding: EdgeInsets.all(10.0),
                  child: TextField(
                    controller: dob,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),

                      labelText:"DOB",hintText: "Enter date of birth",
                    ),
                  ),
                ),
              Padding(
                padding: EdgeInsets.all(8.0),
                  child: TextField(
                    controller: highestQualification,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),

                      labelText:"Highest Qualification",hintText: "",
                    ),
                  ),
                ),
              Padding(
                padding: EdgeInsets.all(8.0),
                  child: TextField(
                    controller: address,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),

                      labelText:"Address",hintText: "Enter address",
                    ),
                  ),
                ),

              Padding(
                padding: EdgeInsets.all(10.0),
                  child: TextField(
                    controller: employstatus,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),

                      labelText:"Current Employment Status",hintText: ""
                    ),
                  ),
                ),
              ElevatedButton(onPressed: () {
                                getData();
                              }, child: Text("REGISTOR")),

],
        ),
      ),
      );
  }
}