<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
function confirmation() {
	var respuesta = confirm("Desea borrar el concurso # <? echo $_REQUEST["id"]; ?> ?")
	if (respuesta){
		<? 
			require_once("funciones.php");	
 		    eliminarConcurso($_REQUEST["id"]);
 		 		
		?>
		alert("Concurso borrado exitosamente");

		<? 
			 header('refresh: 2; url=javascript: history.go(-1)');			   
		?> 	
	}
	else{
		alert("El concurso no fue borrado")
		<?
			header('refresh: 2; url=javascript: history.go(-1)');
		?>
	}

}

</script>
</head>
<body onload=confirmation()>

</body>

</html>
