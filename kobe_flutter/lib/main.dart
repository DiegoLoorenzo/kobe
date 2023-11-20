import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
//import 'package:kobe_flutter/login/LoginPage.dart';
import 'package:kobe_flutter/Screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  ///todo Llamado de la primera vista Screen
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Aplicacion K.O.B.E",
      home: Screen(),
    );
  }
}
