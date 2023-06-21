import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.quizScreen, {super.key});
  final void Function() quizScreen;
  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(150, 252, 252, 252),
          ),
          const SizedBox(
            height: 80,
          ),
          Text(
            'Learn Flutter the Fun way!',
            style: GoogleFonts.lato(
              fontSize: 20,
              color: const Color.fromARGB(255, 245, 220, 250),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          OutlinedButton.icon(
              onPressed: quizScreen,
              style: OutlinedButton.styleFrom(
                foregroundColor: const Color.fromARGB(255, 242, 214, 247),
              ),
              icon: const Icon(Icons.arrow_right_alt),
              label: const Text('Start Quiz'))
        ],
      ),
    );
  }
}
