import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kobe_flutter/pages/juegos/classes/question_tres.dart';
import 'package:kobe_flutter/pages/juegos/classes/quiz_tres.dart';
import 'package:kobe_flutter/pages/juegos/pages/results_page_tres.dart';

class QuizPageTres extends StatefulWidget {
  const QuizPageTres({Key? key}) : super(key: key);

  @override
  State<QuizPageTres> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPageTres> {
  int totalQuestions = 5;
  int totalOptions = 3;
  int questionIndex = 0;
  int progressIndex = 0;
  QuizTres quiz = QuizTres(name: 'Quiz de Gastronomia Tema 3', questions: []);

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/tema-3.json');
    final List<dynamic> data = await json.decode(response);
    List<int> optionList = List<int>.generate(data.length, (i) => i);
    List<int> questionsAdded = [];

    while (true) {
      optionList.shuffle();
      int answer = optionList[0];
      if (questionsAdded.contains(answer)) continue;
      questionsAdded.add(answer);

      List<String> otherOptions = [];
      for (var option in optionList.sublist(1, totalOptions)) {
        otherOptions.add(data[option]['respuesta']);
      }

      QuestionTres question = QuestionTres.fromJson(data[answer]);
      question.addOptions(otherOptions);
      quiz.questions.add(question);

      if (quiz.questions.length >= totalQuestions) break;
    }

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    readJson();
  }

  void _optionSelected(String selected) {
    quiz.questions[questionIndex].selected = selected;
    if (selected == quiz.questions[questionIndex].answer) {
      quiz.questions[questionIndex].correct = true;
      quiz.right += 1;
    }

    progressIndex += 1;
    if (questionIndex < totalQuestions - 1) {
      questionIndex += 1;
    } else {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) => _buildResultDialog(context));
    }

    setState(() {});
  }

  Widget _buildResultDialog(BuildContext context) {
    return AlertDialog(
      title: Text('Resultados', style: Theme.of(context).textTheme.headline1),
      backgroundColor: Theme.of(context).primaryColorDark,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Preguntas totales: $totalQuestions',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Text(
            'Correctas: ${quiz.right}',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Text(
            'Incorrectas: ${(totalQuestions - quiz.right)}',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Text(
            'Porcentaje: ${quiz.percent}%',
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: ((context) => ResultsPageTres(
                        quiz: quiz,
                      ))),
            );
          },
          child: Text(
            'Ver Respuestas',
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 251, 251, 250),
      appBar: AppBar(
        title: Text(
          quiz.name,
          style: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(color: Colors.black),
        ),
        backgroundColor: Color.fromARGB(255, 255, 255, 253),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 30),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: LinearProgressIndicator(
                color: Color.fromARGB(255, 39, 126, 184),
                value: progressIndex / totalQuestions,
                minHeight: 20,
              ),
            ),
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 450),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              child: quiz.questions.isNotEmpty
                  ? Card(
                      color: Color.fromARGB(248, 235, 233, 233),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            margin: const EdgeInsets.all(15),
                            child: Text(
                              quiz.questions[questionIndex].questionTres,
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Flexible(
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: totalOptions,
                              itemBuilder: (_, index) {
                                return Container(
                                  margin: const EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color:
                                            Color.fromARGB(255, 145, 143, 143),
                                        width: 2),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: ListTile(
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(15),
                                      ),
                                    ),
                                    leading: Text(
                                      '${index + 1}',
                                      style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 118, 117, 117),
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    title: Text(
                                      quiz.questions[questionIndex]
                                          .options[index],
                                      style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 137, 137, 137),
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    onTap: () {
                                      _optionSelected(quiz
                                          .questions[questionIndex]
                                          .options[index]);
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    )
                  : const CircularProgressIndicator(
                      backgroundColor: Colors.white,
                    ),
            ),
          ),
          TextButton(
            onPressed: () {
              _optionSelected('Skipped');
            },
            child: Text(
              'Saltar',
              style: TextStyle(
                color: Colors.black, // Cambiar el color del texto a negro
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
