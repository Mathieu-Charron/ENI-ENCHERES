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
	
/*function searchBids(){
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
		document.querySelector('.container-main-items').innerHTML = '';
	    for(item of items){
			new CardItem(item);
		}
	  })
}*/
function searchBids(pageNumber = 1) {
    const itemsPerPage = 6;
    const startIndex = (pageNumber - 1) * itemsPerPage;
    const endIndex = startIndex + itemsPerPage;

    let urlParameters = "?searchItemName=" + document.querySelector('#search').value;
    urlParameters += "&categoryId=" + document.querySelector('#categoryId').value;

    radiobuttonIsTypeBuy = document.querySelector('#isTypeBuy-true');

    urlParameters += "&isTypeBuy=" + (radiobuttonIsTypeBuy != null ? radiobuttonIsTypeBuy.checked : "false");
    for (checkboxId of listCheckboxFilter) {
        const checkbox = document.querySelector('#' + checkboxId);
        urlParameters += "&" + checkboxId + "=" + (checkbox != null ? checkbox.checked : "false");
    }

    fetch("/ENI-ENCHERES/rest/bids/searchWithFilters" + urlParameters, {
        method: 'GET',
        headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json'
        },
    })
        .then(response => response.json())
        .then(items => {
            const bidItemsContainer = document.querySelector('.container-main-items');
			bidItemsContainer.innerHTML = '';

            const paginationContainer = document.getElementById('paginationContainer');
            paginationContainer.innerHTML = '';

            for (let i = startIndex; i < Math.min(endIndex, items.length); i++) {
                new CardItem(items[i]);
            }

            if (items.length > itemsPerPage) {
                createPaginationLinks(items.length, itemsPerPage, pageNumber);
            }
        });
}

function createPaginationLinks(totalItems, itemsPerPage, currentPage) {
    const paginationContainer = document.getElementById('paginationContainer');

    const totalPages = Math.ceil(totalItems / itemsPerPage);
    const maxVisibleLinks = 5;
    const halfVisibleLinks = Math.floor(maxVisibleLinks / 2);

    let startPage = Math.max(currentPage - halfVisibleLinks, 1);
    let endPage = Math.min(startPage + maxVisibleLinks - 1, totalPages);

    if (endPage - startPage < maxVisibleLinks - 1) {
        startPage = Math.max(endPage - maxVisibleLinks + 1, 1);
    }

    const paginationList = document.createElement('ul');
    paginationList.classList.add('pagination-list');

    if (startPage > 1) {
        const firstPageLink = createPaginationLink(1, '<<');
        paginationList.appendChild(firstPageLink);
    }

    if (currentPage > 1) {
        const prevPageLink = createPaginationLink(currentPage - 1, '<');
        paginationList.appendChild(prevPageLink);
    }

    for (let page = startPage; page <= endPage; page++) {
        const pageLink = createPaginationLink(page, page.toString(), page === currentPage);
        paginationList.appendChild(pageLink);
    }

    if (currentPage < totalPages) {
        const nextPageLink = createPaginationLink(currentPage + 1, '>');
        paginationList.appendChild(nextPageLink);
    }


    if (endPage < totalPages) {
        const lastPageLink = createPaginationLink(totalPages, '>>');
        paginationList.appendChild(lastPageLink);
    }

    paginationContainer.appendChild(paginationList);
}

function createPaginationLink(page, text, isActive = false) {
    const paginationLink = document.createElement('li');
    paginationLink.classList.add('pagination-link');

    if (isActive) {
        paginationLink.classList.add('active');
    }

    const link = document.createElement('a');
    link.setAttribute('href', '#');
    link.textContent = text;

    link.addEventListener('click', function (event) {
        event.preventDefault();
        searchBids(page);
    });

    paginationLink.appendChild(link);
    return paginationLink;
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
		this.addImg('/ENI-ENCHERES/public/assets/image/logo.png',item.itemId);
		this.addDesc(item.seller, item.itemName, item.initialPrice, item.endDate, item.itemId);
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
	
	addImg(_linkImg,_itemId){
		const detailHref = document.createElement('a');
		detailHref.setAttribute('href','DetailBid?itemId='+_itemId);
		
		const img = document.createElement('img');
		img.setAttribute('src',_linkImg);
		
		detailHref.appendChild(img);
		this.cardImg.appendChild(detailHref);
	}
	
	addDesc(seller, itemName, initialPrice, endDate, itemId){
		endDate = (endDate.dayOfMonth+"").padStart(2, "0")+"/"+(endDate.monthValue+"").padStart(2, "0")+"/"+endDate.year;
		
		const detailHref = document.createElement('a');
		detailHref.setAttribute('href','DetailBid?itemId='+itemId);
		const itemNameTag = this.createElementWithTxt('h4',itemName);
		
		detailHref.appendChild(itemNameTag);
		this.cardDesc.appendChild(detailHref);
		
		//prix
		const priceBalise = this.createElementWithTxt('p','Prix : '+initialPrice);
		priceBalise.appendChild(this.createElementWithClass('i','fa-solid fa-coins'));
		this.cardDesc.appendChild(priceBalise);
		
		
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
