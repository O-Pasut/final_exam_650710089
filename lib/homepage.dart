import 'package:final_exam_650710089/profile_card.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 249, 231),
        title: Center(
          child: const Text(
            "Homepage",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 249, 231),
      body: Center(child: ProfileCard()),
    );
  }
}
