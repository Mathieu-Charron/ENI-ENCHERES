package bo;

public class User {
	private int user_id;
	private String username;
	private String lastName;
	private String firstName;
	private String email;
	private String phone;
	private String street;
	private String postalCode;
	private String city;
	private String password;
	private int credit;
	private boolean administrator;
	
	
	public User(int user_id, String username, String lastName, String firstName, String email, String phone,
			String street, String postalCode, String city, String password, int credit, boolean administrator) {
		super();
		this.user_id = user_id;
		this.username = username;
		this.lastName = lastName;
		this.firstName = firstName;
		this.email = email;
		this.phone = phone;
		this.street = street;
		this.postalCode = postalCode;
		this.city = city;
		this.password = password;
		this.credit = credit;
		this.administrator = administrator;
	}


	public int getUser_id() {
		return user_id;
	}


	public String getUsername() {
		return username;
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


	public String getPassword() {
		return password;
	}


	public int getCredit() {
		return credit;
	}


	public boolean isAdministrator() {
		return administrator;
	}


	@Override
	public String toString() {
		return "User [user_id=" + user_id + ", username=" + username + ", lastName=" + lastName + ", firstName="
				+ firstName + ", email=" + email + ", phone=" + phone + ", street=" + street + ", postalCode="
				+ postalCode + ", city=" + city + ", password=" + password + ", credit=" + credit + ", administrator="
				+ administrator + "]";
	}

}
