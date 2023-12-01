import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kobe_flutter/pages/juegos/classes/question_dos.dart';
import 'package:kobe_flutter/pages/juegos/classes/quiz_dos.dart';


class ReviewQuizPageDos extends StatefulWidget {
  const ReviewQuizPageDos({Key? key}) : super(key: key);

  @override
  State<ReviewQuizPageDos> createState() => _ReviewQuizPageState();
}

class _ReviewQuizPageState extends State<ReviewQuizPageDos> {
  QuizDos quiz = QuizDos(name: 'Quiz de Gastronomia Tema 2', questions: []);

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/tema-2.json');
    final List<dynamic> data = await json.decode(response);
    for (var item in data) {
      QuestionDos questionDos = QuestionDos.fromJson(item);
      questionDos.questionDos += questionDos.pregunta;
      quiz.questions.add(questionDos);
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColorDark,
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColorDark,
          elevation: 0,
        ),
        body: quiz.questions.isNotEmpty
            ? Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(
                  left: 8, right: 8, top: 2, bottom: 10),
              width: double.infinity,
              decoration: BoxDecoration(
                border:
                Border.all(color: Colors.indigo.shade50, width: 1),
              ),
              child: Center(
                child: Text(
                  "Preguntas: ${quiz.questions.length}",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: quiz.questions.length,
                  itemBuilder: (_, index) {
                    return Card(
                      color: Theme.of(context).primaryColorLight,
                      child: ListTile(
                        leading: Text("${index + 1}"),
                        title: Text(quiz.questions[index].questionDos),
                        trailing: Text(quiz.questions[index].answer),
                      ),
                    );
                  }),
            ),
          ],
        )
            : const Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        ));
  }
}
