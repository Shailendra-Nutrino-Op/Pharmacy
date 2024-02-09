package com.java.hib;

import java.io.Serializable;
import java.util.Calendar;
import java.util.Date;




public class Medicines implements Serializable{
	
	
	private int entryId;
	private String medId;
	private String medName; 
	private String type;
	private int quantity;
	private Date entryDate;
	private Date mfgDate;
	private Date expiryDate;
	private double price;
	public int getEntryId() {
		return entryId;
	}
	public void setEntryId(int entryId) {
		this.entryId = entryId;
	}
	public String getMedId() {
		return medId;
	}
	public void setMedId(String medId) {
		this.medId = medId;
	}
	public String getMedName() {
		return medName;
	}
	public void setMedName(String medName) {
		this.medName = medName;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public Date getEntryDate() {
		return entryDate;
	}
	public void setEntryDate(Date entryDate) {
		this.entryDate = entryDate;
	}
	public Date getMfgDate() {
		return mfgDate;
	}
	public void setMfgDate(Date mfgDate) {
		this.mfgDate = mfgDate;
	}
	public Date getExpiryDate() {
		return expiryDate;
	}
	public void setExpiryDate(Date expiryDate) {
		this.expiryDate = expiryDate;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	
	@Override
	public String toString() {
		return "Medicines [entryId=" + entryId + ", medId=" + medId + ", medName=" + medName + ", type=" + type
				+ ", quantity=" + quantity + ", entryDate=" + entryDate + ", mfgDate=" + mfgDate + ", expiryDate="
				+ expiryDate + ", price=" + price + "]";
	}
	public Medicines(int entryId, String medId, String medName, String type, int quantity, Date entryDate, Date mfgDate,
			Date expiryDate, double price) {
		super();
		this.entryId = entryId;
		this.medId = medId;
		this.medName = medName;
		this.type = type;
		this.quantity = quantity;
		this.entryDate = entryDate;
		this.mfgDate = mfgDate;
		this.expiryDate = expiryDate;
		this.price = price;
	}
	public Medicines() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	 public boolean isExpiryWithinOneMonth() {
	        Calendar oneMonthAhead = Calendar.getInstance();
	        oneMonthAhead.add(Calendar.MONTH, 1);

	        Calendar today = Calendar.getInstance();

	        return expiryDate != null && expiryDate.after(today.getTime()) && expiryDate.before(oneMonthAhead.getTime());
	    }
	

	    
	    public boolean isExpired() {
	        Calendar today = Calendar.getInstance();
	        return expiryDate != null && expiryDate.before(today.getTime());
	    }
	    
	    
	    public boolean isExpiryDateLessThanOneMonth(Date expiryDate) {
	        Calendar calendar = Calendar.getInstance();
	        calendar.add(Calendar.MONTH, 1);

	        return expiryDate.before(calendar.getTime());
	    }
		
	    
	    //----------------------------------------------------------------
	    
	 // In your managed bean or server-side logic
	    public Date getOneMonthLater() {
	        // Calculate and return one month later based on the current expiryDate
	        Calendar calendar = Calendar.getInstance();
	        calendar.setTime(expiryDate);
	        calendar.add(Calendar.MONTH, 1);
	        return calendar.getTime();
	    }
	    
	    //---------------------------------------------------------
	    
	    public boolean isExpiryMoreThanOneMonth(Date expiryDate) {
	        // Calculate one month from today
	        Calendar oneMonthLater = Calendar.getInstance();
	        oneMonthLater.add(Calendar.MONTH, 1);

	        // Compare the expiry date with one month later
	        return expiryDate.after(oneMonthLater.getTime());
	    }


	
}