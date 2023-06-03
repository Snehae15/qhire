import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:qhire/const.dart';
import 'package:qhire/newpayment.dart';
import 'package:qhire/payment.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Reg extends StatefulWidget {
  const Reg({Key? key}) : super(key: key);

  @override
  State<Reg> createState() => _RegState();
}

class _RegState extends State<Reg> {
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

  TextEditingController dateinput = TextEditingController();
  var highestQualification = TextEditingController();

  Future<void> getData() async {
    SharedPreferences spref = await SharedPreferences.getInstance();
    var sp = spref.getString('log_id');
    var data = {
      "id": sp,
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
    print(data);
    var response =
    await post(Uri.parse('${Con.url}reg_employee.php'), body: data);
    print(response.body);
    if (response.statusCode == 200) {
      var res = jsonDecode(response.body)["message"];
      if (res == 'Added') {
        const snackBar = SnackBar(
          content: Text('Successfully Registered'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        Fluttertoast.showToast(msg: "successfully registered");
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return const Payments();
          },
        ));
      } else if (res == 'Email already exists') {
        Fluttertoast.showToast(msg: "Email already exists");
      }
    } else {
      Fluttertoast.showToast(msg: 'Something went wrong!');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register Employee"),
        backgroundColor: Colors.black,
        centerTitle: true,
        leading: const Icon(Icons.home),
      ),
      body: Center(
        child: ListView(
          children: [
            Form(
              key: formkey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: name,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Name",
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
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: dob,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "dob",
                        hintText: "Enter your dob name",
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
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: phone_no,
                      decoration: const InputDecoration(
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

                  const ListTile(
                    title: Text("Gender:"),
                  ),

                  RadioListTile(
                      title: const Text("Male"),
                      value: 'Male',
                      groupValue: genders,
                      onChanged: (rad) {
                        setState(() {
                          genders = rad;
                        });
                      }),
                  RadioListTile(
                      title: const Text("Female"),
                      value: 'Female',
                      groupValue: genders,
                      onChanged: (rad) {
                        setState(() {
                          genders = rad;
                        });
                      }),

                  RadioListTile(
                      title: const Text("Other"),
                      value: 'Other',
                      groupValue: genders,
                      onChanged: (rad) {
                        setState(() {
                          genders = rad;
                        });
                      }),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: address,
                      keyboardType: TextInputType.multiline,
                      maxLines: 5,
                      decoration: const InputDecoration(
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
                      decoration: const InputDecoration(
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
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: username,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "User name",
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
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: password,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Password",
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
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: email,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Email id",
                        hintText: "Enter Email id",
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email is required';
                        }
                        final emailRegex =
                            RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,}$');
                        if (!emailRegex.hasMatch(value)) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                    ),
                  ),
                  const ListTile(
                    title: Text("Employment status:"),
                  ),

                  RadioListTile(
                      title: const Text("Unemployed"),
                      value: 'Unemployed',
                      groupValue: employstatus,
                      onChanged: (radio) {
                        setState(() {
                          employstatus = radio;
                        });
                      }),
                  RadioListTile(
                      title: const Text("Employed"),
                      value: 'Employed',
                      groupValue: employstatus,
                      onChanged: (radio) {
                        setState(() {
                          employstatus = radio;
                        });
                      }),

                  RadioListTile(
                      title: const Text("Self Employed"),
                      value: 'Selfemployed',
                      groupValue: employstatus,
                      onChanged: (radio) {
                        setState(() {
                          employstatus = radio;
                        });
                      }),
                  Padding(
                      padding: const EdgeInsets.only(
                          left: 100.0, right: 100.0, top: 8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          if (formkey.currentState!.validate()) {
                            debugPrint("Successfull");
                            getData();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 20),
                          textStyle: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        child: const Text(
                          "Register",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
