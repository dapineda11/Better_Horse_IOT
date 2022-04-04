class Persona {
  // Propiedades
  String Id = "";
  String Nombre = "";
  String Apellido = "";
  String Celular = "";
  String Image = "";
  String Fecha = "";

  // Constructores

  Persona(String Id, String Nombre, String Apellido, String Celular,
      String Image, String Fecha) {
    this.Id = Id;
    this.Nombre = Nombre;
    this.Apellido = Apellido;
    this.Celular = Celular;
    this.Image = Image;
    this.Fecha = Fecha;
  }

  Persona.fromJson(Map<String, dynamic> mapa) {
    this.Id = mapa['Id'];
    this.Nombre = mapa['Nombre'];
    this.Apellido = mapa['Apellido'];
    this.Celular = mapa['Celular'];
    this.Image = mapa['Image'];
    this.Fecha = mapa['Fecha'];
  }

  // Get y sets
  // metodos
}
