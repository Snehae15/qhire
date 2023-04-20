import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:qhire/const.dart';
import 'package:qhire/home.dart';
import 'package:qhire/viewpost.dart';
import 'package:shared_preferences/shared_preferences.dart';

// void main() => runApp(const Viewabout());

class Viewabout extends StatelessWidget {
  const Viewabout({Key? key}) : super(key: key);

  static const String _title = 'View post';

  Future<dynamic> viewAbout() async {
    SharedPreferences spref = await SharedPreferences.getInstance();
    var sp = spref.getString('emp_id');
    print(sp);

    var data = {
      "id": sp,
    };
    print('>>>>>>>$data');

    var response = await post(Uri.parse('${Con.url}viewabout.php'), body: data);
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
                  builder: (context,snapshot) {
                    if (!snapshot.hasData) {
                      return Center(child: CircularProgressIndicator());
                    }
                    else if (snapshot.data[0]['message'] == 'failed') {
                      return Center(child: Text('no data'));
                    } else {
                      return ListView(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 12,right: 12),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('ABOUT'),
                                  Text(snapshot.data![0]['about']),
                                ]),
                          ),
                          // Row(
                          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //     children: [
                          //       Text('about'),
                          //       Text(snapshot.data![0]['about']),
                          //     ])

                        ],
                      );
                    }
                  }
              ),
             ),
                ),
              );
    }
}
