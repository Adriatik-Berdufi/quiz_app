import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary({super.key, required this.summaryData});
  final List<Map<String, Object>> summaryData;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: summaryData.map((el) {
        return Row(
          children: [
            Text(((el['index'] as int) + 1).toString()),
            Column(
              children: [
                Text((el['question'] as String)),
                const SizedBox(height: 5),
                Text((el['correct_ansquers'] as String)),
                const SizedBox(height: 5),
                Text((el['user_answer'] as String)),
              ],
            ),
          ],
        );
      }).toList(),
    );
  }
}
