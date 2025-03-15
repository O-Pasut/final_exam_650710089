import 'package:flutter/material.dart';
import 'package:final_exam_650710089/answer1.dart';
import 'package:final_exam_650710089/answer2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Answer1());
  }
}
