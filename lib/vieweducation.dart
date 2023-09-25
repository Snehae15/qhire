import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:qhire/addeducation.dart';
import 'package:qhire/const.dart';
import 'package:qhire/pagehome.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(const Vieweducation());

class Vieweducation extends StatelessWidget {
  const Vieweducation({super.key});

  static const String _title = 'View Education';

  Future<dynamic> viewEducation() async {
    SharedPreferences spref = await SharedPreferences.getInstance();
    var sp = spref.getString('log_id');
    print(sp);

    var data = {
      "id": sp,
    };
    print('>>>>>>>>>>>>$data');

    var response =
    await post(Uri.parse('${Con.url}vieweducation.php'), body: data);
    print(response.body);
    var res = jsonDecode(response.body);
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Education"),
          backgroundColor: Colors.orange,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Pagehome()),
              );
            },
          ),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FutureBuilder(
                  future: viewEducation(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.data[0]['message'] == 'failed') {
                      return Center(child: Text('no data'));
                    } else
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          var jobData = snapshot.data![index];
                          return Container(
                            margin: EdgeInsets.symmetric(vertical: 8.0),
                            padding: EdgeInsets.all(12.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white70,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Center Name',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 4.0),
                                Text(jobData['centername']),
                                SizedBox(height: 12.0),
                                Text(
                                  'Degree',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 4.0),
                                Text(jobData['degree']),
                                SizedBox(height: 12.0),
                                Text(
                                  'Field',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 4.0),
                                Text(jobData['field']),
                                Text(
                                  'Start Date',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 4.0),
                                Text(jobData['startdate']),
                                SizedBox(height: 12.0),
                                Text(
                                  'End Date',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 4.0),
                                Text(jobData['enddate']),
                                SizedBox(height: 12.0),
                                Text(
                                  'Grade',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 4.0),
                                Text(jobData['grade']),
                                SizedBox(height: 12.0),
                                Text(
                                  'Activity',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 4.0),
                                Text(jobData['activity']),
                                SizedBox(height: 12.0),
                                Text(
                                  'Description',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 4.0),
                                Text(jobData['description']),
                              ],
                            ),
                          );
                        },
                      );
                  },
                ),
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Navigate to the AddPage when the floating button is pressed
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Addeducation()), // Replace with your AddPage widget
            );
          },
          child: Icon(Icons.add),
          backgroundColor: Colors.orange,
        ),
      ),
    );
  }
}
