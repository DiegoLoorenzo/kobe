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
              SizedBox(height: 16.0),
              Text(
                'Contrato de Términos y Condiciones de Uso del Software',
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Este Contrato de Términos y Condiciones de Uso del Software ("Contrato") '
                    'es celebrado entre el usuario final ("Usuario") y Innovatech, una entidad legalmente '
                    'constituida con dirección en Ocosingo, Chiapas, México, en adelante referido '
                    'como el "Proveedor".',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 16.0),
              Text(
                '1. Licencia de Software:',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '1.1 Concesión de Licencia:  '
                    '- El Proveedor otorga al Usuario una licencia no exclusiva, intransferible y revocable para utilizar el software proporcionado por el Proveedor, incluyendo todas las funciones y características asociadas (en adelante, el "Software").',
                style: TextStyle(fontSize: 16.0),
              ),
              Text(
                '1.2 Alcance de la Licencia: '
                    '- La licencia concede al Usuario el derecho de utilizar el Software únicamente con el propósito previsto de acuerdo con la descripción proporcionada por el Proveedor. Cualquier uso no autorizado está estrictamente prohibido.',
                  style: TextStyle(fontSize: 16.0),
              ),
              Text(
               '1.3 Restricciones: '
                    '- El Usuario se compromete a no modificar, adaptar, traducir, realizar ingeniería inversa, descompilar, desmontar o intentar derivar el código fuente del Software ni a permitir que terceros lo hagan.',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 16.0),
              Text(
                '2. Términos de Uso:',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '2.1 Registro: '
                    '- Para acceder y utilizar el Software, el Usuario puede ser requerido a registrarse proporcionando información precisa y actualizada. El Usuario es responsable de mantener la confidencialidad de sus credenciales de acceso.',
                   style: TextStyle(fontSize: 16.0),
              ),
              Text(
                '2.2 Uso Adecuado: '
                    '- El Usuario se compromete a utilizar el Software de manera legal, ética y conforme a este Contrato. Se prohíbe el uso del Software para cualquier actividad ilegal o que viole los derechos de terceros.',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 16.0),
              Text(
                '3. Propiedad Intelectual:',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                  '3.1 Derechos de Propiedad: '
                      '- El Usuario reconoce que todos los derechos de propiedad intelectual sobre el Software, incluyendo pero no limitado a derechos de autor, marcas registradas y secretos comerciales, pertenecen exclusivamente al Proveedor.',
                style: TextStyle(fontSize: 16.0),
              ),
              Text(
                '3.2 Comentarios y Mejoras: '
                    '- El Usuario tiene derecho a proporcionar comentarios y sugerencias sobre el Software. Cualquier mejora, actualización o modificación basada en estos comentarios será propiedad exclusiva del Proveedor.',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 16.0),
              Text(
                '4. Actualizaciones y Mantenimiento:',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                  '4.1 Actualizaciones: '
                      '- El Proveedor puede proporcionar actualizaciones periódicas del Software para mejorar la funcionalidad y corregir errores. Estas actualizaciones estarán sujetas a los términos de este Contrato.',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 16.0),
              Text(
                '5. Limitación de Responsabilidad:',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '5.1 Uso bajo su Propio Riesgo: '
                    '- El Usuario reconoce que el uso del Software es bajo su propio riesgo. El Proveedor no será responsable de pérdidas, daños o perjuicios directos o indirectos derivados del uso o incapacidad de uso del Software.',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 16.0),
              Text(
                '6. Duración y Terminación:',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '6.1 Duración: '
                    '- Este Contrato entrará en vigor en el momento en que el Usuario acepte sus términos y continuará hasta que sea terminado por cualquiera de las partes.',
                  style: TextStyle(fontSize: 16.0),
              ),
              Text(
                '6.2 Terminación: '
                    '- El Proveedor se reserva el derecho de terminar este Contrato y la licencia otorgada si el Usuario incumple cualquiera de los términos establecidos. En caso de terminación, el Usuario deberá dejar de usar el Software.',
                  style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 16.0),
              Text(
                '7. Disposiciones Generales:',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '7.1 Modificaciones: '
                    '- El Proveedor se reserva el derecho de modificar los términos de este Contrato en cualquier momento. Las modificaciones serán efectivas al ser publicadas en el sitio web del Proveedor.',
                style: TextStyle(fontSize: 16.0),
              ),
              Text(
                '7.2 Ley Aplicable: '
                    '- Este Contrato se regirá e interpretará de acuerdo con las leyes de los Estados Unidos Mexicanos, excluyendo cualquier conflicto de disposiciones legales.',
              style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 16.0),
              Text(
                'Aceptación de Términos:',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'El Usuario manifiesta haber leído y entendido este Contrato, aceptando todos sus términos y condiciones al utilizar el Software proporcionado por el Proveedor.',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 16.0),
              Text(
                'Innovatech',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              Text(
                'Ocosingo, Chiapas, Mexico',
                style: TextStyle(
                  fontSize: 16.0,

                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
