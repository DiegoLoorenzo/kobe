import 'package:intl/intl.dart';


//Son mensajes de error convertidos en Español
class AppLocalizations {
  static String translate(String errorCode, {String? locale}) {
    locale ??= Intl.defaultLocale; //Intl.defaultLocale
    switch (errorCode) {
      case 'email-already-in-use':
        return Intl.message(
          'El correo ya está en uso',
          name: 'emailInUseError',
          locale: locale,
        );
      case 'weak-password':
        return Intl.message(
          'Contraseña débil',
          name: 'weakPasswordError',
          locale: locale,
        );
      case 'invalid-email':
        return Intl.message(
          'La dirección de correo electrónico es inválida',
          name: 'invalidEmailError',
          locale: locale,
        );
      case 'createUserError':
        return Intl.message(
          'Error al crear el usuario',
          name: 'createUserError',
          locale: locale,
        );
      case 'acceptPrivacyError':
        return Intl.message(
          'Debes aceptar la Política de Privacidad',
          name: 'acceptPrivacyError',
          locale: locale,
        );
      default:
        return Intl.message(
          'Error al crear el usuario',
          name: 'defaultError',
          locale: locale,
        );
    }
  }
}
