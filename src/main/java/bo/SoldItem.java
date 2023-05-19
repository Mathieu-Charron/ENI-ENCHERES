package bo;

import java.sql.Date;
import java.time.LocalDate;

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
    private Integer bestOffer;
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
			LocalDate endDate, User seller, String description, 
			Category category, User buyer, Integer betterOffer,
			Withdrawal widWithdrawal) {
		this(itemId,itemName,initialPrice,endDate,seller);
		this.description = description;
		this.category = category;
		this.buyer = buyer;
		this.bestOffer = betterOffer;
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

	@Override
	public String toString() {
		return "SoldItem [itemId=" + soldItemId + ", itemName=" + itemName + ", description=" + description + ", startDate="
				+ startDate + ", endDate=" + endDate + ", initialPrice=" + initialPrice
				+ ", seller=" + seller + ", category=" + category + "]";
	}
	
}
