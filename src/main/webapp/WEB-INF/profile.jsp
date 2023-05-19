<%@ include file="templates/header.jsp"%>
<style>
		<%@ include file="../public/css/profile.css"%>
</style>
	<div class="container-profile">
	<h1>Mon profil</h1>
	<div class="form">
		<form action="${pageContext.request.contextPath}/Profile">
	
			<div class="form-element">
                <label for="username">Pseudo :</label>
                <label id="username" for="username">${user.username}</label>
            </div>
            
            <div class="form-element">
                <label for="lastName">Nom :</label>
                <label id="lastName" for="lastName">${user.lastName}</label>
            </div>
            
            <div class="form-element">
                <label for="firstName">Prénom :</label>
                <label id="firstName" for="firstName">${user.firstName}</label>
            </div>
            
            <div class="form-element">
                <label for="email">Email :</label>
                <label id="email" for="email">${user.email}</label>
            </div>
            
            <div class="form-element">
                <label for="phone">Téléphone :</label>
                <label id="phone" for="phone">${user.phone}</label>
            </div>
            
            <div class="form-element">
                <label for="street">Rue :</label>
                <label id="street" for="street">${user.street}</label>
            </div>
        
            <div class="form-element">
                <label for="postalCode">Code Postal :</label>
                <label id="postalCode" for="postalCode">${user.postalCode}</label>
            </div>
        
            <div class="form-element">
                <label for="city">Ville :</label>
                <label id="city" for="city">${user.city}</label>
            </div>
			
		    <!-- <input type="button" value="Modifier"> -->
		    <a href="<%= request.getContextPath() %>/EditProfile">Modifier</a>
		</form>
	</div>
	</div>
<%@ include file="templates/footer.jsp"%>
