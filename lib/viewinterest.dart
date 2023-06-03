import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:qhire/const.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'bottom.dart';

void main() => runApp(const Viewinterest());

class Viewinterest extends StatelessWidget {
  const Viewinterest({Key? key}) : super(key: key);

  static const String _title = 'View interest';

  Future<dynamic> viewInterest() async {
    SharedPreferences spref = await SharedPreferences.getInstance();
    var sp = spref.getString('log_id');
    print(sp);

    var data = {
      "id": sp,
    };
    print('>>>>>>>>>>>>$data');

    var response = await post(Uri.parse('${Con.url}viewinterest.php'), body: data);
    print(response.body);
    var res = jsonDecode(response.body);
    return res;
    //print(res);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("View interests"),
          backgroundColor: Colors.black,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Pagehome()));
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: FutureBuilder(
              future: viewInterest(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.data[0]['message'] == 'failed') {
                  return const Center(child: Text('No data'));
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            ListTile(
                              title: Text(snapshot.data![index]['interest']),
                            ),
                            const Divider(),
                          ],
                        );
                      });
                }
              }),
        ),
      ),
    );
  }
}
