import 'package:flutter/material.dart';
//import 'package:quiz_app/screen/quizScreen.dart';
import 'package:quiz_app/screen/Homescreen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Homepage(),
    );
  }
}
