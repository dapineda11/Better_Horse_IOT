import 'package:http/http.dart' as http;
import 'dart:convert';
import '../DTO/Usuario.dart';

class regController {
  // Propiedades
  // Get y sets
  // Constructores
  // metodos

  Future<void> insertarUsuario(
      String nombre, String contrasena, String id) async {
    String theUrl = 'https://talleriot.000webhostapp.com/postUsuario.php';
    var data = {"Nombre": nombre, "Contraseña": contrasena, "Id": id};

    Uri uri = Uri.parse(theUrl);
    var response = await http.post(uri, body: data);
  }

  Future<void> insertarPersona(
      String nombre, String apellido, String celular, String id) async {
    String theUrl = 'https://talleriot.000webhostapp.com/postPersona.php';
    var data = {
      "Nombre": nombre,
      "Apellido": apellido,
      "Id": id,
      "Celular": celular
    };

    Uri uri = Uri.parse(theUrl);
    var response = await http.post(uri, body: data);
  }

  Future<void> insertarUbicacion(
      String ciudad, String direccion, String id) async {
    String theUrl = 'https://talleriot.000webhostapp.com/postUbicacion.php';
    var data = {"Ciudad": ciudad, "Direccion": direccion, "Id": id};

    Uri uri = Uri.parse(theUrl);
    var response = await http.post(uri, body: data);
  }

  Future<int> verificar(String nombre, String contrasena) async {
    int res = 0;

    String theUrl = 'https://talleriot.000webhostapp.com/getUsuario.php';
    var data = {"Nombre": nombre};

    Uri uri = Uri.parse(theUrl);
    var response = await http.post(uri, body: data);
    var responseBody = json.decode(response.body);

    if (responseBody.length == 0) {
      res = 1;
    }
    return res;
  }
}
