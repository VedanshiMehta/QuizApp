import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app_flutter/data/questions.dart';
import 'package:quiz_app_flutter/question_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.chosenAnswer,
    required this.restartScreen,
  });
  final List<String> chosenAnswer;
  final void Function() restartScreen;
  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (int i = 0; i < chosenAnswer.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].question,
        'correct_answer': questions[i].answers[0],
        'user_Answer': chosenAnswer[i],
      });
    }
    return summary;
  }

  @override
  Widget build(context) {
    final summary = getSummaryData();
    final totalQuestions = questions.length;
    final totalCorrectAnswers = summary.where((data) {
      return data['user_Answer'] == data['correct_answer'];
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'You answer $totalCorrectAnswers out of $totalQuestions question correctly!',
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 245, 220, 250),
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionSummary(summaryData: summary),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
              onPressed: restartScreen,
              style: TextButton.styleFrom(
                foregroundColor: const Color.fromARGB(255, 242, 214, 247),
              ),
              icon: const Icon(Icons.restart_alt_sharp),
              label: const Text('Restart Quiz!'),
            ),
          ],
        ),
      ),
    );
  }
}
