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
  const Viewpost({Key? key}) : super(key: key);

  static const String _title = 'View post';

  Future<dynamic> viewPost() async {
    SharedPreferences spref = await SharedPreferences.getInstance();
    var sp = spref.getString('emp_id');
    print(sp);

    var data = {
      "id": sp,
    };
    print('>>>>>>>>>>>>>>>>>>>>$data');

    var response = await post(Uri.parse('${Con.url}viewonpost.php'), body: data);
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
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Pagehome()),
              );
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 12, bottom: 10, right: 20),
          child: FutureBuilder(
            future: viewPost(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.data[0]['message'] == 'failed') {
                return Center(child: Text('No data'));
              } else {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            snapshot.data![index]['postname'],
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            snapshot.data![index]['description'],
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    );
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
