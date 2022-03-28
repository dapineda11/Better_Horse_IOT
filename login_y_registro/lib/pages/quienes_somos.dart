import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:login_y_registro/common/tema_principal.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

import 'menu_y_usuario.dart';
import 'widgets/header_widget.dart';

class QuienesSomos extends StatefulWidget {
  const QuienesSomos({Key? key}) : super(key: key);

  @override
  _QuienesSomosState createState() => _QuienesSomosState();
}

class _QuienesSomosState extends State<QuienesSomos> {
  //final _formKey = GlobalKey<FormState>();
  //bool _pinSuccess = false;

  @override
  Widget build(BuildContext context) {
    double _headerHeight = 130;

    return Scaffold(
        backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
          Container(
          height: _headerHeight,
            child: HeaderWidget(
          _headerHeight, true, Icons.engineering),
            ),
         SafeArea(
          child: Container(
          //margin: EdgeInsets.fromLTRB(25, 10, 25, 10),
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Column(
          children: [
              Container(
            alignment: Alignment.topLeft,
            //margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Better Horse: Información de interés para el cliente',
                style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54
                      ),
                      ),
                      SizedBox(height: 10,),
                  Text('¿A quién va dirigida esta iniciativa?',
                    style: TextStyle(
                      fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54
                    ),
                    // textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10,),
                  Text('Fue decidido por el equipo de trabajo, la realización de la iniciativa "Better Horse" con el objetivo de implementar un correcto aprovechamiento de las condiciones de los espacios destinados al hábitat de caballos de alta crianza y/o de alto rendimiento. Se propone con ello el diseño e implementación un sistema de establo inteligente. Lo que el equipo de trabajo busca resolver con la solución, es suplir la necesidad de poseedores de caballos de competencia, referente a la preservación y monitoreo de las condiciones más optimas de sus especímenes.',
                    style: TextStyle(
                      color: Colors.black38,
                      fontSize: 18,
                    ),
                    // textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10,),
                  Text('¿Por qué es importante estar alerta ante estas condiciones?',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54
                    ),
                    // textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10,),
                  Text('Condiciones como la humedad, temperatura y calidad del aire, tienen una correlación inmediata con la prevención del estrés, el estado de salud de dichos animales, y por supuesto su valor de cara a compradores. No obstante, se busca mantener un régimen alimentario adecuado a la edad, peso y estatura del equino. Esto, considerando que por supuesto, un caballo de alto rendimiento requiere de la más estricta y apropiada alimentación.',
                    style: TextStyle(
                      color: Colors.black38,
                      fontSize: 18,
                    ),
                    // textAlign: TextAlign.center,
                  ),
                  ],
    ),),],),),),],),),);

    /*body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: _headerHeight,
                child: HeaderWidget(
                    _headerHeight, true, Icons.privacy_tip_outlined),
              ),
              SafeArea(
                child: Container(
                  margin: EdgeInsets.fromLTRB(25, 10, 25, 10),
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Verification',
                              style: TextStyle(
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54
                              ),
                              // textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 10,),
                            Text(
                              'Enter the verification code we just sent you on your email address.',
                              style: TextStyle(
                                // fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54
                              ),
                              // textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 40.0),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            OTPTextField(
                              length: 4,
                              width: 300,
                              fieldWidth: 50,
                              style: TextStyle(
                                  fontSize: 30
                              ),
                              textFieldAlignment: MainAxisAlignment.spaceAround,
                              fieldStyle: FieldStyle.underline,
                              onCompleted: (pin) {
                                setState(() {
                                  _pinSuccess = true;
                                });
                              },
                            ),
                            SizedBox(height: 50.0),
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: "If you didn't receive a code! ",
                                    style: TextStyle(
                                      color: Colors.black38,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Resend',
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return TemaPrincipal().alartDialog("Successful",
                                                "Verification code resend successful.",
                                                context);
                                          },
                                        );
                                      },
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.orange
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 40.0),
                            Container(
                              decoration: _pinSuccess ? TemaPrincipal().buttonBoxDecoration(context):TemaPrincipal().buttonBoxDecoration(context, "#AAAAAA","#757575"),
                              child: ElevatedButton(
                                style: TemaPrincipal().buttonStyle(),
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      40, 10, 40, 10),
                                  child: Text(
                                    "Verify".toUpperCase(),
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                onPressed: _pinSuccess ? () {
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                          builder: (context) => MenuYUsuario()
                                      ),
                                          (Route<dynamic> route) => false
                                  );
                                } : null,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        )
    );*/
  }
}
