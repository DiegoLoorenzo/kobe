import 'package:flutter/material.dart';
import 'package:kobe_flutter/pages/configuration/app_information.dart';
import 'package:kobe_flutter/pages/configuration/comments.dart';
import 'package:kobe_flutter/pages/configuration/privacy_policy.dart';
import 'package:kobe_flutter/pages/configuration/help.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kobe_flutter/auth/LoginPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfigurationScreen extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ClipPath(
            clipper: CustomClip(),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.22,
              color: Color(0xFFFFD974),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  leading: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromARGB(255, 255, 236, 185),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.arrow_back),
                      color: const Color.fromARGB(255, 0, 0, 0),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  title: Text(
                    'Configuración',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                SizedBox(height: 56),
                _buildProfileInfo(
                  email: 'tu_correo_electronico@gmail.com',
                ),
                Divider(color: Colors.black),
                SizedBox(height: 16),
                _buildConfiguracionItem(
                  icon: Icons.feedback,
                  title: 'Enviar Comentarios',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CommentsScreen()),
                    );
                  },
                ),
                _buildConfiguracionItem(
                  icon: Icons.lock,
                  title: 'Política de Privacidad',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PrivacyScreen()),
                    );
                  },
                ),
                _buildConfiguracionItem(
                  icon: Icons.help,
                  title: 'Ayuda',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HelpScreen()),
                    );
                  },
                ),
                _buildConfiguracionItem(
                  icon: Icons.info,
                  title: 'Información de la Aplicación',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => InformationScreen()),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 46.0),
          child: ElevatedButton(
            onPressed: () async {
              // await _auth.signOut();
              // Navigator.pushReplacement(
              //   context,
              //   MaterialPageRoute(builder: (context) => LoginPage()),
              // );

              try {
                await _auth.signOut();
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.remove('user_email');
                prefs.remove('user_uid');
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              } catch (e) {
                print('Error al cerrar la sesión: $e');
              }
            },
            style: ElevatedButton.styleFrom(
              primary: Color(0xFFEA5C00),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 16.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.exit_to_app),
                SizedBox(width: 10),
                Text(
                  'Cerrar Sesión',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildConfiguracionItem(
      {required IconData icon,
      required String title,
      required VoidCallback onTap}) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.blue,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16.0,
          color: Colors.black,
        ),
      ),
      onTap: onTap,
    );
  }

  Widget _buildProfileInfo({required String email}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 1.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: const Color.fromARGB(255, 232, 232, 232),
            child: Icon(
              Icons.person,
              color: Colors.black,
              size: 30,
            ),
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Perfil',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                '$email',
                style: TextStyle(fontSize: 13.0),
              ),
            ],
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
