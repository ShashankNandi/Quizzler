import 'Question.dart';

class QuizBrain {
  List<Question> questions = [
    Question("question 1", true),
    Question("question 2", false),
    Question("question 3", true),
    Question("question 4", false),
    Question("question 5", false),
    Question("question 6", false),
    Question("question 7", true),
    Question("question 8", true),
    Question("question 9", false),
    Question("question 10", true),
  ];
  int questionIndex = 0;

  String getNextQuestion() {
    if (questionIndex + 1 < questions.length) {
      questionIndex++;
    }
    return getCurrentQuestion();
  }

  String getCurrentQuestion() {
    return questions[questionIndex].question;
  }

  bool getCurrentAnswer() {
    return questions[questionIndex].answer;
  }
}
