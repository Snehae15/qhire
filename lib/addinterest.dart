import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:qhire/const.dart';
import 'package:qhire/home.dart';
import 'package:qhire/viewinterest.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Addinterest extends StatefulWidget {
  const Addinterest({Key? key}) : super(key: key);

  @override
  State<Addinterest> createState() => _AddinterestState();
}

class _AddinterestState extends State<Addinterest> {
  var interest = TextEditingController();
  Future<void> getData() async {
    SharedPreferences spref = await SharedPreferences.getInstance();
    var sp = spref.getString('log_id');
    var data = {
      "id": sp,
      "interest": interest.text,
    };
    print(data);
    var response =
        await post(Uri.parse('${Con.url}addinterest.php'), body: data);
    print(response.body);
    if (response.statusCode == 200) {
      var res = jsonDecode(response.body)["message"];
      if (res == 'Added') {
        const snackBar = SnackBar(
          content: Text("added"),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        Fluttertoast.showToast(msg: "added");
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return const Viewinterest();
          },
        ));
      }
    } else {
      Fluttertoast.showToast(msg: "something went wrong");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Interests"),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: ListView(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("You can write about your skills and interests."),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: interest,
                  keyboardType: TextInputType.multiline,
                  maxLines: 10,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Add interest",
                      hintText: "Enter interests",
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Colors.black87))),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  getData();
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => const Home()));
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 88.0, right: 90.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black87,
                    ),
                    height: 50,
                    width: 50,
                    child: const Center(child: Text('SAVE')),
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
