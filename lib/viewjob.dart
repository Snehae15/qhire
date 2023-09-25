import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:qhire/chatboat.dart';
import 'package:qhire/const.dart';
import 'package:qhire/pagehome.dart';
import 'package:qhire/tests.dart';
import 'package:qhire/view%20news.dart';
import 'package:qhire/viewaddpost.dart';
import 'package:qhire/viewprofile.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'first.dart';

void main() => runApp(const Viewjob());

class Viewjob extends StatelessWidget {
  const Viewjob({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("JOBS"),
          centerTitle: true,
          backgroundColor: Colors.orange,
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              Container(
                color: Colors.orange, // Set your desired background color here
                child: UserAccountsDrawerHeader(
                  currentAccountPicture: Icon(
                    Icons.person,
                    size: 48.0,
                    color: Colors.white,
                  ),
                  accountName: Text("Welcome to Q-hire"),
                  accountEmail: null, // Set accountEmail to null to remove it
                ),
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text("PROFILE"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Viewpro()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.menu_book_outlined),
                title: Text("News"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Viewnews()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.post_add),
                title: Text("POST"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Viewpost()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text("Logout"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => First()),
                  );
                },
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            width: screenSize.width,
            height: screenSize.height,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white,
                  Color(0xFFFFA756), // Starting color
                  Colors.white, // Ending color
                ],
              ),
            ),
            child: FutureJobList(),
          ),
        ),
      ),
    );
  }
}

class FutureJobList extends StatelessWidget {
  Future<List<dynamic>> viewJob() async {
    SharedPreferences spref = await SharedPreferences.getInstance();
    var sp = spref.getString('log_id');
    print(sp);

    var data = {
      "id": sp,
    };
    print('>>>>>>$data');

    var response =
        await post(Uri.parse('${Con.url}viewalljob.php'), body: data);
    print(response.body);
    var res = jsonDecode(response.body);
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: viewJob(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError || snapshot.data == null) {
          return const Center(child: Text('Failed to load data'));
        } else if (snapshot.data!.isEmpty) {
          return const Center(child: Text('No data available'));
        } else {
          final dataList = snapshot.data! as List;

          return SearchableList(dataList: dataList);
        }
      },
    );
  }
}

class SearchableList extends StatefulWidget {
  const SearchableList({Key? key, required this.dataList}) : super(key: key);

  final List dataList;

  @override
  State<SearchableList> createState() => _SearchableListState();
}

class _SearchableListState extends State<SearchableList> {
  List datas = [];

  @override
  void initState() {
    datas = widget.dataList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          onChanged: (value) {
            if (value.isEmpty) {
              setState(() {
                datas = widget.dataList;
              });
            } else {
              datas = [];
              widget.dataList.forEach((singleItem) {
                if (singleItem['jobname']
                    .toString()
                    .toLowerCase()
                    .contains(value.toLowerCase())) {
                  setState(() {
                    datas.add(singleItem);
                  });
                }
              });
            }
          },
          decoration: const InputDecoration(
            hintText: "Search Job",
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: datas.length,
            itemBuilder: (context, index) {
              var jobData = datas[index];
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                padding: const EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 5,
                      blurRadius: 5,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Job Name',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Text(jobData['jobname']),
                    const SizedBox(height: 12.0),
                    const Text(
                      'Shift Schedule',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Text(jobData['shift_schedule']),
                    const SizedBox(height: 12.0),
                    const Text(
                      'Benefits',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Text(jobData['benefits']),
                    const Text(
                      'Experience',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Text(jobData['experience']),
                    const SizedBox(height: 12.0),
                    const Text(
                      'Job type',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Text(jobData['jobtype']),
                    const SizedBox(height: 12.0),
                    const Text(
                      'Job description',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Text(jobData['jobdescription']),
                    const SizedBox(height: 12.0),
                    const Text(
                      'Skills',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Text(jobData['skills']),
                    const SizedBox(height: 12.0),
                    const Text(
                      'Vacancy',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Text(jobData['vacancy']),
                    const Text(
                      'Salary',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Text(jobData['salary']),
                    ElevatedButton(
                      onPressed: () {
                        update(id: 'job_id');
                        Fluttertoast.showToast(msg: "Applied for exam");
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Questionnaire()));
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.orange),
                      ),
                      child: const Text("Apply"),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  void update({required String id}) {
    var data = {"id": id};
    var response = post(Uri.parse('${Con.url}appliedjob.php'), body: data);
  }
}
