import 'package:flutter/material.dart';
import 'package:quiz_app/start_screen.dart';

void main() {
  runApp(
    MaterialApp(
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
          child: const StartScreen(),
        ),
      ),
    ),
  );
}
