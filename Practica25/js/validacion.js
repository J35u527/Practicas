window.onload = function(){
oculta('adv_nombre');
oculta('adv_email');
oculta('adv_password');
oculta('adv_repassword');
oculta('adv_noCoinciden');
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
//Nombre
if(document.addUser.nombre.value.length==0){
muestra('adv_nombre');
document.addUser.nombre.focus();
return 0;
}
else{
oculta('adv_nombre');
}
//Email

var valor= document.addUser.mail.value;
var filtro = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;	
if (!filtro.test(valor)) {
document.addUser.mail.focus();
   muestra('adv_email');
   return 0;
}
else{

oculta('adv_email');
}

 
//Passwords

var pass1 = document.getElementById("pass").value;
var pass2 = document.getElementById("confirm_password").value;

if(pass1.length == 0 ){
muestra('adv_password');
document.addUser.pass.focus();
return 0;
}

if(pass2.length == 0){
muestra('adv_repassword');
document.addUser.confirm_password.focus();
return 0;
}

if (pass1 != pass2) {

   muestra('adv_noCoinciden');
   document.addUser.pass.focus();
   return 0;
}

else if(pass1 == pass2 || /\w{6,8}/.test(document.addUser.pass.value)){

pass_md5 = md5(document.getElementById("pass").value);
document.getElementById("pass").value="";
document.getElementById("confirm_password").value ="";
document.getElementById("password_md5").value=pass_md5;

}


document.addUser.submit();

}
