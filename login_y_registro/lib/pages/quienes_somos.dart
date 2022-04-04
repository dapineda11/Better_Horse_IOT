import 'package:flutter/material.dart';
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
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Column(
              children: [
              Container(
              alignment: Alignment.topLeft,
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
                      SizedBox(height: 20,),
                  Text('¿A quién va dirigida esta iniciativa?',
                    style: TextStyle(
                      fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54
                    ),
                  ),
                  SizedBox(height: 20,),
                  Text('Fue decidido por el equipo de trabajo, la realización de la iniciativa "Better Horse" con el objetivo de implementar un correcto aprovechamiento de las condiciones de los espacios destinados al hábitat de caballos de alta crianza y/o de alto rendimiento. Se propone con ello el diseño e implementación un sistema de establo inteligente. Lo que el equipo de trabajo busca resolver con la solución, es suplir la necesidad de poseedores de caballos de competencia, referente a la preservación y monitoreo de las condiciones más optimas de sus especímenes.',
                    style: TextStyle(
                      color: Colors.black38,
                      fontSize: 18,
                    ),
                    // textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20,),
                  Text('¿Por qué es importante estar alerta ante estas condiciones?',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54
                    ),

                  ),
                  SizedBox(height: 20,),
                  Text('Condiciones como la humedad, temperatura y calidad del aire, tienen una correlación inmediata con la prevención del estrés, el estado de salud de dichos animales, y por supuesto su valor de cara a compradores. No obstante, se busca mantener un régimen alimentario adecuado a la edad, peso y estatura del equino. Esto, considerando que por supuesto, un caballo de alto rendimiento requiere de la más estricta y apropiada alimentación.',
                    style: TextStyle(
                      color: Colors.black38,
                      fontSize: 18,
                    ),
                    ),
                  SizedBox(height: 10,),

                  Text('Arquitectura en alto nivel: Better Horse',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    height: _headerHeight,
                    child:
                    new Image.asset('assets/andres.png', scale: 1,),

                  ),
                ],
                  ),
                ),
              ],
            ),
            ),
            ),

          ],
        ),
      ),
    );
  }
}
