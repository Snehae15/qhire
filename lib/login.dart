import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:qhire/const.dart';
import 'package:qhire/pagehome.dart';
import 'package:qhire/register.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Log extends StatefulWidget {
  const Log({Key? key}) : super(key: key);

  @override
  State<Log> createState() => _LogState();
}
class _LogState extends State<Log> {
  var email = TextEditingController();
  var password = TextEditingController();

  // Function to validate the user input fields
  bool _validateFields() {
    if (email.text.isEmpty) {
      Fluttertoast.showToast(msg: 'Please enter email');
      return false;
    }
    if (password.text.isEmpty) {
      Fluttertoast.showToast(msg: 'Please enter password');
      return false;
    }
    return true;
  }

  Future<void> getData() async {
    if (!_validateFields()) return;

    var data = {
      "email": email.text,
      "password": password.text,
    };
    var response = await post(Uri.parse('${Con.url}login.php'), body: data);
    print('>>>>>>>>${response.body}');
    var res = jsonDecode(response.body);
    print(res);
    if (response.statusCode == 200) {
      if (res['message'] == 'User Successfully LoggedIn') {
        var id = res["emp_id"];
        print(id);
        final spref = await SharedPreferences.getInstance();
        spref.setString('emp_id', id);
        Fluttertoast.showToast(msg: 'Successfully Login...');
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return Pagehome();
          },
        ));
      } else {
        Fluttertoast.showToast(msg: 'Invalid email or password');
      }
    } else {
      Fluttertoast.showToast(msg: 'Something went wrong!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade400,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/Free Instagram Story Template.jpg"),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Sign In'),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    controller: email,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Email", hintText: "Enter Email",
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    controller: password,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Password", hintText: "Enter password",
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                InkWell(
                  onTap: () {
                    getData();
                  },
                  child: Container(
                    child: Center(child: Text('Login')),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Color(0xFF78A9DA),
                    ),
                    height: 50,
                    width: 300,

                  ),
                ),
                TextButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (
                      context) => Reg()));
                  }, child: Text("Don't have any account please login her!"))
                ],
              ),
            ),
          ),
        ),
      );
    }
  }

