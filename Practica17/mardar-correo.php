<?php
//receiver
$to = $_REQUEST["mail"];
// subject
$subject = 'Mensaje de confirmaci�n';

// message
$message = '
<!DOCTYPE html>
<html lang="es">
<head>
  <title>Recordatorio de cumplea�os para Agosto</title>
</head>
<body>
  <p>�Hola!</p>
  <pre>
  Agredemos tu inquitud por formar parte de este sitio web. 
  As� mismo te notificamos que ahora puedes acceder a nuestro sistema con los siguientes datos:
  Nick de usuario: '<?php $_REQUEST["nombre"]?>. "\r\n";
  'Si tienes alguna dificultad, dirigete a la secci�n de preguntas frecuentes de nuestra p�gina o contacta ayuda en linea all� mismo.
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
$header .= 'Bcc: birthdaycheck@example.com' . "\r\n";

// Mail it
mail($to, $subject, $message, $header);
?>
