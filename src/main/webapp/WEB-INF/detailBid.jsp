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
						<c:if test="${item.checkEndedBid}">
							<c:choose>
								<c:when test="${sessionScope.user.userId eq item.buyer.userId}">
								    <h1 class="title">Vous avez remporté l'enchère</h1>
								</c:when>
								<c:otherwise>
								    <h1 class="title">${item.buyer.username} a remporté l'enchère</h1>
								</c:otherwise>
							</c:choose>
						</c:if>
						<c:if test="${!item.checkEndedBid}">
							<h1 class="title">Détail vente</h1>
						</c:if>
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
<%-- 							<p id="bestOffer">${item.bestOffer} pts par ${item.buyer.username}</p> --%>		
								<c:choose>
									<c:when test="${sessionScope.user.userId eq item.buyer.userId}">
									    <p id="bestOffer">${item.bestOffer} <i class="fa-solid fa-coins"></i> (vous)</p>
									</c:when>
									<c:otherwise>
									    <p id="bestOffer">${item.bestOffer} <i class="fa-solid fa-coins"></i> par ${item.buyer.username}</p>
									</c:otherwise>
								</c:choose>
						</div>
					</c:if>
					<div class="flex">
						<label for="price">Mise à prix :</label>
						<p id="price">${item.initialPrice} <i class="fa-solid fa-coins"></i></p>
					</div>
					<div class="flex">
						<label for="endBids">Fin de l'enchère :</label>
						<p id="endBids">${item.endDateFormatFR}</p>
					</div>
					<div>
						<label for="retrait">Adresse :</label>
						<div class="address" id="retrait">
							<p id="street"><a href="https://www.google.fr/maps/search/${item.withdrawal.street}+${item.withdrawal.postalCode}+${item.withdrawal.city}" target="_blank"> ${item.withdrawal.street} <br>
							${item.withdrawal.postalCode} ${item.withdrawal.city}</a></p>
							<!-- <p id="postalCode"></p> -->
						</div>
					</div>
					<div class="flex">
						<label for="seller">Vendeur :</label>
						<p id="seller">${item.seller.username}</p>
					</div>
					<c:if test="${item.checkEndedBid && (sessionScope.user.userId eq item.buyer.userId)}" >
						<div class="flex">
							<label for="phone">Tel :</label>
							<p id="phone">${item.seller.phone}</p>
						</div>
					</c:if>
					<c:if test="${item.currentDateIsBetweenStartDateAndEndDate && !(sessionScope.user.userId eq item.seller.userId) && !(sessionScope.user.userId eq item.buyer.userId)}" >
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
					<c:if test="${item.checkEndedBid && (sessionScope.user.userId eq item.buyer.userId)}" >
						<a class="button-style-1" href="<%= request.getContextPath() %>">Retour</a>
					</c:if>
				</div>
			</div>
		</div>

<%@ include file="templates/footer.jsp"%>


