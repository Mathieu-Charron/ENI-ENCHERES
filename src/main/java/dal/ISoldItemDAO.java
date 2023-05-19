package dal;

import java.util.List;

import bo.Bid;
import bo.SoldItem;
import bo.User;

public interface ISoldItemDAO extends ICRUDDAO<SoldItem> {
	List<SoldItem> selectItemsByFilters(
			String searchItemName, 
			int categoryId,
			boolean isTypeBuy,
			List<String> filterCheck,
			User user) throws DALException;
	
	void bidOnItem(int soldItemId, int coins, User user) throws DALException;
	
	
}
