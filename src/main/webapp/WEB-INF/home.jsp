<%@ include file="templates/header.jsp"%>
	<style>
		<%@ include file="../public/css/home.css"%>
	</style>
	<script type="text/javascript" src="<%= request.getContextPath() %>/public/js/home.js"></script>

	<div class="container-home">
		<div class="container-filters">
			<h2>FILTRES</h2>
			<div class="container-main-filters">
				<div>
				  	<input type="text" name="q" id="search" placeholder="Rechercher...">
				</div>
				<div>
				  	<select id="categoryId">
				    	<option value="0">Toutes les catégories</option>
				    	<c:forEach var="category" items="${categories}">
				    		<option value="${category.categoryId}">${category.label}</option>
						</c:forEach>
		  			</select>
				</div>
			</div>
				<c:if test="${not empty sessionScope.user}">
				
				  	<div class="container-checks-filters">
				  		<div class="container-buys-filters">
				  			<div>
				  				<input type="radio" id="isTypeBuy-true" name="isTypeBuy" onclick="displayCheckboxFilters()" checked>
				  				<label for="isTypeBuy-true">Achats</label>
				  			</div>
				  			<div>
				  				<input type="checkbox" id="openBids" checked>
				  				<label for="openBids">enchères ouvertes</label>
				  			</div>
				  			<div>
				  				<input type="checkbox" id="myBids">
				  				<label for="myBids">mes enchères</label>
				  			</div>
				  			<div>
				  				<input type="checkbox" id="myWonBids">
				  				<label for="myWonBids">mes enchères remportées</label>
				  			</div>
				  		</div>
				  		<div class="container-mySales-filters">
			  				<div>
				  				<input type="radio" id="isTypeBuy-false" name="isTypeBuy" onclick="displayCheckboxFilters()">
				  				<label for="isTypeBuy-false">Mes ventes</label>
			  				</div>
			  				<div>
				  				<input type="checkbox" id="myCurrentSales" disabled>
				  				<label for="myCurrentSales" class="disabled-opacity">mes ventes en cours</label>
				  			</div>
				  			<div>
				  				<input type="checkbox" id="myNotStartedSales" disabled>
				  				<label for="myNotStartedSales" class="disabled-opacity">mes ventes non débutées</label>
				  			</div>
				  			<div>
				  				<input type="checkbox" id="myEndedSales" disabled>
				  				<label for="myEndedSales" class="disabled-opacity">mes ventes terminées</label>
				  			</div>
				  		</div>
			  		</div>
			  		
		  		</c:if>
		  	
	  	</div>
		<div class="container-items">
			<h2>ARTICLES</h2>
			<div class="container-main-items">
<!--  				<div class="card-item">
 					<a href="test">
 						<button class="detail-button"><i class="fa-solid fa-magnifying-glass"></i></button>
 					</a>
					<div class="card-item-img">
						<img src="/ENI-ENCHERES/public/assets/image/logo.png" alt="Nom de l'image">
					</div>
					<div class="card-item-desc">
						<h4>Fauteuil</h4>
						<p>Prix : 18 caca</p>
						<p>Fin de l'enchère : 01/10/2010</p>
						<br>
						<p>Vendeur : <a href="aaz">CacaMan</a></p>
					</div>
				</div>
				<div class="card-item">a</div>
				<div class="card-item">a</div>
				<div class="card-item">a</div> -->
			</div>
			<div class="pagination" id="paginationContainer">
            	<!-- Pagination links will be added dynamically by JavaScript -->
        	</div>
			
	  	</div>
  	</div>

<%@ include file="templates/footer.jsp"%>
