<%-- 
    Document   : listar
    Created on : 15-11-2018, 14:24:18
    Author     : Pablo Saez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <style>
  
     body {
    background-color: gray;
}

        table {
    border-collapse: collapse;
    width: 100%;
}

   th, td {
    padding: 8px;
    text-align: left;
    border-bottom: 1px solid #ddd;
}

tr:hover {background-color:#f5f5f5;}
h1 { 
    display: block;
    font-size: 2em;
    margin-top: 0.67em;
    margin-bottom: 0.67em;
    margin-left: 0;
    margin-right: 0;
    font-weight: bold;
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
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        
      <body style="text-align: center">
        
            <ul>
            <li><a href="<c:url value="/cliente/agregar"/>" class="active">Agregar Cliente</a></li>
            <li><a href="<c:url value="/cliente/listar"/>" class="active">Listar Clientes Actuales</a></li>
            <li><a href="<c:url value="/juego/agregar"/>" class="active" >Agregar Juego</a></li>
            <li><a href="<c:url value="/juego/listar"/>" class="active" > Listas Juegos</a></li>
         
            </ul>
    
        
        <h1 style="color: greenyellow"> Lista de Juegos del Cyber </h1>
        
            <table>
                <tr>
                    <th style="color: greenyellow"> Id Juego</th>
                <th style="color: greenyellow">Nombre del Juego</th>
                <th></th>
                <th></th>
                <form method="POST" action="<c:url value="/juego/filtrar"/>">
                 <td></td>
                 <td>Filtrar Por Nombre</td>
                 <td> <input type="text" name="titulo"/></td>
                  <td><button type="submit">Consultar</button>
                </form>
                </tr>
                <c:forEach items="${juegos}" var="jue">
                    <tr>
                        <td>${jue.id}</td>
                        <td>${jue.titulo}</td>
                <td><a href="<c:url value="/juego/${jue.id}/editar" />" class="btn btn-primary">Modificar Juego</a></td>
                <td><a href="<c:url value="/juego/${jue.id}/eliminar"/>" class="btn btn-danger">Eliminar Juego</a></td>   
                </tr>
                </c:forEach>
                
                <h5 style ="color: red">${error}</h5>
            </table>
                
                
                
                
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
