
window.addEventListener('load', function(){
	if(document.querySelector('.error-button')){
		document.querySelector('.error-button').addEventListener('click', function() {
	  		document.querySelector('#errorDiv').remove();
		})
	}
	if(document.querySelector('.success-button')){
		document.querySelector('.success-button').addEventListener('click', function() {
	  		document.querySelector('#successDiv').remove();
		})
	}

	date = new Date();
	year = date.getFullYear();
	document.getElementById("current-date").innerHTML = year;
})
