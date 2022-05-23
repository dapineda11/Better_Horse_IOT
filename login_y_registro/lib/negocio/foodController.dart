
import 'package:http/http.dart' as http;
import 'dart:convert';

class foodController{

double tasa=0;  

double getTasa(){

  return tasa;
} 

void descargar() async {
    String theUrl = 'https://api.thingspeak.com/channels/1744488/feeds.json?api_key=8CCAFPOL6K3CUILA&results=2';

    double res=0;

    Uri uri = Uri.parse(theUrl);
    var response = await http.get(uri);
    var responseBody = json.decode(response.body);

    if (responseBody.length != 0) {
      tasa =  await double.parse(responseBody["feeds"][0]["field1"]);
    }
  }

  
}