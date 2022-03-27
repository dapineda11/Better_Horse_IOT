class Usuario {
  // Propiedades
  String Nombre = "";
  String Contrasena = "";
  int Id = 0;
  // Constructores

  Usuario(String Nombre, String Contrasena, int Id) {
    this.Nombre = Nombre;
    this.Contrasena = Contrasena;
    this.Id = Id;
  }

  Usuario.fromJson(Map<String, dynamic> mapa) {
    this.Nombre = mapa['Nombre'];
    this.Contrasena = mapa['Contraseña'];
    this.Id = int.parse(mapa['Id']);
  }

  // Get y sets
  // metodos

  int validarIdentidad(String contrasena) {
    int res = 0;
    if (identical(Contrasena, contrasena)) {
      res = 1;
    }
    return res;
  }
}
