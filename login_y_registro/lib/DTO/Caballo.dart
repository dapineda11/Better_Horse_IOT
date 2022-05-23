class Caballo {
  // Propiedades
  String Id = "";
  String Nombre = "";
  String Peso = "";
  String Actividad = "";
  var Image = null;
  var Fecha = null;

  // Constructores

  Caballo(String Id, String Nombre, String Peso, String Actividad, String Image,
      String Fecha) {
    this.Id = Id;
    this.Nombre = Nombre;
    this.Peso = Peso;
    this.Actividad = Actividad;
    this.Image = Image;
    this.Fecha = Fecha;
  }

  Caballo.fromJson(Map<String, dynamic> mapa) {
    this.Id = mapa['Id'];
    this.Nombre = mapa['Nombre'];
    this.Peso = mapa['Peso'];
    this.Actividad = mapa['Actividad'];
    if (mapa['Image'] != null)  {
      if (mapa['Image'] != "")  {
        this.Image = mapa['Image'];
      }
    }

    if (mapa['Fecha'] != null) {
      this.Fecha = mapa['Fecha'];
    }
  }

  // Get y sets
  // metodos
}
