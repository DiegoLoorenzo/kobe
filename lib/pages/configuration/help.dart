import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ayuda'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Centro de Ayuda de K.O.B.E',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              _buildHelpTile(
                question: '¿Porque no puedo enviar comentarios?',
                answer:
                    'Puede ser que no tengas una aplicación de correo electronico predeterminada, sigue estos pasos para solucionar el problema:\n\n'
                    'Abre los ‘Ajustes’ > Aplicaciones > Administrar aplicaciones > Aplicaciones Predeterminadas > Aplicación de correo electrónico.',
              ),
              _buildHelpTile(
                question: '¿Cómo envío comentarios sobre la aplicación?',
                answer:
                    'Nos encantaría recibir tus comentarios. Ve a Configuración > Enviar Comentarios y podrás enviarnos tus sugerencias directamente.',
              ),
              _buildHelpTile(
                question:
                    '¿Dónde puedo encontrar información sobre la versión de la aplicación?',
                answer:
                    'La información de la versión se encuentra en Configuración > Información de la Aplicación. Aquí podrás ver la versión actual de K.O.B.E.',
              ),
              // Agrega más preguntas y respuestas según sea necesario
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHelpTile({required String question, required String answer}) {
    return ExpansionTile(
      title: Text(
        question,
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            answer,
            style: TextStyle(fontSize: 16.0),
          ),
        ),
      ],
    );
  }
}
