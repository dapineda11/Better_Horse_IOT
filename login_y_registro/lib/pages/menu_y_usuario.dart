import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_y_registro/pages/pagina_inicio.dart';
import 'package:login_y_registro/pages/pantalla_animacion.dart';
import 'package:login_y_registro/pages/registro_caballos.dart';
import 'package:login_y_registro/pages/widgets/header_widget.dart';
import 'recuperar_contrasena.dart';
import 'quienes_somos.dart';
import 'pagina_registro.dart';
import 'package:login_y_registro/negocio/userController.dart';

class MenuYUsuario extends StatefulWidget {
  final String id;
  final user;
  MenuYUsuario({required this.id, this.user});

  @override
  State<StatefulWidget> createState() {
    return _MenuYUsuarioState();
  }
}

class _MenuYUsuarioState extends State<MenuYUsuario> {
  double _tamanoIconos = 24;
  double _tamanoLetra = 17;

  String ubicacionImagen = "invalido";
  var nombre = null;
  var apellido = null;
  var correo = null;
  var tel = null;
  var place = null;

  initState() {
    final ctrU = userController();
    ctrU.descargar(widget.id);
    ctrU.getUbicacion(widget.id);

    Future.delayed(const Duration(milliseconds: 700), () {
      setState(() {
        ubicacionImagen = ctrU.getImagen();
        nombre = ctrU.getNombre();
        apellido = ctrU.getApellido();
        correo = widget.user.Correo;
        tel = ctrU.getTelefono();
        place = (ctrU.getDireccion() + " : " + ctrU.getCiudad());
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Menu principal",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        elevation: 0.5,
        iconTheme: IconThemeData(color: Colors.white),
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
        actions: [
          Container(
            margin: EdgeInsets.only(
              top: 16,
              right: 16,
            ),
            child: Stack(
              children: <Widget>[
                Icon(Icons.notifications),
                Positioned(
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    constraints: BoxConstraints(
                      minWidth: 12,
                      minHeight: 12,
                    ),
                    child: Text(
                      '5',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 8,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
      drawer: Drawer(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [
                0.0,
                1.0
              ],
                  colors: [
                Theme.of(context).primaryColor.withOpacity(0.2),
                Theme.of(context).accentColor.withOpacity(0.5),
              ])),
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.0, 1.0],
                    colors: [
                      Theme.of(context).primaryColor,
                      Theme.of(context).accentColor,
                    ],
                  ),
                ),
                child: Container(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Better Horse",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.thermostat,
                  size: _tamanoIconos,
                  color: Theme.of(context).accentColor,
                ),
                title: Text(
                  'Temperatura',
                  style: TextStyle(
                      fontSize: 17, color: Theme.of(context).accentColor),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              PantallaAnimacion(title: "Temperatura")));
                },
              ),
              Divider(
                color: Theme.of(context).primaryColor,
                height: 1,
              ),
              ListTile(
                leading: Icon(Icons.air,
                    size: _tamanoIconos, color: Theme.of(context).accentColor),
                title: Text(
                  'Calidad del aire',
                  style: TextStyle(
                      fontSize: _tamanoLetra,
                      color: Theme.of(context).accentColor),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PaginaInicio()),
                  );
                },
              ),
              Divider(
                color: Theme.of(context).primaryColor,
                height: 1,
              ),
              ListTile(
                leading: Icon(Icons.water_drop_outlined,
                    size: _tamanoIconos, color: Theme.of(context).accentColor),
                title: Text(
                  'Humedad relativa',
                  style: TextStyle(
                      fontSize: _tamanoLetra,
                      color: Theme.of(context).accentColor),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PaginaRegistro()),
                  );
                },
              ),
              Divider(
                color: Theme.of(context).primaryColor,
                height: 1,
              ),
              ListTile(
                leading: Icon(
                  Icons.food_bank_outlined,
                  size: _tamanoIconos,
                  color: Theme.of(context).accentColor,
                ),
                title: Text(
                  'Alimentación',
                  style: TextStyle(
                      fontSize: _tamanoLetra,
                      color: Theme.of(context).accentColor),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RecuperarContrasena()),
                  );
                },
              ),
              Divider(
                color: Theme.of(context).primaryColor,
                height: 1,
              ),
              ListTile(
                leading: Icon(
                  Icons.engineering,
                  size: _tamanoIconos,
                  color: Theme.of(context).accentColor,
                ),
                title: Text(
                  '¿Quiénes somos?',
                  style: TextStyle(
                      fontSize: _tamanoLetra,
                      color: Theme.of(context).accentColor),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => QuienesSomos()),
                  );
                },
              ),

              //bedroom_baby_outlined
              Divider(
                color: Theme.of(context).primaryColor,
                height: 1,
              ),
              ListTile(
                leading: Icon(
                  Icons.add_box,
                  size: _tamanoIconos,
                  color: Theme.of(context).accentColor,
                ),
                title: Text(
                  'Agregar un caballo al registro',
                  style: TextStyle(
                      fontSize: _tamanoLetra,
                      color: Theme.of(context).accentColor),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegistroCaballos()),
                  );
                },
              ),
              Divider(
                color: Theme.of(context).primaryColor,
                height: 1,
              ),

              Divider(
                color: Theme.of(context).primaryColor,
                height: 1,
              ),

              ListTile(
                leading: Icon(
                  Icons.logout_rounded,
                  size: _tamanoIconos,
                  color: Theme.of(context).accentColor,
                ),
                title: Text(
                  'Salir',
                  style: TextStyle(
                      fontSize: _tamanoLetra,
                      color: Theme.of(context).accentColor),
                ),
                onTap: () {
                  SystemNavigator.pop();
                },
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 100,
              child: HeaderWidget(100, false, Icons.house_rounded),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.fromLTRB(25, 10, 25, 10),
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(width: 5, color: Colors.white),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 20,
                          offset: const Offset(5, 5),
                        ),
                      ],
                    ),
                    child: ubicacionImagen == "invalido"
                        ? Icon(
                            Icons.person,
                            size: 80,
                            color: Colors.grey.shade300,
                          )
                        : CircleAvatar(
                            backgroundImage: NetworkImage(
                                "https://talleriot.000webhostapp.com/uploads/" +
                                    ubicacionImagen),
                            radius: 80,
                          ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  (nombre == null
                      ? Text(
                          'Nombre_Usuario',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        )
                      : Text(
                          nombre,
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        )),
                  SizedBox(
                    height: 20,
                  ),
                  (apellido == null
                      ? Text(
                          //'Usuario premium - Better Horse',
                          widget.id,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        )
                      : Text(
                          apellido,
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        )),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding:
                              const EdgeInsets.only(left: 8.0, bottom: 4.0),
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Información de usuario",
                            style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Card(
                          child: Container(
                            alignment: Alignment.topLeft,
                            padding: EdgeInsets.all(15),
                            child: Column(
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    ...ListTile.divideTiles(
                                      color: Colors.grey,
                                      tiles: [
                                        ListTile(
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 12,
                                                    vertical: 4),
                                            leading: Icon(Icons.my_location),
                                            title: Text("Ubicación"),
                                            subtitle: (place == null
                                                ? Text(
                                                    'Colombia',
                                                  )
                                                : Text(
                                                    place,
                                                  ))),
                                        ListTile(
                                            leading: Icon(Icons.email),
                                            title: Text("Email"),
                                            subtitle: (correo == null
                                                ? Text(
                                                    'tucorreo_@gmail.com',
                                                  )
                                                : Text(
                                                    correo,
                                                  ))),
                                        ListTile(
                                            leading: Icon(Icons.phone),
                                            title: Text("Phone"),
                                            subtitle: (tel == null
                                                ? Text(
                                                    '321-480-3788',
                                                  )
                                                : Text(
                                                    tel,
                                                  ))),
                                        ListTile(
                                          leading: Icon(Icons.person),
                                          title: Text("Mi cuenta"),
                                          subtitle: Text(
                                              "Información acerca de mis caballos registrados"),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
