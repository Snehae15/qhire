import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:qhire/const.dart';
import 'package:qhire/view%20news.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Viewnews extends StatefulWidget {

  Viewnews({Key? key}) : super(key: key);

  @override
  State<Viewnews> createState() => _ViewnewsState();
}

class _ViewnewsState extends State<Viewnews> {
  Future<dynamic> getData() async {
    SharedPreferences spref=await SharedPreferences.getInstance();
    var sp=spref.getString('log_id');
    print(sp);

    var data={
      "id":sp,

    };
    print(data);
    var response = await post(Uri.parse('${Con.url}viewnews.php'),body:data);
    var res = jsonDecode(response.body);
    print(response.body);
    return res;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("view"),
        centerTitle: true,
      ),
      body: Center(
        child: FutureBuilder(
            future: getData(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.data[0]['message'] == 'failed') {
                return Center(child: Text('No  items added'));
              } else {
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.all(8.0),
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Colors.blueGrey.shade200,
                          borderRadius: BorderRadius.circular(8.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade300,
                              blurRadius: 5.0,
                              offset: Offset(0.0, 2.0),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            // Image(
                            //     height: 100,
                            //     width: 100,
                            //     image: NetworkImage(
                            //         "https://images.unsplash.com/photo-1601004890684-d8cbf643f5f2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=415&q=80")
                            // ),
                            SizedBox(
                              width: 130,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    "News: ${snapshot.data![index]['news']}",
                                    style: TextStyle(
                                      color: Colors.blueGrey.shade800,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    "Content: ${snapshot.data![index]['content']}",
                                    style: TextStyle(
                                      color: Colors.blueGrey.shade800,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    });
              }
            }),
      ),
    );
  }
}
