import 'package:flutter/material.dart';
import 'package:quiz_app_flutter/data/questions.dart';
import 'package:quiz_app_flutter/questions.dart';
import 'package:quiz_app_flutter/results_screen.dart';
import 'package:quiz_app_flutter/start_screen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return _QuizSrceenState();
  }
}

class _QuizSrceenState extends State<QuizScreen> {
  List<String> selectedAnswers = [];
  var activeScreen = 'state-screen';
  // @override
  // void initState() {
  //   activeScreen = StartScreen(switchScreen);
  //   super.initState();
  // }

  void switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'state-screen';
    });
  }

  @override
  Widget build(context) {
    Widget startScreen = StartScreen(switchScreen);
    if (activeScreen == 'question-screen') {
      startScreen = QuestionScreen(onSelectAnswer: chooseAnswer);
    }
    if (activeScreen == 'results-screen') {
      startScreen = ResultScreen(
        chosenAnswer: selectedAnswers,
        restartScreen: restartQuiz,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 107, 15, 168),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: startScreen,
        ),
      ),
    );
  }
}
// activeScreen == 'state-screen'
//             ? StartScreen(switchScreen)
//             : QuestionScreen(
//                 onSelectAnswer: chooseAnswer,
//               ),