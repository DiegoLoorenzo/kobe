import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class reset_password extends StatefulWidget{
  @override
  State createState(){
    return _resetpasswordState();
  }
}

class _resetpasswordState extends State<reset_password>{
  final _formkey = GlobalKey<FormState>();
  String email="";
  String error="";
  bool isLoading = false;

///Almacenamiento de todos los Build y diseño de la interfaz
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Restablecer Contraseña",style: TextStyle(color: Colors.black, fontSize: 22,
              fontFamily: 'Poppins',fontWeight: FontWeight.w700,height: 0),),
        backgroundColor: Color(0xFFFFD974),
      ),
      body: SingleChildScrollView(
          child: isLoading
          ? Center(child: CircularProgressIndicator()) // Mostrar un indicador de carga mientras se espera
          : Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                padding:const EdgeInsets.all(50.0),
                child:Image.asset('assets/icon250.png')
                /*Image.network(
                'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiWTnDrG8iUiaNeji8MVMvDuYXQjMveb_ZFPVVJ6DjO4uj0ww1Gmq0aF_S2P-DuDSyjYC5rA7ss3eds92jzQg3hFb7prcn_4w06diBWEnEPzm6sOh_wMsPU1n7U-VkIHoytE9EAHhKoJnv_JG2SkE0_wIgrE14nFoHwSBmfZVofzh4A5q4U9AgbmnbgH8A/s1600/icon250.jpg'
                ),*/),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("Introduce tu correo electrónico y se te enviará un enlace a tu email.",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 16,fontFamily: 'Poppins',fontWeight: FontWeight.w500,height: 0),
                    ),
                  ),
                if (error.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      error,
                      style: TextStyle(color: Colors.red, fontSize: 14),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: formulario(),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 100),
                    child: botonRestablecer(),
                  )
                ],
              ),
              ),
          );
        }

///Capos del formulario
  Widget formulario(){
    return Form(
      key: _formkey,
        child: Column(children: [
          buildEmail(),
          const Padding(padding: EdgeInsets.only(top: 12)),
    ],));
  }

//Campo del Email
  Widget buildEmail(){
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Correo Electrónico" ,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: new BorderSide(color: Colors.black)
        )
      ),
      keyboardType: TextInputType.emailAddress,
      onSaved: (value) => email = value ?? '',
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Este campo es obligatorio";
        } else if (!value.contains('@')) {
          return "Por favor ingrese un correo electrónico válido";
        }
        return null;
      },
    );
  }

//Bonton crear usuario
  Widget botonRestablecer(){
    return FractionallySizedBox(
      widthFactor: 0.6,
    child: ElevatedButton(
      onPressed: () {
          if (_formkey.currentState!.validate()) {
            _formkey.currentState!.save();
            restablecerContrasena();
          }
        },
        child: Text(
          "Restablecer",
          style: TextStyle(fontSize: 17),
        ),
      ),
    );
}

void restablecerContrasena() async {
  setState(() {
    isLoading = true;
  });
  try {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Se ha enviado un enlace de restablecer a tu correo electronico."),
        )
    );
    Navigator.of(context).pop();
    } on FirebaseAuthException catch (e) {
      setState(() {
        error = e.message ?? 'Ocurrio un error al intentar restablecer la contraseña.';
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
}

}