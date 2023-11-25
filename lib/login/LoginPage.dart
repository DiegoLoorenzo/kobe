import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kobe_flutter/MyHomePage.dart';
import 'package:kobe_flutter/login/CreateUserPage.dart';
import 'package:kobe_flutter/login/reset_password/reset_password.dart';

class LoginPage extends StatefulWidget {
  @override
  State createState() {
    return _LoginState();
  }
}

class _LoginState extends State<LoginPage> {
  bool passwordVisible = true;
  String email = '', password = '';
  final _formkey = GlobalKey<FormState>();
  String error = '';

  Map<String, String> mensajesErrorPersonalizados = {
    'user-not-found': 'Usuario no encontrado',
    'wrong-password': 'Contraseña incorrecta',
    'invalid-email': 'Correo Electronico Incorrecto',
    'INVALID_LOGIN_CREDENTIALS': 'Contraseña Incorrecto',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
              padding: const EdgeInsets.all(80.0),
              child: Image.asset('assets/icon250.png')),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Text(
              "Bienvenido a K.O.B.E",
              style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 30,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                  height: -1),
            ),
          ),
          Offstage(
            offstage: error == '',
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 16),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: formulario(),
          ),
          butonLogin(),
          nuevoAqui(),
          forgetpassword(),
          buildOrLine(),
          BotonGoogle(),
        ],
      ),
    ));
  }

  Widget BotonGoogle() {
    return Column(
      children: [
        SignInButton(Buttons.Google, onPressed: () async {
          await entrarConGoogle();
          if (FirebaseAuth.instance.currentUser != null) {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => MyHomePage()),
                (Route<dynamic> route) => false);
          }
        }),
      ],
    );
  }

  Future<UserCredential> entrarConGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? authentication =
        await googleUser?.authentication;
    final credentials = GoogleAuthProvider.credential(
        accessToken: authentication?.accessToken,
        idToken: authentication?.idToken);
    return await FirebaseAuth.instance.signInWithCredential(credentials);
  }

  Widget buildOrLine() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(child: Divider()),
        Text("ó"),
        Expanded(child: Divider()),
      ],
    );
  }

  Widget nuevoAqui() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "¿No Tienes una Cuenta?",
          style: TextStyle(
              color: Color(0xFF000000),
              fontSize: 15,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => CreateUserPage()));
          },
          child: Text(
            "Registrate",
            style: TextStyle(
                color: Color(0xFF3FA8EE),
                fontSize: 15,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700),
          ),
        ),
      ],
    );
  }

  Widget forgetpassword() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        TextButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => reset_password()));
          },
          child: const Text(
            "¿Olvidaste tu Contraseña?",
            style: TextStyle(
                color: Color(0xFF3FA8EE),
                fontSize: 15,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700),
          ),
        ),
      ],
    );
  }

  Widget formulario() {
    return Form(
        key: _formkey,
        child: Column(
          children: [
            buildEmail(),
            const Padding(padding: EdgeInsets.only(top: 12)),
            buildPassword()
          ],
        ));
  }

  Widget buildEmail() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: "Email",
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide:
                  BorderSide(color: const Color.fromARGB(255, 0, 0, 0)))),
      keyboardType: TextInputType.emailAddress,
      onSaved: (String? value) {
        email = value!;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return "Este campo es obligatorio";
        }
        return null;
      },
    );
  }

  Widget buildPassword() {
    return TextFormField(
      obscureText: passwordVisible,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.black)),
        hintText: 'Contraseña',
        suffixIcon: IconButton(
          icon: Icon(passwordVisible ? Icons.visibility : Icons.visibility_off),
          onPressed: () {
            setState(() {
              passwordVisible = !passwordVisible;
            });
          },
        ),
      ),
      keyboardType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.done,
      validator: (value) {
        if (value!.isEmpty) {
          return "Este campo es obligatorio";
        }
        return null;
      },
      onSaved: (String? value) {
        password = value!;
      },
    );
  }

  Widget butonLogin() {
    return FractionallySizedBox(
      widthFactor: 0.6,
      child: ElevatedButton(
        onPressed: () async {
          if (_formkey.currentState!.validate()) {
            _formkey.currentState!.save();
            UserCredential? credentials = await login(email, password);
            if (credentials != null) {
              if (credentials.user != null) {
                if (credentials.user!.emailVerified) {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => MyHomePage()),
                      (Route<dynamic> route) => false);
                } else {
                  setState(() {
                    error = "Debes verificar tu correo antes de acceder";
                  });
                }
              }
            }
          }
        },
        child: Text(
          "Iniciar Sesión",
          style: TextStyle(
              color: Color(0xFFFFFFFF),
              fontSize: 20,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w700),
        ),
      ),
    );
  }

  Future<UserCredential?> login(String email, String passwd) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: passwd);
      return userCredential;
    } on FirebaseException catch (e) {
      setState(() {
        error = mensajesErrorPersonalizados[e.code] ?? '${e.code}';
      });
      return null;
    }
  }
}
