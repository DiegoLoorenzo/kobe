import 'package:flutter/material.dart';

class juegos extends StatefulWidget {

    const juegos({super.key});

  @override
  State<juegos> createState() => _juegos();
}

class _juegos extends State<juegos>{

    @override
    Widget build(BuildContext context) {
      return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(' Esto es juegos')
            ],
          ),
        );
    }
}