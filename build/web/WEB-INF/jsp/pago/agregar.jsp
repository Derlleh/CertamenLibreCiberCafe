<%-- 
    Document   : agregar
    Created on : 15-11-2018, 15:58:22
    Author     : Pablo Saez
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="/js/scr.js"></script>

 <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!DOCTYPE html>
<html>
    <head>
        
        <style>
 
     body {
    background-color: gray;
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

        </style>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    
    <body style="text-align: center">
        
            <ul>
            <li><a href="<c:url value="/cliente/agregar"/>" class="active">Agregar Cliente</a></li>
            <li><a href="<c:url value="/cliente/listar"/>" class="active">Listar Clientes Actuales</a></li>
            <li><a href="<c:url value="/pago/listar"/>" class="active">Mostrar Deudores</a></li>
            </ul>
             <form class="" method="POST" action="<c:url value="/pago/agregar"/>"
                       
                     <h1 style="color: green"> Agregar Cliente con Deuda </h1>
                    <p></p>
                 
                     
                      
                     <label>Nombre Del Cliente</label>
                     <select name="cliente" >
                         <option selected> --Seleccionar-- </option>
                         <c:forEach items="${clientes}" var="cli">
                             <option value="${cli.id}">${cli.nombre}</option>
                         </c:forEach>
                         
                     </select>
                     <br></br>
                 
                 
                     <div class ="contact">
                     <label> Monto$: </label>
                     <input type="number" name="nuevoPago" required="" min="1" pattern="^[0-9]+" placeholder="Dinero Que Debe" >
                     
                  
                
            <button type="submit" class="btn btn-success"> Agregar a lista negra </button>
        </div>
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
