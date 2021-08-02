<%-- 
    Document   : login
    Created on : 14-11-2018, 22:55:02
    Author     : Pablo Saez
--%>



<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="/js/scr.js"></script>

 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <style>
        body, html {
    height: 75%;
    margin: 0;
}

.bg {
    /* The image used */
    background-image: url("vapologin.jpg");

    /* Full height */
    height: 80%; 

    /* Center and scale the image nicely */
    background-position: center;
    background-size: cover;
}

/* Add styles to the form container */
.container {
    position: relative;
    right: 40px;
    left: 300px;
    margin: 200px;
    max-width: 400px;
    padding: 30px;
    background-color: rgba(255, 255, 255, 0);
}

/* Full-width input fields */
input[type=email], input[type=password] {
    width: 100%;
    padding: 30px;
    margin: 5px 0 22px 0;
    border: greenyellow;
    background: purple;
    cursor: initial;
}

input[type=email]:focus, input[type=password]:focus {
    background-color: #ddd;
    outline: none;
}

/* Set a style for the submit button */
.btn {
    
    color: purple;
    padding: 16px 20px;
    border: darkorange;
    cursor: cell;
    width: 100%;
    opacity: 0.9;
}

.btn:hover {
    opacity: 4;
}
placeholder { /* Chrome, Firefox, Opera, Safari 10.1+ */
    color: red;
   
}
h1 { 
    display: block;
    font-size: 2em;
    margin-top: 0.67em;
    margin-bottom: 0.67em;
    margin-left: 0;
    margin-right: 0;
    font-weight: bold;
}
.contac div{
     float:left;
}
footer { 
    display: block;
}
        </style>
    </head>
    <body background="vapologin.jpg" style="text-align: center">
        <h1 style = "color: greenyellow"> Inicio de Sesion - CyberZzz</h1>
          <form class="" method="POST" action="<c:url value="/"/>">   
       <div class="contac"> 
            <div class="container">
               <label for="uname"><b style = "color: greenyellow"> Correo de Usuario</b></label>
               <input type="email" id="" name="user" class="" placeholder="Ingresar Correo..." >

              <label for="psw"><b style="color: greenyellow"> Contraseña de Usuario </b></label>
              <input type="password" id="" name="pass" class="" placeholder="Ingresar Contraseña..." >
              
              <button type="submit" class="btn btn-success"> Iniciar Sesion </button>
                
                   
            </div>
        </form>
        <h3>${mensajes}</h3>
    
        <div class ="container">
        <audio controls>
            <source src="blue.ogg" type="audio/ogg">
            <source src="blue.mp3" type="audio/mpeg">
             <source src="blue.wav" type="audio/wav">
        <object type="application/x-shockwave-flash" data="player.swf?miArchivo=blue.mp3">
            <param name="movie" value="player.swf?miArchivo=blue.mp3">
        </object>
</audio>
<div>
    <button onclick="document.getElementById('player').play()">Play</button>
    <button onclick="document.getElementById('player').pause()">Pausa</button>
    <button onclick="document.getElementById('player').load()">Stop</button>
    <button onclick="document.getElementById('player').volume += .1">Subir volumen</button>
    <button onclick="document.getElementById('player').volume -= .1">Bajar volumen</button>
</div> 
                      
        </div>   
</div>
     
        <html>
<head>
<script type="text/javascript">
function startTime()
{
var today=new Date();
var h=today.getHours();
var m=today.getMinutes();
var s=today.getSeconds();
// add a zero in front of numbers<10
m=checkTime(m);
s=checkTime(s);
document.getElementById('txt').innerHTML=h+":"+m+":"+s;
t=setTimeout('startTime()',500);
}
function checkTime(i)
{
if (i<10)
{
i="0" + i;
}
return i;
}
</script>
</head>
<body onload="startTime()">
<div id="txt"></div>
</body>
</html>

<html> 
<head> 
<title> </title> 
</head> 

<body> 

<script> 

var mydate=new Date(); 
var year=mydate.getYear(); 
if (year < 1000) 
year+=1900; 
var day=mydate.getDay(); 
var month=mydate.getMonth()+1; 
if (month<10) 
month="0"+month; 
var daym=mydate.getDate(); 
if (daym<10) 
daym="0"+daym; 
document.write("<small><font color='000000' face='Arial'><b>"+daym+"/"+month+"/"+year+"</b></font></small>") 

</script> 

</body> 
</html>
        
    </body>
    
 
</html>
