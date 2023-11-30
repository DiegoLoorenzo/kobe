import 'package:flutter/material.dart';
import 'package:kobe_flutter/MyHomePage.dart';
import 'package:kobe_flutter/main.dart';
import 'package:kobe_flutter/pages/inicio.dart';
import 'package:kobe_flutter/pages/juegos/classes/quiz.dart';
import 'package:kobe_flutter/pages/juegos/classes/quiz_dos.dart';
import 'package:kobe_flutter/pages/juegos/juegos.dart';
import 'package:kobe_flutter/pages/juegos/juegos_view.dart';
import 'package:kobe_flutter/pages/juegos/pages/elegir_tema.dart';

class ResultsPageDos extends StatelessWidget {
  const ResultsPageDos({Key? key, required this.quiz}) : super(key: key);
  final QuizDos quiz;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorDark,
      appBar: AppBar(
        title: Text(quiz.name),
        backgroundColor: Theme.of(context).primaryColorDark,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              margin:
              const EdgeInsets.only(left: 3, right: 3, top: 2, bottom: 10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.indigo.shade50,
                  width: 1,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Preguntas: ${quiz.questions.length}',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Text(
                    'Correctas: ${quiz.percent}%',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: quiz.questions.length,
                  itemBuilder: (_, index) {
                    return Card(
                      color: quiz.questions[index].correct
                          ? Colors.green.shade200
                          : Colors.red.shade200,
                      child: ListTile(
                        leading: quiz.questions[index].correct
                            ? Icon(Icons.check, color: Colors.green.shade900)
                            : Icon(Icons.close, color: Colors.red.shade900),
                        title: Text(quiz.questions[index].question),
                        subtitle: Text(quiz.questions[index].selected),
                        trailing: Text(quiz.questions[index].answer),
                      ),
                    );
                  }),
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MyHomePage()),
                );
              },
              child: Text(
                'Regresar',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}