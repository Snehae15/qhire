import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:qhire/const.dart';

import 'package:qhire/regstudent.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'bottom.dart';

class Logstudent extends StatefulWidget {
  const Logstudent({Key? key}) : super(key: key);

  @override
  State<Logstudent> createState() => _LogstudentState();
}

class _LogstudentState extends State<Logstudent> {
  var email = TextEditingController();
  var password = TextEditingController();
  var type = TextEditingController();
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
      "type": type.text,
    };
    var response = await post(Uri.parse('${Con.url}logstd.php'), body: data);
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
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return const Pagehome();
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
      backgroundColor: Colors.black87,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/Wallpaper.jpeg"),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Sign In'),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: email,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Email",
                        hintText: "Enter Email",
                        prefixIcon: Icon(Icons.email)),
                    // prefixIcon: Icon(Icons.email)
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    obscureText: true,
                    controller: password,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Password",
                        hintText: "Enter password",
                        prefixIcon: Icon(Icons.lock)),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    getData();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.black,
                    ),
                    height: 50,
                    width: 300,
                    child: const Center(
                        child: Text('Login',
                            style: TextStyle(color: Colors.white))),
                  ),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Regstudent()));
                    },
                    child: const Text("Don't have any account please login here!",
                        style: TextStyle(color: Colors.blue)))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
