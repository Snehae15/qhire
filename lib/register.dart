import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:qhire/const.dart';
import 'package:qhire/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Reg extends StatefulWidget {
  const Reg({Key? key}) : super(key: key);

  @override
  State<Reg> createState() => _RegState();
}

class _RegState extends State<Reg> {
  final formkey = GlobalKey< FormState>();
  String? employstatus;
  String? genders;
  var name = TextEditingController();
  var dob = TextEditingController();
  var phone_no = TextEditingController();
  var gender = TextEditingController();
  var address = TextEditingController();
  var qualification = TextEditingController();
  var username = TextEditingController();
  var password = TextEditingController();
  var email = TextEditingController();
  var ep_status = TextEditingController();
  var upload_resume = TextEditingController();
  var type = TextEditingController();

  TextEditingController dateinput = TextEditingController();
  var highestQualification = TextEditingController();
  // final TextEditingController upload_resume = TextEditingController();
  // File? _file;

  // Future<void> _pickFile() async {
  //   final file = await ImagePicker().pickImage(source: ImageSource.gallery);
  //   if (file != null) {
  //     setState(() {
  //       _file = File(file.path);
  //       upload_resume.text = basename(file.path);
  //     });
  //   }
  // }
  Future<void> getData() async {
      SharedPreferences spref = await SharedPreferences.getInstance();
      var sp = spref.getString('log_id');
    var data = {
      "id":sp,
      "name":name.text,
      "dob":dob.text,
      "phone_no":phone_no.text,
      "gender":genders,
      "address":address.text,
      "qualification":qualification.text,
      "username":username.text,
      "password":password.text,
      "email":email.text,
      "ep_status":employstatus,
      "upload_resume":upload_resume.text,
      "type":'employee'
    };
    // print(data);
    var response = await post(Uri.parse('${Con.url}reg_employee.php'),body: data);
    print(response.body);
    if(response.statusCode==200){
      var res = jsonDecode(response.body)["message"];
      if(res=='Added'){
        const snackBar = SnackBar(
          content: Text('Successfully Registered'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        Fluttertoast.showToast(msg:"successfully registered");
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return Log();
          },
        ));
      }

    }
    else {
      Fluttertoast.showToast(msg: 'Something went wrong!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register Employee"),
        backgroundColor: Colors.black,
        centerTitle: true,
        leading: Icon(
            Icons.home
        ),
      ),
      body:
      Center(
        child: ListView(
          children:  [

        Form(
        key:formkey,
          child: Column(
              children: [
          Padding(
          padding: EdgeInsets.all(8.0),
          child: Container(
            width: 320,
              child: TextFormField(
                controller: name,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Name",
                  hintText: "Enter your name",
                ),
                // obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }

                  return null;
                },
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
                 return null;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextFormField(
                controller: phone_no,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "phone_no",
                  hintText: "Enter your Phone number",
                ),
                maxLength: 10,
                keyboardType: TextInputType.number,
    validator: (value) {
    if (value == null || value.isEmpty) {
    return 'Cannot be empty';
    } else if (value.length != 10) {
    return 'Must be 10 characters long';
    }
    return null;
    },
              ),
            ),

            ListTile(
              title: Text("Gender:"),
            ),

            RadioListTile(
                title:Text("Male"),
                value: 'Male', groupValue: genders, onChanged: (rad){
              setState(() {
                genders = rad;
              });
            }),
            RadioListTile(
                title:Text("Female"),
                value: 'Female', groupValue: genders, onChanged: (rad){
              setState(() {
                genders = rad;
              });
            }),

            RadioListTile(
                title:Text("Other"),
                value: 'Other', groupValue: genders, onChanged: (rad){
              setState(() {
                genders = rad;
              });
            }),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          controller: address,
          keyboardType: TextInputType.multiline,
          maxLines: 10,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: "Address",
            hintText: "Enter Address",
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your address';
            }
            return null;
          },
        ),
      ),


            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: qualification,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Highest Qualification",
                  hintText: "Enter highest qualification",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your highest qualification';
                  }
                  return null;
                },
              ),
            ),

            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextFormField(
                controller: username,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText:"User name",
                  hintText: "Enter Username",
                ),keyboardType: TextInputType.name,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a username';
                  }
                  return null;
                },
              ),
            ),

            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextFormField(
                controller: password,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText:"Password",
                  hintText: "Enter Password",
                ),keyboardType: TextInputType.visiblePassword,
                maxLength: 10,
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a password';
                  }
                  return null;
                },
              ),
            ),

            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextFormField(
                controller: email,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Email id",
                  hintText: "Enter Email id",
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                if(value == null || value.isEmpty){
                return 'Email is required';
                }
                final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,}$');
                if (!emailRegex.hasMatch(value)) {
                return 'Please enter a valid email address';
                }
                return null;
                },
              ),
            ),
            ListTile(
              title: Text("Employment status:"),
            ),

            RadioListTile(
                title:Text("Unemployed"),
                value: 'Unemployed', groupValue: employstatus , onChanged: (radio){
              setState(() {
                employstatus = radio;
              });
            }),
            RadioListTile(
                title:Text("Employed"),
                value: 'Employed', groupValue: employstatus, onChanged: (radio){
              setState(() {
                employstatus = radio;
              });
            }),

            RadioListTile(
                title:Text("Self Employed"),
                value: 'Selfemployed', groupValue: employstatus, onChanged: (radio){
              setState(() {
                employstatus = radio;
              });
            }),
            // Padding(
            //   padding: EdgeInsets.all(8.0),
            //   child: TextField(
            //     controller: upload_resume,
            //     decoration: InputDecoration(
            //       border: OutlineInputBorder(),
            //       labelText:"Upload_resume",hintText: "Enter Upload_resume",
            //     ),
            //   ),
            // ),
            //   Padding(
            //     padding: EdgeInsets.all(8.0),
            //     child: GestureDetector(
            //       onTap: _pickFile,
            //       child: AbsorbPointer(
            //         child: TextField(
            //           controller: upload_resume,
            //           decoration: InputDecoration(
            //             border: OutlineInputBorder(),
            //             labelText: "Upload_resume",
            //             hintText: "Enter Upload_resume",
            //           ),
            //         ),
            //       ),
            //     ),
        Padding(
          padding: const EdgeInsets.only(left:100.0,right: 100.0,top: 8.0),
          child: ElevatedButton(onPressed: (){
            if(formkey.currentState!.validate()) {
               debugPrint("Successfull");
              getData();
            };

          },
              child: Text(
                "Register",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                textStyle: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
        ),
        ],
      ),
        ),
    ],
      ),
    ),
    );
  }
}
