import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qhire/const.dart';
import 'package:qhire/home.dart';
import 'package:qhire/homepage.dart';
import 'package:qhire/viewpost.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddPost extends StatefulWidget {
  const AddPost({Key? key}) : super(key: key);

  @override
  _AddPostState createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  XFile? pickedFile;
  File? image;
  var postname = TextEditingController();
  var description = TextEditingController();

  Future<void> _addPost() async {
    SharedPreferences spref = await SharedPreferences.getInstance();
    var sp = spref.getString('log_id');
    print(sp);

    if (postname.text.trim().isEmpty ||
        description.text.trim().isEmpty ||
        image == null) {
      Fluttertoast.showToast(msg: "Please fill all fields");
      return;
    }

    var data = {
      "id": sp,
      "postname": postname.text.trim(),
      "uploadfile": image!.path,
      "description": description.text.trim(),
    };
    print(data);
    var response = await post(Uri.parse('${Con.url}addpost.php'), body: data);
    print(response.body);
    if (response.statusCode == 200) {
      var res = jsonDecode(response.body)["message"];
      if (res == 'added') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Successfully added"),
          ),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Viewpost(),
          ),
        );
      }
    } else {
      Fluttertoast.showToast(msg: "Something went wrong");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "ADD POST",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: ListView(
            children: [
              Padding(
                padding:
                const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
                child: TextField(
                  controller: postname,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Post name",
                    hintText: "Post Name",
                  ),
                  keyboardType: TextInputType.name,
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
                child: TextField(
                  controller: description,
                  maxLines: 4,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Description",
                    hintText: "Description",
                  ),
                  keyboardType: TextInputType.multiline,
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 100, right: 100),
                    child: ElevatedButton(
                      child: Text("Upload Image"),
                      onPressed: () async {
                        ImagePicker picker = ImagePicker();
                        pickedFile = await picker.pickImage(
                            source: ImageSource.gallery,
                            maxHeight: 200,
                            maxWidth: 200);
                        setState(() {
                          image = File(pickedFile!.path);
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
                     _addPost();
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


