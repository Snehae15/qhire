import 'package:flutter/material.dart';

class Editpost extends StatefulWidget {
  const Editpost({Key? key}) : super(key: key);

  @override
  State<Editpost> createState() => _EditpostState();
}

class _EditpostState extends State<Editpost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ADD POSTS"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                //controller: user,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Post name",
                  hintText: "Enter post Name",
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Upload post",
                  hintText: "Upload post",
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                keyboardType: TextInputType.multiline,
                maxLines: 4,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Description About post",
                    hintText: "Enter Description About post",
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 1, color: Colors.redAccent))),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                //getData();
                //Navigator.push(context, MaterialPageRoute(builder: (context)=>Reg()));
              },
              child: const Text("SUBMIT"),
            ),
          ],
        ),
      ),
    );
  }
}
