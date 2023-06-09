import 'dart:io';
import 'dart:typed_data';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_y_registro/common/tema_principal.dart';
import 'package:login_y_registro/pages/widgets/header_widget.dart';
import 'package:login_y_registro/negocio/regController.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

import 'menu_y_usuario.dart';

class PaginaRegistro extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PaginaRegistroState();
  }
}

class _PaginaRegistroState extends State<PaginaRegistro> {
  var _fechaSeleccionadaPersona;
  final _formKey = GlobalKey<FormState>();
  void callSelectorPersona() async {
    var fechaSeleccionadaPersona = await getFechaPersonaWidget();
    setState(() {
      _fechaSeleccionadaPersona = fechaSeleccionadaPersona;
    });
  }

  //2. wigdet selector
  Future<DateTime?> getFechaPersonaWidget() {
    return showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1930),
      lastDate: DateTime(2040),
    );
  }

  TextEditingController nombrectrl = new TextEditingController();
  TextEditingController apellidoctrl = new TextEditingController();
  TextEditingController celularctrl = new TextEditingController();
  TextEditingController cedulactrl = new TextEditingController();
  TextEditingController emailctrl = new TextEditingController();
  TextEditingController contrasenactrl = new TextEditingController();
  TextEditingController direccionctrl = new TextEditingController();
  TextEditingController ciudadctrl = new TextEditingController();

  bool checkedValue = false;
  bool checkboxValue = false;
  bool NexistImage = true;

  final ctrReg = regController();

  final ImagePicker _picker = ImagePicker();
  late Uint8List webImage;
  String nombreImagen = "";
  String imagen = "";

  String fecha = "1967-06-15";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                                        Icons.person,
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
                              : Container(
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
                                this.webImage = f;
                                this.imagen = base64Encode(webImage);
                                this.nombreImagen = temp.name;
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
                                'Primer Nombre', 'Ingrese su primer nombre'),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Por favor ingrese los datos solicitados";
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
                            controller: apellidoctrl,
                            decoration: TemaPrincipal().textInputDecoration(
                                'Apellidos', 'Ingrese sus apellidos'),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Por favor ingrese los datos solicitados";
                              }
                              return null;
                            },
                          ),
                          decoration:
                              TemaPrincipal().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            controller: cedulactrl,
                            decoration: TemaPrincipal().textInputDecoration(
                                "Cédula",
                                "Ingrese su número de identificación"),
                            keyboardType: TextInputType.phone,
                            validator: (val) {
                              if (!(val!.isEmpty) &&
                                  !RegExp(r"^(\d+)*$").hasMatch(val)) {
                                return "Ingrese un número de identificación válido";
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
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            onPressed: callSelectorPersona,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          child: TextFormField(
                            controller: direccionctrl,
                            decoration: TemaPrincipal().textInputDecoration(
                                'Dirección',
                                'Ingrese la dirección de su finca/granja'),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Por favor ingrese su contraseña";
                              }
                              return null;
                            },
                          ),
                          decoration:
                              TemaPrincipal().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            controller: ciudadctrl,
                            decoration: TemaPrincipal().textInputDecoration(
                                'Ciudad',
                                'Ingrese su ciudad/municipio de ubicación'),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Por favor ingrese su ciudad de ubicación";
                              }
                              return null;
                            },
                          ),
                          decoration:
                              TemaPrincipal().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            controller: emailctrl,
                            decoration: TemaPrincipal().textInputDecoration(
                                "Correo electrónico", "Ingrese su email"),
                            keyboardType: TextInputType.emailAddress,
                            validator: (val) {
                              if (!(val!.isEmpty) &&
                                  !RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
                                      .hasMatch(val)) {
                                return "Ingrese una dirección válida de correo";
                              }
                              return null;
                            },
                          ),
                          decoration:
                              TemaPrincipal().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            controller: celularctrl,
                            decoration: TemaPrincipal().textInputDecoration(
                                "Celular", "Ingrese su número de teléfono"),
                            keyboardType: TextInputType.phone,
                            validator: (val) {
                              if (!(val!.isEmpty) &&
                                  !RegExp(r"^(\d+)*$").hasMatch(val)) {
                                return "Ingrese un número de teléfono válido";
                              }
                              return null;
                            },
                          ),
                          decoration:
                              TemaPrincipal().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            controller: contrasenactrl,
                            obscureText: true,
                            decoration: TemaPrincipal().textInputDecoration(
                                "Contraseña*", "Ingrese su contraseña"),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Por favor ingrese una contraseña";
                              }
                              return null;
                            },
                          ),
                          decoration:
                              TemaPrincipal().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 15.0),
                        FormField<bool>(
                          builder: (state) {
                            return Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Checkbox(
                                        value: checkboxValue,
                                        onChanged: (value) {
                                          setState(() {
                                            checkboxValue = value!;
                                            state.didChange(value);
                                          });
                                        }),
                                    Text(
                                      "Acepto los términos y condiciones",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    state.errorText ?? '',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: Theme.of(context).errorColor,
                                      fontSize: 12,
                                    ),
                                  ),
                                )
                              ],
                            );
                          },
                          validator: (value) {
                            if (!checkboxValue) {
                              return 'Debes aceptar los términos y condiciones de nuestra aplicación';
                            } else {
                              return null;
                            }
                          },
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          decoration:
                              TemaPrincipal().buttonBoxDecoration(context),
                          child: ElevatedButton(
                            style: TemaPrincipal().buttonStyle(),
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(40, 10, 40, 10),
                              child: Text(
                                "Registrarse".toUpperCase(),
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                var res =
                                    await ctrReg.verificar(emailctrl.text);

                                if (res == 1) {
                                  ctrReg.insertarPersona(
                                      nombrectrl.text,
                                      apellidoctrl.text,
                                      celularctrl.text,
                                      cedulactrl.text,
                                      imagen,
                                      nombreImagen,
                                      fecha,
                                      emailctrl.text,
                                      contrasenactrl.text,
                                      ciudadctrl.text,
                                      direccionctrl.text);

                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                          builder: (context) => MenuYUsuario(
                                              id: cedulactrl.text)),
                                      (Route<dynamic> route) => false);
                                } else {
                                  Fluttertoast.showToast(
                                      msg:
                                          "Los datos concuerdan con los de un usuario ya registrado",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      webPosition: "center",
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white,
                                      fontSize: 50,
                                      timeInSecForIosWeb: 2);
                                }
                              }
                            },
                          ),
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
}
