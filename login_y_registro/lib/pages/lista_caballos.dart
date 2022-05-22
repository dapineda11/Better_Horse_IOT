import 'package:flutter/material.dart';
import 'caballo_pagina.dart';
class Lista_Caballos extends StatefulWidget {

  const Lista_Caballos({Key? key}) : super(key: key);

  @override
  _Lista_CaballosState createState() => _Lista_CaballosState();
}

class CaballoReg{
  final String nombre;
  final String edad;
  final String peso;
  final String fecha;
  final String actividad;


  const CaballoReg({
   required this.nombre,
   required this. edad,
    required this.peso,
    required this.fecha,
    required this.actividad,


});
}
class _Lista_CaballosState extends State<Lista_Caballos> {
List<CaballoReg> caballos=[
  const CaballoReg(
      nombre: 'Bojack',
      edad: '22 años',
      peso: '650kg',
      fecha: '05/11/1999',
      actividad: 'Liviano',
      ),

  const CaballoReg(
      nombre: 'Secretariat',
      edad: '22 años',
      peso: '800kg',
      fecha: '10/11/1999',
      actividad: 'Moderado',
  ),

  const CaballoReg(
    nombre: 'Spirit',
    edad: '21',
    peso: '500kg',
    fecha: '06/01/2000',
    actividad: 'Pesado',
  ),

  const CaballoReg(
    nombre: 'Centella',
    edad: '24',
    peso: '720kg',
    fecha: '07/08/1997',
    actividad: 'Muy Pesado',
  ),

];

  @override
  Widget build(BuildContext context) {
    double _headerHeight = 130;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text ('Lista de caballos registrados de usuario' ,
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
      body: ListView.builder(
        itemCount: caballos.length,
        itemBuilder: (context, index){
          final caballitoxd= caballos[index];

          return Card(
          child: ListTile(
            leading: Icon(
              Icons.bedroom_baby_outlined,
              size: 30,
            ),

            title: Text (caballitoxd.nombre),
            subtitle: Text (caballitoxd.edad),
            trailing: const Icon(Icons.arrow_forward),
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context)=> CaballoPagina (caballitoxd:caballitoxd),
              ));
            },
          ),
        );
    },),
    );
  }
}
