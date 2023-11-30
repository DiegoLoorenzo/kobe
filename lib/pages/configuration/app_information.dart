import 'package:flutter/material.dart';

class InformationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Información de la Aplicación'),
      ),
      body: Container(
        color: Color.fromARGB(255, 255, 255, 255),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'K.O.B.E',
                style: TextStyle(
                  fontSize: 36.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Versión 1.0.0',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 16.0),
              Image.asset(
                'assets/icon300.png', // Reemplaza 'tu_imagen.png' con la ruta correcta
                width: 100.0,
                height: 100.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
