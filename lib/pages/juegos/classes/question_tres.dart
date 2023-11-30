class QuestionTres {
  late String pregunta;
  String questionTres = "Tema 3: ";
  late String answer;
  List<String> options = [];
  String selected = 'Skipped';
  bool correct = false;

  QuestionTres.fromJson(Map<String, dynamic> json)
      : pregunta = json['pregunta'],
        answer = json['respuesta'];

  void addOptions(List<String> newOptions) {
    questionTres += pregunta;
    options.add(answer);
    options.addAll(newOptions);
    options.shuffle();
  }
}