import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/question_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.choseAnsewers,
    required this.onRestart,
  });

  final List<String> choseAnsewers;
  final void Function() onRestart;

  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < choseAnsewers.length; i++) {
      final bool isCorrect = choseAnsewers[i] == questions[i].answer[0];
      summary.add({
        'index': i,
        'question': questions[i].question,
        'correct_answers': questions[i].answer[0],
        'user_answer': choseAnsewers[i],
        'is_correct': isCorrect,
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final numTotQuestions = questions.length;
    final numCorrectQuestions = summaryData
        .where((el) => el['user_answer'] == el['correct_answers'])
        .length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(33),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text.rich(
                TextSpan(
                  text: 'You answered ', // Parte normale
                  style: const TextStyle(
                    color: Color.fromARGB(255, 199, 199, 199),
                    fontSize: 20.0,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: '$numCorrectQuestions',
                      style: const TextStyle(
                        color: Color.fromARGB(255, 231, 22, 11),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const TextSpan(
                      text: ' of ',
                    ),
                    TextSpan(
                      text: '$numTotQuestions ',
                      style: const TextStyle(
                        color: Color.fromARGB(255, 11, 231, 51),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const TextSpan(
                      text: 'questions correctly!!!',
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionSummary(summaryData: summaryData),
            const SizedBox(
              height: 33,
            ),
            TextButton(
              onPressed: onRestart,
              style: TextButton.styleFrom(
                side: const BorderSide(
                  color: Color.fromARGB(255, 9, 240, 20),
                  width: 2,
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18)),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.refresh,
                    color: Color.fromARGB(255, 88, 222, 47),
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Restart Quiz',
                    style: TextStyle(
                      color: Color.fromARGB(255, 9, 240, 20),
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
