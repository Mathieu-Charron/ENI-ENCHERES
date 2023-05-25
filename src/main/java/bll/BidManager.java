package bll;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.Arrays;
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

public class BidManager implements IManager {
	private ISoldItemDAO soldItemDAO;
	private static BidManager instance;
	
	private static final int MAX_ITEM_NAME_SIZE = 30;
	private static final int MAX_DESCRIPTION_SIZE = 300;

	
	
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
		
		//verif not empty
		errorMessage+= checkValuesAreNotEmpty(Arrays.asList(itemName,description,startDateString,endDateString,street,postalCode,city));
		
		//verif itemName <=30
		errorMessage+= checkItemNameSize(itemName);
		
		//verif description <=300
		errorMessage+= checkDescriptionSize(description);

		LocalDate startDate = null;
		LocalDate endDate = null;
		//verif intialPrice >0
		errorMessage+= initialPrice > 0 ? "" : "Le prix doit être supérieur à 0";
		try {
			//check is date format
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
			startDate = LocalDate.parse(startDateString, formatter);
			endDate = LocalDate.parse(endDateString, formatter);
			
			//verif startDate>today && endDates>startDate
			errorMessage+= checkDate(startDate,endDate);
		} catch (DateTimeParseException e) {
			e.printStackTrace();
			errorMessage+= "Vous devez rentrer une date valide !!!!!!!";
		}
		
		
		if(errorMessage.length()>0) throw new BLLException(errorMessage);
		
		try {
			soldItemDAO.insert(new SoldItem(itemName, initialPrice, startDate, endDate, seller, description, new Category(categoryId), new Withdrawal(street, postalCode, city)));
		} catch (DALException e) {
			e.printStackTrace();
			throw new BLLException(ERROR_BDD);
		}
	}
	
	
	private String checkItemNameSize(String itemName) {
		
		if(itemName.length()>MAX_ITEM_NAME_SIZE) return "Le nom de l'article doit contenir maximum " + MAX_ITEM_NAME_SIZE + " charactères\n";
		return "";
	}
	
	private String checkDescriptionSize(String description) {
		
		if(description.length()>MAX_DESCRIPTION_SIZE) return "La description doit contenir maximum " + MAX_DESCRIPTION_SIZE + " charactères\n";
		return "";
	}
	
	private String checkDate(LocalDate startDate,LocalDate endDate) {
		String errorMessage="";
		if(startDate.isBefore(LocalDate.now())) {
			errorMessage+= "Les dates doivent être superieures à celle d'aujourd'hui\n";
		}
		
		if(startDate.isAfter(endDate)) {
			errorMessage+= "La date de fin ne peut pas être inferieur à celle de début\n";
		}
		return errorMessage;
	}
	
	
	public void insertBid(User userAuthenticate, int itemId, int creditsSpent) throws BLLException {
		String errorMessage= "";

		Bid oldBid = null;
		SoldItem soldItem = null;
		try {
			oldBid = soldItemDAO.selectBestOfferByItemId(itemId);
			soldItem = soldItemDAO.selectById(itemId);
			if(soldItem == null) throw new DALException("soldItem is null");
		} catch (DALException e) {
			e.printStackTrace();
			throw new BLLException(ERROR_BDD);
		}
		
		//verif not seller user (THROW ERROR IF TRUE)
		errorMessage+= userAuthenticate.getUserId() == soldItem.getSeller().getUserId() ? "Vous ne pouvez pas surenchérir sur votre vente voyons !" : "";
		if(errorMessage.length()>0) throw new BLLException(errorMessage);
		
		if(oldBid != null) {
			//verif not same user (THROW ERROR IF TRUE)
			errorMessage+= userAuthenticate.getUserId() == oldBid.getUser().getUserId() ? "Vous ne pouvez pas surenchérir sur votre offre voyons !" : "";
			if(errorMessage.length()>0) throw new BLLException(errorMessage);
		}
		
		//verif getdate() between startDate && endDate (THROW ERROR IF FALSE)
		errorMessage+= checkCurrentDateIsBetweenStartDateAndEndDate(soldItem.getStartDate(), soldItem.getEndDate());
		if(errorMessage.length()>0) throw new BLLException(errorMessage);

		//verif coins user not in negative
		errorMessage+=checkCreditsNotInNegative(userAuthenticate.getCredit(), creditsSpent);
		
		if(oldBid != null) {
			//verif bid > oldBid
			errorMessage+= oldBid.getBidAmount() > creditsSpent ? "Vous devez surenchérir !\n" :"";
		}
		
		if(errorMessage.length()>0) throw new BLLException(errorMessage);
		
		try {
			soldItemDAO.bidOnItem(itemId, creditsSpent, userAuthenticate);
		} catch (DALException e) {
			e.printStackTrace();
			throw new BLLException(ERROR_BDD);
		}
		
		
	}
	
	private String checkCreditsNotInNegative(int userCredits, int creditsSpent) {
		
		return (userCredits-creditsSpent) < 0 ? "Vous n'avez pas assez de credits\n" : "";
	}
	
	private String checkCurrentDateIsBetweenStartDateAndEndDate(LocalDate startDate, LocalDate endDate) {

		return LocalDate.now().isBefore(startDate) 
				|| LocalDate.now().isAfter(endDate) 
				? "La vente n'est pas en cours\n"
				: "";
	}
	
	private String checkValuesAreNotEmpty(List<String> values) {
		for(String value : values) {
			if(value.isBlank() || value.isEmpty()) {
				return "Les champs ne doivent pas être vides\n";
			}
		}
		return "";
	}
	
}
