<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Accueil</title>
</head>
<body>
<form action="/recherche" method="get">
	<h2>Filtres :</h2>
	<div>
  	<input type="text" name="q" placeholder="Rechercher...">
  	<select name="category">
    	<option value="all">Toutes les catégories</option>
    	<option value="electronics">Électronique</option>
    	<option value="clothing">Vêtements</option>
    	<option value="books">Livres</option>
  	</select>
  	</div>
  	<button type="submit">Rechercher</button>
</form>

<div>
	<ul>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
	</ul>
</div>
</body>
</html>