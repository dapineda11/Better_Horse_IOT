

<?php 

require('connection.php');

$folder ="uploads/"; 
$nombre=$_POST["Nombre"];
$apellido=$_POST["Apellido"];
$id= $_POST["Id"];
$celular= $_POST["Celular"];
$fecha= $_POST["Fecha"];

$image = $_POST["ImageName"];
$path = $folder . $image ;



$query="INSERT INTO Persona (`Id`, `Nombre`, `Apellido`, `Celular`, `Image`, `fechaNacimiento`) VALUES ('$id','$nombre', '$apellido', '$celular' , '$image' , '$fecha')";
$consulta =$Connection -> prepare($query);
$consulta->execute();

if(isset($_POST["Image"])){

$base64_string = $_POST["Image"];
$filehandler = fopen($path, 'wb' ); 
fwrite($filehandler, base64_decode($base64_string));
fclose($filehandler); 
}




?>