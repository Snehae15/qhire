import 'package:flutter/material.dart';
import 'package:qhire/login.dart';

void main() => runApp(MyApps());

class MyApps extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Centered Containers',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Centered Containers'),
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Log()),
                  );
                },
                child: Container(
                  width: 150,
                  height: 150,
                  color: Colors.blue,
                  child: Center(
                    child: Text(
                      'Container 1',
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
                    MaterialPageRoute(builder: (context) => Log()),
                  );
                },
                child: Container(
                  width: 150,
                  height: 150,
                  color: Colors.white24,
                  child: Center(
                    child: Text(
                      'Container 2',
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
