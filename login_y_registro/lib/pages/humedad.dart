import 'package:flutter_html/flutter_html.dart';
import 'package:flutter/material.dart';


class Humedad extends StatefulWidget {

  const Humedad({Key? key}) : super(key: key);

  @override
  _HumedadState createState() => _HumedadState();
}


class _HumedadState extends State<Humedad> {

  @override
  Widget build(BuildContext context) {
    double _headerHeight = 130;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text ('Nivel de humedad relativa en tiempo real' ,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
        elevation: 0.5,
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                    Theme.of(context).primaryColor,
                    Theme.of(context).accentColor,
                  ])),
        ),
      ),

    );
  }
}
