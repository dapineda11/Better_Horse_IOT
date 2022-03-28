

<?php 

require('connection.php');

$nombre=$_POST["Nombre"];
$apellido=$_POST["Apellido"];
$id= $_POST["Id"];
$celular= $_POST["Celular"];


$query="INSERT INTO Persona (Nombre, Apellido, Celular,  Id) VALUES ('$nombre', '$apellido', '$celular' , '$id')";
$consulta =$Connection -> prepare($query);
$consulta->execute();

?>