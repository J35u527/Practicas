<?php
	//incluir el archivo de conexion
	require_once("bd.inc");

	//hacer la conexion

	$conexion = new mysqli($host, $user, $pass,$bd) or die('Hubo un error en la conexion: ' . mysql_error());  //detectar si hubo errores durante la conexion
	
	//asignamos/limpiamos las variables
	$usuario = $conexion -> real_escape_string($_GET['nombre']);
	$encriptada = $_GET['password_md5'];
	$correo = $_GET['mail'];
	
	
	$nombre = $conexion -> real_escape_string($_REQUEST['nombre_con']);
	$hastag = $conexion -> real_escape_string($_REQUEST['hashTwitter']);
	$dificutad = $_REQUEST['dificultad'];
	$categoria = $_REQUEST['categoria'];
	$fechaIni = $_REQUEST['fechaInicio'];
	$fechaFin = $_REQUEST['fechaFin'];
	$fechaAlta = new Date();
	$organizador = $conexion -> real_escape_string($_REQUEST['aroba']);
	$pathImagen = $conexion -> real_escape_string($_REQUEST['cargarImagen']);
	$descripcion = $conexion -> real_escape_string($_REQUEST['RteDemo']);

	
	//realizamos la consulta/insert
	$consulta = "insert into concurso(nombre_con ,hashtag, dificultad, categoria,fechaInicio, fechaFin, fechaAlta , organizador , pathImagen , descripcion ) 
	values ('$nombre','$hashtag','$dificultad', '$categoria', '$fechaIni', '$fechaFin', '$fechaAlta', '$organizador', '$pathImagen', '$descripcion')";
	
	//ejecutamos la consulta
	$conexion -> query($consulta) or die('hubo un error la ejecucion de la query');
		
	$conexion -> close();
	echo 'Se realizo la insercion a la bd';

?>
