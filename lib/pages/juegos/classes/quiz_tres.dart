import 'package:kobe_flutter/pages/juegos/classes/question_tres.dart';

class QuizTres {
  String name;
  List<QuestionTres> questions;
  int right = 0;

  QuizTres({required this.name, required this.questions});

  double get percent => (right / questions.length) * 100;
}