import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Addabout extends StatefulWidget {
  const Addabout({Key? key}) : super(key: key);

  @override
  State<Addabout> createState() => _AddaboutState();
}

class _AddaboutState extends State<Addabout> {
  var post = TextEditingController();
  void getData(){
    print(post.text);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text("Add about"),
    centerTitle: true,
    ),
      body: Center(
        child: Column(
            children: [
     Padding(
       padding: const EdgeInsets.all(8.0),
       child: Text("You can write about your years of experience, industry, or skills. \n People also talk about their achievements or previous job experiences."),
     ),
    Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextField(
    keyboardType: TextInputType.multiline,
    maxLines: 10,
    decoration: InputDecoration(
    border: OutlineInputBorder(),
    labelText:"Add about",hintText: "Enter about",
    focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(width: 1, color: Colors.redAccent)
    )
    ),
    ),
    ),
              ElevatedButton(onPressed: (){
                getData();
                //Navigator.push(context, MaterialPageRoute(builder: (context)=>Reg()));
              }, child: Text("Save")),
    ],
    ),
    ),
    );
  }
}
