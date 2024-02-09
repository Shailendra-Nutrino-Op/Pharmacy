package com.java.hib;

import java.text.ParseException;
import java.util.Calendar;
import java.util.Date;

import java.util.regex.Pattern;

import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;


public class MedicinesController {
	
	private  Medicines medicines =new Medicines();
	private MainImpl impl=new MainImpl();
	public Medicines getMedicines() {
		return medicines;
	}
	public void setMedicines(Medicines medicines) {
		this.medicines = medicines;
	}
	public MainImpl getImpl() {
		return impl;
	}
	public void setImpl(MainImpl impl) {
		this.impl = impl;
	}
	
	public String addMedicines( String medId, String medName, String type, int quantity, Date mfgDate, Date expiryDate, double price) throws ParseException {
		if(addValid(medId, medName, type, quantity, mfgDate, expiryDate, price)) {
			return impl.Updatemedicine(medId, medName, type, quantity, mfgDate, expiryDate, price);		
		}
		return "";
	}
	
//	public String addMedicines(Medicines medicines) throws ParseException {
//		if(addValid(medicines)) {
//			return impl.Updatemedicine(medicines);
//		}
//		return "";
//	}
	
	
	public boolean addValid(String medId, String medName, String type, int quantity, Date mfgDate, Date expiryDate, double price)
//	public boolean addValid( Medicines medicines)
	{
		System.out.println("Medicine is  " +medicines);
	FacesContext context = FacesContext.getCurrentInstance();


//		 Date mfgDate=medicines.getMfgDate();
//		 Date expiryDate =medicines.getExpiryDate();
//		 
		 boolean flag=true;
		 
		// SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		 
		 

			
			Date today = new Date();
			
			if (mfgDate == null) {
				context.addMessage("form:mfgDate", new FacesMessage("Please enter Mfg Date."));
				flag = false;
			}
	 
			if (mfgDate == null || mfgDate.after(today)) {
				context.addMessage("form:mfgDate", new FacesMessage("MfgDate cannot be in the future."));
				flag = false;
			}
			
			
			
			if (mfgDateAlreadyExists(mfgDate)) {
				context.addMessage("form:mfgDate", new FacesMessage("Value already exists"));
				flag = false;
			}

			
			/*
			 * if (mfgDate == null || mfgDate == today) { context.addMessage("form:mfgDate",
			 * new FacesMessage("MfgDate cannot be Today.")); flag = false; }
			 */
	 
			if (expiryDate == null) {
				context.addMessage("form:expiryDate", new FacesMessage("Please enter Expiry Date."));
				flag = false;
			}
	 
			if (expiryDate == null || expiryDate.before(mfgDate) || expiryDate.equals(today)) {
				context.addMessage("form:expiryDate", new FacesMessage("ExpiryDate cannot be before MfgDate or today."));
				flag = false;
			}
			
			if (expiryDateAlreadyExists(expiryDate)) {
				context.addMessage("form:expiryDate", new FacesMessage("Value already exists"));
				flag = false;
			}

			
			
	
			
			// Additional Validation: Check if the expiry date is within 1 month\
						Calendar oneMonth = Calendar.getInstance();
						oneMonth.add(Calendar.MONTH, 1);

						if (expiryDate == null || expiryDate.before(oneMonth.getTime())) {
							context.addMessage("form:expiryDate", new FacesMessage("ExpiryDate must be at least 1 month to Today's Date"));
							flag = false;
						}
				

		String quantityInput = Integer.toString(quantity);
		String integerPattern = "^[0-9]+$";
		
		// 	Quantity cannot be Null
		if(quantity == 0) {
			 context.addMessage("form:quantity",new FacesMessage("Please Enter Quantity in Integer"));
			 flag= false;
		}
		
		if(quantity < 5) {
			 context.addMessage("form:quantity",new FacesMessage("Quantity must be at least 5."));
			 flag= false;
		}
		
		// Quantity cannot be String
		if(!Pattern.matches(integerPattern, quantityInput)) {
			System.out.println("Err");
			context.addMessage("form:quantity",new FacesMessage("Please enter Number only"));
			 flag= false;
			
		}
		
		
		String priceInput = Double.toString(price);
	
		  String price1= "[0-9]{1,13}(.[0-9]*)?";
				
//	 	Price cannot be Null
			if(price == 0) {
				 context.addMessage("form:price",new FacesMessage("Please Enter the Price in Numeric"));
				 flag= false;
			}
		
			
			if(price <= 0) {
				 context.addMessage("form:price",new FacesMessage("Invalid Price amount."));
				 flag= false;
			}
		
		// Price cannot be String
	if(!Pattern.matches(price1, priceInput)) {
			System.out.println("Err1");
			context.addMessage("form:price",new FacesMessage("Please enter numeric only"));
			 flag= false;
			
		}

		 return flag;
			
		
}

	public String addEquipment(String medId, String medName, String type, int quantity, Date mfgDate, Date expiryDate, double price) throws ParseException {
		
		if(addEquip(medId, medName, type, quantity, mfgDate,expiryDate, price)) {
			System.err.println("Equipment method");
			return impl.Updatemedicine(medId, medName, type, quantity, mfgDate, expiryDate, price);
			
		}
		return "";
	}
	public boolean addEquip(String medId, String medName, String type, int quantity, Date mfgDate, Date expiryDate, double price)
	{
		System.out.println("Medicine is  " +medicines);
	FacesContext context = FacesContext.getCurrentInstance();


		// Date mfgDate=medicines.getMfgDate();
		 boolean flag=true;
		 
		Date today = new Date();
		
		 if (mfgDate == null) {
				context.addMessage("form1:mfgDate", new FacesMessage("Please enter Mfg Date."));
				flag = false;
			}
	 
			if (mfgDate == null || mfgDate.after(today)) {
				context.addMessage("form1:mfgDate", new FacesMessage("MfgDate cannot be in the future."));
				flag = false;
			}
			
			if (mfgDateAlreadyExists(mfgDate)) {
				context.addMessage("form1:mfgDate", new FacesMessage("Value already exists"));
				flag = false;
			}

	 
	
			String quantityInput = Integer.toString(quantity);
			String integerPattern = "^[0-9]+$";
			
			// 	Quantity cannot be Null
			if(quantity == 0) {
				 context.addMessage("form1:quantity",new FacesMessage("Please Enter Quantity in Integer"));
				 flag= false;
			}
			
			if(quantity < 5) {
				 context.addMessage("form1:quantity",new FacesMessage("Quantity must be at least 5."));
				 flag= false;
			}
			
			// Quantity cannot be String
			if(!Pattern.matches(integerPattern, quantityInput)) {
				System.out.println("Err");
				context.addMessage("form1:quantity",new FacesMessage("Please enter Number only"));
				 flag= false;
				
			}
			
			
		
			String priceInput = Double.toString(price);
		
			  String pricepattern= "[0-9]{1,13}(.[0-9]*)?";
					
//		 	Price cannot be Null
				if(price == 0) {
					 context.addMessage("form1:price",new FacesMessage("Please Enter the Price in Numeric"));
					 flag= false;
				}
			
				
				if(price <= 0) {
					 context.addMessage("form1:price",new FacesMessage("Invalid Price amount."));
					 flag= false;
				}
			
			// Price cannot be String
		if(!Pattern.matches(pricepattern, priceInput)) {
			System.out.println("price hitting");
				context.addMessage("form1:price",new FacesMessage("Please enter numeric only"));
				 flag= false;
				
			}

			 return flag;
				
			
	}
	
	public boolean mfgDateAlreadyExists( Date mfgDate) {
		SessionFactory sf = SessionHelper.getConnection();
		Session session = sf.openSession();
		Criteria criteria = session.createCriteria(Medicines.class);
	//	criteria.add(Restrictions.eq("quantity", quantity));
		criteria.add(Restrictions.eq("mfgDate", mfgDate));
	//	criteria.add(Restrictions.eq("expiryDate", expiryDate));
	//	criteria.add(Restrictions.eq("price", price));
		
		criteria.setProjection(Projections.rowCount());

		Long count = (Long) criteria.uniqueResult();
		return count != null && count > 0;
	}
	
	
	public boolean expiryDateAlreadyExists( Date expiryDate) {
		SessionFactory sf = SessionHelper.getConnection();
		Session session = sf.openSession();
		Criteria criteria = session.createCriteria(Medicines.class);
	//	criteria.add(Restrictions.eq("quantity", quantity));
	//	criteria.add(Restrictions.eq("mfgDate", mfgDate));
		criteria.add(Restrictions.eq("expiryDate", expiryDate));
	//	criteria.add(Restrictions.eq("price", price));
		
		criteria.setProjection(Projections.rowCount());

		Long count = (Long) criteria.uniqueResult();
		return count != null && count > 0;
	}
}
