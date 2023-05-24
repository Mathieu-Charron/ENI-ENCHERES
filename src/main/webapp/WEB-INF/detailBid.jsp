<%@ include file="templates/header.jsp"%>
		<style>
			<%@ include file="../public/css/detailBid.css"%>
		</style>
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
			<div class="container">
				<div class="image-container">
					<img src="chemin/vers/mon-image.jpg" alt="#">
				</div>
				<div class="form">
					<div>
						<p id="article">${item.itemName}</p>
					</div>
					<div>
						<label for="description">Description :</label>
						<p id="description">${item.description}</p>
					</div>
					<div>
						<label for="categorie-select">Catégorie :</label>
						<p id="categorie">
							${item.category.label}
						</p>
					</div>
					<c:if test="${item.bestOffer != 0}">
						<div>
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
					<div>
						<label for="price">Mise à prix :</label>
						<p id="price">${item.initialPrice} <i class="fa-solid fa-coins"></i></p>
					</div>
					<div>
						<label for="endBids">Fin de l'enchère :</label>
						<p id="endBids">${item.endDateFormatFR}</p>
					</div>
					<div>
						<p>Adresse :</p>
						<div>
							<p id="street">${item.withdrawal.street}</p>
							<p id="postalCode">${item.withdrawal.postalCode }</p>
							<p id="city">${item.withdrawal.city}</p>
						</div>
					</div>
					<div>
						<label for="seller">Vendeur :</label>
						<p id="seller">${item.seller.username}</p>
					</div>
					<c:if test="${item.currentDateIsBetweenStartDateAndEndDate}">
						<form method="POST" action="<%= request.getContextPath() %>/DetailBid?itemId=${item.itemId}">
							<div>
								<label for="myBids">Mon enchère :</label>
								<input type="number" id="bidAmount" name="bidAmount" min='<c:out value="${item.minNextValueBid}"></c:out>' value='<c:out value="${item.minNextValueBid}"></c:out>'>
							</div>
							<div>
								<input type="submit" name="Bids" value="Enchérir">
							</div>
						</form>
					</c:if>
				</div>
			</div>
		</div>

<%@ include file="templates/footer.jsp"%>


