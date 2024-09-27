import 'package:flutter/material.dart';

class QuestionsSreen extends StatefulWidget {
  const QuestionsSreen({super.key});
  @override
  State<QuestionsSreen> createState() {
    return _QuestionsSreen();
  }
}

class _QuestionsSreen extends State<QuestionsSreen> {
  @override
  Widget build(context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'The Questions...',
            style: TextStyle(color: Colors.white),
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Anser 1'),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Anser 2'),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Anser 3'),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Anser 4'),
          ),
        ],
      ),
    );
  }
}
