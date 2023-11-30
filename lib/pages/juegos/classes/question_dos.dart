class QuestionDos {
  late String pregunta;
  String questionDos = "Tema 2: ";
  late String answer;
  List<String> options = [];
  String selected = 'Skipped';
  bool correct = false;

  QuestionDos.fromJson(Map<String, dynamic> json)
      : pregunta = json['pregunta'],
        answer = json['respuesta'];

  void addOptions(List<String> newOptions) {
    questionDos += pregunta;
    options.add(answer);
    options.addAll(newOptions);
    options.shuffle();
  }
}