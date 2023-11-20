import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:kobe_flutter/login/LoginPage.dart';
import 'package:kobe_flutter/pages/Biblioteca/biblioteca.dart';
import 'package:kobe_flutter/pages/Recetas/recetas.dart';
import 'package:kobe_flutter/pages/inicio.dart';
import 'package:kobe_flutter/pages/juegos/juegos.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage> {
  int selctnavbar = 0;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      /// Body y direccionamineto de las pages seleccionando un screens
      body: IndexedStack(
        index: selctnavbar,
        children: const [
          inicio(),
          Recetas(),
          biblioteca(),
          juegos(),
        ],
      ),

      /// Diseño de los Botones utilizando GNav con onTabChange
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
          child: GNav(
            backgroundColor: Colors.white,
            color: Colors.black,
            activeColor: Colors.white,
            tabBackgroundColor: Color.fromARGB(254, 238, 126, 51),
            gap: 8,
            padding: EdgeInsets.all(16),
            tabs: const [
              GButton(
                icon: Icons.home_sharp,
                text: 'Home',
              ),
              GButton(
                icon: Icons.attach_money_sharp,
                text: 'Recetas',
              ),
              GButton(
                icon: Icons.library_books_rounded,
                text: 'Biblioteca',
              ),
              GButton(
                icon: Icons.games_rounded,
                text: 'Trivias',
              ),
            ],
            selectedIndex: selctnavbar,
            onTabChange: (index) {
              setState(() {
                selctnavbar = index;
              });
              navigateToScreen(index);
            },
          ),
        ),
      ),
    );
  }

  void navigateToScreen(int index) {}
}
