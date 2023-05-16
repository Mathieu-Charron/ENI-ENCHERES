package bo;

import java.sql.Date;

public class Bids {
	private Date bidsDate;
    private int bidsAmount;
    private SoldItem soldItem;
    private User user;
    
	public Bids(Date bidsDate, int bidsAmount, SoldItem soldItem, User user) {
		super();
		this.bidsDate = bidsDate;
		this.bidsAmount = bidsAmount;
		this.soldItem = soldItem;
		this.user = user;
	}
	public Date getAuctionDate() {
		return bidsDate;
	}
	public void setAuctionDate(Date auctionDate) {
		this.bidsDate = auctionDate;
	}
	public double getAuctionAmount() {
		return bidsAmount;
	}
	public void setAuctionAmount(int auctionAmount) {
		this.bidsAmount = auctionAmount;
	}
	public SoldItem getItem() {
		return soldItem;
	}
	public void setItem(SoldItem soldItem) {
		this.soldItem = soldItem;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	@Override
	public String toString() {
		return "Bids [bidsDate=" + bidsDate + ", bidsAmount=" + bidsAmount + ", soldItem=" + soldItem + ", user=" + user
				+ "]";
	}
}
