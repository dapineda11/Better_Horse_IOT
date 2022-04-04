import 'package:http/http.dart' as http;
import 'dart:convert';
import '../DTO/Usuario.dart';

class logController {
  // Propiedades
  // Get y sets
  // Constructores
  // metodos

  Future<int> verificar(String correo, String contrasena) async {
    int res = -1;

    String theUrl = 'https://talleriot.000webhostapp.com/getUsuario.php';
    var data = {"Correo": correo};

    Uri uri = Uri.parse(theUrl);
    var response = await http.post(uri, body: data);
    var responseBody = json.decode(response.body);

    if (responseBody.length != 0) {
      var user = Usuario.fromJson(responseBody[0]);
      res = user.validarIdentidad(contrasena);
    }
    return res;
  }
}
