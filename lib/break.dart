import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:qhire/const.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Viewnew extends StatefulWidget {
  const Viewnew({Key? key}) : super(key: key);

  @override
  State<Viewnew> createState() => _ViewnewState();
}

class _ViewnewState extends State<Viewnew> {
  Future<dynamic> getNewsData() async {
    SharedPreferences spref = await SharedPreferences.getInstance();
    var sp = spref.getString('log_id');
    print(sp);

    var data = {"id": sp};

    var response = await post(Uri.parse('${Con.url}viewnews.php'), body: data);
    var res = jsonDecode(response.body);
    print(response.body);
    return res;
  }

  Future<dynamic> getPostsData() async {
    // Fetch posts data from API
    // Replace this with your API call to retrieve posts data
    // Example:
    // var response = await get(Uri.parse('${Con.url}getposts.php'));
    // var res = jsonDecode(response.body);
    // return res;

    // Mock data for demonstration
    return [
      {
        'postname': 'Post 1',
        'description': 'Description of post 1',
        'uploadfile': 'image1.jpg',
      },
      {
        'postname': 'Post 2',
        'description': 'Description of post 2',
        'uploadfile': 'image2.jpg',
      },
      {
        'postname': 'Post 3',
        'description': 'Description of post 3',
        'uploadfile': 'image3.jpg',
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("View News"),
        backgroundColor: Colors.orange,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getPostsData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text("Error: ${snapshot.error}"));
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
                              snapshot.data[index]['postname'],
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              snapshot.data[index]['description'],
                              style: TextStyle(fontSize: 16),
                            ),
                            Container(
                              height: 350,
                              width: 350,
                              color: Colors.grey,
                              child: Image.network(
                                Con.img + snapshot.data[index]['uploadfile'],
                                fit: BoxFit.fill,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
