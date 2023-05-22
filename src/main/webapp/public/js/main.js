
window.addEventListener('load', function(){
	if(document.querySelector('.error-button')){
		document.querySelector('.error-button').addEventListener('click', function() {
	  		document.querySelector('#errorDiv').remove();
		})
	}

	date = new Date();
	year = date.getFullYear();
	document.getElementById("current-date").innerHTML = year;
})
