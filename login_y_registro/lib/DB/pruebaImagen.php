
<?php 

require('connection.php');

$folder ="uploads/"; 
$image = "image.jpg" ;
$path = $folder . $image ;
echo $path;

$base64_string = $_POST["image"];
$outputfile = "uploads/image.jpg" ;
$outputfile = $_POST["name"];
//save as image.jpg in uploads/ folder

$filehandler = fopen($outputfile, 'wb' ); 
//file open with "w" mode treat as text file
//file open with "wb" mode treat as binary file

fwrite($filehandler, base64_decode($base64_string));
// we could add validation here with ensuring count($data)>1

// clean up the file resource
fclose($filehandler); 


$query="INSERT INTO users (image) values('$image') ";
$consulta =$Connection -> prepare($query);
$consulta->execute();


?> 