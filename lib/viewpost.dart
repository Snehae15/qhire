import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:qhire/const.dart';
import 'package:qhire/home.dart';
import 'package:qhire/homepage.dart';
import 'package:qhire/pagehome.dart';
import 'package:qhire/viewpost.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(const Viewpost());

class Viewpost extends StatelessWidget {
  const Viewpost({super.key});

  static const String _title = 'View post';

  Future<dynamic> viewPost() async {
    SharedPreferences spref = await SharedPreferences.getInstance();
    var sp = spref.getString('emp_id');
    print(sp);

    var data = {
      "id": sp,
    };
    print('>>>>>>>>>>>>>>>>>>>>$data');

    var response = await post(Uri.parse('${Con.url}viewpost.php'), body: data);
    print(response.body);
    var res = jsonDecode(response.body);
    return res;
   // print(res);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(
            leading: IconButton(
            icon: Icon(Icons.arrow_back),
        onPressed:(){
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => Pagehome()));
        },
      ),
        ),
          body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: FutureBuilder(
          future: viewPost(),
          builder: (context,snapshot) {
          if(!snapshot.hasData){
              return Center(child: CircularProgressIndicator());
              }
              else if (snapshot.data[0]['message'] == 'failed') {
                return Center(child: Text('no data'));
                } else
                return ListView(
                              children: [
                              Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                              Text('PostName'),
                              Text(snapshot.data![0]['postname']),
                              ]),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Uploaded file'),
                                      Text(snapshot.data![0]['uploadfile']),
                                    ]),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Description'),
                                      Text(snapshot.data![0]['description']),
                                    ]),
            ],
            );
            }
    ),
    ),
    ),
    );
  }
}
