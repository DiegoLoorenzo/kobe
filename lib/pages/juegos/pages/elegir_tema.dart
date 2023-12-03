import 'package:flutter/material.dart';

class elegir_tema extends StatefulWidget {
  const elegir_tema({super.key});

  @override
  State<elegir_tema> createState() => _elegir_tema();
}

class _elegir_tema extends State<elegir_tema> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(10),
        children: [
          Container(
            height: 50,
            margin: const EdgeInsets.only(top: 50, bottom: 25),
            child: const Center(
              child: Text(
                'Elije un tema:',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
            ),
            decoration: BoxDecoration(
                border:
                    Border.all(color: const Color.fromARGB(255, 255, 255, 255)),
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Color.fromARGB(255, 232, 235, 102),
                      Color.fromARGB(255, 255, 162, 118)
                    ]),
                borderRadius: BorderRadius.circular(5)),
          ),
          OutlinedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/quiz-page');
            },
            child: const Text('Tema 1 - Cortes'),
            style: OutlinedButton.styleFrom(
              primary: Colors.black,
              backgroundColor: Theme.of(context).primaryColorLight,
              elevation: 4,
              side: const BorderSide(width: 1),
            ),
          ),
          OutlinedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/quiz-page-dos');
            },
            child: const Text('Tema 2 - Métodos y técnicas de cocina'),
            style: OutlinedButton.styleFrom(
              primary: Colors.black,
              backgroundColor: Theme.of(context).primaryColorLight,
              elevation: 4,
              side: const BorderSide(width: 1),
            ),
          ),
          OutlinedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/quiz-page-tres');
            },
            child: const Text('Tema 3 - Equipo mayor, menor y utensilios'),
            style: OutlinedButton.styleFrom(
              primary: Colors.black,
              backgroundColor: Theme.of(context).primaryColorLight,
              elevation: 4,
              side: const BorderSide(width: 1),
            ),
          ),
          OutlinedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/juegos-view');
            },
            child: const Text('Regresar'),
            style: OutlinedButton.styleFrom(
              primary: Colors.black,
              backgroundColor: Theme.of(context).primaryColorLight,
              elevation: 4,
              side: const BorderSide(width: 1),
            ),
          ),
        ],
      ),
    );
  }
}
