import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:qhire/const.dart';
import 'package:url_launcher/url_launcher.dart';

class Exam {
  final String name;
  final String link;
  final String content;

  Exam({
    required this.name,
    required this.link,
    required this.content,
  });

  factory Exam.fromJson(Map<String, dynamic> json) {
    return Exam(
      name: json['name'],
      link: json['link'],
      content: json['content'],
    );
  }
}

class Attendexam extends StatefulWidget {
  const Attendexam({Key? key}) : super(key: key);

  @override
  State<Attendexam> createState() => _AttendexamState();
}

class _AttendexamState extends State<Attendexam> {
  var _link;

  Future<dynamic> viewCourse() async {
    var data;
    var response = await post(Uri.parse('${Con.url}viewjob.php'), body: data);
    if (response.statusCode == 200) {
      var coursesJson = jsonDecode(response.body);
      print(coursesJson);
      // List<Course> courses = coursesJson.map((courseJson) => Course.fromJson(courseJson)).toList();
      return coursesJson;
    } else {
      throw Exception('Failed to fetch exam');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Exam'),
          backgroundColor: Colors.black,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              // Navigator.push(context,MaterialPageRoute(builder: (context) => More()));
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: FutureBuilder<dynamic>(
            future: viewCourse(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    // Course course = snapshot.data!['name'];
                    return Container(
                      height: 90,
                      width: 100,
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
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
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          '${snapshot.data[index]['name']}',
                                          style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          '${snapshot.data[index]['description']}',
                                          style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
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
                                    mode: LaunchMode.externalApplication);
                              },
                              child: const Icon(Icons.arrow_forward)),
                        ],
                      ),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return const Center(
                  child: Text('Failed to fetch EXAM'),
                );
              } else {
                return const Center(
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
