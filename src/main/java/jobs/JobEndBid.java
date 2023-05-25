package jobs;

import bll.BLLException;
import bll.BidManager;

public class JobEndBid implements Runnable {

    private int itemId;

    public JobEndBid(int itemId) {
        this.itemId = itemId;
    }
	
	
    @Override
    public void run() {
        try {
			BidManager.getInstance().paySeller(itemId);
	        System.out.println("JobEndBid exécuté pour l'itemId n°"+itemId);
		} catch (BLLException e) {
			e.printStackTrace();
		}
    }
}