import 'package:flutter/material.dart';

class Addskill extends StatefulWidget {
  const Addskill({Key? key}) : super(key: key);

  @override
  State<Addskill> createState() => _AddskillState();
}

class _AddskillState extends State<Addskill> {
  var skill = TextEditingController();
  void getData(){
    print(skill.text);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add skill"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Add you skill"),
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

