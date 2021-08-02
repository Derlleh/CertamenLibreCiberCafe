<%-- 
    Document   : modificar
    Created on : 15-11-2018, 0:32:34
    Author     : Pablo Saez
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


     <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    
    
 <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <!DOCTYPE html>
    <html> 
         <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
    <style>
       
        

     body {
    background-color: grey;
}

table, th, td {
    border: 1px solid black;
    
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
h1 {
    background-color: green;
}

div {
    background-color: greenyellow;
}

p {
    background-color: yellow;
}
.button {
    background-color: green;
    border: none;
    color: white;
    padding: 15px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;
}


ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    width: 25%;
    background-color: #f1f1f1;
    position: fixed;
    height: 100%;
    overflow: auto;
}

li a {
    display: block;
    color: #000;
    padding: 8px 16px;
    text-decoration: none;
}

li a.active {
    background-color: #4CAF50;
    color: black;
}

li a:hover:not(.active) {
    background-color: #555;
    color: black;
}

    </style>
    
        <title>Modificar Cliente</title>
    </head>
   <body style="text-align: center">
         <ul>
     
            <li><a href="<c:url value="/cliente/agregar"/>" class="active">Agregar Cliente</a></li>
            <li><a href="<c:url value="/cliente/listar"/>" class="active">Listar Clientes Actuales</a></li>
            <li><a href="<c:url value="/juego/agregar"/>" class="active" >Agregar Juego</a></li>
            <li><a href="<c:url value="/juego/listar"/>" class="active" > Listas Juegos</a></li>
            <li><a href="<c:url value="/pago/agregar"/>" class="active" > Lista Negra </a></li>
              
              
            </ul>
       


        <h1>Modificar Cliente</h1>
      
            <form action="<c:url value="/cliente/${cliente.id}/editar" />" method="POST">
                
                <div class="contac">
                    <br>
                <label>Nombre</label>
                <input type="text" value="${cliente.nombre}" name="nombre">
                <br></br>
                
                <label>Valor Pagado</label>                
                <input type="number" value="${cliente.pago}" name="pago">
                <br></br>
                 
                 <label>Inicio</label>                
                <input type="number" value="${cliente.inicio}" name="inicio">
                <br></br>
                 
                 <label>Termino</label>                
                <input type="number" value="${cliente.termino}" name="termino">
                
                 <br></br>
                 <label>Consola</label>                
                <input type="text" value="${cliente.consola}" name="consola">
                
                 <br></br>
                 <label>Television </label>                
                <input type="number" value="${cliente.television}" name="television">
                <br></br>
                 
                 <label>Juego</label>                
                 <select name="juego">
                     <c:forEach items="${juegos}" var="jue">
                         <option value="${jue.id}" ${(cliente.juego.id eq jue.id)?'selected':''}>${jue.titulo}</option>
                     </c:forEach>
                 </select>
                 <br></br>
                <input type="submit" value="Modificar Cliente">
                <a href="/cliente/editar" class="btn btn-primary" style="width: 100%">No Editar </a>
                
                   </div>
            </form>
                
                
            <h3>${mensaje}</h3>
            <c:forEach items="${mensajes}" var="mensaje">
                <h3>${mensaje}</h3>
            </c:forEach>
                
    
    </body>
    
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
    
</html>
