import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';

class QuestionsSreen extends StatefulWidget {
  const QuestionsSreen({super.key, required this.onSelectAnswer});
  final void Function(String answer) onSelectAnswer;
  @override
  State<QuestionsSreen> createState() {
    return _QuestionsSreen();
  }
}

class _QuestionsSreen extends State<QuestionsSreen> {
  var currentQuestionIndex = 0;
  void answerQuestion(String selectedAnswer) {
    setState(() {
      widget.onSelectAnswer(selectedAnswer);
      currentQuestionIndex += 1;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 250,
              child: Align(
                alignment: const Alignment(0, 0.66),
                child: Text(
                  currentQuestion.question,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 199, 199, 199),
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 55,
            ),
            ...currentQuestion.getShuffleAnswers().map((answer) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: AnswerButton(
                  answerText: answer,
                  onTap: () {
                    answerQuestion(answer);
                  },
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
