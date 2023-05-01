import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:qhire/const.dart';
import 'package:url_launcher/url_launcher.dart';

class InterviewPreparationPage extends StatefulWidget {
  @override
  _InterviewPreparationPageState createState() => _InterviewPreparationPageState();
}

class _InterviewPreparationPageState extends State<InterviewPreparationPage> {
  List<dynamic> _data = [];

  Future<void> _fetchData() async {
    final response = await http.get(Uri.parse('${Con.url}viewinterviewpreparation.php'));
    if (response.statusCode == 200) {
      setState(() {
        _data = jsonDecode(response.body);
      });
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Interview Preparation'),
      ),
      body: _data.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: _data.length,
        itemBuilder: (context, index) {
          final item = _data[index];
          return ListTile(
            title: Text(item['name']),
            onTap: () async {
              final url = item['link'];
              if (await canLaunch(url)) {
                await launch(url);
              } else {
                throw 'Could not launch $url';
              }
            },
          );
        },
      ),
    );
  }
}
