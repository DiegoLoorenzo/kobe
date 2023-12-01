class Question {
  late String pregunta;
  String question = "Tema 1: ";
  late String answer;
  List<String> options = [];
  String selected = 'Skipped';
  bool correct = false;

  Question.fromJson(Map<String, dynamic> json)
      : pregunta = json['pregunta'],
        answer = json['respuesta'];

  void addOptions(List<String> newOptions) {
    question += pregunta;
    options.add(answer);
    options.addAll(newOptions);
    options.shuffle();
  }
}