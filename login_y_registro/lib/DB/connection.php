
<?php 

try{

    $Connection= new PDO('mysql:host=localhost;dbname=id18625907_betterhorsedb','id18625907_gomezan', '/{p0^K$HL-qOZsJ(');
    $Connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    echo "Conexión exitosa";

} catch(PDOException $exc){

    echo $exc->getMessage();
    die("Error");
}


?>