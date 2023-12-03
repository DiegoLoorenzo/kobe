import 'package:flutter/material.dart';

class PrivacyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Política de Privacidad'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.0),
              SizedBox(height: 16.0),
              Text(
                '¿Qué información recopilamos?',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'La aplicación no recopila información personal como '
                'nombre, apellido, edad, fecha de nacimiento, etc.',
                style: TextStyle(fontSize: 16.0),
              ),
              Text(
                'Utilizamos Firebase para el rendimiento de la APLICACIÓN proporcionada '
                'para mejorar la Aplicación.',
                style: TextStyle(fontSize: 16.0),
              ),
              RichText(
                text: TextSpan(
                  text: 'Firebase\n',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ),
              Text(
                'Esta Aplicación utiliza firebase para crear un rendimiento de la aplicación '
                'donde esta sea utilizada. Nos ayuda a mejorar este producto.',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 16.0),
              Text(
                'Log Data',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Quiero informarle que cada vez que utiliza mi Servicio, en caso de un '
                'error en la aplicación, recopilo datos e información (a través de productos de terceros) '
                'en su teléfono llamados Datos de Registro. Estos datos de registro pueden incluir información '
                'como la dirección del Protocolo de Internet (“IP”) de su dispositivo, el nombre del dispositivo, '
                'la versión del sistema operativo, la configuración de la aplicación cuando utiliza mi Servicio, '
                'la hora y fecha de su uso del Servicio y otras estadísticas.',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 16.0),
              Text(
                'Proveedores de servicio',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Puedo emplear empresas e individuos de terceros por las siguientes razones:',
                style: TextStyle(fontSize: 16.0),
              ),
              Text(
                '• Para facilitar nuestro Servicio;\n'
                '• Para proporcionar el Servicio en nuestro nombre;\n'
                '• Para realizar servicios relacionados con el Servicio; o\n'
                '• Para ayudarnos a analizar cómo se utiliza nuestro Servicio.',
                style: TextStyle(fontSize: 16.0),
              ),
              Text(
                'Quiero informar a los usuarios de este Servicio que estos terceros tienen acceso a su Información Personal. '
                'El motivo es realizar las tareas que les sean asignadas en nuestro nombre. Sin embargo, están obligados a no '
                'revelar ni utilizar la información para ningún otro fin.',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 16.0),
              Text(
                'Seguridad',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Valoro su confianza al proporcionarnos su información personal, por lo que nos esforzamos por utilizar medios '
                'comercialmente aceptables para protegerla. Pero recuerde que ningún método de transmisión a través de Internet '
                'o método de almacenamiento electrónico es 100% seguro y confiable, y no puedo garantizar su seguridad absoluta.',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 16.0),
              Text(
                'Enlaces a otros sitios',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Este Servicio puede contener enlaces a otros sitios. Si hace clic en un enlace de un tercero, será dirigido a ese sitio. '
                'Tenga en cuenta que estos sitios externos no son operados por mí. Por lo tanto, le recomiendo encarecidamente que '
                'revise la Política de Privacidad de estos sitios web. No tengo control ni asumo ninguna responsabilidad por el contenido, '
                'las políticas de privacidad o las prácticas de sitios o servicios de terceros.',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 16.0),
              Text(
                'Cambios a esta política de privacidad',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Puedo actualizar nuestra Política de Privacidad de vez en cuando...Puedo actualizar nuestra Política de Privacidad de vez en cuando.'
                ' Por lo tanto, se recomienda revisar esta página periódicamente para detectar cualquier cambio. Le notificaré cualquier cambio '
                'publicando la nueva Política de Privacidad en esta página. Estos cambios entran en vigor inmediatamente después de su publicación en esta página.',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 16.0),
              Text(
                'Contacto',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              Text(
                'equip.innovatech@gmail.com',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
