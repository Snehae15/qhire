import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class More extends StatelessWidget {
  final List<Map<String, String>> _items = [
    {
      'title': 'Item 1',
      'subtitle': 'Subtitle for Item 1',
      'image': 'https://via.placeholder.com/150',
    },
    {
      'title': 'Item 2',
      'subtitle': 'Subtitle for Item 2',
      'image': 'https://via.placeholder.com/150',
    },
    {
      'title': 'Item 3',
      'subtitle': 'Subtitle for Item 3',
      'image': 'https://via.placeholder.com/150',
    },
    {
      'title': 'Item 4',
      'subtitle': 'Subtitle for Item 4',
      'image': 'https://via.placeholder.com/150',
    },
    {
      'title': 'Item 5',
      'subtitle': 'Subtitle for Item 5',
      'image': 'https://via.placeholder.com/150',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              // Do something when the item is tapped
            },
            child: Card(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(
                      _items[index]['image']!,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _items[index]['title']!,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          _items[index]['subtitle']!,
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
