import 'package:flutter/material.dart';

class juegos_view extends StatefulWidget {
  const juegos_view({super.key});

  @override
  State<juegos_view> createState() => _juegos_view();
}

class _juegos_view extends State<juegos_view> {

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
                '¿Listo para Jugar?',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
            ),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Colors.indigo.shade200,
                      Colors.purple.shade300
                    ]),
                borderRadius: BorderRadius.circular(5)),
          ),
          OutlinedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/elegir-tema');
            },
            child: const Text('Comenzar'),
            style: OutlinedButton.styleFrom(
              primary: Colors.black,
              backgroundColor: Theme
                  .of(context)
                  .primaryColorLight,
              elevation: 4,
              side: const BorderSide(width: 1),
            ),
          ),

        ],
      ),
    );
  }
}