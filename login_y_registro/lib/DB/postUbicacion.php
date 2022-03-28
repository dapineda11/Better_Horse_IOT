

<?php 

require('connection.php');

$ciudad=$_POST["Ciudad"];
$direccion=$_POST["Direccion"];
$id= $_POST["Id"];


$query="INSERT INTO Ubicacion (Ciudad, Direccion, Id) VALUES ('$ciudad', '$direccion', '$id')";
$consulta =$Connection -> prepare($query);
$consulta->execute();

?>