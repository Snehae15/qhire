import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:qhire/const.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'bottom.dart';

void main() => runApp(const Viewidea());

class Viewidea extends StatelessWidget {
  const Viewidea({Key? key}) : super(key: key);

  static const String _title = 'View Idea';

  Future<dynamic> viewIdea() async {
    SharedPreferences spref = await SharedPreferences.getInstance();
    var sp = spref.getString('log_id');
    print(sp);

    var data = {
      "id": sp,
    };
    print('>>>>>>>>>>>>>>>>>>>>$data');

    var response = await http.post(Uri.parse('${Con.url}viewonidea.php'), body: data);
    print(response.body);
    var res = jsonDecode(response.body);
    return res;
  }

  Future<Uint8List?> getImage(String image) async {
    var response = await http.get(Uri.parse('${Con.url}$image'));
    if (response.statusCode == 200) {
      return response.bodyBytes;
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("View On Innovative Idea"),
          backgroundColor: Colors.black,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Pagehome()),
              );
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 12, bottom: 10, right: 20),
          child: FutureBuilder(
            future: viewIdea(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.data[0]['message'] == 'failed') {
                return const Center(child: Text('No data'));
              }
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
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            snapshot.data[index]['name'],
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            snapshot.data[index]['details'],
                            style: const TextStyle(fontSize: 16),
                          ),
                          Container(
                            height: 350,
                            width: 350,
                            color: Colors.grey,
                            child: Image.network(Con.img+snapshot.data[index]['image'],
                              fit:BoxFit.fill,
                            ),
                          ),
                        ],
                      ),
                    );

                  }
              );
            },
          ),
        ),
      ),
    );
  }

}
