import 'package:flutter/material.dart';
import 'package:qhire/login.dart';

void main() => runApp(const Task());

class Task extends StatelessWidget {
  const Task({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Centered Containers',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Exam'),
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Log()),
                  );
                },
                child: Container(
                  width: 150,
                  height: 150,
                  color: Colors.blue,
                  child: const Center(
                    child: Text(
                      'Task 1',
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Log()),
                  );
                },
                child: Container(
                  width: 150,
                  height: 150,
                  color: Colors.white24,
                  child: const Center(
                    child: Text(
                      'Task 2',
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
