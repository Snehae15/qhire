import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:qhire/const.dart';
import 'package:qhire/pagehome.dart';
import 'package:url_launcher/url_launcher.dart';

class Alumini{
  final String name;
  final String date;
  final String time;
  final String link;



  Alumini({required this.name, required this.date, required this.time, required this.link,});

  factory Alumini.fromJson(Map<String, dynamic> json) {
    return Alumini(
      name: json['name'],
      date: json['date'],
      time: json['time'],
      link: json['link'],

    );
  }
}

class Aluminitalk extends StatefulWidget {
  const Aluminitalk({Key? key}) : super(key: key);

  @override
  State<Aluminitalk> createState() => _AluminitalkState();
}

class _AluminitalkState extends State<Aluminitalk> {
  var _link ;

  Future<dynamic> viewCourse() async {
    var data;
    var response = await post(Uri.parse('${Con.url}viewaluminitalk.php'), body: data);
    if (response.statusCode == 200) {
      var coursesJson = jsonDecode(response.body);
      print(coursesJson);
      // List<Course> courses = coursesJson.map((courseJson) => Course.fromJson(courseJson)).toList();
      return coursesJson;
    } else {
      throw Exception('Failed to fetch Alumini talk');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Alumini Talk'),
          backgroundColor: Colors.orange,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Pagehome()));
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: FutureBuilder<dynamic>(
            future: viewCourse(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    // Course course = snapshot.data!['name'];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 90,
                        width: 1000,
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.orange,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${snapshot.data[index]['name']}',
                                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  '${snapshot.data[index]['time']}',
                                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                                ),

                              SizedBox(height: 5),
                                Text(
                                  '${snapshot.data[index]['date']}',
                                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                                ),
                            ],
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  _link = snapshot.data![index]['link'];
                                });
                                print(_link);
                                print('....$_link');
                                launchUrl(Uri.parse(_link),
                                  mode: LaunchMode.externalApplication,
                                );
                              },
                              child: Icon(Icons.play_arrow),
                            ),
                          ],
                        ),

                      ),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Failed to fetch Aluminitalk'),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
