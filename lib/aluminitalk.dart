import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:qhire/const.dart';
import 'package:url_launcher/url_launcher.dart';

class Alumini{


  final String name;
  final String date;
  final String time;
  final String link;



  Alumini({required this.link, required this.date, required this.time, required this.name,});

  factory Alumini.fromJson(Map<String, dynamic> json) {
    return Alumini(
      name: json['name'],
      link: json['link'],
      date: json['date'],
      time: json['time'],

    );
  }
}

class Aluminitalk extends StatefulWidget {
  Aluminitalk({Key? key}) : super(key: key);

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
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) => More()));
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
                    return Container(
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
                                    Text('${snapshot.data[index]['name']}',
                                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal,),),
                                    Text('${snapshot.data[index]['time']}',
                                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal,),),
                                    Text('${snapshot.data[index]['date']}',
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
