import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:qhire/const.dart';
import 'package:qhire/home.dart';
import 'package:qhire/viewpost.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Viewabout extends StatelessWidget {
  const Viewabout({Key? key}) : super(key: key);

  static const String _title = 'View about';

  Future<List<dynamic>> viewAbout() async {
    SharedPreferences spref = await SharedPreferences.getInstance();
    var sp = spref.getString('log_id');
    print(sp);

    var data = {
      "id": sp,
    };
    print('>>>>>>>$data');

    var response = await post(Uri.parse('${Con.url}viewaboutstudent.php'), body: data);
    print(response.body);
    var res = jsonDecode(response.body);
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Home()));
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: FutureBuilder(
            future: viewAbout(),
            builder: (context, snapshot) {
              if (snapshot.hasData && snapshot.data != null) {
                if (snapshot.data![0]['message'] == 'failed') {
                  return Center(child: Text('no data'));
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.all(16.0),
                        margin: EdgeInsets.only(bottom: 16.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('ABOUT', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                            SizedBox(height: 8.0),
                            Text(snapshot.data![index]['about'] ?? ''),
                          ],
                        ),
                      );
                    },
                  );
                }
              } else {
                return Center(child: CircularProgressIndicator());
              }

            },
          ),
        ),
      ),
    );
  }
}