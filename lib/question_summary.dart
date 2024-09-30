import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  final List<Map<String, Object>> summaryData;
  const QuestionSummary({super.key, required this.summaryData});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((el) {
            return Row(
              children: [
                Center(
                  child: Container(
                    width: 36,
                    height: 36,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle, // Imposta la forma circolare
                      color: (el['is_correct'] as bool)
                          ? Colors.green
                          : Colors.red,
                    ),
                    child: Center(
                      child: Text(((el['index'] as int) + 1).toString()),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        (el['question'] as String),
                        style: const TextStyle(
                          color: Color.fromARGB(255, 199, 199, 199),
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        (el['correct_answers'] as String),
                        style: const TextStyle(
                          color: Colors.green,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 5),
                      if (el['user_answer'] != el['correct_answers'])
                        Text(
                          (el['user_answer'] as String),
                          style: const TextStyle(
                            color: Color.fromARGB(255, 201, 38, 12),
                            fontSize: 16,
                          ),
                        ),
                      const SizedBox(height: 33),
                    ],
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
