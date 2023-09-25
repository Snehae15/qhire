import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:qhire/pagehome.dart';



class Editreg extends StatefulWidget {
  const Editreg({Key? key}) : super(key: key);

  @override
  State<Editreg> createState() => _RegState();
}

class _RegState extends State<Editreg> {
  String? employstatus;
  var firstname = TextEditingController();
  var lastname = TextEditingController();
  var email = TextEditingController();
  var username = TextEditingController();
  TextEditingController dateinput = TextEditingController();
  var highestQualification = TextEditingController();
  var address = TextEditingController();
  void getData() {
    print(firstname.text);
    print(lastname.text);
    print(email.text);
    print(username.text);
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
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                keyboardType : TextInputType.datetime,
                decoration : InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.only(),
                  ),
                  labelText:"DOB",hintText: " Enter DOB",
                ),
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
