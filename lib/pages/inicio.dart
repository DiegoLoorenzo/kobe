import 'package:flutter/material.dart';
import 'package:kobe_flutter/login/LoginPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kobe_flutter/pages/config.dart';

class inicio extends StatefulWidget {
  const inicio({Key? key}) : super(key: key);

  @override
  State<inicio> createState() => _inicioState();
}

class _inicioState extends State<inicio> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ClipPath(
            clipper: CustomClip(),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.5,
              color: Color(0xFFFFD974),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(width: 8),
                    // Contenedor del segundo icono
                    Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 236, 185),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: IconButton(
                        icon: Icon(Icons.settings),
                        color: const Color.fromARGB(255, 0, 0, 0),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ConfigurationScreen()),
                          );
                        },
                      ),
                    ),
                    SizedBox(width: 8)
                  ],
                ),
                SizedBox(height: 60),
                Text(
                  'Bienvenido a K.O.B.E',
                  style: TextStyle(
                    fontSize: 40,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height * 0.8);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height * 0.8);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClip oldClipper) {
    return false;
  }
}
