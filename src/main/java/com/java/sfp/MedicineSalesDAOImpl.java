package com.java.sfp;

import java.util.List;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.Map;
import java.util.regex.Pattern;

import javax.faces.application.FacesMessage;
import javax.faces.context.ExternalContext;
import javax.faces.context.FacesContext;
import javax.servlet.http.HttpServletRequest;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

public class MedicineSalesDAOImpl {
	//Connection//
	SessionFactory sf;
	 Session session;
	 private String searchValue;
//---------------------------------------//
	 
	 //show medicine Sales//
	 public List<MedicineSales> showSales(){
		 sf= SessionHelper.getConnection();
		 session =sf.openSession();
		 Criteria cr=session.createCriteria(MedicineSales.class);
		 List<MedicineSales> saleList=cr.list();
		 return saleList;
	 }
	//---------------------------------------//

	 // Search//
	 private Date startDate;
		private Date endDate;
		
		 public Date getStartDate() {
			return startDate;
		}

		public void setStartDate(Date startDate) {
			this.startDate = startDate;
		}

		public Date getEndDate() {
			return endDate;
		}

		public void setEndDate(Date endDate) {
			this.endDate = endDate;
		}

		public List<MedicineSales> showMedicinesDao() {
			sf = SessionHelper.getConnection();
			session = sf.openSession();
			Criteria cr = session.createCriteria(MedicineSales.class);
			List<MedicineSales> medList = cr.list();
			return medList;
		}
		
		public Criteria getSalesByDateRange(Date startDate, Date endDate) {
		    System.out.println("METHOD HIT");
		    sf = SessionHelper.getConnection();
		    Map<String, Object> sessionMap = FacesContext.getCurrentInstance().getExternalContext().getSessionMap();
		    sessionMap.put("startDate", startDate);
		    sessionMap.put("endDate", endDate);
		    session = sf.openSession();
		    Criteria criteria = session.createCriteria(MedicineSales.class);
		    criteria.add(Restrictions.ge("saleDate", startDate));
		    criteria.add(Restrictions.le("saleDate", endDate));
		    criteria.addOrder(Order.asc("saleDate"));
		    return criteria;
		}
		
	 public Criteria searchBySaleId(String saleId) {
		 sf = SessionHelper.getConnection();
			Map<String, Object> sessionMap = FacesContext.getCurrentInstance().getExternalContext().getSessionMap();
		sessionMap.put("searchsale", saleId);
			session=sf.openSession();
			Criteria criteria = session.createCriteria(MedicineSales.class);
			criteria.add(Restrictions.eq("saleId", saleId ));
			return criteria;	
	 }
	 
	 public Criteria searchByprescription(String prescription_Id) {
		 sf = SessionHelper.getConnection();
			Map<String, Object> sessionMap = FacesContext.getCurrentInstance().getExternalContext().getSessionMap();
			sessionMap.put("searchprescription", prescription_Id);
			session=sf.openSession();
			Criteria criteria = session.createCriteria(MedicineSales.class);
			criteria.add(Restrictions.eq("prescription_Id",prescription_Id));
			return criteria;	
	 }
	 
	 public Criteria searchByprovider(String providerId) {
		 sf = SessionHelper.getConnection();
			Map<String, Object> sessionMap = FacesContext.getCurrentInstance().getExternalContext().getSessionMap();
			sessionMap.put("searchprovider", providerId);
			session=sf.openSession();
			Criteria criteria = session.createCriteria(MedicineSales.class);
			criteria.add(Restrictions.eq("providerId",providerId));
			return criteria;	
	 }
	 
	 public Criteria searchByUHID(String uHID) {
		 sf = SessionHelper.getConnection();
			Map<String, Object> sessionMap = FacesContext.getCurrentInstance().getExternalContext().getSessionMap();
			sessionMap.put("searchuhid", uHID);
			session=sf.openSession();
			Criteria criteria = session.createCriteria(MedicineSales.class);
			criteria.add(Restrictions.eq("uHID", uHID));
			return criteria;	
	 }
	 ////////////////////////////////check if exist in db or not///////////////////////////

	private boolean checksaleExistsInDatabase(String saleId) {
		 
		SessionFactory sf = SessionHelper.getConnection();
		Session session = sf.openSession();
 
		try {
			session.beginTransaction();
			Criteria criteria = session.createCriteria(MedicineSales.class);
			criteria.add(Restrictions.eq("saleId", saleId));
			List<MedicineSales> resultList = criteria.list();
 
			return !resultList.isEmpty();
		} finally {
			session.close();
		}
	}
	////////////////////////////////////////prescription_Id////////////////////////////////////////////////////////
	private boolean checkprescriptionIdExistsInDatabase(String prescription_Id) {
		 
		SessionFactory sf = SessionHelper.getConnection();
		Session session = sf.openSession();
 
		try {
			session.beginTransaction();
			Criteria criteria = session.createCriteria(MedicineSales.class);
			criteria.add(Restrictions.eq("prescription_Id", prescription_Id));
			List<MedicineSales> resultList = criteria.list();
 
			return !resultList.isEmpty();
		} finally {
			session.close();
		}
	}
	
	
	///////////////////////////////////////////////////////////////////////////////////////////////
	 public Criteria searchAllSales(Date startDate,Date endDate,String saleId,String prescription_Id,String providerId,String uHID) {
		 System.out.println("Search hitting....");
		 if((endDate==null)&&(startDate==null)&&(saleId==null ||saleId.isEmpty())&&(prescription_Id==null||prescription_Id.isEmpty())&&(providerId==null||providerId.isEmpty())&&(uHID==null||uHID.isEmpty())){
			 FacesMessage message=new FacesMessage(FacesMessage.SEVERITY_ERROR,"Enter atleast One Parameter",null);
			 FacesContext.getCurrentInstance().addMessage(null, message);
			 return null;
		 }
		 sf = SessionHelper.getConnection();
		 Map<String, Object> sessionMap = FacesContext.getCurrentInstance().getExternalContext().getSessionMap();
		 session=sf.openSession();
		 Criteria criteria = session.createCriteria(MedicineSales.class);
		 FacesContext context= FacesContext.getCurrentInstance();
		 
		 if (startDate != null && endDate == null) {
				System.out.println("enddate hitting hitting...........");
				FacesMessage message = new FacesMessage(FacesMessage.SEVERITY_ERROR, "Please Enter EndDate", null);
				FacesContext.getCurrentInstance().addMessage("searchform:eDate", message);
			

			}


		 if ((startDate == null || startDate.toString().isEmpty()) && endDate != null) {
			    // handle the case where startdate is empty or null, and enddate is not
			    System.out.println("StartDate hitting...........");
			    FacesMessage message = new FacesMessage(FacesMessage.SEVERITY_ERROR, "Please Enter StartDate", null);
			    FacesContext.getCurrentInstance().addMessage("searchform:sDate", message);
			} else if (startDate != null && (endDate == null || endDate.toString().isEmpty())) {
			    // handle the case where enddate is empty or null, and startdate is not
			    System.out.println("EndDate hitting...........");
			    FacesMessage message = new FacesMessage(FacesMessage.SEVERITY_ERROR, "Please Enter EndDate", null);
			    FacesContext.getCurrentInstance().addMessage("searchform:eDate", message);
			} else if (startDate != null && endDate != null) {
			    if (startDate.equals(endDate)) {
			        // handle the case where startdate and enddate are equal
			        System.out.println("Date mismatch hitting...........");
			        FacesMessage message = new FacesMessage(FacesMessage.SEVERITY_ERROR,
			                "Start Date and End Date should not be equal", null);
			        FacesContext.getCurrentInstance().addMessage("searchform:eDate", message);
			    } else if (startDate.after(endDate)) {
			        // handle the case where enddate is before startdate
			        System.out.println("Date mismatch hitting...........");
			        FacesMessage message = new FacesMessage(FacesMessage.SEVERITY_ERROR,
			                "End Date should not be before Start Date", null);
			        FacesContext.getCurrentInstance().addMessage("searchform:eDate", message);
			    } else {
			        // handle the case where both startdate and enddate are valid
			        sessionMap.put("startDate", startDate);
			        sessionMap.put("endDate", endDate);
			        criteria.add(Restrictions.ge("saleDate", startDate));
			        criteria.add(Restrictions.le("saleDate", endDate));
			    }
				List<MedicineSales> claimList = criteria.list();
			    boolean recordsFound = claimList.stream()
			            .anyMatch(claim -> claim.getSaleDate().after(startDate) && claim.getSaleDate().before(endDate));
 
			    if (!recordsFound) {
			        // handle the case where no records are found in the specified date range
			        System.out.println("No records found for the specified date range.");
			        FacesMessage errorMessage = new FacesMessage(FacesMessage.SEVERITY_ERROR,
			                "No records found for given date range.", null);
			        FacesContext.getCurrentInstance().addMessage("searchform:eDate", errorMessage); // Fix here
			    }
			
			}
		 if(saleId!=null && !saleId.isEmpty()) {
			 if(!saleId.matches("^S[0-9]+$")&& !saleId.matches("^s[0-9]+$") ) {	
				 System.out.println("Error printing....");
					FacesMessage message = new FacesMessage(FacesMessage.SEVERITY_ERROR,
							"Enter the Correct Sale ID", null);
					FacesContext.getCurrentInstance().addMessage("searchform:saleId", message);
				 //context.addMessage("searchform:saleId",new FacesMessage(FacesMessage.SEVERITY_ERROR,"Sale ID must contain number",null)); 
			 }
			 /////////////////////////////check if exist db or not/////////////////////////////////////////
				boolean saleIDExists = checksaleExistsInDatabase(saleId);
				if (!saleIDExists) {
					FacesMessage message = new FacesMessage(FacesMessage.SEVERITY_ERROR,
							"Record with Sale " + saleId + " not found in the database.", null);
					FacesContext.getCurrentInstance().addMessage("searchform:saleId", message);
					return null;
				}
 
				sessionMap.put("searchsale", saleId);
			}
		 if(prescription_Id!=null && !prescription_Id.isEmpty()) {
			 if(!prescription_Id.matches("^PS[0-9]+$") && !prescription_Id.matches("^ps[0-9]+$")) {
			 FacesMessage message = new FacesMessage(FacesMessage.SEVERITY_ERROR,
						"Prescription Details not found!!", null);
				FacesContext.getCurrentInstance().addMessage("searchform:prescription_Id", message);
			 }
			 /////////////////////////////check if exist db or not/////////////////////////////////////////
				boolean prescriptionIdExists = checkprescriptionIdExistsInDatabase(prescription_Id);
				if (!prescriptionIdExists) {
					FacesMessage message = new FacesMessage(FacesMessage.SEVERITY_ERROR,
							"Record with prescription Id " + prescription_Id + " not found in the database.", null);
					FacesContext.getCurrentInstance().addMessage("searchform:prescription_Id", message);
					return null;
				}
			 
			 sessionMap.put("searchprescription", prescription_Id);
			 //criteria.add(Restrictions.eq("prescription_Id", prescription_Id));
		 }
		 if(providerId != null && !providerId.isEmpty()) {
			    if(!providerId.matches("^PROV\\d*$") && !providerId.matches("^prov\\d*$")){
			    	FacesMessage message = new FacesMessage(FacesMessage.SEVERITY_ERROR,
							"Enter correct Provider ID", null);
					FacesContext.getCurrentInstance().addMessage("searchform:providerId", message);
			    	// context.addMessage("searchform:providerId", new FacesMessage(FacesMessage.SEVERITY_ERROR, "ProviderID must be correct", null));
			    }
			    sessionMap.put("searchprovider", providerId);
			   // criteria.add(Restrictions.eq("providerId", providerId));
			}
		 if (uHID != null && !uHID.isEmpty()) {
			    if (!uHID.matches("^IN\\d*$")) {
			    	FacesMessage message = new FacesMessage(FacesMessage.SEVERITY_ERROR,
							"Enter correct UHID", null);
					FacesContext.getCurrentInstance().addMessage("searchform:uHID", message);
			    	//  context.addMessage("searchform:uHID", new FacesMessage(FacesMessage.SEVERITY_ERROR, "UHID must be correct", null));
			    }
			    sessionMap.put("searchuhid", uHID);
			   // criteria.add(Restrictions.eq("uHID", uHID));
			}

		 return criteria;	
	 }
	 
	 
	 //----------------------------------------------
	 // pagination//
	 private String localCode;
		
		public String getLocalCode() {
			return localCode;
		}
		public void setLocalCode(String localCode) {
			this.localCode = localCode;
		}
		
		public List<MedicineSales> showMedicineSale(int firstRow, int rowCount) {
				  SessionFactory sf = SessionHelper.getConnection();
				  Session session = sf.openSession();
					Map<String, Object> sessionMap = FacesContext.getCurrentInstance().getExternalContext().getSessionMap();
					  Date startDate = (Date) sessionMap.get("startDate");
					    Date endDate = (Date) sessionMap.get("endDate");

					    if (startDate != null && endDate != null) {
					        Criteria cr = session.createCriteria(MedicineSales.class);
					        cr.add(Restrictions.ge("saleDate", startDate));
					        cr.add(Restrictions.le("saleDate", endDate));
					        cr.addOrder(Order.asc("saleDate"));
					        cr.setFirstResult(firstRow);
					        cr.setMaxResults(rowCount);
					        System.out.println(firstRow);
							  System.out.println(rowCount);
							  System.out.println(cr.list());
					        return cr.list();
					    }				
					
					String searchsale="";
					if (sessionMap.get("searchsale")!=null) {
						System.out.println("Found...");
						searchsale=(String)sessionMap.get("searchsale");
						  Criteria cr = session.createCriteria(MedicineSales.class);
						  cr.add(Restrictions.eq("saleId", searchsale));
						  cr.setFirstResult(firstRow);
						  cr.setMaxResults(rowCount);
						  System.out.println(firstRow);
						  System.out.println(rowCount);
						  System.out.println(cr.list());
						  return cr.list();
		}
					String searchprescription="";
					if (sessionMap.get("searchprescription")!=null) {
						System.out.println("Found...");
						searchprescription=(String)sessionMap.get("searchprescription");
						  Criteria cr = session.createCriteria(MedicineSales.class);
						  cr.add(Restrictions.eq("prescription_Id", searchprescription));
						  cr.setFirstResult(firstRow);
						  cr.setMaxResults(rowCount);
						  System.out.println(firstRow);
						  System.out.println(rowCount);
						  System.out.println(cr.list());
						  return cr.list();
		}
					String searchprovider="";
					if (sessionMap.get("searchprovider")!=null) {
						System.out.println("Found...");
						searchprovider=(String)sessionMap.get("searchprovider");
						  Criteria cr = session.createCriteria(MedicineSales.class);
						  cr.add(Restrictions.eq("providerId", searchprovider));
						  cr.setFirstResult(firstRow);
						  cr.setMaxResults(rowCount);
						  System.out.println(firstRow);
						  System.out.println(rowCount);
						  System.out.println(cr.list());
						  return cr.list();
		}
					String searchuhid="";
					if (sessionMap.get("searchuhid")!=null) {
						System.out.println("Found...");
						searchuhid=(String)sessionMap.get("searchuhid");
						  Criteria cr = session.createCriteria(MedicineSales.class);
						  cr.add(Restrictions.eq("uHID", searchuhid));
						  cr.setFirstResult(firstRow);
						  cr.setMaxResults(rowCount);
						  System.out.println(firstRow);
						  System.out.println(rowCount);
						  System.out.println(cr.list());
						  return cr.list();
		}
	 return null;
		}
		
		public List<MedicineSales> getListOfMedSale(int firstRow, int rowCount) {
			   Map<String, Object> sessionMap = FacesContext.getCurrentInstance().getExternalContext().getSessionMap();
			   System.out.println("Method hitting.....");
			   if (sessionMap.get("startDate") != null && sessionMap.get("endDate") != null) {
			        Date startDate = (Date) sessionMap.get("startDate");
			        Date endDate = (Date) sessionMap.get("endDate");
			        SessionFactory sf = SessionHelper.getConnection();
			        Session session = sf.openSession();
			        List<MedicineSales> cdList = null;

			        session.beginTransaction();
			        Criteria criteria = getSalesByDateRange(startDate, endDate);
			        criteria.setFirstResult(firstRow);
			        criteria.setMaxResults(rowCount);

			        System.out.println("From Pagination " + firstRow);
			        System.out.println("From Pagination Count   " + rowCount);
			        List<MedicineSales> saleList = criteria.list();

			        System.out.println(saleList);
			        sessionMap.put("saleList", saleList);
			        return saleList;
			    } 
			   
			   
			   if (sessionMap.get("searchsale")!=null) {
				   String saleId = (String)sessionMap.get("searchsale");
				   SessionFactory sf = SessionHelper.getConnection();
			    Session session = sf.openSession();
			    List<MedicineSales> cdList = null;
	 
			    session.beginTransaction();
			    Criteria criteria = searchBySaleId(saleId);
			    criteria.setFirstResult(firstRow);
			    criteria.setMaxResults(rowCount);
	 
			    System.out.println("From Pagination " +firstRow);
			    System.out.println("From Pagination Count   " +rowCount);
			    List<MedicineSales> saleList = criteria.list();
			    
			   System.out.println(saleList);
			    sessionMap.put("saleList", saleList);
			    return saleList;
			   }
			   if (sessionMap.get("searchprescription")!=null) {
				   String prescription_Id = (String)sessionMap.get("searchprescription");
				   SessionFactory sf = SessionHelper.getConnection();
			    Session session = sf.openSession();
			    List<MedicineSales> cdList = null;
	 
			    session.beginTransaction();
			    Criteria criteria = searchByprescription(prescription_Id);
			    criteria.setFirstResult(firstRow);
			    criteria.setMaxResults(rowCount);
	 
			    System.out.println("From Pagination " +firstRow);
			    System.out.println("From Pagination Count   " +rowCount);
			    List<MedicineSales> saleList = criteria.list();
			    
			   System.out.println(saleList);
			    sessionMap.put("saleList", saleList);
			    return saleList;
			   }
			   if (sessionMap.get("searchprovider")!=null) {
				   String providerId = (String)sessionMap.get("searchprovider");
				   SessionFactory sf = SessionHelper.getConnection();
			    Session session = sf.openSession();
			    List<MedicineSales> cdList = null;
	 
			    session.beginTransaction();
			    Criteria criteria = searchByprovider(providerId);
			    criteria.setFirstResult(firstRow);
			    criteria.setMaxResults(rowCount);
	 
			    System.out.println("From Pagination " +firstRow);
			    System.out.println("From Pagination Count   " +rowCount);
			    List<MedicineSales> saleList = criteria.list();
			    
			   System.out.println(saleList);
			    sessionMap.put("saleList", saleList);
			    return saleList;
			   }
			   if (sessionMap.get("searchuhid")!=null) {
				   String uHID = (String)sessionMap.get("searchuhid");
				   SessionFactory sf = SessionHelper.getConnection();
			    Session session = sf.openSession();
			    List<MedicineSales> cdList = null;
	 
			    session.beginTransaction();
			    Criteria criteria = searchByUHID(uHID);
			    criteria.setFirstResult(firstRow);
			    criteria.setMaxResults(rowCount);
	 
			    System.out.println("From Pagination " +firstRow);
			    System.out.println("From Pagination Count   " +rowCount);
			    List<MedicineSales> saleList = criteria.list();
			    
			   System.out.println(saleList);
			    sessionMap.put("saleList", saleList);
			    return saleList;
			   }
			   
			   return null;
		}
	 //-------------------------------------------------
	 

////////////////////////////////Reset the whole page//////////////////////	    
	    public void clear() throws IOException {
			System.out.println("Clear");
			FacesContext.getCurrentInstance().getExternalContext().invalidateSession();
			FacesContext.getCurrentInstance().getExternalContext().getSessionMap().put("clear all", null);
			
			ExternalContext ec = FacesContext.getCurrentInstance().getExternalContext();
			ec.redirect(((HttpServletRequest) ec.getRequest()).getRequestURI());
		}
	    ///////////////////////////////////////////////////////////////////
	    
	   public int countRows() {
			Map<String, Object> sessionMap = FacesContext.getCurrentInstance().getExternalContext().getSessionMap();
			SessionFactory sf = SessionHelper.getConnection();
			Session session = sf.openSession();
	 
			try {
				session.beginTransaction();
				Criteria criteria = session.createCriteria(MedicineSales.class);
	 
				if (sessionMap.get("searchprescription") != null) {
					String prescription_Id = (String) sessionMap.get("searchprescription");
					criteria.add(Restrictions.ilike("prescription_Id", "%" + prescription_Id + "%"));
				} else if (sessionMap.get("searchprovider") != null) {
					String providerId = (String) sessionMap.get("searchprovider");
					criteria.add(Restrictions.ilike("providerId", "%" + providerId + "%"));
				} else if (sessionMap.get("searchuhid") != null) {
					String uHID = (String) sessionMap.get("searchuhid");
					criteria.add(Restrictions.ilike("uHID", "%"+ uHID+"%" ));
				} else if (sessionMap.get("searchsale") != null) {
					String saleId = (String) sessionMap.get("searchsale");
					criteria.add(Restrictions.ilike("saleId", saleId + "%"));
				} else if (sessionMap.get("startDate") != null && sessionMap.get("endDate") != null) {
					Date startDate = (Date) sessionMap.get("startDate");
					Date endDate = (Date) sessionMap.get("endDate");
					criteria.add(Restrictions.ge("saleDate", startDate));
					criteria.add(Restrictions.le("saleDate", endDate));
				}
	 
				List<MedicineSales> filteredList = criteria.list();
				return filteredList.size();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				session.close();
			}
			return 0;
		}
		
		
/////////////////Sorting sale id///////////////////////////////////////		
		public List<MedicineSales> sortBySaleIdAsc(int firstRow, int rowsPerPage) {
			List<MedicineSales> medList = getListOfMedSale(firstRow, rowsPerPage);
			Collections.sort(medList, Comparator.comparing(MedicineSales::getSaleId));
			return medList;
		}
		public List<MedicineSales> sortBySaleIdDesc(int firstRow, int rowsPerPage) {
			List<MedicineSales> medList = getListOfMedSale(firstRow, rowsPerPage);
			Collections.sort(medList, Comparator.comparing(MedicineSales::getSaleId).reversed());
			return medList;
		}
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////Sorting Pharm Id//////////////////////////////////
		
		public List<MedicineSales> sortByPharmIdAsc(int firstRow, int rowsPerPage) {
			List<MedicineSales> medList = getListOfMedSale(firstRow, rowsPerPage);
			Collections.sort(medList, Comparator.comparing(MedicineSales::getPharm_id));
			return medList;
		}
		public List<MedicineSales> sortByPharmIdDesc(int firstRow, int rowsPerPage) {
			List<MedicineSales> medList = getListOfMedSale(firstRow, rowsPerPage);
			Collections.sort(medList, Comparator.comparing(MedicineSales::getPharm_id).reversed());
			return medList;
		}
///////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////Sorting MedName //////////////////////////////////
		
   public List<MedicineSales> sortByMedNameAsc(int firstRow, int rowsPerPage) {
   List<MedicineSales> medList = getListOfMedSale(firstRow, rowsPerPage);
   Collections.sort(medList, Comparator.comparing(MedicineSales::getMedId));
   return medList;
   }
  public List<MedicineSales> sortByMedNameDesc(int firstRow, int rowsPerPage) {
  List<MedicineSales> medList = getListOfMedSale(firstRow, rowsPerPage);
  Collections.sort(medList, Comparator.comparing(MedicineSales::getMedId).reversed());
  return medList;
  }
///////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////Sorting SaleDate //////////////////////////////////
	
public List<MedicineSales> sortBySaleDateAsc(int firstRow, int rowsPerPage) {
List<MedicineSales> medList = getListOfMedSale(firstRow, rowsPerPage);
Collections.sort(medList, Comparator.comparing(MedicineSales::getSaleDate));
return medList;
}
public List<MedicineSales> sortBySaleDateDesc(int firstRow, int rowsPerPage) {
List<MedicineSales> medList = getListOfMedSale(firstRow, rowsPerPage);
Collections.sort(medList, Comparator.comparing(MedicineSales::getSaleDate).reversed());
return medList;
}
///////////////////////////////////////////////////////////////////////////////////////////

////////////////////////////////Sorting Quantity //////////////////////////////////

public List<MedicineSales> sortByQuantityAsc(int firstRow, int rowsPerPage) {
List<MedicineSales> medList = getListOfMedSale(firstRow, rowsPerPage);
Collections.sort(medList, Comparator.comparing(MedicineSales::getQuantity));
return medList;
}
public List<MedicineSales> sortByQuantityDesc(int firstRow, int rowsPerPage) {
List<MedicineSales> medList = getListOfMedSale(firstRow, rowsPerPage);
Collections.sort(medList, Comparator.comparing(MedicineSales::getQuantity).reversed());
return medList;
}
///////////////////////////////////////////////////////////////////////////////////////////

////////////////////////////////Sorting ProviderId //////////////////////////////////
public List<MedicineSales> sortByProviderIdAsc(int firstRow, int rowsPerPage) {
List<MedicineSales> medList = getListOfMedSale(firstRow, rowsPerPage);
Collections.sort(medList, Comparator.comparing(MedicineSales::getProviderId));
return medList;
}
public List<MedicineSales> sortByProviderIdDesc(int firstRow, int rowsPerPage) {
List<MedicineSales> medList = getListOfMedSale(firstRow, rowsPerPage);
Collections.sort(medList, Comparator.comparing(MedicineSales::getProviderId).reversed());
return medList;
}
///////////////////////////////////////////////////////////////////////////////////
////////////////////////////////Sorting UHId //////////////////////////////////
public List<MedicineSales> sortByUHIdAsc(int firstRow, int rowsPerPage) {
List<MedicineSales> medList = getListOfMedSale(firstRow, rowsPerPage);
Collections.sort(medList, Comparator.comparing(MedicineSales::getuHID));
return medList;
}
public List<MedicineSales> sortByUHIdDesc(int firstRow, int rowsPerPage) {
List<MedicineSales> medList = getListOfMedSale(firstRow, rowsPerPage);
Collections.sort(medList, Comparator.comparing(MedicineSales::getuHID).reversed());
return medList;
}
///////////////////////////////////////////////////////////////////////////////////
////////////////////////////////Sorting UHId //////////////////////////////////
public List<MedicineSales> sortByPrescriptionIdAsc(int firstRow, int rowsPerPage) {
List<MedicineSales> medList = getListOfMedSale(firstRow, rowsPerPage);
Collections.sort(medList, Comparator.comparing(MedicineSales::getPrescription_Id));
return medList;
}
public List<MedicineSales> sortByPrescriptionIdDesc(int firstRow, int rowsPerPage) {
List<MedicineSales> medList = getListOfMedSale(firstRow, rowsPerPage);
Collections.sort(medList, Comparator.comparing(MedicineSales::getPrescription_Id).reversed());
return medList;
}
///////////////////////////////////////////////////////////////////////////////////

		
		//---------------------------------------------------------
		//---------- New Search
		
		public Criteria newsearchAllSales(String saleId, String prescription_Id, String providerId, String uHID) {
		    System.out.println("Search hitting....");

		    if ((saleId == null || saleId.isEmpty()) && (prescription_Id == null || prescription_Id.isEmpty())
		            && (providerId == null || providerId.isEmpty()) && (uHID == null || uHID.isEmpty())) {
		        FacesMessage message = new FacesMessage(FacesMessage.SEVERITY_ERROR, "Enter at least One Parameter", null);
		        FacesContext.getCurrentInstance().addMessage(null, message);
		        return null;
		    }

		    sf = SessionHelper.getConnection();
		    Map<String, Object> sessionMap = FacesContext.getCurrentInstance().getExternalContext().getSessionMap();
		    session = sf.openSession();
		    Criteria criteria = session.createCriteria(MedicineSales.class);
		    FacesContext context = FacesContext.getCurrentInstance();

		    if (saleId != null && !saleId.isEmpty()) {
		        if (!saleId.matches("^[0-9]*$")) {
		            context.addMessage("searchform:	", new FacesMessage(FacesMessage.SEVERITY_ERROR, "SaleID must be numeric", null));
		            return null; // Return null to stop further processing
		        }
		        sessionMap.put("searchsale", saleId);
		        // criteria.add(Restrictions.eq("saleId", saleId));
		    }
		    if (prescription_Id != null && !prescription_Id.isEmpty()) {
		        // Add additional checks if needed
		        sessionMap.put("searchprescription", prescription_Id);
		        // criteria.add(Restrictions.eq("prescription_Id", prescription_Id));
		    }
		    if (providerId != null && !providerId.isEmpty()) {
		        if (!providerId.matches("^PROV\\d*$")) {
		            context.addMessage("searchform:providerId", new FacesMessage(FacesMessage.SEVERITY_ERROR, "ProviderID must start with PROV and followed by digits", null));
		            return null; // Return null to stop further processing
		        }
		        sessionMap.put("searchprovider", providerId);
		        // criteria.add(Restrictions.eq("providerId", providerId));
		    }
		    if (uHID != null && !uHID.isEmpty()) {
		        if (!uHID.matches("^IN\\d*$")) {
		            context.addMessage("searchform:uHID", new FacesMessage(FacesMessage.SEVERITY_ERROR, "UHID must start with IN and followed by digits", null));
		            return null; // Return null to stop further processing
		        }
		        sessionMap.put("searchuhid", uHID);
		        // criteria.add(Restrictions.eq("uHID", uHID));
		    }

		    return criteria;
		}
 
		 
		//-------------------------------------------------//
		public Criteria searchAllDate(Date startDate, Date endDate) {
		    System.out.println("Search hitting....");
		    if ((endDate == null) && (startDate == null)) {
		        FacesMessage message = new FacesMessage(FacesMessage.SEVERITY_ERROR, "Enter at least One Parameter", null);
		        FacesContext.getCurrentInstance().addMessage(null, message);
		        return null;
		    }

		    if (startDate != null && endDate != null && endDate.before(startDate)) {
		        FacesMessage message = new FacesMessage(FacesMessage.SEVERITY_ERROR, "End date should not be before start date", null);
		        FacesContext.getCurrentInstance().addMessage(null, message);
		        return null;
		    }

		    sf = SessionHelper.getConnection();
		    Map<String, Object> sessionMap = FacesContext.getCurrentInstance().getExternalContext().getSessionMap();
		    session = sf.openSession();
		    Criteria criteria = session.createCriteria(MedicineSales.class);
		    FacesContext context = FacesContext.getCurrentInstance();

		    if (startDate != null && endDate != null) {
		        System.out.println("Date Hitting.....");
		        sessionMap.put("startDate", startDate);
		        sessionMap.put("endDate", endDate);
		       
		    }
		        List<MedicineSales> results = criteria.list();

		        if (results.isEmpty()) {
		            FacesMessage message = new FacesMessage(FacesMessage.SEVERITY_INFO, "No data available for the selected date range", null);
		            FacesContext.getCurrentInstance().addMessage(null, message);
		            return null;
		        }
		    

		    return criteria;
		}

////////////////////////-//////////////////////////////////-/////////////////////////////////////////
		 public String SearchSalesSingle(String saleId) {
		   	 System.out.println("method is hitting in search");
		   	 System.out.println(saleId);
		        Session session = SessionHelper.getConnection().openSession();
			     Map<String, Object> sessionMap = FacesContext.getCurrentInstance().getExternalContext().getSessionMap();
			     Criteria criteria = session.createCriteria(MedicineSales.class);
		        criteria.add(Restrictions.eq("saleId", saleId));
		        MedicineSales details=(MedicineSales) criteria.uniqueResult();
		        System.out.println(details);
		        sessionMap.put("details", details);
		        return "ShowDetails.jsp?faces-redirect=true";
		                
		    }
		 
}
