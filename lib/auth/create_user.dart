import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kobe_flutter/auth/login_page.dart';
import 'package:kobe_flutter/pages/configuration/privacy_policy.dart';

class CreateUserPage extends StatefulWidget {
  @override
  State createState() {
    return _CreateUserState();
  }
}

class _CreateUserState extends State<CreateUserPage> {
  bool passwordVisible = true;
  late String email, password;
  final _formkey = GlobalKey<FormState>();
  String error = '';
  bool acceptPolicy = false;

  @override
  void initState() {
    super.initState();
    passwordVisible = true;
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
              padding: const EdgeInsets.all(60.0),
              child: Transform.scale(
                scale: 1.0, // Puedes ajustar el valor según tus necesidades
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
                    color: Color.fromARGB(255, 253, 0, 0),
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

  Widget formulario() {
    return Form(
      key: _formkey,
      child: Column(
        children: [
          buildEmailFormField(),
          const Padding(padding: EdgeInsets.only(top: 12)),
          buildPasswordFormField(),
        ],
      ),
    );
  }

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
      keyboardType: TextInputType.visiblePassword,
      onSaved: (String? value) {
        password = value!;
      },
    );
  }

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

  Widget butonCrearUsuario() {
    return FractionallySizedBox(
      widthFactor: 0.6,
      child: Column(
        children: [
          ElevatedButton(
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
                    error = "Por favor, acepta la Política de Privacidad";
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
        ],
      ),
    );
  }

  bool isValidEmail(String email) {
    final emailRegExp =
        RegExp(r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$');
    return emailRegExp.hasMatch(email);
  }

  Future<UserCredential?> crear(String email, String passwd) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseException catch (e) {
      if (e.code == 'email-already-in-use') {
        setState(() {
          error =
              "El correo electrónico ya está en uso. Por favor, utiliza otro.";
        });
      } else if (e.code == 'weak-password') {
        setState(() {
          error = "La contraseña es débil. Elige una contraseña más segura.";
        });
      } else {
        setState(() {
          error = "Error al crear el usuario. Por favor, inténtalo de nuevo.";
        });
      }
      return null;
    } catch (e) {
      print(e.toString());
      setState(() {
        error = "Error al crear el usuario. Por favor, inténtalo de nuevo.";
      });
      return null;
    }
  }
}
