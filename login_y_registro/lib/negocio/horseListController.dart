import 'dart:html';

import 'package:http/http.dart' as http;
import 'dart:convert';
import '../DTO/Caballo.dart';
import '../DTO/Ubicacion.dart';

class horseListController {
  // Propiedades
  List<Caballo> cab=[];


  // Get y sets
  String getNombre(pos) {
    String res = "invalido";
    if (cab != null) {
      res = cab[pos].Nombre;
    }
    return res;
  }

  String getPeso(pos) {
    String res = "invalido";
    if (cab != null) {
      res = cab[pos].Peso;
    }
    return res;
  }

  String getImagen(pos) {
    String res = "invalido";
    if (cab!= null) {
      if (cab[pos].Image != null) {
        res = cab[pos].Image;
      }
    }
    return res;
  }

  String getId(pos) {
    String res = "invalido";
    if (cab != null) {
      res = cab[pos].Id;
    }
    return res;
  }

  String getActividad(pos) {
    String res = "invalido";
    if (cab != null) {
      res = cab[pos].Actividad;
    }
    return res;
  }


  // Constructores
  horseListController() {}
  // metodos

  void getCaballos(String id) async {
    String theUrl = 'https://talleriot.000webhostapp.com/getCaballo.php';
    var data = {"Id": id};

    Uri uri = Uri.parse(theUrl);
    var response = await http.post(uri, body: data);
    var responseBody = json.decode(response.body);

    if (responseBody.length != 0) {

      for (var i in responseBody){
        cab.add( await Caballo.fromJson(i));

      }

    }
  }

  
}
