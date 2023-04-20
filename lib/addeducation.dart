import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:qhire/const.dart';
import 'package:qhire/home.dart';
import 'package:qhire/homepage.dart';

class Addeducation extends StatefulWidget {
  const Addeducation({Key? key}) : super(key: key);

  @override
  State<Addeducation> createState() => _AddeducationState();
}

class _AddeducationState extends State<Addeducation> {
  var centername = TextEditingController();
  var degree = TextEditingController();
  var fieldstudy = TextEditingController();
  var startdate = TextEditingController();
  var enddate = TextEditingController();
  var grade = TextEditingController();
  var activity = TextEditingController();
  var description = TextEditingController();
  TextEditingController dateinput = TextEditingController();
  TextEditingController dateinputs = TextEditingController();
  Future<void> getData() async {
    var data = {
    "centername":centername.text,
    "degree":degree.text,
    "fieldstudy":fieldstudy.text,
    "dateinput":dateinput.text,
    "dateinputs":dateinputs.text,
    "grade":grade.text,
   "activity":activity.text,
   "description":description.text,
  };
    print(data);
  var response = await post(Uri.parse('${Con.url}addeducation.php'),body: data);
  print(response.body);
  if(response.statusCode==200){
  var res = jsonDecode(response.body)["message"];
  if(res=='Added'){
  const snackBar = SnackBar(
  content: Text('added'),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
  Fluttertoast.showToast(msg:"added");
  Navigator.push(context, MaterialPageRoute(
  builder: (context) {
  return Homepage();
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
        title: Text("Add Education"),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed:(){
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Home()));
          },
        ),
      ),
      body:
      Center(
        child: ListView(
          children:  [
            Padding(
              padding:const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: centername,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText:"Center name",hintText: "Enter Center name",
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
              child: TextFormField(
                controller: degree,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText:"Degree",hintText: "Enter Degree type",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter';
                  }
                  return null;
                },
              ),
              ),

            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextFormField(
                controller: fieldstudy,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText:"Field of Study",hintText: "Enter Field of Study",
                ),
                    validator: (value) {
                    if (value == null || value.isEmpty) {
                    return 'Please enter';
                    }
                    return null;
                    },
                    ),
                              ),


            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                keyboardType : TextInputType.datetime,
                decoration : InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.only(),
                  ),
                  labelText:"Start date",
                ),
                onTap: () async {
                  DateTime? date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );
                  if (date != null) {
                    dateinputs.text = date.toString().split(' ')[0];
                  }
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter';
                  }
                  // You can add more validation here if necessary, for example checking that the date is in the correct format or range.
                  return null;
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                keyboardType : TextInputType.datetime,
                decoration : InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.only(),
                  ),
                  labelText:"End date",
                ),
                onTap: () async {
                  DateTime? date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );
                  if (date != null) {
                    dateinput.text = date.toString().split(' ')[0];
                  }
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter';
                  }
                  // You can add more validation here if necessary, for example checking that the date is in the correct format or range.
                  return null;
                },
              ),
            ),

            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                controller: grade,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),

                  labelText:"Grade",hintText: "Enter Grade",
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.all(8.0),

              child: TextField(
                controller: activity,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),

                  labelText:"Activity",hintText: "Enter Activity",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: description,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText:"Description",
                ),
              ),
            ),
            ElevatedButton(onPressed: (){
              getData();
              Fluttertoast.showToast(msg: "Education Successfully saved");
             // Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
            }, child: Text("Save")),
          ],
        ),
      ),
    );
  }
}
