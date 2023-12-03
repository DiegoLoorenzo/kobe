import 'package:intl/intl.dart';

//Son mensajes de error convertidos en Español
class AppLocalizations {
  static String translate(String errorCode, {String? locale}) {
    locale ??= Intl.defaultLocale;
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
      case 'user-not-found':
        return Intl.message(
          'Usuario no encontrado',
          name: 'userNotFound',
          locale: locale,
        );
      case 'wrong-password':
        return Intl.message(
          'Contraseña incorrecta',
          name: 'wrongPassword',
          locale: locale,
        );
      case 'unknown-error':
        return Intl.message(
          'Ocurrió un error desconocido',
          name: 'unknownError',
          locale: locale,
        );
      case 'invalid_login_credentials':
        return Intl.message(
          'Correo Electronico Incorrecto',
          name: 'invalidCredentials',
          locale: locale,
        );
      case 'badly-formatted-email':
        return Intl.message(
          'La dirección de correo electrónico está mal formateada',
          name: 'badlyFormattedEmailError',
          locale: locale,
        );
      default:
        return Intl.message(
          'Error desconocido',
          name: 'unknownError',
          locale: locale,
        );
    }
  }
}
