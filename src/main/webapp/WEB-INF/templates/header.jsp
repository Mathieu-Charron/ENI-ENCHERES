<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	<%@ include file="../../public/css/style.css"%>
</style>
<title>ENI ENCHERE - <%= request.getAttribute("title") %></title>
<link rel="icon" href="<%= request.getContextPath() %>/public/assets/image/logo.png" />
</head>
<body>
<nav class="header">
	<div class="header-image">
		<!-- <img src="../../assets/image/logo.png"> -->
		<%-- <%@ include file="../../assets/image/logo.png" %> --%>
		<a href="<%= request.getContextPath() %>">
		 	<img src="<%= request.getContextPath() %>/public/assets/image/logo.png" alt="Nom de l'image">
		 </a>
	</div>
	<ul class ="header-page">
		<li><a href="<%= request.getContextPath() %>">Enchères</a></li>
		<c:if test="${not empty sessionScope.user}">
		<li><a href="<%= request.getContextPath() %>/NewSold">Vendre un article</a></li>
		</c:if>
		<c:if test="${not empty sessionScope.user}">
		<li><a href="<%= request.getContextPath() %>/Profile">Mon profil</a></li>
		</c:if>
		<c:if test="${not empty sessionScope.user}">
		<li><a href="<%= request.getContextPath() %>/Logout">Déconnexion</a></li>
		</c:if>
		<c:if test="${empty sessionScope.user}">
		<li><a href="<%= request.getContextPath() %>/Connection">Connexion</a></li>
		</c:if>
	</ul>
</nav>