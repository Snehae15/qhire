import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:qhire/const.dart';
import 'package:qhire/newpage.dart';
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

class Coursepage extends StatelessWidget {
  const Coursepage({Key? key}) : super(key: key);

  Future<List<Course>> viewCourse() async {
    var data;
    var response = await http.post(Uri.parse('${Con.url}viewcourse.php'), body: data);
    if (response.statusCode == 200) {
      List<dynamic> coursesJson = jsonDecode(response.body);
      List<Course> courses = coursesJson.map((courseJson) => Course.fromJson(courseJson)).toList();
      return courses;
    } else {
      throw Exception('Failed to fetch courses');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Courses'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => More()));
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder<List<Course>>(
            future: viewCourse(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    Course course = snapshot.data![index];
                    return GestureDetector(
                      onTap: () async {
                        if (await canLaunchUrl(course.link as Uri)) {
                          await launchUrl(course.link as Uri);
                        } else {
                          throw 'Could not launch ${course.link}';
                        }
                      },

                      child: Container(
                        height: 90,
                        width: 1000,
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.blue,
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
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        course.name,
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Icon(Icons.play_arrow),
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
