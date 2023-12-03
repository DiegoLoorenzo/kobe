import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kobe_flutter/auth/i18n.dart';
import 'package:kobe_flutter/pages/configuration/privacy_policy.dart';
import 'package:kobe_flutter/auth/login_page.dart';

class CreateUserPage extends StatefulWidget {
  @override
  State createState() {
    return _CreateUserState();
  }
}

class _CreateUserState extends State<CreateUserPage> {
  bool passwordVisible = true;
  bool confirmPasswordVisible = true;
  late String email, password, confirmPassword;
  final _formkey = GlobalKey<FormState>();
  String error = '';
  bool acceptPolicy = false;

  @override
  void initState() {
    super.initState();
    passwordVisible = true;
    confirmPasswordVisible = true;

    password = '';
    confirmPassword = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Transform.scale(
                scale: 0.6, // Puedes ajustar el valor según tus necesidades
                child: Image.asset('assets/icon250.png'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: Text(
                "Bienvenido a K.O.B.E. Regístrate para empezar.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
            ),
            Offstage(
              offstage: error == '' || error == "Usuario creado",
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  error,
                  style: TextStyle(
                    color: Color.fromARGB(255, 42, 108, 252),
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: formulario(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: politica(),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                  0, 0, 0, 20), // Ajusta el espacio inferior
              child: butonCrearUsuario(),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "¿Ya tienes una cuenta? ",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              LoginPage()), // Navegar a la página de inicio de sesión
                    );
                  },
                  child: Text(
                    "Inicia sesión aquí.",
                    style: TextStyle(
                      color: Colors.blue, // Cambiar a azul
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Campo de confirmación de la contraseña
  Widget buildConfirmPasswordFormField() {
    return TextFormField(
      maxLength: 20,
      obscureText: confirmPasswordVisible,
      decoration: InputDecoration(
        labelText: "Confirmar Contraseña",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: new BorderSide(color: Colors.black),
        ),
        suffixIcon: IconButton(
          icon: Icon(
              confirmPasswordVisible ? Icons.visibility : Icons.visibility_off),
          onPressed: () {
            setState(() {
              confirmPasswordVisible = !confirmPasswordVisible;
            });
          },
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "Este campo es obligatorio";
        } else if (value != password) {
          return "Las contraseñas no coinciden";
        }
        return null;
      },
      onSaved: (String? value) {
        confirmPassword = value!;
      },
    );
  }

  ///Capos del formulario
  Widget formulario() {
    return Form(
      key: _formkey,
      child: Column(
        children: [
          buildEmailFormField(),
          const Padding(padding: EdgeInsets.only(top: 12)),
          buildPasswordFormField(),
          const Padding(padding: EdgeInsets.only(top: 12)),
          buildConfirmPasswordFormField(), // Nuevo campo para la confirmación de la contraseña
        ],
      ),
    );
  }

  //Campo del Correo Electronico
  Widget buildEmailFormField() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: "Email",
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: new BorderSide(color: Colors.black))),
      keyboardType: TextInputType.emailAddress,
      onSaved: (String? value) {
        email = value!;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return "Este campo es obligatorio";
        } else if (value.length < 5 || value.length > 50) {
          return "La longitud del correo electrónico debe estar entre 5 y 50 caracteres";
        }
        return null;
      },
    );
  }

  //Campo de la contraseña
  Widget buildPasswordFormField() {
    return TextFormField(
      maxLength: 20,
      obscureText: passwordVisible,
      decoration: InputDecoration(
        labelText: "Contraseña",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: new BorderSide(color: Colors.black),
        ),
        suffixIcon: IconButton(
          icon: Icon(passwordVisible ? Icons.visibility : Icons.visibility_off),
          onPressed: () {
            setState(() {
              passwordVisible = !passwordVisible;
            });
          },
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "Este campo es obligatorio";
        } else if (value.length < 12 || value.length > 20) {
          return "La longitud de la contraseña debe estar entre 12 y 20 caracteres";
        }
        return null;
      },
      onSaved: (String? value) {
        password = value!;
      },
    );
  }

  //Boton para ver las Politicas de Privacidad
  Widget politica() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Checkbox(
          value: acceptPolicy,
          onChanged: (value) {
            setState(() {
              acceptPolicy = value ?? false;
            });
          },
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PrivacyScreen()),
            );
          },
          child: Text(
            "Acepto la Política de Privacidad",
            style: TextStyle(
              color: Color(0xFF3FA8EE),
              fontSize: 15,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }

  //Bonton crear usuario
  Widget butonCrearUsuario() {
    return FractionallySizedBox(
      widthFactor: 0.6,
      child: ElevatedButton(
        onPressed: () async {
          if (_formkey.currentState!.validate()) {
            _formkey.currentState!.save();
            if (acceptPolicy) {
              UserCredential? userCredential = await crear(email, password);
              if (userCredential != null && userCredential.user != null) {
                await userCredential.user!.sendEmailVerification();
                setState(() {
                  error = '';
                });
                Navigator.of(context).pop();
              }
            } else {
              setState(() {
                error = AppLocalizations.translate('acceptPrivacyError');
              });
            }
          }
        },
        child: Text(
          "Registrarse",
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontSize: 20,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w700,
            height: 0,
          ),
        ),
      ),
    );
  }

  // Manejar los formatos del email
  bool isValidEmail(String email) {
    final emailRegExp =
        RegExp(r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$');
    return emailRegExp.hasMatch(email);
  }

  // Future Para la conexión de Firebase al registro
  Future<UserCredential?> crear(String email, String passwd) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseException catch (e) {
      if (e.code == 'email-already-in-use') {
        setState(() {
          error = AppLocalizations.translate('emailInUseError');
        });
      } else if (e.code == 'weak-password') {
        setState(() {
          error = AppLocalizations.translate('weakPasswordError');
        });
      } else {
        setState(() {
          error = AppLocalizations.translate('createUserError');
        });
      }
      return null;
    } catch (e) {
      print(e.toString());
      setState(() {
        error = AppLocalizations.translate('createUserError');
      });
      return null;
    }
  }
}
