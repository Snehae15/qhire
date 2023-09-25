import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:qhire/const.dart';
import 'package:qhire/homepage1.dart';
import 'package:qhire/pagehome.dart';
import 'package:url_launcher/url_launcher.dart';

class Inter {
  final String name;
  final String content;
  final String link;

  Inter({required this.name, required this.content, required this.link});

  factory Inter.fromJson(Map<String, dynamic> json) {
    return Inter(
      name: json['name'],
      content: json['content'],
      link: json['link'],
    );
  }
}

class Interview extends StatefulWidget {
  const Interview({Key? key}) : super(key: key);

  @override
  State<Interview> createState() => _InterviewState();
}

class _InterviewState extends State<Interview> {
  var _link ;

  Future<dynamic> viewCourse() async {
    var data;
    var response = await post(Uri.parse('${Con.url}viewinterviewpreparation.php'), body: data);
    if (response.statusCode == 200) {
      var coursesJson = jsonDecode(response.body);
      print(coursesJson);
      // List<Course> courses = coursesJson.map((courseJson) => Course.fromJson(courseJson)).toList();
      return coursesJson;
    } else {
      throw Exception('Failed to fetch Interview preparation');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Interview preparation'),
          backgroundColor: Colors.orange,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
               Navigator.push(context, MaterialPageRoute(builder: (context) => Pagehome()));
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder<dynamic>(
            future: viewCourse(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    // Course course = snapshot.data!['name'];
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
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
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Row(
                                    children: [
                                      Text('${snapshot.data[index]['name']}',  // displays the name of the item from the snapshot data
                                        style: TextStyle(
                                          fontSize: 15,  // sets font size to 15
                                          fontWeight: FontWeight.normal,  // sets font weight to normal
                                        ),
                                      ),

                                      Text('${snapshot.data[index]['content']}',
                                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal,),),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            InkWell(
                                onTap: (){
                                  setState(() {
                                    _link = snapshot.data![index]['link'];
                                  });
                                  print(_link);
                                  print('....$_link');
                                  launchUrl(Uri.parse(_link),
                                      mode: LaunchMode.externalApplication
                                  );
                                },
                                child: Icon(Icons.play_arrow)),
                          ],
                        ),
                      ),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Failed to fetch Interview preparation'),
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
