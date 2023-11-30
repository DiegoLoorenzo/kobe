import 'package:kobe_flutter/pages/juegos/classes/question.dart';
import 'package:kobe_flutter/pages/juegos/classes/question_dos.dart';

class QuizDos {
  String name;
  List<QuestionDos> questions;
  int right = 0;

  QuizDos({required this.name, required this.questions});

  double get percent => (right / questions.length) * 100;
}