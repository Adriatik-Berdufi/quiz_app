import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_sreen.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/result_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizzState();
  }
}

class _QuizzState extends State<Quiz> {
  final List<String> selectedAnswer = [];
  Widget? activeScreeen;
  @override
  void initState() {
    activeScreeen = StartScreen(switchSreen);
    super.initState();
  }

  void restartQuiz() {
    setState(() {
      selectedAnswer.clear();
      activeScreeen = StartScreen(switchSreen);
    });
  }

  void switchSreen() {
    setState(() {
      activeScreeen = QuestionsSreen(
        onSelectAnswer: choooseAnswer,
      );
    });
  }

  void choooseAnswer(String answer) {
    selectedAnswer.add(answer);
    if (selectedAnswer.length == questions.length) {
      setState(() {
        activeScreeen = ResultsScreen(
          choseAnsewers: selectedAnswer,
          onRestart: restartQuiz,
        );
      });
    }
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: RadialGradient(
              colors: [
                Color.fromARGB(255, 58, 25, 116),
                Color.fromARGB(255, 101, 64, 135),
                Color.fromARGB(255, 58, 25, 116),
              ],
              radius: 5,
              center: Alignment.center,
              focal: Alignment.center,
              stops: [0.0, 0.5, 1.0],
              focalRadius: 0.1,
            ),
          ),
          child: activeScreeen,
        ),
      ),
    );
  }
}
