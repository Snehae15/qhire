import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:qhire/home.dart';

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
  void getData() {
    print(centername.text);
    print(degree.text);
    print(fieldstudy.text);
    print(startdate.text);
    print(enddate.text);
    print(grade.text);
    print(activity.text);
    print(description.text);
  }
  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field
    super.initState();
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
              child: TextField(
                controller: centername,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText:"Center name",hintText: "Enter Center name",
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                controller: degree,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText:"Degree",hintText: "Enter Degree type",
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                controller: fieldstudy,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText:"Field of Study",hintText: "Enter Field of Study",
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                keyboardType : TextInputType.datetime,
                decoration : InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.only(),
                  ),
                  labelText:"Start date",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                keyboardType : TextInputType.datetime,
                decoration : InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.only(),
                  ),
                  labelText:"End date",
                ),
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
