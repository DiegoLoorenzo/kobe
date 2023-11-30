import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class CommentsScreen extends StatelessWidget {
  // Controlador para obtener el texto del TextField
  final TextEditingController _controller = TextEditingController();

  // Abir app de correo electrónico desde comentarios
  void _sendEmail(BuildContext context, String comments) async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'diegolorenzomendez@gmail.com',
      queryParameters: {'subject': 'Comentarios de K.O.B.E', 'body': comments},
    );

    final String emailLaunchUriString = emailLaunchUri.toString();
    //Mensaje por si no se abre la aplicación
    if (await canLaunch(emailLaunchUriString)) {
      await launch(emailLaunchUriString);
    } else {
      print('No se pudo abrir la aplicación de correo electrónico.');
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('No se pudo abrir la aplicación de correo electrónico'),
            content: Text(
                'Por favor, copia y pega este correo electrónico para enviar tus comentarios: diegolorenzomendez@gmail.com'),
            actions: <Widget>[
              TextButton(
                child: Text('Copiar'),
                onPressed: () {
                  Clipboard.setData(
                      new ClipboardData(text: 'diegolorenzomendez@gmail.com'));
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  //Interfaz de Mensajes
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
                controller: _controller,
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
                String userComments = _controller.text;
                _sendEmail(context, userComments);
              },
              child: Text('Enviar Comentarios'),
            ),
          ],
        ),
      ),
    );
  }
}
