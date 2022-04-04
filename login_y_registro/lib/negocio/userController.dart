import 'dart:html';

import 'package:http/http.dart' as http;
import 'dart:convert';
import '../DTO/Persona.dart';

class userController {
  // Propiedades
  var per = null;

  // Get y sets
  // Constructores
  // metodos

  Future<int> descargar(String id) async {
    String theUrl = 'https://talleriot.000webhostapp.com/getPersona.php';
    var data = {"Id": id};

    Uri uri = Uri.parse(theUrl);
    var response = await http.post(uri, body: data);
    var responseBody = json.decode(response.body);

    if (responseBody.length != 0) {
      this.per = Persona.fromJson(responseBody[0]);
    }

    return 1;
  }
}
