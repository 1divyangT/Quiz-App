import 'package:flutter/material.dart';

import 'package:quiz_app/first_screen.dart';

import 'package:quiz_app/question_screen.dart';

import 'package:quiz_app/result_screen.dart';

import 'package:quiz_app/questions/question_answer_list.dart';

class Quiz extends StatefulWidget {
  const Quiz({key}) : super(key: key);

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswer = [];

  var currentScreen = 'start-screen';

  void change() {
    setState(
      () {
        currentScreen = 'question-screen';
      },
    );
  }

  void chooseAnswer(String answer) {
    selectedAnswer.add(answer);
    if (selectedAnswer.length == questionanswers.length) {
      setState(() {
        currentScreen = 'result-screen';
      });
    }
  }

  void restart() {
    selectedAnswer = [];

    setState(() {
      currentScreen = 'start-screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = FirstScreen(change);

    if (currentScreen == 'question-screen') {
      screenWidget = QuestionScreen(
        onSelectAnswer: chooseAnswer,
      );
    }

    if (currentScreen == 'result-screen') {
      screenWidget = ResultScreen(
        chosenAnswers: selectedAnswer,
        onRestart: restart,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 255, 116, 57),
                Color.fromARGB(255, 25, 180, 11),
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
