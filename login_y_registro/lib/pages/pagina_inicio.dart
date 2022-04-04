import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:login_y_registro/common/tema_principal.dart';
import 'package:login_y_registro/negocio/logController.dart';

import 'recuperar_contrasena.dart';
import 'menu_y_usuario.dart';
import 'pagina_registro.dart';
import 'widgets/header_widget.dart';

class PaginaInicio extends StatefulWidget {
  const PaginaInicio({Key? key}) : super(key: key);

  @override
  _PaginaInicioState createState() => _PaginaInicioState();
}

class _PaginaInicioState extends State<PaginaInicio> {
  double _headerHeight = 200;

  //formularios
  Key _formKey = GlobalKey<FormState>();

  TextEditingController emailctrl = new TextEditingController();
  TextEditingController contrasenactrl = new TextEditingController();

  //controladores de negocio
  final ctrLogin = logController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: _headerHeight,
              child: Image.asset('assets/logo.PNG'),
              //child: HeaderWidget(_headerHeight, true, Icons.login_rounded), //let's create a common header widget
            ),
            SafeArea(
              child: Container(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  margin: EdgeInsets.fromLTRB(
                      20, 10, 20, 10),
                  child: Column(
                    children: [
                      Text(
                        'Better Horse',
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Inicio de sesión',
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(height: 30.0),
                      Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              Container(
                                child: TextField(
                                  controller: emailctrl,
                                  decoration: TemaPrincipal()
                                      .textInputDecoration(
                                          'Email', 'Ingrese su correo'),
                                ),
                                decoration:
                                    TemaPrincipal().inputBoxDecorationShaddow(),
                              ),
                              SizedBox(height: 30.0),
                              Container(
                                child: TextField(
                                  controller: contrasenactrl,
                                  obscureText: true,
                                  decoration: TemaPrincipal()
                                      .textInputDecoration('Contraseña',
                                          'Ingrese su contraseña'),
                                ),
                                decoration:
                                    TemaPrincipal().inputBoxDecorationShaddow(),
                              ),
                              SizedBox(height: 15.0),
                              Container(
                                margin: EdgeInsets.fromLTRB(10, 0, 10, 20),
                                alignment: Alignment.topRight,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              RecuperarContrasena()),
                                    );
                                  },
                                  child: Text(
                                    "Olvidé mi contraseña",
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                decoration: TemaPrincipal()
                                    .buttonBoxDecoration(context),
                                child: ElevatedButton(
                                  style: TemaPrincipal().buttonStyle(),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(40, 10, 40, 10),
                                    child: Text(
                                      'Ingresar'.toUpperCase(),
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                  onPressed: () async {
                                    var res = await ctrLogin.verificar(
                                        emailctrl.text, contrasenactrl.text);

                                    if (res == 1) {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  MenuYUsuario()));
                                    } else {
                                      Fluttertoast.showToast(
                                          msg: "Imposible iniciar sesión",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          webPosition: "center",
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 50);
                                    }
                                  },
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
                                //child: Text('Don\'t have an account? Create'),
                                child: Text.rich(TextSpan(children: [
                                  TextSpan(
                                      text: "¿No tiene una cuenta creada? "),
                                  TextSpan(
                                    text: 'Crear nueva cuenta',
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    PaginaRegistro()));
                                      },
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context).accentColor),
                                  ),
                                ])),
                              ),
                            ],
                          )),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
