
<?php 

require('connection.php');

$query="SELECT * FROM Usuario";
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