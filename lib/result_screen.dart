import 'package:flutter/material.dart';
import 'package:quiz_app/question_summary.dart';

import 'package:quiz_app/questions/question_answer_list.dart';

import 'package:google_fonts/google_fonts.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {required this.chosenAnswers, required this.onRestart, super.key});

  final List<String> chosenAnswers;

  final void Function() onRestart;

  List<Map<String, Object>> getSummaryData() {
    List<Map<String, Object>> summaryData = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summaryData.add(
        {
          'question_index': i,
          'question': questionanswers[i].question,
          'correct_answer': questionanswers[i].answers[0],
          'selected_answer': chosenAnswers[i],
        },
      );
    }

    return summaryData;
  }

  @override
  Widget build(context) {
    final summary = getSummaryData();

    final numberOfQuestions = questionanswers.length;

    final numCorrectQuestions = summary.where((data) {
      return data['correct_answer'] == data['selected_answer'];
    }).length;

    return Center(
        child: Container(
      margin: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'You answered $numCorrectQuestions out of total $numberOfQuestions!',
            style: GoogleFonts.lato(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          QuestionAnswerSummary(summaryData: summary),
          const SizedBox(height: 30),
          TextButton.icon(
            onPressed: onRestart,
            label: const Text(
              'Restart Quiz!',
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
            icon: const Icon(
              Icons.refresh,
              color: Colors.white,
            ),
          )
        ],
      ),
    ));
  }
}
