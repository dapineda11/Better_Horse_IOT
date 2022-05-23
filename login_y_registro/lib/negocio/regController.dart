import 'package:http/http.dart' as http;
import 'dart:convert';
import '../DTO/Usuario.dart';

class regController {
  // Propiedades
  var user = null;  

  // Get y sets
  Usuario getUsuario(correo, contrasena, id) {
    return Usuario(correo, contrasena, id);
  }

  // Constructores
  // metodos

  Future<void> insertarUsuario(
      String correo, String contrasena, String id) async {
    String theUrl = 'https://talleriot.000webhostapp.com/postUsuario.php';
    var data = {"Correo": correo, "Contraseña": contrasena, "Id": id};

    Uri uri = Uri.parse(theUrl);
    var response = await http.post(uri, body: data);
  }

  Future<void> insertarPersona(
      String nombre,
      String apellido,
      String celular,
      String id,
      String imagen,
      String imagenName,
      String fecha,
      String correo,
      String contrasena,
      String ciudad,
      String direccion) async {
    String theUrl = 'https://talleriot.000webhostapp.com/postPersona.php';

    var data = {
      "Nombre": nombre,
      "Apellido": apellido,
      "Id": id,
      "Celular": celular,
      "Image": imagen,
      "ImageName": imagenName,
      "Fecha": fecha,
      "Correo": correo,
      "Contraseña": contrasena,
      "Ciudad": ciudad,
      "Direccion": direccion
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

  Future<int> verificar(String correo) async {
    int res = 0;

    String theUrl = 'https://talleriot.000webhostapp.com/getUsuario.php';
    var data = {"Correo": correo};

    Uri uri = Uri.parse(theUrl);
    var response = await http.post(uri, body: data);
    var responseBody = json.decode(response.body);

    if (responseBody.length == 0) {
      res = 1;
    }
    return res;
  }
}
