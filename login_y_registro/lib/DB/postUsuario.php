

<?php 

require('connection.php');

$correo=$_POST["Correo"];
$contrasena=$_POST["Contraseña"];
$id= $_POST["Id"];


$query="INSERT INTO Usuario (Correo, Contraseña, Id) VALUES ('$correo', '$contrasena', '$id')";
$consulta =$Connection -> prepare($query);
$consulta->execute();

?>