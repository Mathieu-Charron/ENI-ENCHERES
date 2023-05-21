const listCheckboxFilter = ['openBids','myBids','myWonBids','myCurrentSales','myNotStartedSales','myEndedSales']


window.addEventListener("load",function(){
	searchBids();
	
	document.querySelector('#search').addEventListener("input", function(){
		searchBids();
	});
	
	document.querySelector('#categoryId').addEventListener("change", function(){
		searchBids();
	});
	
	if(document.querySelector('#isTypeBuy-true')){
		for(checkboxId of listCheckboxFilter){
			document.querySelector('#'+checkboxId).addEventListener("click", function(){
				searchBids();
			});
		}
	}
	
});
	
function searchBids(){
	let urlParameters = "?searchItemName="+document.querySelector('#search').value;
	urlParameters+= "&categoryId="+document.querySelector('#categoryId').value;
	
	radiobuttonIsTypeBuy = document.querySelector('#isTypeBuy-true');
	
	urlParameters+= "&isTypeBuy="+(radiobuttonIsTypeBuy != null ? radiobuttonIsTypeBuy.checked : "false");
	for(checkboxId of listCheckboxFilter){
		const checkbox = document.querySelector('#'+checkboxId);
		urlParameters+= "&"+checkboxId+"="+(checkbox != null ? checkbox.checked : "false");
	}
	
	fetch("/ENI-ENCHERES/rest/bids/searchWithFilters"+urlParameters, {
	  method: 'GET',
      headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        },
	})
	  .then(response => response.json())
	  .then(items => {
		  console.log(items);
		document.querySelector('.container-main-items').innerHTML = '';
	    for(item of items){
			new CardItem(item);
		}
	  })
}


function displayCheckboxFilters(){
	
	function disabledCheckBox(container){
		for(checkbox of container.querySelectorAll('input[type=checkbox]')){
			checkbox.checked = false; 
			checkbox.setAttribute("disabled","");
			document.querySelector('[for='+checkbox.id+']') .classList.add("disabled-opacity");
		}
	}
	
	function enabledCheckBox(container){
		for(checkbox of container.querySelectorAll('input[type=checkbox]')){
			checkbox.removeAttribute("disabled");
			document.querySelector('[for='+checkbox.id+']') .classList.remove("disabled-opacity");
		}
	}
	
	radiobuttonIsTypeBuy = document.querySelector('#isTypeBuy-true');
	if(!radiobuttonIsTypeBuy) return;
	
	const containerIsTypeBuy = document.querySelector('.container-buys-filters');
	const containerIsTypeMySales = document.querySelector('.container-mySales-filters');
	
	if(!radiobuttonIsTypeBuy.checked){
 		disabledCheckBox(containerIsTypeBuy);
 		enabledCheckBox(containerIsTypeMySales)
	}else{
		disabledCheckBox(containerIsTypeMySales);
 		enabledCheckBox(containerIsTypeBuy)
	}

}

class CardItem {
	constructor(item){
		this.createCardItem();
		this.createDetailButton(item.itemId);
		this.addImg('/ENI-ENCHERES/public/assets/image/logo.png');
		this.addDesc(item.seller, item.itemName, item.initialPrice, item.endDate);
	}
	
	createCardItem(){
/*		this.cardItem = document.createElement('div');
		this.cardItem.classList.add('card-item');*/
		this.cardItem = this.createElementWithClass('div', 'card-item');
		
		this.cardImg = this.createElementWithClass('div', 'card-item-img');
		
		this.cardDesc = this.createElementWithClass('div', 'card-item-desc');
		
		this.cardItem.appendChild(this.cardImg);
		this.cardItem.appendChild(this.cardDesc);
		
		document.querySelector('.container-main-items').appendChild(this.cardItem);
	}
	
	createDetailButton(_itemId){
		const detailHref = document.createElement('a');
		detailHref.setAttribute('href','DetailBid?itemId='+_itemId);
		
		const detailButton = this.createElementWithClass('button','detail-button');
		
		detailButton.appendChild(
			this.createElementWithClass('i','fa-solid fa-magnifying-glass')
		);
		
		
		
		detailHref.appendChild(detailButton);
		this.cardItem.appendChild(detailHref);
	}
	
	addImg(_linkImg){
		const img = document.createElement('img');
		img.setAttribute('src',_linkImg);
		
		this.cardImg.appendChild(img);
	}
	
	addDesc(seller, itemName, initialPrice, endDate){
		endDate = (endDate.dayOfMonth+"").padStart(2, "0")+"/"+(endDate.monthValue+"").padStart(2, "0")+"/"+endDate.year;
		this.cardDesc.appendChild(this.createElementWithTxt('h4',itemName));
		this.cardDesc.appendChild(this.createElementWithTxt('p','Prix : '+initialPrice));
		this.cardDesc.appendChild(this.createElementWithTxt('p','Fin de l\'enchère : '+ endDate));
		
		this.cardDesc.appendChild(document.createElement('br'));
		
		const sellerBalise = this.createElementWithTxt('p', 'Vendeur : ');
		const hrefSeller =  this.createElementWithTxt('a',seller.username);
		hrefSeller.setAttribute('href','Profile?userId='+seller.userId);
		sellerBalise.appendChild(hrefSeller);
		
		this.cardDesc.appendChild(sellerBalise);
	}
	
	createElementWithClass(_balise, _class){
		const element = document.createElement(_balise);
		element.className = _class;
		return element;
	}
	
	createElementWithTxt(_balise, _txt){
		const element = document.createElement(_balise);
		element.innerText = _txt;
		return element;
	}
}
