import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:qhire/activity.dart';
import 'package:qhire/const.dart';
import 'package:qhire/pagehome.dart';
import 'package:qhire/vieweducation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Addeducation extends StatefulWidget {
  const Addeducation({Key? key}) : super(key: key);

  @override
  State<Addeducation> createState() => _AddeducationState();
}

class _AddeducationState extends State<Addeducation> {
  var centername = TextEditingController();
  var degree = TextEditingController();
  var field = TextEditingController();
  var startdate = TextEditingController();
  var enddate = TextEditingController();
  var grade = TextEditingController();
  var activity = TextEditingController();
  var description = TextEditingController();
  TextEditingController dateinput = TextEditingController();
  TextEditingController dateinputs = TextEditingController();

  Future<void> getData() async {
    SharedPreferences spref = await SharedPreferences.getInstance();
    var sp = spref.getString('log_id');
    var data ={
      "id":sp,
    "centername":centername.text,
    "degree":degree.text,
    "field":field.text,
    "startdate":startdate.text,
    "enddate":enddate.text,
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
  return Vieweducation();
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
        backgroundColor: Colors.orange,
        title: Text("Add Education"),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed:(){
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Pagehome()));
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
                controller: field,
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
                controller: dateinput,
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
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: dateinputs,
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
                keyboardType: TextInputType.multiline,
                maxLines: 5,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText:"Description",
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
                  child: Center(child: Text('SAVE',
                    style: TextStyle(color: Colors.white),),),
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
    );
  }
}
