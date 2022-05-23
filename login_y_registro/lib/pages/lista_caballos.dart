import 'package:flutter/material.dart';
import 'caballo_pagina.dart';
import 'package:login_y_registro/negocio/horseListController.dart';
import '../DTO/Caballo.dart';

class Lista_Caballos extends StatefulWidget {

  final String id;
  Lista_Caballos({required this.id});

  @override
  _Lista_CaballosState createState() => _Lista_CaballosState();
}


class _Lista_CaballosState extends State<Lista_Caballos> {

List<Caballo> cab=[];

 initState() {
    final ctrU = horseListController();
     ctrU.getCaballos(widget.id);
     
    Future.delayed(const Duration(milliseconds: 700), () {
      setState(() {
        cab=ctrU.obtenerCaballos(); 
        
      });
    });
  }


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
        itemCount: cab.length,
        itemBuilder: (context, index){
          final caballitoxd= cab[index];

          return Card(
          child: ListTile(
            leading: caballitoxd.Image == null
                        ? Icon(
              Icons.bedroom_baby_outlined,
              size: 30,
            )
                        : CircleAvatar(
                            backgroundImage: NetworkImage(
                                "https://talleriot.000webhostapp.com/uploads/" +
                                    caballitoxd.Image),
                            radius: 80,
                          ), 

            title: Text (caballitoxd.Nombre),
            subtitle: Text (caballitoxd.Fecha),
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
