

<?php 

require('connection.php');

$user=$_POST["Correo"];

$query="SELECT * FROM Usuario WHERE Correo LIKE '$user'";
$consulta =$Connection -> prepare($query);
$consulta->execute();
$resultado=array();

while($res =$consulta -> fetch()){

    array_push(
        $resultado, array(
            "Id"=>$res['Id'],
            "Correo"=>$res['Correo'],
            "Contraseña"=>$res['Contraseña']
        )
    );

}

echo json_encode($resultado);

?>