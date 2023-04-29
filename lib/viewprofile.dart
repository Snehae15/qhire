import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:qhire/const.dart';
import 'package:qhire/pagehome.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Viewpro extends StatelessWidget {
  const Viewpro({Key? key}) : super(key: key);

  static const String _title = 'View Profile';

  Future<dynamic> profileView() async {
    SharedPreferences spref = await SharedPreferences.getInstance();
    var sp = spref.getString('log_id');
    print(sp);

    var data = {
      "id": sp,
    };
    print('>>>>>>>>>>>>$data');

    var response = await post(Uri.parse('${Con.url}viewstudent.php'), body: data);
    print(response.body);
    var res = jsonDecode(response.body);
    return res;
     //print(res);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
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
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: FutureBuilder(
            future: profileView(),
            builder: (context,snapshot) {
              if(!snapshot.hasData){
                return Center(child: CircularProgressIndicator());
              }
              else if (snapshot.data[0]['message'] == 'failed') {
              return Center(child: Text('no data'));
              } else
              return ListView(
                children: [
              Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              CircleAvatar(
              radius: 50.0,
              // backgroundImage: AssetImage('asset/profilepic.jpg'),
              ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                    Text('Name',style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),),
                    Text(snapshot.data![0]['name']),
                  ]),

                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                    Text('DOB',style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),),
                    Text(snapshot.data![0]['dob']),
                  ]),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                    Text('Phone no',style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),),
                    Text(snapshot.data![0]['phone_no']),
                  ]),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                    Text('Gender',style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),),
                    Text(snapshot.data![0]['gender']),
                  ]),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Address',style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),),
                      Text(snapshot.data![0]['address'])
                    ]),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Qualification',style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),),
                        Text(snapshot.data![0]['qualification'].toString())
                      ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Username',style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),),
                      Text(snapshot.data![0]['username'].toString())
                    ]),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Email',style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),),
                        Text(snapshot.data![0]['email'].toString())
                      ]),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Employment Status',style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),),
                        Text(snapshot.data![0]['status'].toString())
                      ]),
                ],
              ),
              ),
            ]);
            }
          ),
        ),
      ),
    );
  }
}
