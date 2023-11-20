import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class ButtomNavbar extends StatefulWidget implements PreferredSizeWidget {
  @override
  State createState() => _ButtomNavbarState();

  @override
  Size get preferredSize => Size.fromHeight(kBottomNavigationBarHeight);
}

class _ButtomNavbarState extends State<ButtomNavbar> {
  int selctnavbar = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
        child: GNav(
          backgroundColor: Colors.white,
          color: Colors.black,
          activeColor: Colors.white,
          tabBackgroundColor: const Color.fromRGBO(234, 92, 0, 1),
          gap: 8,
          padding: EdgeInsets.all(16),
          tabs: [
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
            // Puedes agregar tu lógica para cambiar de pestaña aquí si es necesario
          },
        ),
      ),
    );
  }
}
