package com.java.hib;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import javax.faces.application.FacesMessage;
import javax.faces.context.ExternalContext;
import javax.faces.context.FacesContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Disjunction;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.transform.Transformers;

public class MainImpl {

	static SessionFactory sf;
	static Session session;

	private String localCode;

	public String getLocalCode() {
		return localCode;
	}

	public void setLocalCode(String localCode) {
		this.localCode = localCode;

	}

	private static String medName;

	public String getMedName() {
		return medName;
	}

	public void setMedName(String medName) {
		MainImpl.medName = medName;
	}

	public List<Medicines> ShowMedicines() {

		sf = SessionHelper.getConnection();
		session = sf.openSession();
		Criteria cr = session.createCriteria(Medicines.class);
		List<Medicines> list = cr.list();

		return list;
	}

//	public List<MedList> totalMedicines() {
//		sf = SessionHelper.getConnection();
//		session = sf.openSession();
//		Criteria criteria = session.createCriteria(Medicines.class);
//		criteria.setProjection(Projections.projectionList().add(Projections.groupProperty("medId").as("medId"))
//			.add(Projections.groupProperty("medName").as("medName")).add(Projections.groupProperty("type").as("type")).add(Projections.sum("quantity"), "quantity"));
//		criteria.setResultTransformer(Transformers.aliasToBean(MedList.class));
//		System.out.println(criteria.list().size());
//
//		System.out.println(criteria.list());
//		return criteria.list();
//	}
//	

	public List<MedList> totalMedicinesList(int firstRow, int rowCount, String medName) {
		sf = SessionHelper.getConnection();
		session = sf.openSession();
		Criteria criteria = session.createCriteria(Medicines.class);
		Medicines med = new Medicines();

		// Calculate the date that is 20 days from today
		LocalDate today = LocalDate.now();
		LocalDate expiryThreshold = today.plusDays(20);

		// Group by medId, medName, and type; and sum the quantity
		criteria.setProjection(Projections.projectionList().add(Projections.groupProperty("medId").as("medId"))
				.add(Projections.groupProperty("medName").as("medName"))
				.add(Projections.groupProperty("type").as("type")).add(Projections.sum("quantity").as("quantity")));

		criteria.setResultTransformer(Transformers.aliasToBean(MedList.class));

		if (medName != null && medName.length() > 0) {
			criteria.add(Restrictions.like("medName", medName + "%"));
		}

		// Add restrictions for expiry date
		Disjunction or = Restrictions.disjunction();
		or.add(Restrictions.gt("expiryDate",
				Date.from(expiryThreshold.atStartOfDay(ZoneId.systemDefault()).toInstant())));
		or.add(Restrictions.isNull("expiryDate"));
		criteria.add(or);

		criteria.setFirstResult(firstRow);
		criteria.setMaxResults(rowCount);

		return criteria.list();
	}

//	public List<MedList> totalMedicinesList(int firstRow, int rowCount, String medName) {
//	
//		sf = SessionHelper.getConnection();
//		session = sf.openSession();
//		Criteria criteria = session.createCriteria(Medicines.class);
//		Medicines med=new Medicines();
//		if(med.isExpiryWithinOneMonth() || med.isExpired() == true){
//			
////			criteria.setProjection(Projections.projectionList().add(Projections.groupProperty("medId").as("medId"))
////					.add(Projections.groupProperty("medName").as("medName")).add(Projections.groupProperty("type").as("type")).add(Projections.("quantity"), "quantity"));
////			
////			criteria.setResultTransformer(Transformers.aliasToBean(MedList.class));	
//			
//		}
//		
//		criteria.setProjection(Projections.projectionList().add(Projections.groupProperty("medId").as("medId"))
//				.add(Projections.groupProperty("medName").as("medName")).add(Projections.groupProperty("type").as("type")).add(Projections.sum("quantity"), "quantity"));
//		
//		criteria.setResultTransformer(Transformers.aliasToBean(MedList.class));
//	
////		
////		 // Calculate the date that is 20 days from today
////	    LocalDate today = LocalDate.now();
////	    LocalDate expiryThreshold = today.plusDays(20);
////	    
////	    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
////
//		
////			
////			   criteria.add(Restrictions.or(
////			            Restrictions.gt("expiryDate", formatter.format(today)),
////			            Restrictions.isNull("expiryDate")
////			    ));
//
//		if (medName.length()>0 || medName!=null) {
//			System.out.println("working");
//			criteria.add(Restrictions.like("medName", medName + "%"));
//			criteria.setFirstResult(firstRow);
//			criteria.setMaxResults(rowCount);
//		
//			
//		}
//		
//		criteria.setFirstResult(firstRow);
//		criteria.setMaxResults(rowCount);
//		System.out.println(criteria.list());
//		return criteria.list();
//		
//	}

	public boolean isExpiryWithinOneMonthh(Date expiryDate) {
		Calendar oneMonthAhead = Calendar.getInstance();
		oneMonthAhead.add(Calendar.MONTH, 1);

		Calendar today = Calendar.getInstance();

		return expiryDate != null && expiryDate.after(today.getTime()) && expiryDate.before(oneMonthAhead.getTime());
	}

	public boolean isExpiredd(Date expiryDate) {
		Calendar today = Calendar.getInstance();
		return expiryDate != null && expiryDate.before(today.getTime());
	}

	public String redirecttoUpdateMedicine(String medId, String medName, String type, int quantity, Date mfgDate,
			Date expiryDate, double price) {

		System.out.println("Hittingggg");
		Map<String, Object> sessionMap = FacesContext.getCurrentInstance().getExternalContext().getSessionMap();
		FacesContext context = FacesContext.getCurrentInstance();

		sessionMap.put("medId", medId);
		sessionMap.put("medName", medName);
		sessionMap.put("type", type);
		sessionMap.put("quantity", quantity);
		sessionMap.put("mfgDate", mfgDate);
		sessionMap.put("expiryDate", expiryDate);
		sessionMap.put("price", price);
		// Medicines med=new Medicines();
		if (quantity < 20) {
			System.out.println("Hiting redirect method");
			if (medId.startsWith("E0")) {
				return "EquipmentUpdate.jsf?faces-redirect=true";
			} else {
				return "UpdateMedicine.jsf?faces-redirect=true";
			}

		}
		if (isExpiryWithinOneMonthh(expiryDate)) {
			System.out.println("Hiting redirect method");
			if (medId.startsWith("E0")) {
				return "EquipmentUpdate.jsf?faces-redirect=true";
			} else {
				return "UpdateMedicine.jsf?faces-redirect=true";
			}
		}
		if (isExpiredd(expiryDate)) {
			System.out.println("Hiting redirect method");
			if (medId.startsWith("E0")) {
				return "EquipmentUpdate.jsf?faces-redirect=true";
			} else {
				return "UpdateMedicine.jsf?faces-redirect=true";
			}
		}
		context.addMessage(null, new FacesMessage(
				"UPDATE ONLY IF QUANTITY IS LESS THEN 5 (OR) EXPIRY DATE IS LESS THEN ONE MONTH (OR) EXPIRED"));
		System.out.println("Hiting redirecttttttttt method");

		return null;

	}

//	public String Updatemedicine(Medicines medicines) throws ParseException {
//		sf = SessionHelper.getConnection();
//		session = sf.openSession();
//		
//		System.out.println("Hiiiiiiiii");
//
//		Map<String, Object> sessionMap = FacesContext.getCurrentInstance().getExternalContext().getSessionMap();
//		String medId = (String) sessionMap.get("medId");
//		String medName = (String) sessionMap.get("medname");
//		String type = (String) sessionMap.get("type");
//		// double price =(double)sessionMap.get("price");
//		// double price =Double.parseDouble((String) sessionMap.get("price"));
//
//		medicines.setMedId(medId);
//		medicines.setMedName(medName);
//		medicines.setType(type);
//
//		Date date = new Date();
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//		String sdate = sdf.format(date);
//		Date utildate = sdf.parse(sdate);
//		java.sql.Date sqlentryDate = new java.sql.Date(utildate.getTime());
//		medicines.setEntryDate(sqlentryDate);
//
//		Transaction trans = session.beginTransaction();
//		session.save(medicines);
//		trans.commit();
//		return "ShowMedicinesPagination.jsp?faces-redirect=true";
//
//	}

//	public String updateAndDeleteMedicine(String oldMed, String MedId, String medName, String type, int quantity, Date mfgDate, Date expiryDate, double price) throws ParseException {
//	    try {
//	        sf = SessionHelper.getConnection();
//	        session = sf.openSession();
//
//	        // Get the old record
//	        Medicines oldMedicine = session.get(Medicines.class, oldMedId);
//
//	        // Update the existing record
//	        Medicines newMedicine = new Medicines();
//	        newMedicine.setMedId(MedId);
//	        newMedicine.setMedName(medName);
//	        newMedicine.setType(type);
//	        newMedicine.setQuantity(quantity);
//	        newMedicine.setMfgDate(mfgDate);
//	        newMedicine.setExpiryDate(expiryDate);
//	        newMedicine.setPrice(price);
//
//	        Date date = new Date();
//	        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//	        String sdate = sdf.format(date);
//	        Date utilDate = sdf.parse(sdate);
//	        java.sql.Date sqlEntryDate = new java.sql.Date(utilDate.getTime());
//	        newMedicine.setEntryDate(sqlEntryDate);
//	        
//	        // Increment the lastUpdated field for the new version
//	        newMedicine.setLastUpdated(new Date());
//
//	        Transaction trans = session.beginTransaction();
//	        session.saveOrUpdate(newMedicine);
//	        trans.commit();
//
//	        // Delete the old record
//	        Transaction deleteTrans = session.beginTransaction();
//	        session.delete(oldMedicine);
//	        deleteTrans.commit();
//
//	        return "ShowMedicinesPagination.jsp?faces-redirect=true";
//	    } catch (Exception e) {
//	        e.printStackTrace();
//	        // Handle exceptions (log, show error message, etc.)
//	        return ""; // Return an appropriate value based on the error handling strategy
//	    } finally {
//	        if (session != null && session.isOpen()) {
//	            session.close();
//	        }
//	    }
//	}

	public String Updatemedicine(String medId, String medName, String type, int quantity, Date mfgDate, Date expiryDate,
			double price) throws ParseException {
		sf = SessionHelper.getConnection();
		session = sf.openSession();

		System.out.println("Hiiiiiiiii");

		Map<String, Object> sessionMap = FacesContext.getCurrentInstance().getExternalContext().getSessionMap();

		Medicines medicines = new Medicines();
		medicines.setMedId(medId);
		medicines.setMedName(medName);
		medicines.setType(type);
		medicines.setQuantity(quantity);
		medicines.setMfgDate(mfgDate);
		medicines.setExpiryDate(expiryDate);
		medicines.setPrice(price);

		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String sdate = sdf.format(date);
		Date utildate = sdf.parse(sdate);
		java.sql.Date sqlentryDate = new java.sql.Date(utildate.getTime());
		medicines.setEntryDate(sqlentryDate);

		Transaction trans = session.beginTransaction();
		session.save(medicines);
		trans.commit();
		return "ShowMedicinesPagination.jsp?faces-redirect=true";

	}

//	public String updateMedicine(String medId, String medName, String type, int quantity, Date mfgDate, Date expiryDate, double price ) throws ParseException {
//	    try {
//	        sf = SessionHelper.getConnection();
//	        session = sf.openSession();
//	        
//	        System.out.println("Hiiiiiiiii");
//	        
//	        
//	 Map<String, Object> sessionMap = FacesContext.getCurrentInstance().getExternalContext().getSessionMap();
//	 
////		String medId = (String) sessionMap.get("medId");
////		String medName = (String) sessionMap.get("medname");
////		String type = (String) sessionMap.get("type");
////		int quantity =(int) sessionMap.get("quantity");
////		Date mfgDate = (Date) sessionMap.get("mfgDate");
////		Date expiryDate = (Date) sessionMap.get("expiryDate");
////		double price = (double) sessionMap.get("price");
//
//		
////	
////	        int quantity = medicines.getQuantity();
////	        Date mfgDate = medicines.getMfgDate();
////	        Date expiryDate = medicines.getExpiryDate();
////	        double price = medicines.getPrice();
//
//	 Medicines medicines=new Medicines();
//	    	medicines.setMedId(medId);
//			medicines.setMedName(medName);
//			medicines.setType(type);
//	        medicines.setQuantity(quantity);
//	        medicines.setMfgDate(mfgDate);
//	        medicines.setExpiryDate(expiryDate);
//	        medicines.setPrice(price);
//
//	        Date date = new Date();
//	        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//	        String sdate = sdf.format(date);
//	        Date utilDate = sdf.parse(sdate);
//	        java.sql.Date sqlEntryDate = new java.sql.Date(utilDate.getTime());
//	        medicines.setEntryDate(sqlEntryDate);
//
//	        Transaction trans = session.beginTransaction();
//	        session.saveOrUpdate(medicines); // Use saveOrUpdate to handle both save and update
//	        trans.commit();
//	        
//	        return "ShowMedicinesPagination.jsp?faces-redirect=true";
//	    } catch (Exception e) {
//	        e.printStackTrace();
//	        // Handle exceptions (log, show error message, etc.)
//	        return ""; // Return an appropriate value based on the error handling strategy
//	    } finally {
//	        if (session != null && session.isOpen()) {
//	            session.close();
//	        }
//	    }
//	}

//	public String Updatemedicine(Medicines medicines) throws ParseException {
//		sf = SessionHelper.getConnection();
//		session = sf.openSession();
//		
//		System.out.println("Hiiiiiiiii");
//
//
//	//	Map<String, Object> sessionMap = FacesContext.getCurrentInstance().getExternalContext().getSessionMap();
////		String medId = (String) sessionMap.get("medId");
////		String medName = (String) sessionMap.get("medname");
////		String type = (String) sessionMap.get("type");
////		int quantity = Integer.parseInt((String) sessionMap.get("quantity"));
////		Date mfgDate = (Date) sessionMap.get("mfgDate");
////		Date expiryDate = (Date) sessionMap.get("expiryDate");
////		
//		
//		// double price =(double)sessionMap.get("price");
////		 double price =Double.parseDouble((String) sessionMap.get("price"));
//		
//		String medId =medicines.getMedId();
//		String medName=medicines.getMedName();
//		String type=medicines.getType();
//		int quantity=medicines.getQuantity();
//		Date mfgDate=medicines.getMfgDate();
//		Date expiryDate=medicines.getExpiryDate();
//		double price=medicines.getPrice();
//
//		medicines.setMedId(medId);
//		medicines.setMedName(medName);
//		medicines.setType(type);
//		medicines.setQuantity(quantity);
//		medicines.setMfgDate(mfgDate);
//		medicines.setExpiryDate(expiryDate);
//		medicines.setPrice(price);
//
//		Date date = new Date();
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//		String sdate = sdf.format(date);
//		Date utildate = sdf.parse(sdate);
//		java.sql.Date sqlentryDate = new java.sql.Date(utildate.getTime());
//		medicines.setEntryDate(sqlentryDate);
//
//		Transaction trans = session.beginTransaction();
//		session.save(medicines);
//		trans.commit();
//		return "ShowMedicinesPagination.jsp?faces-redirect=true";
//
//	}
	// -------------- Pagination--------------

	public List<Medicines> showMedicinesDao(int firstRow, int rowCount) {
		SessionFactory sf = SessionHelper.getConnection();
		Session session = sf.openSession();
		Criteria cr = session.createCriteria(Medicines.class);
		cr.setFirstResult(firstRow);
		cr.setMaxResults(rowCount);
		System.out.println(firstRow);
		System.out.println(rowCount);
		System.out.println(cr.list());
		return cr.list();
	}

	public List<Medicines> searchByMedName(int firstRow, int rowCount, String medName) {
		Map<String, Object> sessionMap = FacesContext.getCurrentInstance().getExternalContext().getSessionMap();
		System.out.println("test1 " + medName);
		SessionFactory sf = SessionHelper.getConnection();
		Session session = sf.openSession();
		Criteria criteria = session.createCriteria(Medicines.class);

		if (medName.length() > 0 || medName != null) {
			System.out.println("working");
			criteria.add(Restrictions.like("medName", medName + "%"));
			criteria.setFirstResult(firstRow);
			criteria.setMaxResults(rowCount);

		}
		// sorting by medId
		if (orderbyMedId.equals("asc")) {
			System.out.println("order: " + orderbyMedId);
			criteria.addOrder(Order.asc("medId"));
		} 
//		else if (orderbyMedId.equals("desc")) {
//			criteria.addOrder(Order.desc("medId"));
//		} 
		else {
			System.out.println("Done");
		}
		// sorting by medIdDes
//				if (orderbyMedIdDes.equals("asc")) {
//					
//					criteria.addOrder(Order.asc("medId"));
//				} else
					if (orderbyMedIdDes.equals("desc")) {
					System.out.println("order: " + orderbyMedIdDes);
					criteria.addOrder(Order.desc("medId"));
				} else {
					System.out.println("Done");
				}

		// sorting by medName
		if (orderbyMedName.equals("asc")) {
			System.out.println("order: " + orderbyMedName);
			criteria.addOrder(Order.asc("medName"));
		}
//		else if (orderbyMedName.equals("desc")) {
//			criteria.addOrder(Order.desc("medName"));
//		}
		else {
			System.out.println("Done");
		}
		
		// sorting by medNameDes
		 if (orderbyMedNameDes.equals("desc")) {
			 System.out.println("order: " + orderbyMedNameDes);
			criteria.addOrder(Order.desc("medName"));
		}
				else {
					System.out.println("Done");
				}
		// sorting by EntryId
		if (orderbyEntryID.equals("asc")) {
			System.out.println("order: " + orderbyEntryID);
			criteria.addOrder(Order.asc("entryId"));
		} 
//		else if (orderbyEntryID.equals("desc")) {
//			criteria.addOrder(Order.desc("entryId"));
//		}
		else {
			System.out.println("Done");
		}
		
		// sorting by EntryIdDes
		 if (orderbyEntryIDDes.equals("desc")) {
			 System.out.println("order: " + orderbyEntryIDDes);
			criteria.addOrder(Order.desc("entryId"));
		}
		else {
			System.out.println("Done");
		}

//		// sorting by ExpiryDate
//		if (orderbyExpDate.equals("asc")) {
//			System.out.println("order: " + orderbyExpDate);
//			criteria.addOrder(Order.asc("expiryDate"));
//		} else if (orderbyExpDate.equals("desc")) {
//			criteria.addOrder(Order.desc("expiryDate"));
//		} else {
//			System.out.println("Done");
//		}

//		if (medName.length()>0 || medName!=null) {
//			System.out.println("working");
//			criteria.add(Restrictions.like("medName", medName + "%"));
//			criteria.setFirstResult(firstRow);
//			criteria.setMaxResults(rowCount);
//	
//			
//		}

		criteria.setFirstResult(firstRow);
		criteria.setMaxResults(rowCount);
		System.out.println(criteria.list());
		return criteria.list();

	}

//	public List<Medicines> searchByMedName1(int firstRow, int rowCount, String medName) {
//		SessionFactory sf = SessionHelper.getConnection();
//		Session session = sf.openSession();
//	
//		
//		System.out.println("start date is " +medName);
//		if (medName != null ) {
//        	session.beginTransaction();
//            Criteria criteria = session.createCriteria(Medicines.class);
//            criteria.add(Restrictions.eq("medName", medName));
//			
////               criteria.add(Restrictions.eq("uhid", uhid));
////               criteria.add(Restrictions.ge("admit_date",parsedStartDate ));
////      		   criteria.add(Restrictions.le("admit_date",parsedEndDate ));         		   
//                    
//	  
//			 criteria.setFirstResult(firstRow);
//			 criteria.setMaxResults(rowCount);
//             return criteria.list();
//           
//           }       
//			//	session.beginTransaction();
//				Criteria criteria = session.createCriteria(Medicines.class);
//				criteria.setFirstResult(firstRow);
//				criteria.setMaxResults(rowCount);
//			    return criteria.list();
//	}

//	public Criteria searchByMedName(String medName) {
//		System.out.println("Hitting");
//		sf = SessionHelper.getConnection();
//		Map<String, Object> sessionMap = FacesContext.getCurrentInstance().getExternalContext().getSessionMap();
//		sessionMap.put("searchMed", medName);
//		session = sf.openSession();
//		Criteria cr = session.createCriteria(Medicines.class);
//		cr.add(Restrictions.like("medName", medName + "%"));
////		 List<MedicineEntry> MedList = cr.list();
//		return cr;
//	}
//	public int countRows() {
//		SessionFactory sf = SessionHelper.getConnection();
//		Session session = sf.openSession();
//		try {
//			session.beginTransaction();
//			Criteria criteria = session.createCriteria(Medicines.class);
//			if (criteria != null) {
//				
//				return criteria.list().size();
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return 0;
//	}

	// -------------------------------------------------------------------------

//	//sorting for medicines
//		 public List<Medicines> sortBymedID(int firstRow, int rowsPerPage) {
////				Map<String, Object> sessionMap = FacesContext.getCurrentInstance().getExternalContext().getSessionMap();
////
////				String medName=(String) sessionMap.get("searchMed");
////				
//		        List<Medicines> medicinesList = searchByMedName( firstRow,  rowsPerPage,  medName);
//	 
//		        Collections.sort(medicinesList, Comparator.comparing(Medicines::getMedId));
//	 
//		        return medicinesList;
//		    }
//		 public List<Medicines> sortBymedIDDes(int firstRow, int rowsPerPage) {
////			 Map<String, Object> sessionMap = FacesContext.getCurrentInstance().getExternalContext().getSessionMap();
////
////				String medName=(String) sessionMap.get("searchMed");
//		        List<Medicines> medicinesList = searchByMedName(firstRow, rowsPerPage, medName);
//	 
//		        Collections.sort(medicinesList, Comparator.comparing(Medicines::getMedId).reversed());
//	 
//		        return medicinesList;
//		    }
//	
	// --------------------------------------------------------------------------

	public int countRows(String medName) {
		SessionFactory sf = SessionHelper.getConnection();
		Session session = sf.openSession();
		try {
			session.beginTransaction();
			Criteria criteria = session.createCriteria(Medicines.class);
			if (criteria != null) {
				if (medName.length() > 0 || medName != null) {
					criteria.add(Restrictions.like("medName", medName + "%"));

				}
				return criteria.list().size();
			}
			return criteria.list().size();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	public int countRowsList(String medName) {
		SessionFactory sf = SessionHelper.getConnection();
		Session session = sf.openSession();
		try {
			session.beginTransaction();
			Criteria criteria = session.createCriteria(Medicines.class);

			criteria.setProjection(Projections.projectionList().add(Projections.groupProperty("medId").as("medId"))
					.add(Projections.groupProperty("medName").as("medName"))
					.add(Projections.groupProperty("type").as("type")).add(Projections.sum("quantity"), "quantity"));

			criteria.setResultTransformer(Transformers.aliasToBean(MedList.class));

			if (criteria != null) {
				if (medName.length() > 0 || medName != null) {
					criteria.add(Restrictions.like("medName", medName + "%"));
					/* criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY); */
				}
				return criteria.list().size();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

//------------------------------------------------------------

//SORTING...
	static String orderbyEntryID = "sort";
	static String orderbyMedId = "sort";
	static String orderbyMedName = "sort";
//	static String orderbyExpDate = "sort";

	static String orderbyEntryIDDes = "sort";
	static String orderbyMedIdDes = "sort";
	static String orderbyMedNameDes = "sort";
	
//	static String orderbyEntryIDDes = "sort";

//	public String sortByMedId() {
//		Map<String, Object> sessionMap = FacesContext.getCurrentInstance().getExternalContext().getSessionMap();
//		System.out.println("sort..");
//		if (orderbyMedId.length() == 4) {
//			orderbyMedId = "asc";
//
//			orderbyEntryID = "sort";
//			orderbyMedName = "sort";
//			orderbyExpDate = "sort";
//
//		} else if (orderbyMedId.equals("asc")) {
//			orderbyMedId = "desc";
//
//			orderbyEntryID = "sort";
//			orderbyMedName = "sort";
//			orderbyExpDate = "sort";
//		}
//		sessionMap.put("orderbyMedId", orderbyMedId);
//		return "ShowMedicinesPagination.jsp?faces-redirect=true";
//
//	}
	
	public String sortByEntryId() {
		Map<String, Object> sessionMap = FacesContext.getCurrentInstance().getExternalContext().getSessionMap();
		System.out.println("sort..");
		if (orderbyEntryID.length() == 4) {
			orderbyEntryID = "asc";

			orderbyMedId = "sort";
			orderbyMedName = "sort";
			orderbyMedIdDes = "sort";
			orderbyMedNameDes = "sort";
			orderbyEntryIDDes ="sort";

		} else if (orderbyEntryID.equals("asc")) {
			orderbyEntryID = "desc";

			orderbyMedId = "sort";
			orderbyMedName = "sort";
			orderbyMedIdDes = "sort";
			orderbyMedNameDes = "sort";
			orderbyEntryIDDes ="sort";

		}
		sessionMap.put("orderbyEntryID", orderbyEntryID);
		return "ShowMedicinesPagination.jsp?faces-redirect=true";

	}
	
	public String sortByMedId() {
		Map<String, Object> sessionMap = FacesContext.getCurrentInstance().getExternalContext().getSessionMap();
		System.out.println("sort..");
		if (orderbyMedId.length() == 4) {
			orderbyMedId = "asc";
			
			orderbyEntryID = "sort";
			orderbyMedName = "sort";
			orderbyEntryIDDes ="sort";
			orderbyMedNameDes = "sort";
			orderbyMedIdDes = "sort";
			
			
		} 
		else if (orderbyMedId.equals("desc")) {
			orderbyMedId = "asc";
			
			orderbyEntryID = "sort";
			orderbyMedName = "sort";
			orderbyEntryIDDes ="sort";
			orderbyMedNameDes = "sort";
			orderbyMedIdDes = "sort";
			
		}
		sessionMap.put("orderbyMedId", orderbyMedId);
		return "ShowMedicinesPagination.jsp?faces-redirect=true";

	}
	
	public String sortByMedName() {
		Map<String, Object> sessionMap = FacesContext.getCurrentInstance().getExternalContext().getSessionMap();
		System.out.println("sort..");
		if (orderbyMedName.length() == 4) {
			orderbyMedName = "asc";

			orderbyEntryID = "sort";
			orderbyMedId = "sort";
			orderbyEntryIDDes = "sort";
			orderbyMedIdDes = "sort";
			orderbyMedNameDes = "sort";

		} else if (orderbyMedName.equals("desc")) {
			orderbyMedName = "asc";

			orderbyEntryID = "sort";
			orderbyMedId = "sort";
			orderbyEntryIDDes = "sort";
			orderbyMedIdDes = "sort";
			orderbyMedNameDes = "sort";
		}
		sessionMap.put("orderbyMedName", orderbyMedName);
		return "ShowMedicinesPagination.jsp?faces-redirect=true";

	}

	
	
	public String sortByEntryIdDes() {
		Map<String, Object> sessionMap = FacesContext.getCurrentInstance().getExternalContext().getSessionMap();
		System.out.println("sort..");
		if (orderbyEntryIDDes.length() == 4) {
			orderbyEntryIDDes = "desc";

			orderbyEntryID = "sort";
			orderbyMedId = "sort";
			orderbyMedName = "sort";
			orderbyMedIdDes = "sort";
			orderbyMedNameDes = "sort";
			

		} else if (orderbyEntryIDDes.equals("asc")) {
			orderbyEntryIDDes = "desc";

			orderbyEntryID = "sort";
			orderbyMedId = "sort";
			orderbyMedName = "sort";
			orderbyMedIdDes = "sort";
			orderbyMedNameDes = "sort";

		}
		sessionMap.put("orderbyEntryIDDes", orderbyEntryIDDes);
		return "ShowMedicinesPagination.jsp?faces-redirect=true";

	}
	public String sortByMedIdDes() {
		Map<String, Object> sessionMap = FacesContext.getCurrentInstance().getExternalContext().getSessionMap();
		System.out.println("sort..");
		if (orderbyMedIdDes.length() == 4) {
			orderbyMedIdDes = "desc";
			
			orderbyEntryID = "sort";
			orderbyMedId = "sort";
			orderbyMedName = "sort";
			orderbyEntryIDDes = "sort";
			orderbyMedNameDes = "sort";
			
		} else if (orderbyMedIdDes.equals("asc")) {
			orderbyMedIdDes = "desc";
			
			orderbyEntryID = "sort";
			orderbyMedId = "sort";
			orderbyMedName = "sort";
			orderbyEntryIDDes = "sort";
			orderbyMedNameDes = "sort";
		}
		sessionMap.put("orderbyMedIdDes", orderbyMedIdDes);
		return "ShowMedicinesPagination.jsp?faces-redirect=true";

	}
	
	
	
	public String sortByMedNameDes() {
		Map<String, Object> sessionMap = FacesContext.getCurrentInstance().getExternalContext().getSessionMap();
		System.out.println("sort..");
		if (orderbyMedNameDes.length() == 4) {
			orderbyMedNameDes = "desc";

			orderbyEntryID = "sort";
			orderbyMedId = "sort";
			orderbyMedName = "sort";
			orderbyEntryIDDes = "sort";
			orderbyMedIdDes = "sort";

		} else if (orderbyMedNameDes.equals("asc")) {
			orderbyMedNameDes = "desc";

			orderbyEntryID = "sort";
			orderbyMedId = "sort";
			orderbyMedName = "sort";
			orderbyEntryIDDes = "sort";
			orderbyMedIdDes = "sort";

		}
		sessionMap.put("orderbyMedNameDes", orderbyMedNameDes);
		return "ShowMedicinesPagination.jsp?faces-redirect=true";

	}




//	public String sortByExpDate() {
//		Map<String, Object> sessionMap = FacesContext.getCurrentInstance().getExternalContext().getSessionMap();
//		System.out.println("sort..");
//		if (orderbyExpDate.length() == 4) {
//			orderbyExpDate = "asc";
//
//			orderbyMedId = "sort";
//			orderbyMedName = "sort";
//			orderbyEntryID = "sort";
//		} else if (orderbyExpDate.equals("asc")) {
//			orderbyEntryID = "desc";
//
//			orderbyMedId = "sort";
//			orderbyMedName = "sort";
//			orderbyEntryID = "sort";
//
//		}
//		sessionMap.put("orderbyExpDate", orderbyExpDate);
//		return "ShowMedicinesPagination.jsp?faces-redirect=true";
//
//	}

	public void clear2() throws IOException {
		System.out.println("Clear");

		FacesContext facesContext = FacesContext.getCurrentInstance();
		ExternalContext externalContext = facesContext.getExternalContext();
		HttpSession session = (HttpSession) externalContext.getSession(false);

		if (session != null) {
			// Remove specific attributes from the session map
			session.removeAttribute("quantity");
			session.removeAttribute("price");
			session.removeAttribute("mfgDate");
			session.removeAttribute("expiryDate");

			// Redirect to the current page
			externalContext.redirect(((HttpServletRequest) externalContext.getRequest()).getRequestURI());
		}
	}

	
}

