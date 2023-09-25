import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:qhire/const.dart';

import 'package:qhire/newpage.dart';
import 'package:qhire/pagehome.dart';
import 'package:url_launcher/url_launcher.dart';

class Course {
  final String name;
  final String link;
  final String content;

  Course({required this.name, required this.link, required this.content});

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      name: json['name'],
      link: json['link'],
      content: json['content'],
    );
  }
}

class Coursepage extends StatefulWidget {
  Coursepage({Key? key}) : super(key: key);

  @override
  State<Coursepage> createState() => _CoursepageState();
}

class _CoursepageState extends State<Coursepage> {
  var _link;

  Future<dynamic> viewCourse() async {
    var data;
    var response =
    await post(Uri.parse('${Con.url}viewcourse.php'), body: data);
    if (response.statusCode == 200) {
      var coursesJson = jsonDecode(response.body);
      print(coursesJson);
      // List<Course> courses = coursesJson.map((courseJson) => Course.fromJson(courseJson)).toList();
      return coursesJson;
    } else {
      throw Exception('Failed to fetch courses');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: Text('Courses'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Pagehome()));
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: FutureBuilder<dynamic>(
            future: viewCourse(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: 100,
                        width: 1000,
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.orange,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                '${snapshot.data[index]['name']}',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                '${snapshot.data[index]['content']}',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      _link = snapshot.data![index]['link'];
                                    });
                                    print(_link);
                                    print('....$_link');
                                    launchUrl(Uri.parse(_link),
                                        mode: LaunchMode.externalApplication);
                                  },
                                  child: Icon(Icons.play_arrow),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );

              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Failed to fetch courses'),
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
