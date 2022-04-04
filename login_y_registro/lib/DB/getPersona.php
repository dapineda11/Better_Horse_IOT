
<?php 

require('connection.php');

$id=$_POST["Id"];
$query="SELECT * FROM Persona WHERE Id LIKE '$id'";

$consulta =$Connection -> prepare($query);
$consulta->execute();
$resultado=array();

while($res =$consulta -> fetch()){

    array_push(
        $resultado, array(
            "Id"=>$res['id'],
            "Nombre"=>$res['Nombre'],
            "Apelido"=>$res['Apellido'],
            "Celular"=>$res['Celular'],
            "Image"=>$res['Image'],
            "Fecha"=>$res['fechaNacimiento']
        )
    );

}


echo json_encode($resultado);

?>