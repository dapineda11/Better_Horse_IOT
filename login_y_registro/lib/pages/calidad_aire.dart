import 'package:flutter_html/flutter_html.dart';
import 'package:flutter/material.dart';


class Calidad_Aire extends StatefulWidget {

  const Calidad_Aire({Key? key}) : super(key: key);

  @override
  _Calidad_AireState createState() => _Calidad_AireState();
}


class _Calidad_AireState extends State<Calidad_Aire> {

  @override
  Widget build(BuildContext context) {
    double _headerHeight = 130;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text ('Calidad de aire en tiempo real (Metano)' ,
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
