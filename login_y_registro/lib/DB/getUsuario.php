
<?php 

require('connection.php');

$user=$_POST["Nombre"];

$query="SELECT * FROM Usuario WHERE Nombre LIKE '$user'";
$consulta =$Connection -> prepare($query);
$consulta->execute();
$resultado=array();

while($res =$consulta -> fetch()){

    array_push(
        $resultado, array(
            "Id"=>$res['Id'],
            "Nombre"=>$res['Nombre'],
            "Contraseña"=>$res['Contraseña']
        )
    );

}

echo json_encode($resultado);

?>