import 'package:flutter/material.dart';
import 'package:quiz/model/questions.dart';

class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int _currentQuestion = 0;
  List questions = [
    Questions.name("Flutter is free & open source.", true),
    Questions.name("Facebook created Flutter", false),
    Questions.name("Flutter is using Kotlin as programming language", true),
    Questions.name("Lars Bak and Kasper Lund created Flutter", true),
    Questions.name(
        "Is Flutter for Web and Desktop available in stable version?", true)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.redAccent,
        title: Text("Flutter Quiz"),
        centerTitle: true,
      ),
      backgroundColor: Colors.blueAccent.withOpacity(0.1),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                "images/flag.png",
                width: 250,
                height: 180,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    color: Colors.blueAccent.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(color: Colors.blueAccent.shade700)),
                height: 150,
                child: Center(
                    child: Text(
                  questions[_currentQuestion].questionLine,
                  style: TextStyle(
                      fontSize: 12.0,
                      // fontWeight: FontWeight.bold,
                      color: Colors.white),
                )),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: _previousQuestion,
                    child: Icon(Icons.arrow_back)),
                ElevatedButton(
                    onPressed: () => _checkAnswer(true, context),
                    child: Text("TRUE")),
                ElevatedButton(
                    onPressed: () => _checkAnswer(false, context),
                    child: Text("FALSE")),
                ElevatedButton(
                    onPressed: _nextQuestion, child: Icon(Icons.arrow_forward))
              ],
            ),
            Spacer()
          ],
        ),
      ),
    );
  }

  _checkAnswer(bool answer, BuildContext context) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    if (answer == questions[_currentQuestion].isCorrect) {
      final snackbar = SnackBar(
          duration: Duration(milliseconds: 200),
          content: Text("Correct!!!"),
          backgroundColor: Colors.blueAccent.shade700);
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
      debugPrint("TRUE");
    } else {
      final snackbar = SnackBar(
          duration: Duration(milliseconds: 200),
          content: Text("Incorrect!!!"),
          backgroundColor: Colors.redAccent.shade700);
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
      debugPrint("FALSE");
    }
  }

  _nextQuestion() {
    debugPrint("Tapped Next");
    setState(() {
      _currentQuestion = (_currentQuestion + 1) % questions.length;
    });
  }

  _previousQuestion() {
    debugPrint("Tapped Next");
    setState(() {
      _currentQuestion = (_currentQuestion - 1) % questions.length;
    });
  }
}
