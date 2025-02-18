import 'package:flutter/material.dart';
import 'Question.dart';
import 'quiz_brain.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Icon> scoreKeeper = [];

  QuizBrain quizBrain = QuizBrain();

  final ButtonStyle styleYes = getStyle(Colors.green);

  final ButtonStyle styleNo = getStyle(Colors.red);

  // List<String> questions = ["question 1", "question 2", "question 3"];
  // List<bool> answers = [true, false, true];

  static ButtonStyle getStyle(Color color) {
    return TextButton.styleFrom(
        fixedSize: Size(225, 75),
        backgroundColor: color,
        shape: BeveledRectangleBorder(borderRadius: BorderRadius.zero));
  }

  void checkAndMarkAnswer(bool playerAnswerForCurrentQuestion) {
    setState(() {
      if (quizBrain.getCurrentAnswer() == playerAnswerForCurrentQuestion) {
        scoreKeeper.add(getIcon(Icons.close));
      } else {
        scoreKeeper.add(getIcon(Icons.check));
      }
      quizBrain.getNextQuestion();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
          body: Center(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 100, bottom: 350),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(quizBrain.getCurrentQuestion(),
                      style: TextStyle(color: Colors.white, fontSize: 25)),
                ),
                TextButton(
                  style: styleYes,
                  onPressed: () {
                    checkAndMarkAnswer(true);
                  },
                  child: Text('True'),
                ),
                SizedBox(height: 30),
                TextButton(
                  style: styleNo,
                  onPressed: () {
                    checkAndMarkAnswer(false);
                  },
                  child: Text('False'),
                ),
                Row(
                  children: scoreKeeper,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Icon getIcon(IconData iconData) {
    Color color = Colors.red;
    if (iconData == Icons.check) {
      color = Colors.green;
    }
    return Icon(iconData, color: color);
  }
}
