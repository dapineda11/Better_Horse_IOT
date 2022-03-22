import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'pages/splash_screen.dart';

void main() {
  runApp(LoginUiApp());
}

class LoginUiApp extends StatelessWidget {

  Color _primaryColor = HexColor('#be8a62');//Cafe clarito
  Color _accentColor = HexColor('#a47450');//Cafe oscuro

  // Design color
  // Color _primaryColor= HexColor('#FFC867');
  // Color _accentColor= HexColor('#FF3CBD');

  // Our Logo Color
  // Color _primaryColor= HexColor('#D44CF6');
  // Color _accentColor= HexColor('#5E18C8');

  // Our Logo Blue Color
  //Color _primaryColor= HexColor('#651BD2');
  //Color _accentColor= HexColor('#320181');

  // This widget is the root of your application.
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
      home: SplashScreen(title: 'Inicio de sesión Better Horse'),
    );
  }
}