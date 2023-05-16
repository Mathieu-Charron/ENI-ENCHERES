package bo;

import java.sql.Date;

public class SoldItem {
    private int soldItemId;
    private String itemName;
    private String description;
    private Date startDate;
    private Date endDate;
    private int initialPrice;
    private int salePrice;
    private User userId;
    private Category categoryId;
    
	public SoldItem(int itemId, String itemName, String description, Date startDate, Date endDate, int initialPrice,
			int salePrice) {
		super();
		this.soldItemId = itemId;
		this.itemName = itemName;
		this.description = description;
		this.startDate = startDate;
		this.endDate = endDate;
		this.initialPrice = initialPrice;
		this.salePrice = salePrice;
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
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public int getInitialPrice() {
		return initialPrice;
	}
	public void setInitialPrice(int initialPrice) {
		this.initialPrice = initialPrice;
	}
	public int getSalePrice() {
		return salePrice;
	}
	public void setSalePrice(int salePrice) {
		this.salePrice = salePrice;
	}
	public Category getCategory() {
		return categoryId;
	}
	public void setCategory(Category category) {
		this.categoryId = category;
	}
	public User getUser() {
		return userId;
	}
	public void setUser(User user) {
		this.userId = user;
	}
	@Override
	public String toString() {
		return "SoldItem [itemId=" + soldItemId + ", itemName=" + itemName + ", description=" + description + ", startDate="
				+ startDate + ", endDate=" + endDate + ", initialPrice=" + initialPrice + ", salePrice=" + salePrice
				+ ", user=" + userId + ", category=" + categoryId + "]";
	}
	
}
