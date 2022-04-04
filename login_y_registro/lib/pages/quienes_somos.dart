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
                  Container(
                    child: Image.asset('assets/images/equitacion.png', scale: 0.1,),
                  ),
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

                  Text('Implicaciones graves ante la falta de supervisión y control de estas variables',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54
                    ),

                  ),
                  SizedBox(height: 20,),
                  Text('Alta humedad y temperatura puede favorecer el crecimiento de bacterias y hongos que pueden causar infecciones tanto en la piel como en las pezuñas, además pueden causar ulceras en el animal, complicaciones respiratorias, del sistema digestivo etc. Esto puede empeorar si se tiene en cuenta la gestión de deshechos de los caballos ya que este puede ser el canal de infección de distintos tipos de enfermedades. Un estudio en causas de muerte de caballos pura sangre encontró que el 39% de las muertes totales eran atribuidas a enfermedades infecciosas. A continuación, se presenta una tabla de enfermedades relacionadas con condiciones ambientales (humedad y temperatura) y/o los desechos del animal. Como se puede observar la tabla varía desde enfermedades con tasa de muertes baja hasta enfermedades graves con tasas de mortalidad cercanas a el 100 %. Sumado a ello, cabe recalcar otro aspecto fundamental para la preservación de la salud de los equinos, corresponde a la calidad del aire que estos respiran. Debido a que gases nocivos, como el caso del metano (CH4), pueden tener incidencias en su propia salud además de ser un fuerte indicativo de una dieta que contenga ingredientes de baja digestibilidad (alto contenido en celulosa, como por ejemplo heno), que implica mayor emisión de metano entérico. ',
                      style: TextStyle(
                      color: Colors.black38,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    alignment: Alignment.center,
                    child: Image.asset('assets/images/tabla.PNG',
                      width: 400.0,
                      height: 400.0,),
                  ),

                  Text('Arquitectura en alto nivel: Better Horse',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54
                    ),
                  ),
                  SizedBox(height: 10,),


                  Container(
                    alignment: Alignment.center,
                    child: Image.asset('assets/images/arqui.png',
                      width: 700.0,
                      height: 700.0,),
                  ),
                  Text('En el anterior diagrama se presenta la implementación del sistema, donde se observa el establo o box de los caballos. Lugar en el que es situado, un sensor de temperatura, humedad y gas, en adición a una galga extensiométrica que realizará las estimaciones de masa del alimento equino. Los sensores mencionados, estarán conectados al procesador Raspberry pi que será conectado a una red wifi, de tal manera que tengamos la facilite el enlace a una aplicación y página web donde el usuario podrá visualizar un apartado de condiciones ambientales, y otro de cantidades y proyecciones de gasto alimentario.',
                    style: TextStyle(
                      color: Colors.black38,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text('Nuestro equipo de trabajo',
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text('- Equipo de desarrollo web y de aplicación móvil (Frontend y Backend respectivamente):',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/images/desarrollo.png',
                      width: 680.0,
                      height: 680.0,),
                  ),
                  Text('- Equipo de sensores y comunicadores:',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    alignment: Alignment.center,
                    child: Image.asset('assets/images/sensores.png',
                      width: 680.0,
                      height: 680.0,),
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
