package bo;

public class Withdrawal {
	private int soldItemId;
    private String street;
    private String postalCode;
    private String city;
    
	public Withdrawal(int soldItemId, String street, String postalCode, String city) {
		this(street,postalCode,city);
		this.soldItemId = soldItemId;
	}
	
	public Withdrawal(String street, String postalCode, String city) {
		super();
		this.street = street;
		this.postalCode = postalCode;
		this.city = city;
	}
	
	
	
	public int getSoldItemId() {
		return soldItemId;
	}

	public String getStreet() {
		return street;
	}
	public void setStreet(String street) {
		this.street = street;
	}
	public String getPostalCode() {
		return postalCode;
	}
	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	@Override
	public String toString() {
		return "Withdrawal [street=" + street + ", postalCode=" + postalCode + ", city=" + city + "]";
	}
}