<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	<%@ include file="../../public/css/style.css"%>
</style>
<title>ENI ENCHERE - <%= request.getAttribute("title") %></title>
</head>
<body>
<nav class="header">
	<div class="header-image">
		<!-- <img src="../../assets/image/logo.png"> -->
		<%-- <%@ include file="../../assets/image/logo.png" %> --%>
		 <img src="<%= request.getContextPath() %>/assets/image/logo.png" alt="Nom de l'image">
	</div>
	<ul class ="header-page">
		<li><a href="<%= request.getContextPath() %>">Enchères</a></li>
		<li><a href="<%= request.getContextPath() %>/newSold">Vendre un article</a></li>
		<li><a href="<%= request.getContextPath() %>">Mon profil</a></li>
		<li><a href="<%= request.getContextPath() %>">Déconnexion</a></li>
	</ul>
</nav>