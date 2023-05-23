package bll;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.swing.text.DateFormatter;

import bo.Bid;
import bo.Category;
import bo.SoldItem;
import bo.User;
import bo.Withdrawal;
import dal.DALException;
import dal.DAOFactory;
import dal.ISoldItemDAO;

public class BidManager {
	private ISoldItemDAO soldItemDAO;
	private static BidManager instance;
	
	private static final String ERROR_BDD = "Une erreur est survenue";

	
	private BidManager() {
		this.soldItemDAO = DAOFactory.getSoldItemDAO();
	}
	
	public static BidManager getInstance() {
		if(instance == null) {
			instance = new BidManager();
		}
		return instance;
	}
	
	public List<SoldItem> SearchBidsWithFilters(
			String searchItemName,
			int categoryId,
			boolean isTypeBuy,
			List<String> filterCheck,
			User user) throws BLLException{
				
		try {
			return soldItemDAO.selectItemsByFilters(searchItemName, categoryId, isTypeBuy, filterCheck,user);
		} catch (DALException e) {
			e.printStackTrace();
			throw new BLLException(ERROR_BDD);
		}
	}
	
	public List<Category> getCategories() throws BLLException{
		try {
			return soldItemDAO.selectAllCategories();
		} catch (DALException e) {
			e.printStackTrace();
			throw new BLLException(ERROR_BDD);

		}
		
	}
	
	public SoldItem getSoldItemById(int id) throws BLLException{
		try {
			return soldItemDAO.selectById(id);
		} catch (DALException e) {
			e.printStackTrace();
			throw new BLLException(ERROR_BDD);

		}
	}
	
	public void insertItem(
			User seller,
			String itemName,
			int categoryId,
			String description,
			int initialPrice,
			String startDateString,
			String endDateString,
			String street,
			String postalCode,
			String city) throws BLLException {
		
		String errorMessage = "";
		//verif itemName <=30
		
		//verif description <=300
		
		//verif intialPrice >0
		
		//verif startDate>today && endDate>startDate
		
		if(errorMessage.length()>0) throw new BLLException(errorMessage);
		
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		LocalDate startDate = LocalDate.parse(startDateString, formatter);
		LocalDate endDate = LocalDate.parse(endDateString, formatter);
		
		try {
			soldItemDAO.insert(new SoldItem(itemName, initialPrice, startDate, endDate, seller, description, new Category(categoryId), new Withdrawal(street, postalCode, city)));
		} catch (DALException e) {
			e.printStackTrace();
			throw new BLLException(ERROR_BDD);
		}
	}
	
//	public void insertBid(int itemId, )
}
