package bo;

import java.sql.Date;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public class SoldItem {
    private int soldItemId;
    private String itemName;
    private String description;
    private LocalDate startDate;
    private LocalDate endDate;
    private int initialPrice;
    private User seller;
    private Category category;
    private User buyer;
    private Integer bestOffer = 0;
    private Withdrawal withdrawal;
    
//	public SoldItem(int itemId, String itemName, String description, LocalDate startDate, LocalDate endDate, int initialPrice,
//			int salePrice) {
//		super();
//		this.soldItemId = itemId;
//		this.itemName = itemName;
//		this.description = description;
//		this.startDate = startDate;
//		this.endDate = endDate;
//		this.initialPrice = initialPrice;
//		this.salePrice = salePrice;
//	}
//	
	public SoldItem(int itemId, String itemName, int initialPrice, LocalDate endDate, User seller) {
		this.soldItemId = itemId;
		this.itemName = itemName;
		this.endDate = endDate;
		this.initialPrice = initialPrice;
		this.seller = seller;
	}
	
	public SoldItem(int itemId, String itemName, int initialPrice, 
			LocalDate startDate, LocalDate endDate, User seller, String description, 
			Category category, User buyer, Integer betterOffer,
			Withdrawal widWithdrawal) {
		this(itemId,itemName,initialPrice,endDate,seller);
		this.description = description;
		this.category = category;
		this.buyer = buyer;
		this.bestOffer = betterOffer;
		this.withdrawal = widWithdrawal;
		this.startDate =startDate;
	}	
	
	public SoldItem(String itemName, int initialPrice, LocalDate startDate,
			LocalDate endDate, User seller, String description, 
			Category category, Withdrawal widWithdrawal) {
		this.itemName = itemName;
		this.initialPrice = initialPrice;
		this.startDate = startDate;
		this.endDate = endDate;
		this.seller = seller;
		this.description = description;
		this.category = category;
		this.withdrawal = widWithdrawal;
	}
	
	public int getItemId() {
		return soldItemId;
	}
	public void setItemId(int itemId) {
		this.soldItemId = itemId;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public LocalDate getStartDate() {
		return startDate;
	}
	public void setStartDate(LocalDate startDate) {
		this.startDate = startDate;
	}
	public LocalDate getEndDate() {
		return endDate;
	}
	
	public String getEndDateFormatFR() {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        String endDateString = endDate.format(formatter);
		return endDateString;
	}
	
	public void setEndDate(LocalDate endDate) {
		this.endDate = endDate;
	}
	public int getInitialPrice() {
		return initialPrice;
	}
	public void setInitialPrice(int initialPrice) {
		this.initialPrice = initialPrice;
	}
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
	public User getSeller() {
		return seller;
	}
	public void setSeller(User seller) {
		this.seller = seller;
	}
	
	
	public User getBuyer() {
		return buyer;
	}

	public Integer getBestOffer() {
		return bestOffer;
	}

	public Withdrawal getWithdrawal() {
		return withdrawal;
	}
	
	public int getMinNextValueBid() {
		return bestOffer>initialPrice ? bestOffer+10 : initialPrice +10;
	}
	
	public boolean getCurrentDateIsBetweenStartDateAndEndDate() {
		if(this.startDate != null && this.endDate !=null) {
			return !(LocalDate.now().isBefore(this.startDate) 
			|| LocalDate.now().isAfter(this.endDate));
		}

		return false;
	}
	
	public boolean getCheckEndedBid () {
		if(this.endDate !=null) {
			return !(LocalDate.now().isBefore(this.endDate));
		}
		return false;
	}

	@Override
	public String toString() {
		return "SoldItem [itemId=" + soldItemId + ", itemName=" + itemName + ", description=" + description + ", startDate="
				+ startDate + ", endDate=" + endDate + ", initialPrice=" + initialPrice
				+ ", seller=" + seller + ", category=" + category + "]";
	}
	
}
