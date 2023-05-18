<%@ include file="templates/header.jsp"%>
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

<script type="text/javascript">
	let urlParameters = "?searchItemName=e";
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
</script>
<%@ include file="templates/footer.jsp"%>
