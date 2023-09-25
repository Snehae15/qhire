import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:qhire/const.dart';
import 'package:qhire/pagehome.dart';
import 'package:qhire/register.dart';
import 'package:qhire/regstudent.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginStudent extends StatefulWidget {
  const LoginStudent({Key? key}) : super(key: key);

  @override
  State<LoginStudent> createState() => _LoginStudentState();
}

class _LoginStudentState extends State<LoginStudent> {
  var email = TextEditingController();
  var password = TextEditingController();
  var type = TextEditingController();

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
      "type": type.text,
    };

    var response = await post(Uri.parse('${Con.url}login.php'), body: data);

    print('>>>>>>>>${response.body}');

    var res = jsonDecode(response.body);

    print(res);

    if (response.statusCode == 200) {
      if (res['message'] == 'User Successfully LoggedIn') {
        var id = res["log_id"];
        print(id);
        final spref = await SharedPreferences.getInstance();
        spref.setString('log_id', id);
        Fluttertoast.showToast(msg: 'Successfully Login...');
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Pagehome()),
        );
      } else if (res['message'] == 'Failed to LogIn') {
        Fluttertoast.showToast(msg: 'Please wait until you get accepted');
      } else {
        Fluttertoast.showToast(msg: 'Invalid email or password');
      }
    } else {
      Fluttertoast.showToast(msg: 'Something went wrong!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade400,
        body: Builder(
          builder: (context) {
            var screenSize = MediaQuery.of(context).size;

            return SingleChildScrollView(
              child: Container(
                width: screenSize.width,
                height: screenSize.height,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    colors: [
                      Color(0xFFFFA756), // Color constant for #FFA756
                      Color(0xFFFFA756), // Color constant for #FFA756
                    ],
                  ),
                ),

                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: screenSize.height * 0.2),
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Login",
                              style:
                              TextStyle(color: Colors.white, fontSize: 40),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Welcome back",
                              style:
                              TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: screenSize.height * 0.10,
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color:  Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(60),
                              topRight: Radius.circular(60),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(35.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                    children: [
                                      TextField(
                                        decoration: InputDecoration(
                                          hintText: 'Email',
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      TextField(
                                        controller: password,
                                        obscureText: true,
                                        decoration: InputDecoration(
                                          hintText: 'Password',
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 15),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Pagehome()),
                                    );
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [Colors.orange, Colors.white],
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                      ),
                                      borderRadius: BorderRadius.circular(50),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey
                                              .withOpacity(0.5), // Shadow color
                                          spreadRadius: 2, // Spread radius
                                          blurRadius: 4, // Blur radius
                                          offset: Offset(
                                              0, 3), // Offset in the (x, y) direction
                                        ),
                                      ],
                                    ),
                                    width: 130,
                                    height: 50,
                                    child: Center(
                                        child: Text('Login',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500))),
                                  ),
                                ),
                                TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Reg()));
                                    },
                                    child: Text(
                                        "Don't have an account? Register here!",
                                        style: TextStyle(
                                            color: Colors.black87))),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
