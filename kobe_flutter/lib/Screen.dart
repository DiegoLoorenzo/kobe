import 'package:flutter/material.dart';
import 'package:kobe_flutter/login/LoginPage.dart';

class Screen extends StatefulWidget{

  @override
  State createState(){
    return _ScreenState();
  }
}

class _ScreenState extends State<Screen>{
  @override
  void initState() {
    super.initState();
  }
//todo Estilo y diseño del body y boton llamado por clases
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding:const EdgeInsets.all(16.0),
            child:Image.asset('assets/icon300.png')
          /*Image.network(
            'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiWTnDrG8iUiaNeji8MVMvDuYXQjMveb_ZFPVVJ6DjO4uj0ww1Gmq0aF_S2P-DuDSyjYC5rA7ss3eds92jzQg3hFb7prcn_4w06diBWEnEPzm6sOh_wMsPU1n7U-VkIHoytE9EAHhKoJnv_JG2SkE0_wIgrE14nFoHwSBmfZVofzh4A5q4U9AgbmnbgH8A/s1600/icon250.jpg'
            ),*/),
          Padding(
            padding: const EdgeInsets.all(80.0),
            child: Text("Bienvenido a K.O.B.E", style: TextStyle(color: Colors.black,
              fontSize: 27,fontFamily: 'Inter',fontWeight: FontWeight.w500,height: 0),),
            ),
          butonScreen(),
        ],
      ),
    );
  }

///todo Boton del Screen
Widget butonScreen() {
  return FractionallySizedBox(
    widthFactor: 0.6,
    child: ElevatedButton(
    onPressed: (){
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginPage()),
        (Route<dynamic> route) => false);
    },
    child: Text("Empezar", style: TextStyle(color: Color.fromARGB(255, 255, 255, 255),
      fontSize: 24, fontFamily: 'Inter',fontWeight: FontWeight.w500),),
    ),
    );
}
}