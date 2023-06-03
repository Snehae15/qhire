import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qhire/const.dart';
import 'package:qhire/editprofile.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'bottom.dart';

class Viewpro extends StatefulWidget {
  const Viewpro({Key? key}) : super(key: key);

  static const String _title = 'View Profile';

  @override
  State<Viewpro> createState() => _ViewproState();
}

class _ViewproState extends State<Viewpro> {
  late File _image;

  Future<dynamic> profileView() async {
    SharedPreferences spref = await SharedPreferences.getInstance();
    var sp = spref.getString('log_id');
    print(sp);

    var data = {
      "id": sp,
    };
    print('>>>>>>>>>>>>$data');

    var response =
    await post(Uri.parse('${Con.url}viewstudent.php'), body: data);
    print(response.body);
    var res = jsonDecode(response.body);
    return res;
  }

  Future<void> _getImage() async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(
      source: ImageSource.gallery,
    );
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Viewpro._title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Profile"),
          backgroundColor: Colors.black,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => const Pagehome()));
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: FutureBuilder(
            future: profileView(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.data[0]['message'] == 'failed') {
                return const Center(child: Text('no data'));
              } else {
                return ListView(children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                            Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                    const Text('Name',style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),),
                    Text(snapshot.data![0]['name']),
                  ]),

                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                    const Text('DOB',style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),),
                    Text(snapshot.data![0]['dob']),
                  ]),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                    const Text('Phone no',style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),),
                    Text(snapshot.data![0]['phone_no']),
                  ]),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                    const Text('Gender',style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),),
                    Text(snapshot.data![0]['gender']),
                  ]),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Address',style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),),
                      Text(snapshot.data![0]['address'])
                    ]),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Qualification',style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),),
                        Text(snapshot.data![0]['qualification'].toString())
                      ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Username',style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),),
                      Text(snapshot.data![0]['username'].toString())
                    ]),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Email',style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),),
                        Text(snapshot.data![0]['email'].toString())
                      ]),
                  // Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       Text('Employment Status',style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),),
                  //       Text(snapshot.data![0]['status'].toString())
                  //     ]),
                ],
              ),
              ),
            ]);
            }
          },
        ),
        ),
             floatingActionButton: Padding(
               padding: const EdgeInsets.only(bottom:500,right:10),
               child: FloatingActionButton(
                    onPressed: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => const Edit()));
                    }, // Change the icon here
                    backgroundColor: Colors.black,
                    child: const Icon(Icons.edit),
    ),
             ),
    ),
    );
  }
}
