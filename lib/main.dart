import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  var questionIndex = 0;
  void answerQuestion() {
    setState(() {
      questionIndex = questionIndex + 1;
    });
    print('Answer Chosen ');
    print(questionIndex);
  }

  var questions = [
    {
      'questionText': 'What\'s you favorite color',
      'answers': ['black', 'blue', 'green']
    },
    {
      'questionText': 'What\'s you favorite pet',
      'answers': ['dog', 'cat', 'pig']
    },
    {
      'questionText': 'What\'s you favorite food',
      'answers': ['meat', 'cheese', 'vegan']
    }
  ];
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My First App"),
        ),
        body: Column(
          children: [
            Question(
              questions[questionIndex]['questionText'],
            ),
            ...(questions[questionIndex]['answers'] as List<String>)
                .map((answers) {
              return Answer(answerQuestion, answers);
            }).toList()
          ],
        ),
      ),
    );
  }
}
