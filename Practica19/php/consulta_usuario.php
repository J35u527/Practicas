<?php

	//Porque la maestra dijo
	session_start();
	
//incluir el archivo de conexion
	require_once("bd.inc");
 
 	$con = new mysqli($host, $user, $pass,$bd) or die('Hubo un error en la conexion: ' . mysql_error());  //detectar si hubo errores durante la conexion
 	
 	//Obtengo mis variables a utilizar
 	$id_usr = $_REQUEST["id_usuario"];
	
	//limpiar mis variables
	$id_usr = $con -> real_escape_string($id_usr);
	
	//creo la consulta
	$mi_query = "select * from usuario where idusuario= $id_usr";
	
	//ejecuto la consulta
	
	$result = $con -> query($mi_query);
	
	//cierro la conexion
	$con -> close();
	
	//convierto el resultado de mi consulta a un arreglo
	
	if($result -> num_rows == 1)
		$datos = $result -> fetch_array(MYSQLI_ASSOC);
		var_dump($datos);
	
	$_SESSION["datos"] = $datos;
	header("Location: ../usuario_completa.php");

?>
