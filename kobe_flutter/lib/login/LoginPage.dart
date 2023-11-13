import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kobe_flutter/MyHomePage.dart';
import 'package:kobe_flutter/login/CreateUserPage.dart';
import 'package:kobe_flutter/login/reset_password/reset_password.dart';

class LoginPage extends StatefulWidget{

  @override
  State createState(){
    return _LoginState();
  }
}

class _LoginState extends State<LoginPage>{
  late String email, password;
  final _formkey = GlobalKey<FormState>();
  String error='';

  @override
  void initState() {
    super.initState();
  }

///Almacenamiento de todos los Build y diseño de la interfaz
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding:const EdgeInsets.all(80.0),
            child:Image.asset('assets/icon250.png')
          /*Image.network(
            'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiWTnDrG8iUiaNeji8MVMvDuYXQjMveb_ZFPVVJ6DjO4uj0ww1Gmq0aF_S2P-DuDSyjYC5rA7ss3eds92jzQg3hFb7prcn_4w06diBWEnEPzm6sOh_wMsPU1n7U-VkIHoytE9EAHhKoJnv_JG2SkE0_wIgrE14nFoHwSBmfZVofzh4A5q4U9AgbmnbgH8A/s1600/icon250.jpg'
            ),*/),
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: Text("Bienvenido a K.O.B.E", style: TextStyle(color: Color.fromARGB(255, 0, 0, 0),
            fontSize: 30,fontFamily: 'Poppins',fontWeight: FontWeight.w700,height: -1),),
          ),
          Offstage(
            offstage: error == '',
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(error, style: TextStyle(color: Colors.red, fontSize: 16),),
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
      )
    );
  }

///// Boton de Entrar con Google
  Widget BotonGoogle(){
    return Column(
      children: [
        SignInButton(Buttons.Google, onPressed: ()async{
          await entrarConGoogle();
          if(FirebaseAuth.instance.currentUser != null){
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => MyHomePage()),
                      (Route<dynamic> route) => false);
          }
        }),
      ],
      );
  }


///Accion del Future para logearnos con Google
  Future<UserCredential> entrarConGoogle() async {
    final GoogleSignInAccount? googleUser= await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? autentication = await googleUser?.authentication;
    final credentials = GoogleAuthProvider.credential(
      accessToken: autentication?.accessToken,
      idToken: autentication?.idToken
    );
    return await FirebaseAuth.instance.signInWithCredential(credentials);
  }


///Boton de Linea
  Widget buildOrLine(){
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

//Boton de entrar a registrarse
  Widget nuevoAqui(){
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("¿No Tienes una Cuenta?", style: TextStyle(color: Color(0xFF000000),fontSize: 15,
          fontFamily: 'Poppins',fontWeight: FontWeight.w500),),
        TextButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => CreateUserPage()));

        }, child: Text("Registrate", style: TextStyle(color: Color(0xFF3FA8EE),fontSize: 15,
          fontFamily: 'Poppins',fontWeight: FontWeight.w700),),
        ),
      ],
    );
  }

///Boton de recuperar contraseña
Widget forgetpassword() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    mainAxisSize: MainAxisSize.max,
    children: [
      TextButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => reset_password()));
        },
        child: const Text("¿Olvidaste tu Contraseña?", style: TextStyle(color: Color(0xFF3FA8EE),fontSize: 15,
        fontFamily: 'Poppins',fontWeight: FontWeight.w700),),
        ),
    ],
  );
}

///Boton de ir a formulario
  Widget formulario(){
    return Form(
      key: _formkey,
        child: Column(children: [
          buildEmail(),
          const Padding(padding: EdgeInsets.only(top: 12)),
          buildPassword()
    ],));
  }

//Campo de colocar email
  Widget buildEmail(){
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Email" ,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: new BorderSide(color: const Color.fromARGB(255, 0, 0, 0))
        )
      ),
      keyboardType: TextInputType.emailAddress,
      onSaved: (String? value) {
      email = value!;
      },
      validator: (value){
        if(value!.isEmpty){
          return "Este campo es obligatorio";
        }
        return null;
      },
    );
  }

//Campo para Introducir Password
  Widget buildPassword(){
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Contraseña",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: new BorderSide(color: Colors.black)
        )
      ),
      obscureText: true,
      validator: (value){
        if(value!.isEmpty){
          return "Este campo es obligatorio";
        }
        return null;
      },
      onSaved: (String? value) {
      password = value!;
      },
    );
  }

//Boton para logearse
  Widget butonLogin(){
    return FractionallySizedBox(
      widthFactor: 0.6,
    child: ElevatedButton(
      onPressed: () async{
        if(_formkey.currentState!.validate()){
          _formkey.currentState!.save();
          UserCredential? credenciales = await login(email, password);
          if(credenciales !=null){
            if(credenciales.user != null){
              if(credenciales.user!.emailVerified){
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => MyHomePage()),
                  (Route<dynamic> route) => false);
              }
              else{
                //todo mostrar que debe verificar su email
                setState(() {
                  error = "Debes verificar tu correo antes de acceder";
                });
              }
            }
          }
        }
      },
      child: Text("Iniciar Sesión",style: TextStyle(color: Color(0xFFFFFFFF),
      fontSize: 20,fontFamily: 'Poppins',fontWeight: FontWeight.w700),),
    ),
    );
  }

//Accion para conectar Firebase al Proyecto
  Future<UserCredential?> login(String email, String passwd) async{
    try{
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email,
        password: password);
      return userCredential;
    } on FirebaseException catch(e){
      if(e.code == 'User-not-found'){
        //todo usuario no encontrado
        setState(() {
          error = "Usuario no encontrado";
        });
      }
      if(e.code == 'wrong-password'){
        //Toda contraseña incorrecta
        setState(() {
          error = "contraseña incorrecta";
        });
      }
    }
  }
}