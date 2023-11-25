import 'package:kobe_flutter/pages/juegos/classes/question.dart';

class Quiz {
  String name;
  List<Question> questions;
  int right = 0;

  Quiz({required this.name, required this.questions});

  double get percent => (right / questions.length) * 100;
}