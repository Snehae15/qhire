import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:qhire/activity.dart';
import 'package:qhire/const.dart';

import 'package:qhire/pagehome.dart';

import 'package:qhire/viewabout.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Addabout extends StatefulWidget {
  const Addabout({Key? key}) : super(key: key);

  @override
  State<Addabout> createState() => _AddaboutState();
}

class _AddaboutState extends State<Addabout> {
  var about = TextEditingController();

  Future<void> getData() async {
    SharedPreferences spref = await SharedPreferences.getInstance();
    var sp = spref.getString('log_id');
    var data = {
      "id": sp,
      "about": about.text,
    };
    print(data);
    var response = await post(Uri.parse('${Con.url}addabout.php'), body: data);
    print(response.body);
    if (response.statusCode == 200) {
      var res = jsonDecode(response.body)["message"];
      if (res == 'Added') {
        const snackBar = SnackBar(
          content: Text("added"),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return Viewabout();
          }),
        );
      }
    } else {
      Fluttertoast.showToast(msg: "something went wrong");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add about",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor:Color(0xFFFFA756),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: ListView(
            children: [
              Padding(
                padding:
                const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
                child: Text(
                  "You can write about your years of experience, industry, or skills. \n People also talk about their achievements or previous job experiences.",
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color:Color(0xFFFFA756)), // Add black border
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: TextField(
                    controller: about,
                    keyboardType: TextInputType.multiline,
                    maxLines: 5,
                    decoration: InputDecoration(
                      border: InputBorder.none, // Remove default border
                      labelText: "Add about",
                      hintText: "Enter about",
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.white30),
                      ),
                    ),
                  ),
                ),
              ),
        SizedBox(height: 10,),
        InkWell(
          onTap: () {
            getData();
           Navigator.push(context,MaterialPageRoute(builder: (context)=>Pagehome()));
          },

          child: Padding(
            padding: const EdgeInsets.only(left: 88.0,right: 90.0),
            child: Container(
              child: Center(
                child: Text("ADD", style: TextStyle(color: Colors.white),),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xFFFFA756),
              ),
              height: 50,
              width: 50,
            ),
          ),

        ),
            ],
    ),
    ),
    ),
    );
  }
}
