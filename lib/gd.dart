import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:qhire/const.dart';
import 'package:qhire/pagehome.dart';
import 'package:url_launcher/url_launcher.dart';

class Group {

  final String name;

  Group( {required this.name, required link, });

  factory Group.fromJson(Map<String, dynamic> json) {
    return Group(
      name: json['name'],
      link: json['link'],
    );
  }
}

class Groupdiscuttion extends StatefulWidget {
  Groupdiscuttion({Key? key}) : super(key: key);

  @override
  State<Groupdiscuttion> createState() => _GroupdiscuttionState();
}

class _GroupdiscuttionState extends State<Groupdiscuttion> {
  var _link ;

  Future<dynamic> viewCourse() async {
    var data;
    var response = await post(Uri.parse('${Con.url}viewgd.php'), body: data);
    if (response.statusCode == 200) {
      var coursesJson = jsonDecode(response.body);
      print(coursesJson);
      // List<Course> courses = coursesJson.map((courseJson) => Course.fromJson(courseJson)).toList();
      return coursesJson;
    } else {
      throw Exception('Failed to fetch GD');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: Text('GD'),
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
                      padding: const EdgeInsets.all(15.0),
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
                                      Text('${snapshot.data[index]['name']}',
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
                  child: Text('Failed to fetch gd'),
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
