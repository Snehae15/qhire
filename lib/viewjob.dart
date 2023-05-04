import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:qhire/const.dart';
import 'package:qhire/pagehome.dart';

import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(const Viewjob());

class Viewjob extends StatelessWidget {
  const Viewjob({Key? key}) : super(key: key);

  static const String _title = 'View Jobs';

  Future<List<dynamic>> viewJob() async {
    SharedPreferences spref = await SharedPreferences.getInstance();
    var sp = spref.getString('log_id');
    print(sp);

    var data = {
      "id": sp,
    };
    print('>>>>>>>>>>>>$data');

    var response = await post(Uri.parse('${Con.url}viewalljob.php'), body: data);
    print(response.body);
    var res = jsonDecode(response.body);
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Pagehome()));
                },
              ),
            ),
            body: Center(
            child: Padding(
            padding: const EdgeInsets.all(20.0),
        child: FutureBuilder<List<dynamic>>(
        future: viewJob(),
    builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
    return Center(child: CircularProgressIndicator());
    } else if (snapshot.hasError || snapshot.data == null) {
    return Center(child: Text('Failed to load data'));
    } else if (snapshot.data!.isEmpty) {
    return Center(child: Text('No data available'));
    } else {
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
              'Job Name',
              style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              ),
              ),
              SizedBox(height: 4.0),
              Text(jobData['jobname']),
              SizedBox(height: 12.0),
              Text(
              'Shift Schedule',
                style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                ),
                ),
                SizedBox(height: 4.0),
                Text(jobData['shift_schedule']),
                SizedBox(height: 12.0),
                Text(
                'Benefits',
                style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                ),
                ),
              SizedBox(height: 4.0),
              Text(jobData['benefits']),
      Text(
        'Experience',
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(height: 4.0),
      Text(jobData['experience']),
      SizedBox(height: 12.0),
      Text(
        'Job type',
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(height: 4.0),
      Text(jobData['jobtype']),
      SizedBox(height: 12.0),
      Text(
        'Job description',
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(height: 4.0),
      Text(jobData['jobdescription']),
      SizedBox(height: 12.0),
      Text(
        'Skills',
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(height: 4.0),
      Text(jobData['skills']),SizedBox(height: 12.0),
      Text(
        'Vacancy',
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(height: 4.0),
      Text(jobData['vacancy']),
      SizedBox(
        width: double.maxFinite,
        child: ElevatedButton(
          onPressed: () {

          },
          child: Text('Apply'),
        ),
      ),

                                ],
                              ),
                              );

                            }
                        );
                    };
              },
            ),
          ),

    ),
    ),
    );
  }
}
