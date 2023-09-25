import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:qhire/const.dart';
import 'package:qhire/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegStudent extends StatefulWidget {
  const RegStudent({Key? key}) : super(key: key);

  @override
  State<RegStudent> createState() => _RegStudentState();
}

class _RegStudentState extends State<RegStudent> {
  final formkey = GlobalKey<FormState>();
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

  TextEditingController dateInput = TextEditingController();

  Future<void> getData() async {
    var data = {
      "name": name.text,
      "dob": dob.text,
      "phone_no": phone_no.text,
      "gender": genders,
      "address": address.text,
      "qualification": qualification.text,
      "username": username.text,
      "password": password.text,
      "email": email.text,
      "ep_status": employstatus,
      "upload_resume": upload_resume.text,
      "type": 'employee'
    };

    var response = await post(Uri.parse('${Con.url}reg_employee.php'), body: data);
    print(response.body);
    if (response.statusCode == 200) {
      var res = jsonDecode(response.body)["message"];
      if (res == 'Added') {
        const snackBar = SnackBar(
          content: Text('Successfully Registered'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        Fluttertoast.showToast(msg: "successfully registered");
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return Log();
            },
          ),
        );
      }
    } else {
      Fluttertoast.showToast(msg: 'Something went wrong!');
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != DateTime.now()) {
      setState(() {
        dob.text = picked.toString().split(' ')[0];
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register Employee"),
        backgroundColor: Colors.orange,
        centerTitle: true,
      ),
      body: Center(
        child: ListView(
          children: [
            Form(
              key: formkey,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: name,
                      decoration: InputDecoration(
                        hintText: "Enter your name",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              dob.text.isEmpty ? 'Date of Birth' : dob.text,
                              style: TextStyle(color: dob.text.isEmpty ? Colors.grey : Colors.black),
                            ),
                            IconButton(
                              icon: Icon(Icons.calendar_today),
                              onPressed: () {
                                _selectDate(context);
                              },
                            ),
                          ],
                        ),

                      ],
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: phone_no,
                      decoration: InputDecoration(
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
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Radio(
                              value: 'Male',
                              groupValue: genders,
                              onChanged: (rad) {
                                setState(() {
                                  genders = rad as String?;
                                });
                              },
                            ),
                            Text('Male'),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Radio(
                              value: 'Female',
                              groupValue: genders,
                              onChanged: (rad) {
                                setState(() {
                                  genders = rad as String?;
                                });
                              },
                            ),
                            Text('Female'),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Radio(
                              value: 'Other',
                              groupValue: genders,
                              onChanged: (rad) {
                                setState(() {
                                  genders = rad as String?;
                                });
                              },
                            ),
                            Text('Other'),
                          ],
                        ),
                      ),
                    ],
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: address,
                      keyboardType: TextInputType.multiline,
                      maxLines: 4,
                      decoration: InputDecoration(
                        labelText: "Address",
                        hintText: "Enter Address",
                        border: InputBorder.none, // Remove border
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
                        hintText: "Enter Username",
                      ),
                      keyboardType: TextInputType.name,
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
                        hintText: "Enter Password",
                      ),
                      keyboardType: TextInputType.visiblePassword,
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
                        hintText: "Enter Email id",
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
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

                  Padding(
                    padding: const EdgeInsets.only(left: 100.0, right: 100.0, top: 8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          debugPrint("Successfull");
                          getData();
                        }
                      },
                      child: Text(
                        "Register",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary:  Color(0xFFFFA756),
                        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                        textStyle: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
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
