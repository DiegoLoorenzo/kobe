import 'package:flutter/material.dart';
import 'package:kobe_flutter/pages/juegos/juegos.dart';

class start_view extends StatefulWidget {
  const start_view({super.key});

  @override
  State<start_view> createState() => _start_view();
}

class _start_view extends State<start_view> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromRGBO(255, 226, 151, 1),
            Color.fromRGBO(255, 226, 151, 1),
            Colors.white,
          ],
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/quiz.png',
              height: 150.0,
            ),
            SizedBox(height: 60.0),
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Text(
                '¿Listo para empezar?',
                style: TextStyle(
                  fontSize: 29.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 40.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => juegos()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Color.fromRGBO(242, 157, 102, 1),
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              child: Text(
                'Empezar',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
