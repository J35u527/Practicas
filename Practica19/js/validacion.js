window.onload = function(){
oculta('error-Id');

}

function muestra(id){
if (document.getElementById){
var elemento = document.getElementById(id);
elemento.style.display = 'block';
}
}

function oculta(id){
if (document.getElementById){
var elemento = document.getElementById(id);
elemento.style.display = 'none';
}
}



function validarForm(){


var valorId=document.buscarUsuario.id_usuario.value;

if(valorId.length==0 || isNaN(valorId)){
muestra('error-Id');
document.buscarUsuario.id_usuario.focus();
return 0;
}
else{
oculta('error-Id');
}


document.buscarUsuario.submit();

}
