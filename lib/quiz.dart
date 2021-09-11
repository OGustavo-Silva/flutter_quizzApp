import 'package:flutter/material.dart';
import './answer.dart';
import 'package:flutter_complete_guide/question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>>
      questions; //List of Map wich each Map holds a String key: Object value
  final int questionIndex;
  final Function answerQuestion;

  Quiz({
    required this.questions,
    required this.answerQuestion,
    required this.questionIndex,
  }); //Constructor with named arguments

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          questions[questionIndex]['questionText']
              .toString(), //cause Dart interprets the Map as <String: Object>
        ),
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(
              () => answerQuestion(answer['score']), answer['text'].toString());
        }).toList()
      ],
    );
  }
}
