import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:qhire/const.dart';
import 'package:qhire/homepage.dart';

class Addskill extends StatefulWidget {
  const Addskill({Key? key}) : super(key: key);

  @override
  State<Addskill> createState() => _AddskillState();
}

class _AddskillState extends State<Addskill> {
  var skill = TextEditingController();
  Future<void> getData() async {
    var data = {
      "skill": skill.text,
    };
  print(data);
  var response = await post(Uri.parse('${Con.url}addabout.php'),body : data);
  print(response.body);
  if (response.statusCode == 200) {
  var res = jsonDecode(response.body)["message"];
  if (res == 'Added') {
  const snackBar = SnackBar(content: Text("added"),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
  Navigator.push(context,MaterialPageRoute(builder: (context){
  return Homepage();
  },
  ));
  }
  }
  else {
  Fluttertoast.showToast(msg: "something went wrong");
  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add skill",style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.blueGrey, centerTitle: true,),
      body:
      SafeArea(
    child:Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Add your skills"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                keyboardType: TextInputType.multiline,
                maxLines: 10,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText:"Add skill",hintText: "Enter skill",
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.redAccent)
                    )
                ),
              ),
            ),
            SizedBox(height: 10,),
            InkWell(
              onTap: () {
                getData();
                Navigator.push(context,MaterialPageRoute(builder: (context)=>Homepage()));
              },

              child: Padding(
                padding: const EdgeInsets.only(left: 88.0,right: 90.0),
                child: Container(
                  child: Center(child: Text('ADD')),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blueGrey,
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

