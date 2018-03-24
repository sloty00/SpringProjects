<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
		<title>Primer Curso de Spring Boot</title>
		<style>
		table {
		    width:100%;
		}
		table, th, td {
		    border: 1px solid black;
		    border-collapse: collapse;
		}
		th, td {
		    padding: 15px;
		    text-align: left;
		}
		table#t01 tr:nth-child(even) {
		    background-color: #eee;
		}
		table#t01 tr:nth-child(odd) {
		   background-color: #fff;
		}
		table#t01 th {
		    background-color: black;
		    color: white;
		}
		</style>
	</head>
<body>
	<div class="panel-heading container" style="align-content: center">
		<h2 align="center" class="center">${msg}</h2>
	</div>

<table id="t01">
  <tr>
    <th>Id</th>
    <th>Firstname</th> 
    <th>Lastname</th>
    <th>Actions</th>
  </tr>
  <c:forEach var="list" items="${lists}">
  <tr>
    <td>${list.id}</td>
    <td>${list.firstName}</td>
    <td>${list.lastName}</td>
    <td>
    	<a href="/view/${list.id}">Vista</a>
    	<a href="/delete/${list.id}">Borrar</a>
    	<a href="/edit/${list.id}">Editar</a>
    </td>
  </tr>
  </c:forEach>
</table>
<br />
<br />

	<h2>Guardar Usuario Nuevo</h2>

	<form method="post" action="/save">
	  <input type="hidden" name="id" value="">
	  First name:<br>
	  <input type="text" name="firstname">
	  <br>
	  Last name:<br>
	  <input type="text" name="lastname">
	  <br><br>
	  <input type="submit" value="Submit">
	</form> 
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>	
</body>

</html>