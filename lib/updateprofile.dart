import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:qhire/login.dart';
import 'package:qhire/pagehome.dart';

class Editpro extends StatefulWidget {
  const Editpro({Key? key}) : super(key: key);

  @override
  State<Editpro> createState() => _RegState();
}

class _RegState extends State<Editpro> {
  String? employstatus;
  var firstname = TextEditingController();
  var lastname = TextEditingController();
  var email = TextEditingController();
  var username = TextEditingController();
  var dob = TextEditingController();
  TextEditingController dateinput = TextEditingController();
  var highestQualification = TextEditingController();
  var address = TextEditingController();
  void getData() {
    print(firstname.text);
    print(lastname.text);
    print(email.text);
    print(username.text);
    print(dob.text);
    print(highestQualification.text);
    print(address.text);
  }
  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
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
                  labelText:"Name",hintText: "Enter your Name",
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
              child: TextFormField(
                controller: dob,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText:"dob",hintText: "Enter your dob name",
                ),
                onTap: () async {
                  DateTime? date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );
                  if (date != null) {
                    dob.text = date.toString().split(' ')[0];
                  }
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your date of birth';
                  }
                  // You can add more validation here if necessary, for example checking that the date is in the correct format or range.
                  return null;
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: highestQualification,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),

                  labelText:"Highest Qualification",hintText: "",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                keyboardType: TextInputType.multiline,
                maxLines: 4,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText:"Address",hintText: "Enter your Address",
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.redAccent)
                    )
                ),
              ),
            ),
            ListTile(
              title: Text("Current employment Status:"),
            ),

            RadioListTile(
                title:Text("Employed"),
                value: 'Employed', groupValue: employstatus, onChanged: (rad){
              setState(() {
                employstatus = rad;
              });
            }),
            RadioListTile(
                title:Text("UnEmployed"),
                value: 'UnEmployed', groupValue: employstatus, onChanged: (rad){
              setState(() {
                employstatus = rad;
              });
            }),

            RadioListTile(
                title:Text("Self Employed"),
                value: 'Self Employed', groupValue: employstatus, onChanged: (rad){
              setState(() {
                employstatus = rad;
              });
            }),
            ElevatedButton(onPressed: (){
              getData();
              Fluttertoast.showToast(msg: "Profile updated");
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Pagehome()));
            }, child: Text("Update")),
          ],
        ),

      ),
    );
  }
}
