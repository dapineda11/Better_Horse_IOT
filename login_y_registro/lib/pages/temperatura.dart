import 'package:flutter_html/flutter_html.dart';
import 'package:flutter/material.dart';


class Temperatura extends StatefulWidget {

  const Temperatura({Key? key}) : super(key: key);

  @override
  _TemperaturaState createState() => _TemperaturaState();
}


class _TemperaturaState extends State<Temperatura> {
  static const htmlData= """
  <iframe width="450" height="260" style="border: 8px solid #cccccc;" src="https://thingspeak.com/channels/1743612/charts/1?bgcolor=%23ffffff&color=%23d62020&dynamic=true&results=60&type=line&update=15"></iframe>
""";


  @override
  Widget build(BuildContext context) {
    double _headerHeight = 130;

    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        title: const Text ('Temperatura en tiempo real' ,
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

      body: Align(
        alignment: Alignment.topLeft,
         child: Column(

          children: <Widget>[
            Container(
              child:
              Html(
                data: htmlData,
              ),

        padding: EdgeInsets.fromLTRB(10, 20, 5, 20),
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border.all(width: 5, color: Colors.deepOrange),
                  //borderRadius: const BorderRadius.all(const Radius.circular(8)
               ),
               ),
             ],
        ),
      ),

    );
  }
}
