import 'package:flutter/material.dart';
import 'package:qhire/skillassessnment1.dart';

class Question {
  final String questionText;
  final List<String> options;

  Question({required this.questionText, required this.options});
}

class Questionnaire1 extends StatefulWidget {
  @override
  _QuestionnaireState createState() => _QuestionnaireState();
}

class _QuestionnaireState extends State<Questionnaire1> {
  int _currentQuestionIndex = 0;
  List<String> _selectedAnswers = [];

  final List<Question> _questions = [    Question(      questionText: 'What is your favorite color?',      options: ['Red', 'Blue', 'Green', 'Yellow'],
  ),
    Question(
      questionText: 'What is your favorite animal?',
      options: ['Dog', 'Cat', 'Bird', 'Fish'],
    ),
    Question(
      questionText: 'What is your favorite food?',
      options: ['Pizza', 'Burger', 'Pasta', 'Rice'],
    ),
  ];

  void _selectAnswer(String answer) {
    setState(() {
      _selectedAnswers.add(answer);
      _currentQuestionIndex++;
    });
  }

  void _resetQuestionnaire() {
    setState(() {
      _currentQuestionIndex = 0;
      _selectedAnswers = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Questionnaire'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed:(){
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Skill1()));
          },
        ),
      ),
      body: _currentQuestionIndex < _questions.length
          ? Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            _questions[_currentQuestionIndex].questionText,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          ..._questions[_currentQuestionIndex].options.map(
                (option) => ElevatedButton(
              onPressed: () => _selectAnswer(option),
              child: Text(option),
            ),
          ),
        ],
      )
          : Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Thank you for completing the questionnaire!',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
              ElevatedButton(onPressed: (){
                //Navigator.push(context, MaterialPageRoute(builder: (context)=>Skill1()));
              }, child: Text("Finish")),
            ],
          ),
    );
  }
}
