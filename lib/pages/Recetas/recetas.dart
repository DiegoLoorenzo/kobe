import 'package:flutter/material.dart';

class recetas extends StatefulWidget {

    const recetas({super.key});

  @override
  State<recetas> createState() => _recetas();
}

class _recetas extends State<recetas>{

    @override
    Widget build(BuildContext context) {
      return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Esto es Recetas'),
            
            ],
          ),
        );
    }
}