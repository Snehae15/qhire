// import 'dart:html';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qhire/add%20post.dart';
import 'package:qhire/const.dart';
import 'package:qhire/home.dart';
import 'package:qhire/homepage.dart';

class Addpost extends StatefulWidget {
  const Addpost({Key? key}) : super(key: key);

  @override
  State<Addpost> createState() => _AddpostState();
}

class _AddpostState extends State<Addpost> {
  XFile? pickedFile;
  File? image;
  var postname = TextEditingController();
  var uploadfile = TextEditingController();
  var description = TextEditingController();

  Future<void> getData() async {
    var data = {
      "postname": postname.text,
      "uploadfile": image!.path,
      "description": description.text,

    };
    var response = await post(Uri.parse('${Con.url}addpost.php'), body: data);
    print(response.body);
    if (response.statusCode == 200) {
      var res = jsonDecode(response.body)["message"];
      if (res == 'added') {
        const snackBar = SnackBar(content: Text("successfully added"),
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
          title: const Text("ADD POST",style: TextStyle(color: Colors.black),),
          backgroundColor: Colors.teal,
          centerTitle: true,
        ),
        body:SafeArea(
            child: Center(
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left:20.0,right: 20.0,top:10.0),
                    child: Container(
                      width: 100,
                      child: TextField(
                        controller: postname,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText:"Post name",hintText: "Post Name ",
                        ),
                        keyboardType: TextInputType.name,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:20.0,right: 20.0,top:10.0),
                    child: Container(
                      width: 100,
                      child: TextField(
                        controller: description,
                        maxLines: 4,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(

                          ),
                          labelText:"description",hintText: "description",
                        ),
                        keyboardType: TextInputType.multiline,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 100,right:100),
                        child: ElevatedButton(
                          child: Text("upload image"),
                          onPressed: () async{
                            ImagePicker picker = ImagePicker();
                            pickedFile= await picker.pickImage(source:ImageSource.gallery,maxHeight: 200, maxWidth: 200);
                            setState(() {
                              image = File(pickedFile!.path);
                              getData();

                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  image==null?  Text('no image') :Image.file(image!),
                  Text(image==null?'image':pickedFile!.name),
                  SizedBox(height: 10,),
                  InkWell(
                    onTap: () {
                      getData();
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>Home()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 88.0,right: 90.0),
                      child: Container(
                        child: Center(child: Text('submit')),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.teal,
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


