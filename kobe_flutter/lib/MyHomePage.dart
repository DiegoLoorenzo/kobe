import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kobe_flutter/login/LoginPage.dart';
import 'package:kobe_flutter/pages/Biblioteca/biblioteca.dart';
import 'package:kobe_flutter/pages/Recetas/recetas.dart';
import 'package:kobe_flutter/pages/inicio.dart';
import 'package:kobe_flutter/pages/juegos/juegos.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, });

  @override
  State<MyHomePage> createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage> {

  int selctnavbar = 0;

  @override
  Widget build(BuildContext context) {
      final colors = Theme.of(context).colorScheme;

///Direccionamiento de las paginas
      final screens =  [
        const inicio(),
        const recetas(),
        const biblioteca(),
        const juegos()];

    return Scaffold(
      appBar: AppBar(
        title:
        Text("K.O.B.E", style: TextStyle(color: Colors.black, fontSize: 32,
              fontFamily: 'Poppins',fontWeight: FontWeight.w700,height: 0),),
        backgroundColor: Color(0xFFFFD974),
        actions: [InkWell(
          onTap: (){
            FirebaseAuth.instance.signOut();
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>LoginPage()),
            (route) => false);
          },
          child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.exit_to_app),
          )
          )],
      ),

/// Body y direccionamineto de las pages sleccionando un screens
      body: IndexedStack(
        index: selctnavbar,
        children: screens,
      ),
      
///Diseño de  los Botones utilizando selectnavar
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          currentIndex: selctnavbar,
          onTap: (value){
            setState(() {
              selctnavbar = value;
            });
          },
          elevation: 0,
          items: [
              BottomNavigationBarItem(
              icon: Icon( Icons.home),
              activeIcon: Icon( Icons.home_filled),
              label: 'Inicio',
              backgroundColor: Color(0xFFEE7D33),
              ),
              BottomNavigationBarItem(
              icon: Icon( Icons.attach_money_outlined),
              activeIcon: Icon( Icons.attach_money_rounded),
              label: 'Recetas',
              backgroundColor: Color(0xFFEE7D33),
              ),
            BottomNavigationBarItem(
              icon: Icon( Icons.library_books_outlined),
              activeIcon: Icon( Icons.my_library_books_outlined),
              label: 'Biblioteca',
              backgroundColor:  Color(0xFFEE7D33),
              ),
              BottomNavigationBarItem(
              icon: Icon( Icons.games_outlined),
              activeIcon: Icon( Icons.games),
              label: 'Juegos',
              backgroundColor:  Color(0xFFEE7D33),
              ),
          ],
          ),
    );
  }
}