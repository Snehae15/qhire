import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Url2 extends StatelessWidget {
  const Url2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Courses'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () => launch('https://youtu.be/EjavYOFoJJ0'),
            child: Container(
              height: 90,
              width: 1000,
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.blue,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Row(
                          children: [
                            Text(
                              'WELCOME TO C',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 2),
                    ],
                  ),
                  Icon(Icons.play_arrow),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
