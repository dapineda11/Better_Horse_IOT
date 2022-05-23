 import 'package:flutter/material.dart';
import 'lista_caballos.dart';
import '../DTO/Caballo.dart';
import 'package:login_y_registro/negocio/foodController.dart';

class CaballoPagina extends StatefulWidget{
  final Caballo caballitoxd;

  CaballoPagina({required this.caballitoxd});

  @override
  _CaballoPaginaState createState() => _CaballoPaginaState();
}



class _CaballoPaginaState extends State<CaballoPagina> {

   
    final ctrFood = foodController();
    
    double tasa=0;
    double base=0;
    double comida=0;
    var mensaje = null;

 initState()  {
     
    ctrFood.descargar();
    double base=0.025*double.parse(widget.caballitoxd.Peso);
    double comida=base*(1+tasa);

    Future.delayed(const Duration(milliseconds: 700), () {
      setState(()  {
        tasa=ctrFood.getTasa();
        comida=base*(1+tasa);
        print(tasa);
        print(base);
        print(comida);
        mensaje=" Tu caballo debe comer "+ comida.toString()+" Kg al dia";
      });
    });
  }

  
   
   @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
    title: Text(widget.caballitoxd.Nombre,
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
          (widget.caballitoxd.Image == null
                        ? Icon(
              Icons.bedroom_baby_outlined,
              size: 80,
            )
                        : CircleAvatar(
                            backgroundImage: NetworkImage(
                                "https://talleriot.000webhostapp.com/uploads/" +
                                    widget.caballitoxd.Image),
                            radius: 80,
                          ) ),
          const SizedBox(height: 16),
          Text(
            widget.caballitoxd.Nombre,
            style: const TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            widget.caballitoxd.Fecha,
            style: const TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),

          Text(
            widget.caballitoxd.Peso+" Kg",
            style: const TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),

          Text(
            widget.caballitoxd.Actividad,
            style: const TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            child: (mensaje == null
                      ? Text(
                          'Tu caballo debe comer 0 Kg al dia',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        )
                      : Text(
                          mensaje,
                          style: TextStyle(
                              fontSize: 30 , fontWeight: FontWeight.bold),
                        ))
            
             
            ,
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