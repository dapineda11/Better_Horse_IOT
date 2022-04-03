
<?php 

require('connection.php');

//$user=$_POST["Nombre"];
//$query="SELECT * FROM Usuario WHERE Nombre LIKE '$user'";

$user="image.jpg";
$query="SELECT * FROM users WHERE image LIKE '$user'";

$consulta =$Connection -> prepare($query);
$consulta->execute();
$resultado=array();

while($res =$consulta -> fetch()){

    array_push(
        $resultado, array(
            "Id"=>$res['id'],
            "Image"=>$res['image']
        )
    );

}

echo json_encode($resultado);

?>