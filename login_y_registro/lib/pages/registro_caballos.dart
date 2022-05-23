import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_y_registro/common/tema_principal.dart';
import 'package:login_y_registro/pages/widgets/header_widget.dart';
import 'package:login_y_registro/negocio/horseListController.dart';
import 'package:image_picker/image_picker.dart';
import 'menu_y_usuario.dart';

class RegistroCaballos extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RegistroCaballos();
  }
}

class _RegistroCaballos extends State<RegistroCaballos> {
  var _fechaSeleccionadaCaballo;
  final _formKey = GlobalKey<FormState>();
  List<String> _EstadoFisico = ['Liviano',
                'Moderado',
                'Pesado',
                'Muy pesado'];
  String? _textico = 'Liviano';

  void callSelectorCab() async {
    var fechaSeleccionadaCab = await getFechaCabWidget();
    setState(() {
      _fechaSeleccionadaCaballo = fechaSeleccionadaCab;
    });
  }


  Future<DateTime?> getFechaCabWidget() {
    return showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1990),
      lastDate: DateTime(2040),
      //builder: (context) => MenuYUsuario()),
      //(Route<dynamic> route) => false);
    );
  }

  TextEditingController nombrectrl = new TextEditingController();
  TextEditingController emailctrl = new TextEditingController();
  TextEditingController direccionctrl = new TextEditingController();
  TextEditingController contrasenactrl = new TextEditingController();
  TextEditingController apellidoctrl = new TextEditingController();
  TextEditingController ciudadctrl = new TextEditingController();
  TextEditingController celularctrl = new TextEditingController();

  bool checkedValue = false;
  bool checkboxValue = false;
  bool NexistImage = true;

  final cblReg = horseListController();

  final ImagePicker _picker = ImagePicker();
  File? image;
  late Uint8List webImage;

  @override
  Widget build(BuildContext context) {
    final Widget? trailing;
    //boton selector
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text ('Registrar nuevo caballo' ,
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
      body: SingleChildScrollView(
        child: Stack(
          children: [

            Container(
              height: 150,
              child: HeaderWidget(150, false, Icons.person_add_alt_1_rounded),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(25, 50, 25, 10),
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        GestureDetector(
                          child: NexistImage
                              ? Stack(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        border: Border.all(
                                            width: 5, color: Colors.white),
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black12,
                                            blurRadius: 20,
                                            offset: const Offset(5, 5),
                                          ),
                                        ],
                                      ),
                                      child: Icon(
                                        Icons.bedroom_baby_outlined,
                                        color: Colors.grey.shade300,
                                        size: 80.0,
                                      ),
                                    ),
                                    Container(
                                      padding:
                                          EdgeInsets.fromLTRB(80, 80, 0, 0),
                                      child: Icon(
                                        Icons.add_circle,
                                        color: Colors.grey.shade700,
                                        size: 25.0,
                                      ),
                                    ),
                                  ],
                                )
                               :Container(
                                  padding: EdgeInsets.all(10),
                                  child: CircleAvatar(
                                    backgroundImage: MemoryImage(webImage),
                                    radius: 80,
                                  ),
                                ),
                          onTap: () async {
                            XFile? temp = await _picker.pickImage(
                                source: ImageSource.gallery);
                            if (temp != null) {
                              var f = await temp.readAsBytes();
                              setState(() {
                                webImage = f;
                                if (NexistImage) {
                                  NexistImage = !NexistImage;
                                }
                              });
                            }
                          },
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          child: TextFormField(
                            controller: nombrectrl,
                            decoration: TemaPrincipal().textInputDecoration(
                                'Nombre del equino',
                                'Ingrese el nombre del caballo'),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Ingrese los datos solicitados";
                              }
                              return null;
                            },
                          ),
                          decoration:
                              TemaPrincipal().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(
                          height: 30,
                        ),

                        Container(
                          child: TextFormField(
                            controller: direccionctrl,
                            decoration: TemaPrincipal().textInputDecoration(
                                'Peso del caballo (kg)',
                                'Ingrese el peso del caballo en kilogramos'),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Ingrese los datos solicitados";
                              }
                              return null;
                            },
                          ),
                          decoration:
                              TemaPrincipal().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 20.0),


                        Container(
                          decoration:
                              TemaPrincipal().buttonBoxDecoration(context),
                          child: ElevatedButton(
                            style: TemaPrincipal().buttonStyle(),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                              child: Text(
                                "Fecha de nacimiento",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            onPressed: callSelectorCab,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),


                              Container(
                              padding:
                              const EdgeInsets.only(left: 8.0, bottom: 4.0),
                              alignment: Alignment.topLeft,
                                child: Text(
                                "Seleccione el estado físico del caballo: ",
                                style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                ),
                                textAlign: TextAlign.left,
                                ),
                                ),

                               Container(
                                width: 150,
                                padding: EdgeInsets.symmetric(horizontal: 14, vertical: 2),
                                decoration:
                                TemaPrincipal().buttonBoxDecoration(context),
                                  child: DropdownButton<String>(
                                  value: _textico,
                                  items: _EstadoFisico
                                .map((item) =>DropdownMenuItem<String>(
                                value: item,
                                child: Text(item),
                            ))
                            .toList(),
                            onChanged: (item) => setState(() => _textico = item),
                            ),
                            ),
                        SizedBox(
                          height: 30,
                        ),

                        Container(
                          decoration:
                              TemaPrincipal().buttonBoxDecoration(context),
                          child: ElevatedButton(
                              style: TemaPrincipal().buttonStyle(),
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(40, 10, 40, 10),
                                child: Text(
                                  "Registrar caballo".toUpperCase(),
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              onPressed: () async {

                                cblReg.getCaballos("0");
                                if (_formKey.currentState!.validate()) {
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                          builder: (context) => MenuYUsuario(
                                                id: '0',
                                              )),
                                      (Route<dynamic> route) => false);
                                }
                              }),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

    );

}
  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
      value: item,
      child: Text(
        item,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
         );
}
