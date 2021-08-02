<%-- 
    Document   : listar
    Created on : 15-11-2018, 15:59:44
    Author     : Pablo Saez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <style>
              body {
    background-color: gray;
}
    table, th, td {
    border: 5px solid purple;
    border-collapse: collapse;
}
th, td {
    padding: 15px;
    text-align: left;
}
table#t01 {
    width: 100%;    
    background-color: #ffc107;
}

ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    width: 200px;
    background-color: #f1f1f1;
}

li a {
    display: block;
    color: #000;
    padding: 8px 16px;
    text-decoration: none;
}

/* Change the link color on hover */
li a:hover {
    background-color: #555;
    color: white;
}


        </style>
        
    </head>
     <body style="text-align: center">
         
         <ul>
             
            <li><a href="<c:url value="/cliente/agregar"/>" class="active">Agregar Cliente</a></li>
            <li><a href="<c:url value="/cliente/listar"/>" class="active">Listar Clientes Actuales</a></li>
            <li><a href="<c:url value="/pago/agregar"/>" class="active">Agregar Deudores</a></li>
            
         </ul>
         
        <h2 style="color: greenyellow">Clientes con Deudas al Cyber</h2>
        <table id="01">
            <tr>
                <th style="color: greenyellow"> Id Cliente Deudor</th>
                <th style="color: greenyellow"> Monto Que Debe</th>
                <th style="color: greenyellow"> Nombre</th>
                <th style="color: greenyellow">Deuda Pagada</th>
               

            </tr>
            <c:forEach items="${pagos}" var="pag">
                <tr>
                    <td>${pag.id}</td>
                    <td>${pag.nuevoPago}</td>
                    <td>${pag.cliente.nombre}</td>
                    
                     <td><a href="<c:url value="/pago/${pag.id}/eliminar" />" class="btn btn-danger">Eliminar</a></td>
                   
                </tr>
            </c:forEach>
        </table>
        
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
