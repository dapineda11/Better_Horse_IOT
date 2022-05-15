class Ubicacion {
  // Propiedades
  String Id = "";
  String Direccion = "";
  String Ciudad = "";

  // Constructores

  Ubicacion(String Id, String Direccion, String Ciudad) {
    this.Id = Id;
    this.Direccion = Direccion;
    this.Ciudad = Ciudad;
  }

  Ubicacion.fromJson(Map<String, dynamic> mapa) {
    this.Id = mapa['Id'];
    this.Direccion = mapa['Direccion'];
    this.Ciudad = mapa['Ciudad'];
  }

  // Get y sets
  // metodos
}
