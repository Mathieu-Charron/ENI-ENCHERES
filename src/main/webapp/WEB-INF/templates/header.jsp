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
	
	<link rel="icon" href="<%= request.getContextPath() %>/public/assets/image/logo.png" />
	<link href="<%= request.getContextPath() %>/public/assets/fontawesome/css/fontawesome.css" rel="stylesheet">
	<link href="<%= request.getContextPath() %>/public/assets/fontawesome/css/brands.css" rel="stylesheet">
	<link href="<%= request.getContextPath() %>/public/assets/fontawesome/css/solid.css" rel="stylesheet">
	<title>ENI ENCHERE - <%= request.getAttribute("title") %></title>
	<script type="text/javascript" src="<%= request.getContextPath() %>/public/js/main.js"></script>
	<script type="text/javascript">
	
	window.addEventListener('scroll', function() {
		  var navbar = document.querySelector('.header');
		  var scrollPosition = window.scrollY || document.documentElement.scrollTop;
	
		  if (scrollPosition > 0) {
		    navbar.classList.add('fixed');
		  } else {
		    navbar.classList.remove('fixed');
		  }
		});
	
	</script>
</head>
<body>
<nav class="header">
	<div class="header-margin">
		<div class="header-image">
		<!-- <img src="../../assets/image/logo.png"> -->
		<%-- <%@ include file="../../assets/image/logo.png" %> --%>
		<a href="<%= request.getContextPath() %>">
		 	<img src="<%= request.getContextPath() %>/public/assets/image/logo.png" alt="Nom de l'image">
		 </a>
		</div>
		
		<ul class ="header-page">
			<div class="close-hamburger-menu">
				    <i class="fa-solid fa-xmark"></i>
			</div>
			<li><a href="<%= request.getContextPath() %>">Enchères</a></li>
			<c:if test="${not empty sessionScope.user}">
				<li><a href="<%= request.getContextPath() %>/NewSold">Vendre un article</a></li>
				<li><a href="<%= request.getContextPath() %>/Profile?userId=${sessionScope.user.userId}">Mon profil</a></li>
				<li><a href="<%= request.getContextPath() %>/Logout">Déconnexion</a></li>
				<li class="header-coin">${user.credit}<i class="fa-solid fa-coins"></i></li>
			</c:if>
			<c:if test="${empty sessionScope.user}">
			<li><a href="<%= request.getContextPath() %>/Connection">Connexion</a></li>
			</c:if>
		</ul>
		<div class="hamburger-menu">
		    <i class="fa-solid fa-bars"></i>
		</div>
		<script type="text/javascript">
		    document.addEventListener('DOMContentLoaded', function() {
		        var hamburgerMenu = document.querySelector('.hamburger-menu');
		        var closeHamburgerMenu = document.querySelector('.close-hamburger-menu');
		        var navigationMenu = document.querySelector('.header-page');
		        
		        hamburgerMenu.addEventListener('click', function() {
		            navigationMenu.classList.toggle('show');
		        });
		        closeHamburgerMenu.addEventListener('click', function() {
		            navigationMenu.classList.remove('show');
		        });
		    });
		</script>
	</div>
</nav>

<% 
	if(request.getSession().getAttribute("error") != null){
		String[] errorList = request.getSession().getAttribute("error").toString().split("\n"); 
		request.setAttribute("errorList", errorList);
	}

%>

<div class="container-principal">
	<c:if test="${not empty sessionScope.error}">	
		<div id="errorDiv">
			<div class="error-message">
				<ul>
					<c:forEach var="error" items="${errorList}">
    					<li>${error}</li>
					</c:forEach>
				</ul>
			</div>
			<div class="error-button"><i class="fa-solid fa-xmark"></i></div>
		</div>
	</c:if>

	<c:if test="${not empty sessionScope.success}">	
		<div id="successDiv">
			<div class="success-message">
				<ul>
   					<li>${success}</li>
				</ul>
			</div>
			<div class="success-button"><i class="fa-solid fa-xmark"></i></div>
		</div>
	</c:if>