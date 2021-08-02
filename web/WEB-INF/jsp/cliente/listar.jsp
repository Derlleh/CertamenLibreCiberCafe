<%-- 
    Document   : listar
    Created on : 14-11-2018, 22:54:44
    Author     : Pablo Saez
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <title>listarClientes</title>
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
    background-color: green;
    color: white;
}

</style>
        
    </head>
    <body bgcolor ="purple">
          <body style="text-align: center">
        
            <ul>
       
            <li><a href="<c:url value="/cliente/agregar"/>" class="active">Agregar Cliente</a></li>
            <li><a href="<c:url value="/cliente/listar"/>" class="active">Listar Clientes Actuales</a></li>
            <li><a href="<c:url value="/juego/agregar"/>" class="active" >Agregar Juego</a></li>
            <li><a href="<c:url value="/juego/listar"/>" class="active"> Listas Juegos</a></li>
         
            </ul>
        <h1 style="color: greenyellow"> Lista de Jugadores Actuales del Cyber</h1>
        <table id="t01">
            <tr>
                <th>Id del Cliente</th>
                <th>Nombre</th>
                <th>Valor Pago</th>
                <th>Inicio pm</th>
                <th>Termino pm </th>
                <th>Consola</th>
                <th>Numero Television</th>
                <th>Juego En Curso</th>
                <th>Fecha Registro</th>
                <th>Acciones</th>
                
            </tr>
            <tr>
            </tr>
             <form method="POST" action="<c:url value="/cliente/filtrar"/>">
                 <td></td>
                 <td>Filtrar</td>
                 <td> <input type="text" name="nombre"/></td>
                 <td><input type="number" name="pago"/></td>
                 <td><input type="televiion" name="television"/></td>
                 <td>
                     <select name="juego">
                         <option value="-1" selected>Todas</option>
                         <c:forEach items="${juegos}" var="jue">
                             <option value="${jue.id}">${jue.titulo}</option>
                         </c:forEach>
                     </select>
                 </td>
                 <td></td>
                 <td></td>
                 <td></td>
                 <td></td>
                 <td><button type="submit">Consultar</button>
             </form>
        </tr>
        <c:forEach items="${clientes}" var="cli">
            <tr>
                <td>${cli.id}</td>
                <td>${cli.nombre}</td>
                <td>${cli.pago}</td>
                <td>${cli.inicio}</td>
                <td>${cli.termino}</td>
                <td>${cli.consola}</td>
                <td>${cli.television}</td>
                <td>${cli.juego.titulo}</td>
                <td>${cli.fechaGuardado}</td>
                
                <td><a href="<c:url value="/cliente/${cli.id}/editar" />" class="btn btn-primary">Modificar</a></td>
                
                <td><a href="<c:url value="/cliente/${cli.id}/eliminar" />" class="btn btn-danger">Eliminar</a></td>
                
            
                
            </tr>
            
            
        </c:forEach>
            
    </table>
            
</form>

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

    </body>
</html>
