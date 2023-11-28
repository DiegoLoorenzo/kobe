import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:kobe_flutter/pages/juegos/juegos_view.dart';
import 'package:kobe_flutter/pages/juegos/pages/quiz_page.dart';
import 'package:kobe_flutter/pages/juegos/pages/elegir_tema.dart';
import 'package:kobe_flutter/pages/juegos/pages/quiz_page_dos.dart';
import 'package:kobe_flutter/pages/juegos/pages/quiz_page_tres.dart';
import 'package:kobe_flutter/pages/juegos/pages/results_page.dart';
=======
import 'package:kobe_flutter/pages/juegos/pages/elegir_tema.dart';
import 'package:kobe_flutter/pages/juegos/pages/quiz_page.dart';
>>>>>>> ebd6b48d0b905367f3c55aed045e4da45c072b73

class juegos extends StatefulWidget {

    const juegos({super.key});

  @override
  State<juegos> createState() => _juegos();
}

class _juegos extends State<juegos>{

    @override
    Widget build(BuildContext context) {
      return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: '¿Listo para Jugar?',
          theme: ThemeData(
            primarySwatch: Colors.indigo,
            textTheme: TextTheme(
              headline1: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.w500,
                shadows: [
                  Shadow(
                    color: Colors.purple.shade50.withOpacity(.3),
                    offset: const Offset(3, 3),
                    blurRadius: 5,
                  ),
                ],
              ),
              headline2: TextStyle(
                color: Colors.purple.shade50,
                fontSize: 20,
              ),
              bodyText1: TextStyle(
                color: Colors.purple.shade50,
                fontSize: 18,
              ),
            ),
            cardTheme: CardTheme(
              elevation: 6,
              color: Colors.indigo.shade900,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),

          initialRoute: '/juegos-view',
          routes: {
           // '/': (context) => const juegos(),
            '/elegir-tema': (context) => const elegir_tema(),
            '/quiz-page': (context) => const QuizPage(),
            '/quiz-page-dos': (context) => const QuizPageDos(),
            '/quiz-page-tres': (context) => const QuizPageTres(),
            '/juegos-view': (context) => const juegos_view(),
            //'/regresar': (context) => const regresar(),
            //'/review-page': (context) => const ReviewQuizPage(),

          }
          );

    }

}