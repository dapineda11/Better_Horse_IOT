import 'package:http/http.dart' as http;
import 'dart:convert';
import '../DTO/Usuario.dart';

class regHorseController {
  // Propiedades
  // Get y sets
  // Constructores
  // metodos

  Future<void> insertarCaballo(
      String nombre,
      String peso,
      String actividad,
      String id,
      String imagen,
      String fecha,
  ) async {
    String theUrl = 'https://talleriot.000webhostapp.com/postPersona.php';

    var data = {
      "Nombre": nombre,
      "Id": id,
      "Peso": peso,
      "Image": imagen,
      "Actividad": actividad,
      "Fecha": fecha
    };

    Uri uri = Uri.parse(theUrl);
    var response = await http.post(uri, body: data);
  }
}
