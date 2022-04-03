

<?php 

require('connection.php');

$correo=$_POST["Nombre"];
$contrasena=$_POST["Contraseña"];
$id= $_POST["Id"];


$query="INSERT INTO Usuario (Nombre, Contraseña, Id) VALUES ('$correo', '$contrasena', '$id')";
$consulta =$Connection -> prepare($query);
$consulta->execute();

?>