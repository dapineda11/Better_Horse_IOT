import 'dart:async';

import 'package:flutter/material.dart';

import 'pagina_inicio.dart';

class PantallaAnimacion extends StatefulWidget {
  PantallaAnimacion({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _PantallaAnimacionState createState() => _PantallaAnimacionState();
}

class _PantallaAnimacionState extends State<PantallaAnimacion> {
  bool _isVisible = false;

  _PantallaAnimacionState(){

    new Timer(const Duration(milliseconds: 3000), (){
      setState(() {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => PaginaInicio()), (route) => false);
      });
    });

    new Timer(
        Duration(milliseconds: 10),(){
      setState(() {
        _isVisible = true; // Now it is showing fade effect and navigating to Login page
      });
    }
    );

  }

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
          colors: [Theme.of(context).accentColor, Theme.of(context).primaryColor],
          begin: const FractionalOffset(0, 0),
          end: const FractionalOffset(1.0, 0.0),
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp,
        ),
      ),
      child: AnimatedOpacity(
        opacity: _isVisible ? 1.0 : 0,
        duration: Duration(milliseconds: 1500),
        child: Center(
          child: Container(
            height: 200.0,
            width: 200.0,
            child: Center(
              child: ClipOval(
                  child: Image.asset('assets/logo.PNG'),
                //child: Icon(Icons.android_outlined, size: 128,), //put your logo here
              ),
            ),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 2.0,
                    offset: Offset(5.0, 3.0),
                    spreadRadius: 2.0,
                  )
                ]
            ),
          ),
        ),
      ),
    );
  }
}