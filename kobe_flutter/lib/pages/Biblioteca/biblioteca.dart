import 'package:flutter/material.dart';

class biblioteca extends StatefulWidget {

    const biblioteca({super.key});

  @override
  State<biblioteca> createState() => _biblioteca();
}

class _biblioteca extends State<biblioteca>{

    @override
    Widget build(BuildContext context) {
      return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(' Esto es Biblioteca')
            ],
          ),
        );
    }
}