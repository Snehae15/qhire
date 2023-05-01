import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:qhire/const.dart';
import 'package:qhire/home.dart';
import 'package:qhire/pagehome.dart';
import 'package:qhire/viewpost.dart';
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

    var response = await post(Uri.parse('${Con.url}vieweducation.php'), body: data);
    print(response.body);
    var res = jsonDecode(response.body);
    return res;
    //print(res);
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
        body:Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blueGrey,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FutureBuilder(
                    future: viewEducation(),
                    builder: (context,snapshot) {
                      if(!snapshot.hasData){
                        return Center(child: CircularProgressIndicator());
                      }
                      else if (snapshot.data[0]['message'] == 'failed') {
                        return Center(child: Text('no data'));
                      } else
                        return ListView.builder(
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  SizedBox(height: 10),
                                  Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('CENTER NAME',style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),),
                                        Text(snapshot.data![index]['centername']),
                                      ]),

                                  Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('DEGREE',style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),),
                                        Text(snapshot.data![index]['degree']),
                                      ]),
                                  Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('FIELD',style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),),
                                        Text(snapshot.data![index]['field']),
                                      ]),
                                  Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('START DATE',style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),),
                                        Text(snapshot.data![index]['startdate']),
                                      ]),
                                  Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('END DATE',style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),),
                                        Text(snapshot.data![index]['enddate'])
                                      ]),
                                  Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('GRADE',style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),),
                                        Text(snapshot.data![index]['grade'].toString())
                                      ]),
                                  Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('ACTIVITY',style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),),
                                        Text(snapshot.data![index]['activity'].toString())
                                      ]),
                                  Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('DESCRIPTION',style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),),
                                        Text(snapshot.data![index]['description'].toString())
                                      ]),
                                ],
                                );
                                }
                      );
                  }),
            ),
          ),
        ),
      ),
    ),
    );
  }
}
