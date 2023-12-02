import 'package:flutter/material.dart';
import 'package:kobe_flutter/auth/LoginPage.dart';

class Screen extends StatefulWidget {
  @override
  State createState() {
    return _ScreenState();
  }
}

class _ScreenState extends State<Screen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFD974), // Color de fondo
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset('assets/icon300.png'),
            /*Image.network(
                'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiWTnDrG8iUiaNeji8MVMvDuYXQjMveb_ZFPVVJ6DjO4uj0ww1Gmq0aF_S2P-DuDSyjYC5rA7ss3eds92jzQg3hFb7prcn_4w06diBWEnEPzm6sOh_wMsPU1n7U-VkIHoytE9EAHhKoJnv_JG2SkE0_wIgrE14nFoHwSBmfZVofzh4A5q4U9AgbmnbgH8A/s1600/icon250.jpg'
            ),*/
          ),
          Padding(
            padding: const EdgeInsets.all(80.0),
            child: Text(
              "Bienvenido a K.O.B.E",
              style: TextStyle(
                color: const Color.fromARGB(255, 255, 255, 255),
                fontSize: 45,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
                height: 0,
              ),
            ),
          ),
          SizedBox(height: 20),
          butonScreen(),
        ],
      ),
    );
  }

  Widget butonScreen() {
    return FractionallySizedBox(
      widthFactor: 0.8,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => LoginPage()),
            (Route<dynamic> route) => false,
          );
        },
        style: ElevatedButton.styleFrom(
          primary: Color(0xFFEE7D33),
          padding: EdgeInsets.symmetric(vertical: 15),
        ),
        child: Text(
          "Empezar",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
