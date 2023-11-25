import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CommentsScreen extends StatelessWidget {
  // Dirección de correo electrónico donde se enviarán los comentarios
  // Método para abrir la aplicación de correo electrónico con los comentarios
  void _sendEmail(String comments) async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'diegolorenzomendez@gmail.com',
      queryParameters: {'subject': 'Comentarios de K.O.B.E', 'body': comments},
    );

    final String emailLaunchUriString = emailLaunchUri.toString();

    if (await canLaunch(emailLaunchUriString)) {
      await launch(emailLaunchUriString);
    } else {
      throw 'No se pudo abrir la aplicación de correo electrónico.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enviar tus Comentarios a K.O.B.E'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '¿Podrías describir tu problema o sugerencia?',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: TextField(
                maxLines: null,
                expands: true,
                decoration: InputDecoration(
                  hintText: 'Escribe tus comentarios aquí...',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Obtener el texto de los comentarios del TextField
                String userComments =
                    "Texto de los comentarios"; // Reemplazar con el valor del TextField
                _sendEmail(userComments);
              },
              child: Text('Enviar Comentarios'),
            ),
          ],
        ),
      ),
    );
  }
}
