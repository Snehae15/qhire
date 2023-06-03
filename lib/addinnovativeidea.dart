import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

import 'package:qhire/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'bottom.dart';

class Addidea extends StatefulWidget {
  const Addidea({Key? key}) : super(key: key);

  @override
  _AddideaState createState() => _AddideaState();
}

class _AddideaState extends State<Addidea> {
  final _formKey = GlobalKey<FormState>();

  var name = TextEditingController();
  var details = TextEditingController();
  XFile? pickedFile;
  File? image;

  File? pickedImage;

  addIdea(BuildContext context) async {
    SharedPreferences spref = await SharedPreferences.getInstance();
    var sp = spref.getString('log_id');
    print('>>>>>>>>>>$sp');
    if (pickedImage != null) {
      final data = await Services.postWithIamge(
          endPoint: 'addinnovativeidea.php',
          params: {
            "id": sp,
            "name": name.text,
            "details": details.text,
          },
          image: pickedImage!,
          imageParameter: 'pic');

      if ((data as Map)['result'] == 'done') {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (_) => const Pagehome(),
          ),
        );
      } else {
        Fluttertoast.showToast(msg: 'Innovative idea added');
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return const Pagehome();
          },
        ));
      }
    } else {
      Fluttertoast.showToast(msg: 'Pick image ');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Innovative Idea"),
        backgroundColor: CupertinoColors.black,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(22.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Upload Image',
                      style: TextStyle(fontSize: 15),
                    ),
                    FloatingActionButton(
                      onPressed: () async {
                        File? temp = await Services.pickImage(context);
                        setState(() {
                          pickedImage = temp;
                        });
                        print(pickedImage!.path);
                      },
                      child: const Icon(Icons.camera_alt),
                    ),
                    // image == null ? Text('no image') : Image.file(image!),
                  ],
                ),
              ),
              const Text(
                '*Must upload a image',
                style: TextStyle(color: Colors.red),
              ),
              // Text(snap.data.toString()),

              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please idea name';
                    }
                    return null;
                  },
                  controller: name,
                  decoration: const InputDecoration(
                      labelText: 'Name of idea', border: OutlineInputBorder()),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please idea description';
                    }
                    return null;
                  },
                  controller: details,
                  minLines: 6,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: const InputDecoration(
                      labelText: 'Details', border: OutlineInputBorder()),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        addIdea(context);
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        height: 50,
                        width: 320,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.black, // <-- Add this line
                        ),
                        child: const Center(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Submit',
                              style: TextStyle(color: Colors.white),
                            ),
                            Icon(
                              Icons.arrow_right,
                              color: Colors.white,
                            )
                          ],
                        )),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
