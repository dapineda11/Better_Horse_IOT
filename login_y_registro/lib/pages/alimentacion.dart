import 'package:flutter_html/flutter_html.dart';
import 'package:flutter/material.dart';


class Alimentacion extends StatefulWidget {

  const Alimentacion({Key? key}) : super(key: key);

  @override
  _AlimentacionState createState() => _AlimentacionState();
}


class _AlimentacionState extends State<Alimentacion> {

  @override
  Widget build(BuildContext context) {
    double _headerHeight = 130;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text ('Cantidad de alimento en tiempo real' ,
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
