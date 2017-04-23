<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<html>
<head>
	<title>Spring</title>
	<style type="text/css">
		.tg  {border-collapse:collapse;border-spacing:0;border-color:#ccc;}
		.tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#fff;}
		.tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#f0f0f0;}
		.tg .tg-4eph{background-color:#f9f9f9}
	</style>
	<link href="<c:url value="/resources/core.css" />" rel="stylesheet" type="text/css">
</head>
<body>

<h3>Listado de Autores</h3>
<c:if test="${!empty lstAuthor}">
	<table class="tg">
	<tr>
		<th width="80">ID</th>
		<th width="120">Nombre</th>
		<th width="120">Apellido Paterno</th>
		<th width="60">Editar</th>
		<th width="60">Eliminar</th>
	</tr>
	<c:forEach items="${lstAuthor}" var="person">
		<tr>
			<td>${person.id}</td>
			<td>${person.name}</td>
			<td>${person.f_last}</td>
			<td><a href="<c:url value='/edit/${person.id}' />" >Editar</a></td>
			<td><a href="<c:url value='/remove/${person.id}' />" >Eliminar</a></td>
		</tr>
	</c:forEach>
	</table>
</c:if>
</body>
</html>
