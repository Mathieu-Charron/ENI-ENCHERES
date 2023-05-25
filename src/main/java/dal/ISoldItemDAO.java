package dal;

import java.util.List;

import bo.Bid;
import bo.Category;
import bo.SoldItem;
import bo.User;
import bo.Withdrawal;

public interface ISoldItemDAO extends ICRUDDAO<SoldItem> {
	List<SoldItem> selectItemsByFilters(
			String searchItemName, 
			int categoryId,
			boolean isTypeBuy,
			List<String> filterCheck,
			User user) throws DALException;
	
	void bidOnItem(int soldItemId, int coins, User user) throws DALException;
	
	List<Category> selectAllCategories() throws DALException; //SINGLETON
	
	Bid selectBestOfferByItemId(int itemId) throws DALException;
	
	void insertWithDrawal(Withdrawal withdrawal)  throws DALException;
	
}
