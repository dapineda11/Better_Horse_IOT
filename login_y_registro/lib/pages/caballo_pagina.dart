 import 'package:flutter/material.dart';
import 'lista_caballos.dart';
import '../DTO/Caballo.dart';

class CaballoPagina extends StatelessWidget{
  final Caballo caballitoxd;

  const CaballoPagina({
    Key? key,
    required this.caballitoxd,
}): super (key: key);
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
    title: Text(caballitoxd.Nombre,
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
          (caballitoxd.Image == null
                        ? Icon(
              Icons.bedroom_baby_outlined,
              size: 80,
            )
                        : CircleAvatar(
                            backgroundImage: NetworkImage(
                                "https://talleriot.000webhostapp.com/uploads/" +
                                    caballitoxd.Image),
                            radius: 80,
                          ) ),
          const SizedBox(height: 16),
          Text(
            caballitoxd.Nombre,
            style: const TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            caballitoxd.Fecha,
            style: const TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),

          Text(
            caballitoxd.Peso,
            style: const TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),

          Text(
            caballitoxd.Actividad,
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