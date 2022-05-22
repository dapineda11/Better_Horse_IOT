 import 'package:flutter/material.dart';
import 'lista_caballos.dart';



class CaballoPagina extends StatelessWidget{
  final CaballoReg caballitoxd;

  const CaballoPagina({
    Key? key,
    required this.caballitoxd,
}): super (key: key);
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
    title: Text(caballitoxd.nombre,
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
    body: Center(
      child: Column(
        children: <Widget>[
          Icon (Icons.bedroom_baby_outlined,
          size: 200),
          const SizedBox(height: 16),
          Text(
            caballitoxd.nombre,
            style: const TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            caballitoxd.edad,
            style: const TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),

          Text(
            caballitoxd.peso,
            style: const TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),

          Text(
            caballitoxd.fecha,
            style: const TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            child: Text(
              'Tu caballo debe consumir 200g de concentrado',
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
              padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.deepPurple),
              borderRadius: const BorderRadius.all(const Radius.circular(8)
              )
            ),
          )
          
        ],
      )
    ),
  );
}