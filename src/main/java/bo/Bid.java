package bo;

import java.sql.Date;

public class Bid {
	private Date bidsDate;
    private int bidAmount;
    private SoldItem soldItem;
    private User user;
	
	public Bid(int bidAmount, User user) {
		super();
		this.bidAmount = bidAmount;
		this.user = user;
	}
	
	public Date getBidDate() {
		return bidsDate;
	}

	public int getBidAmount() {
		return bidAmount;
	}

	public SoldItem getItem() {
		return soldItem;
	}

	public User getUser() {
		return user;
	}

	@Override
	public String toString() {
		return "Bids [bidsDate=" + bidsDate + ", bidAmount=" + bidAmount + ", soldItem=" + soldItem + ", user=" + user
				+ "]";
	}
}
