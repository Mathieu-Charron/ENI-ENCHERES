<%@ include file="templates/header.jsp"%>
<form action="/recherche" method="get">
	<h2>Filtres :</h2>
	<div>
  	<input type="text" name="q" id="search" placeholder="Rechercher...">
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

<script type="text/javascript">
	
	window.addEventListener("load",function(){
		searchBids();
	});
	
	function searchBids(){
		let urlParameters = "?searchItemName="+document.querySelector('#search').value;
		urlParameters+= "&categoryId=0";
		urlParameters+= "&isTypeBuy=false";
		urlParameters+= "&openBids=false";
		urlParameters+= "&myBids=false";
		urlParameters+= "&myWonBids=false";
		urlParameters+= "&myCurrentSales=false";
		urlParameters+= "&myNotStartedSales=false";
		urlParameters+= "&myEndedSales=false";
		fetch("/ENI-ENCHERES/rest/bids/searchWithFilters"+urlParameters, {
		  method: 'GET',
	      headers: {
	          'Accept': 'application/json',
	          'Content-Type': 'application/json'
	        },
		})
		  .then(response => response.json())
		  .then(data => {
		    console.log(data);
		  })
	}
	
	document.querySelector('#search').addEventListener("input", function(){
		searchBids();
	});

</script>
<%@ include file="templates/footer.jsp"%>
