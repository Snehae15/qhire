import 'package:flutter/material.dart';

class HomePages extends StatelessWidget {
  const HomePages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Container(
          width: 200,
          height: 200,
          color: Color(0xFFFFA756),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  print('Container tapped');
                  // Add your code here for the first onclick function
                },
                child: Center(
                  child: Text(
                    'Click me',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              InkWell(
                onTap: () {
                  print('Second container tapped');
                  // Add your code here for the second onclick function
                },
                child: Center(
                  child: Text(
                    'Click me too',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
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
