import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kobe_flutter/pages/Politica_de_Privacidad.dart';

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

  ///Almacenamiento de todos los Build y diseño de la interfaz
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Registro usuario K.O.B.E",
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w700,
            height: 0,
          ),
        ),
        backgroundColor: Color(0xFFFFD974),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset('assets/icon250.png'),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Bienvenido   a   K.O.B.E     Registrate",
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
              padding: EdgeInsets.fromLTRB(0, 0, 0, 100),
              child: butonCrearUsuario(),
            )
          ],
        ),
      ),
    );
  }

  ///Capos del formulario
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

//Boton para evr las Politicas de Privacidad
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
              MaterialPageRoute(builder: (context) => PoliticaPrivacidad()),
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

//Campo del Email
  Widget buildEmail() {
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
        }
        return null;
      },
    );
  }

//Campo de de la contraseña
  Widget buildPassword() {
    return TextFormField(
      obscureText: passwordVisible,
      decoration: InputDecoration(
        labelText: "Contraseña",
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: new BorderSide(color: Colors.black)),
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
        }
        return null;
      },
      onSaved: (String? value) {
        password = value!;
      },
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
              try {
                UserCredential userCredential = await FirebaseAuth.instance
                    .createUserWithEmailAndPassword(
                        email: email, password: password);

                if (userCredential.user != null) {
                  await userCredential.user!.sendEmailVerification();
                  Navigator.of(context).pop();
                } else {
                  setState(() {
                    error = "Error al crear el usuario";
                  });
                }
              } on FirebaseAuthException catch (e) {
                setState(() {
                  if (e.code == 'email-already-in-use') {
                    error = "El correo ya se encuentra en uso";
                  } else if (e.code == 'weak-password') {
                    error = "Contraseña débil";
                  } else {
                    error = "Error al crear el usuario: ${e.message}";
                  }
                });
              } catch (e) {
                print(e.toString());
                setState(() {
                  error = "Error al crear el usuario";
                });
              }
            } else {
              setState(() {
                error = "Debes aceptar la Política de Privacidad";
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

  ///Future Para la conexion de Firebase ala registro
  Future<UserCredential?> crear(String email, String passwd) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseException catch (e) {
      if (e.code == 'email-already-in-use') {
        //todo crear contraseña
        setState(() {
          error = "El correo ya se encuentra en uso";
        });
      }
      if (e.code == 'wrong-password') {
        //Toda contraseña muy debil
        setState(() {
          error = "contraseña debil";
        });
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
