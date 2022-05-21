/*
* Pontificia Universidad Javeriana
* IoT fundamentos y aplicaciones
* Daniel Pineda
* Sebastián Yagama
* Andrés Gómez
* Libardo Melo
* */
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'pages/pantalla_animacion.dart';

void main() {
  runApp(BetterHorseApp());
}

class BetterHorseApp extends StatelessWidget {

  Color _primaryColor = HexColor('#be8a62');//Cafe clarito
  Color _accentColor = HexColor('#a47450');//Cafe oscuro


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Better Horse',
      theme: ThemeData(
        primaryColor: _primaryColor,
        accentColor: _accentColor,
        scaffoldBackgroundColor: Colors.grey.shade50,
        primarySwatch: Colors.grey,
      ),
      home: PantallaAnimacion(title: 'Inicio de sesión Better Horse'),
    );
  }
}