import 'package:flutter/material.dart';

import 'main.dart';

class QuestionScreen extends StatelessWidget {
  final Question question;
  final Function(int) onAnswerSelected;

  const QuestionScreen({
    required this.question,
    required this.onAnswerSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Card(
              elevation: 0,
              color: Colors.transparent, // Set color to transparent
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(12), // Rounded corners for the card
                side: const BorderSide(
                    color: Colors.black, width: 1), // Border color and width
              ), // Add elevation for a shadow effect
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  question.questionText,
                  style: TextStyle(fontSize: 24),
                  textAlign: TextAlign.center,
                ),
              )),
          SizedBox(height: 20),
          Container(
            height: 300,
            child: ListView.builder(
                itemCount: question.answers.length,
                itemBuilder: (context, index) {
                  return Padding(
                      padding: EdgeInsets.symmetric(vertical: 1, horizontal: 4),
                      child: Card(
                          child: ListTile(
                        onTap: () {
                          print(question);
                          onAnswerSelected(
                              question.answers[index]['score'] as int);
                        },
                        title: Text(question.answers[index]['text'] as String),
                      )));
                }),
          )

          // ...question.answers.map((answer) {
          //   return ElevatedButton(
          //     onPressed: () => onAnswerSelected(answer['score'] as int),
          //     child: Text(answer['text'] as String),
          //   );
          // }),
        ],
      ),
    );
  }
}
