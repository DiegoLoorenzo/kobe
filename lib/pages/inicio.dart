import 'package:flutter/material.dart';
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
      appBar: AppBar(
        backgroundColor: Color(0xFFFFD974),
        elevation: 0,
        actions: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color.fromARGB(255, 255, 236, 185),
            ),
            child: IconButton(
              icon: Icon(Icons.settings),
              color: const Color.fromARGB(255, 0, 0, 0),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ConfigurationScreen(),
                  ),
                );
              },
            ),
          ),
          SizedBox(width: 26),
        ],
      ),
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
                SizedBox(height: 40),
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
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClip oldClipper) {
    return false;
  }
}
