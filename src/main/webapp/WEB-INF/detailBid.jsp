<%@ include file="templates/header.jsp"%>
		<style>
			<%@ include file="../public/css/detailBid.css"%>
		</style>
		<div>
			<div class="container">
				<div class="image-container">
					<div class="image-container-box">
	 					<img src="<%= request.getContextPath() %>/public/assets/image/logo.png" alt="#">
	 				</div>
				</div>
				<div class="form">
					<div>
						<h1 class="title">Détail vente</h1>
					</div>
					<div>
						<p class="titleArticle" id="article">${item.itemName} :</p>
					</div>
					<div class="flex">
						<label for="description">Description :</label>
						<p id="description">${item.description}</p>
					</div>
					<div class="flex">
						<label for="categorie-select">Catégorie :</label>
						<p id="categorie">
							${item.category.label}
						</p>
					</div>
					<c:if test="${item.bestOffer != 0}">
						<div class="flex">
							<label for="bestOffer">Meilleure offre :</label>
							<p id="bestOffer">${item.bestOffer} pts par ${item.buyer.username}</p>
						</div>
					</c:if>
					<div class="flex">
						<label for="price">Mise à prix :</label>
						<p id="price">${item.initialPrice} points</p>
					</div>
					<div class="flex">
						<label for="endBids">Fin de l'enchère :</label>
						<p id="endBids">${item.endDateFormatFR}</p>
					</div>
					<div>
						<label for="retrait">Adresse :</label>
						<div class="address" id="retrait">
							<p id="street">${item.withdrawal.street}</p>
							<p id="postalCode">${item.withdrawal.postalCode} ${item.withdrawal.city}</p>
						</div>
					</div>
					<div class="flex">
						<label for="seller">Vendeur :</label>
						<p id="seller">${item.seller.username}</p>
					</div>
					<c:if test="${item.currentDateIsBetweenStartDateAndEndDate}">
						<form method="POST" action="<%= request.getContextPath() %>/DetailBid?itemId=${item.itemId}">
							<div class="flex">
								<label for="myBids">Mon enchère :</label>
								<input type="number" id="bidAmount" name="bidAmount" min='<c:out value="${item.minNextValueBid}"></c:out>' value='<c:out value="${item.minNextValueBid}"></c:out>'>
							</div>
							<div>
								<input class="button-style-1" type="submit" name="Bids" value="Enchérir">
							</div>
						</form>
					</c:if>
				</div>
			</div>
		</div>

<%@ include file="templates/footer.jsp"%>


