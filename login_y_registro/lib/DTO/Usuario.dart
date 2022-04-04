class Usuario {
  // Propiedades
  String Correo = "";
  String Contrasena = "";
  int Id = 0;
  // Constructores

  Usuario(String Correo, String Contrasena, int Id) {
    this.Correo = Correo;
    this.Contrasena = Contrasena;
    this.Id = Id;
  }

  Usuario.fromJson(Map<String, dynamic> mapa) {
    this.Correo = mapa['Correo'];
    this.Contrasena = mapa['Contraseña'];
    this.Id = int.parse(mapa['Id']);
  }

  // Get y sets
  // metodos

  int validarIdentidad(String contrasena) {
    int res = -1;
    if (identical(Contrasena, contrasena)) {
      res = this.Id;
    }
    return res;
  }
}
