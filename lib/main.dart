import 'package:flutter/material.dart';

import 'QuestionScreen.dart';
import 'ResultScreen.dart';

void main() {
  runApp(MyApp());
}

class Question {
  final String questionText;
  final List<Map<String, Object>> answers;

  Question(this.questionText, this.answers);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: QuizScreen(),
    );
  }
}

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final List<Question> _questions = [
    Question(
      'Who created Flutter?',
      [
        {'text': 'Facebook', 'score': -2},
        {'text': 'Google', 'score': 10},
        {'text': 'Apple', 'score': -2},
        {'text': 'Microsoft', 'score': -2},
      ],
    ),
    Question(
      'What is Flutter?',
      [
        {'text': 'Android Development Kit', 'score': -2},
        {'text': 'IOS Development Kit', 'score': -2},
        {'text': 'Web Development Kit', 'score': -2},
        {
          'text':
              'SDK to build beautiful IOS, Android, Web & Desktop Native Apps',
          'score': 10
        },
      ],
    ),
  ];

  int _questionIndex = 0;
  int _totalScore = 0;

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex++;
    });

    if (_questionIndex < _questions.length) {
      // Continue to the next question
    } else {
      // Show result screen when all questions are answered
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => ResultScreen(
            totalScore: _totalScore,
            onRestartQuiz: _restartQuiz,
          ),
        ),
      );
    }
  }

  void _restartQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Quiz'),
        backgroundColor: Colors.blue,
      ),
      body: _questionIndex < _questions.length
          ? QuestionScreen(
              question: _questions[_questionIndex],
              onAnswerSelected: _answerQuestion,
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
