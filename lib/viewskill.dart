import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:qhire/addskill.dart';
import 'package:qhire/const.dart';
import 'package:qhire/pagehome.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Viewskill extends StatelessWidget {
  const Viewskill({Key? key}) : super(key: key);

  static const String _title = 'View skill';

  Future<List<dynamic>> viewSkill() async {
    SharedPreferences spref = await SharedPreferences.getInstance();
    var sp = spref.getString('log_id');
    print(sp);

    var data = {
      "id": sp,
    };
    print('>>>>>>>$data');

    var response = await post(Uri.parse('${Con.url}viewskill.php'), body: data);
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
          backgroundColor: Colors.orange,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Pagehome()));
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: FutureBuilder(
            future: viewSkill(),
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
                            Text('SKILL', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                            SizedBox(height: 8.0),
                            Text(snapshot.data![index]['skill'] ?? ''),
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
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Navigate to the AddPage when the floating button is pressed
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Addskill()), // Replace with your AddPage widget
            );
          },
          child: Icon(Icons.add),
          backgroundColor: Colors.orange,
        ),
      ),
    );
  }
}
