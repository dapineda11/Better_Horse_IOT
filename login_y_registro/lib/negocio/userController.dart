import 'dart:html';

import 'package:http/http.dart' as http;
import 'dart:convert';
import '../DTO/Persona.dart';

class userController {
  // Propiedades
  var per = null;

  // Get y sets
  String getNombre() {
    String res = "invalido";

    if (per != null) {
      res = per.Nombre;
    }

    return res;
  }

  String getApellido() {
    String res = "invalido";

    if (per != null) {
      res = per.Apellido;
    }

    return res;
  }

  String getImagen() {
    String res = "invalido";

    if (per != null) {
      res = per.Image;
    }
    return res;
  }

  String getId() {
    String res = "invalido";

    if (per != null) {
      res = per.Id;
    }

    return res;
  }

  // Constructores
  userController() {}
  // metodos

  void descargar(String id) async {
    String theUrl = 'https://talleriot.000webhostapp.com/getPersona.php';
    var data = {"Id": id};

    Uri uri = Uri.parse(theUrl);
    var response = await http.post(uri, body: data);
    var responseBody = json.decode(response.body);

    print(responseBody);

    if (responseBody.length != 0) {
      per = await Persona.fromJson(responseBody[0]);
    }
  }
}
