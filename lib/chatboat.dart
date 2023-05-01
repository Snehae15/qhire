import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ChatbotPage extends StatefulWidget {
  @override
  _ChatbotPageState createState() => _ChatbotPageState();
}

class _ChatbotPageState extends State<ChatbotPage> {
  List<String> _messages = [];
  TextEditingController _textEditingController = TextEditingController();

  void _addMessage(String message) {
    setState(() {
      _messages.add(message);
    });
  }

  void _sendMessage(String message) async {
    _addMessage('You: $message');
    final response = await http.post(
      Uri.parse('http://example.com/chatbot'), // Replace with your API endpoint
      body: {'message': message},
    );
    if (response.statusCode == 200) {
      _addMessage('Bot: ${response.body}');
    } else {
      _addMessage('Bot: Sorry, I cannot process your request at the moment.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chatbot'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return ListTile(
                  title: Text(message),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textEditingController,
                    decoration: InputDecoration(
                      hintText: 'Type your message',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    final message = _textEditingController.text;
                    _textEditingController.clear();
                    _sendMessage(message);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
