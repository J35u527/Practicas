<?php

	//incluir el archivo de conexion
	require_once("bd.inc");

	//hacer la conexion

	$conexion = new mysqli($host, $user, $pass,$bd) or die('Hubo un error en la conexion: ' . mysql_error());  //detectar si hubo errores durante la conexion
	
	//asignamos variables
	$nick = $conexion -> real_escape_string($_REQUEST['nombre_Us']);
	$razon = $_REQUEST['razones'];
	$avatar = $_REQUEST['cargarImagen'];
	$nombre = $conexion -> real_escape_string($_REQUEST['nombre']);
	$direccion = $conexion -> real_escape_string($_REQUEST['dir']);
	$telefono = $_REQUEST['tel'];
	$fecha = $_REQUEST['fecha_nac'];
	$sexo = $_REQUEST['sexo'];
	
	
	$updateTabla = "update usuario set nombre = '$nombre' set razon_registro = '1' path_image='$avatar', nombre='$nombre', direccion='$direccion', telefono='$telefono', 
			fecha_nac='$fecha', sexo='$sexo' where binary nick = '$nick' ";
	
	//ejecuto la consulta
	 
	$result = $conexion -> query($updateTabla);
	
	//enviar el correo
	
	//receiver
		$to = $_REQUEST["mail"];
		// subject
		$subject = 'Mensaje de confirmación';

		// message
		$message = '
		<!DOCTYPE html>
		<html lang="es">
		<head>
		  <title>Recordatorio de cumpleaños para Agosto</title>
		</head>
		<body>
		  <p>¡Hola!</p>
		  <pre>
		  Agredemos tu inquitud por formar parte de este sitio web. 
		  Así mismo te notificamos que ahora puedes acceder a nuestro sistema con los siguientes datos:
		  Nombre:'<?php $_REQUEST["nombre"]?>."\r\n"
		  'Si tienes alguna dificultad, dirigete a la sección de preguntas frecuentes de nuestra página o contacta ayuda en linea allí mismo.
		  Saludos.
		  </pre>
		</body>
		</html>
		';

		// Para enviar un correo HTML mail, la cabecera Content-type debe fijarse
		$header  = 'MIME-Version: 1.0' . "\r\n";
		$header .= 'Content-type: text/html; charset=iso-8859-1' . "\r\n";

		// headers adicionales

		$header .= 'From: Recordatorio <porteriux.h@gmail.com>' . "\r\n";
		$header .= 'Cc: jesus.covarrubias@alumno.udg.mx' . "\r\n";
		// Mail it
		mail($to, $subject, $message, $header);
	
		
	$conexion -> close();
	echo 'Se ha enviado un correo a su cuenta de correo electronico';

?>
