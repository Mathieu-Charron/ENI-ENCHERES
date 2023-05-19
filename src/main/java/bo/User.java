package bo;

public class User {
	private int userId;
	private String username;
	private String password;
	private String lastName;
	private String firstName;
	private String email;
	private String phone;
	private String street;
	private String postalCode;
	private String city;
	private int credit;
	private boolean administrator;
	

	
	
	public User(String username, String lastName, String firstName, String email, String phone,
			String street, String postalCode, String city, int credit, boolean administrator) {
		super();
		this.username = username;
		this.lastName = lastName;
		this.firstName = firstName;
		this.email = email;
		this.phone = phone;
		this.street = street;
		this.postalCode = postalCode;
		this.city = city;
		this.credit = credit;
		this.administrator = administrator;
	}
	
	public User(int userId, String username, String lastName, String firstName, String email, String phone,
			String street, String postalCode, String city, int credit) {
		super();
		this.userId = userId;
		this.username = username;
		this.lastName = lastName;
		this.firstName = firstName;
		this.email = email;
		this.phone = phone;
		this.street = street;
		this.postalCode = postalCode;
		this.city = city;
		this.credit = credit;
	}
	
	public User(int userId, String username, String lastName, String firstName, String email, String phone,
			String street, String postalCode, String city, int credit, boolean administrator) {
		this(username,lastName,firstName,email,phone,street,postalCode,city,credit,administrator);
		this.userId = userId;
	}
	
	
	
	

	public User(String username, String lastName, String firstName, String email, String phone,
			String street, String postalCode, String city, int credit, boolean administrator, String password) {
		this(username,lastName,firstName,email,phone,street,postalCode,city,credit,administrator);
		this.password = password;
	}
	
	public User(int userId, String username, String lastName, String firstName, String email, String phone,
			String street, String postalCode, String city, int credit, boolean administrator, String password) {
		this(userId, username,lastName,firstName,email,phone,street,postalCode,city,credit,administrator);
		this.password = password;
	}
	
	public User(int userId, String username) {
		this.userId = userId;
		this.username = username;
	}
	
	
	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getUsername() {
		return username;
	}

	public String getPassword() {
		return password;
	}

	public String getLastName() {
		return lastName;
	}


	public String getFirstName() {
		return firstName;
	}


	public String getEmail() {
		return email;
	}


	public String getPhone() {
		return phone;
	}


	public String getStreet() {
		return street;
	}


	public String getPostalCode() {
		return postalCode;
	}


	public String getCity() {
		return city;
	}


	public int getCredit() {
		return credit;
	}


	public boolean getAdministrator() {
		return administrator;
	}


	@Override
	public String toString() {
		return "User [userId=" + userId + ", username=" + username + ", lastName=" + lastName + ", firstName="
				+ firstName + ", email=" + email + ", phone=" + phone + ", street=" + street + ", postalCode="
				+ postalCode + ", city=" + city + ", credit=" + credit + ", administrator="
				+ administrator + "]";
	}

}
