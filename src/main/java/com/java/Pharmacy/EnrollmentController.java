package com.java.Pharmacy;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;


public class EnrollmentController {
	
	private PharmacyDetail pharma;
	private PharmacyEnrollment daoImpl;
	Connection connection;
	PreparedStatement pst;
	SessionFactory sf;
	Session session;
	
	public PharmacyDetail getPharma() {
		return pharma;
	}
	public void setPharma(PharmacyDetail pharma) {
		this.pharma = pharma;
	}
    
	public PharmacyEnrollment getDaoImpl() {
		return daoImpl;
	}
	public void setDaoImpl(PharmacyEnrollment daoImpl) {
		this.daoImpl = daoImpl;
	}
	

	
	public String generateId() {
		
		
	    sf = SessionHelper.getConnection();
	    session = sf.openSession();
	    Criteria criteria = session.createCriteria(PharmacyDetail.class);
	    criteria.setProjection(Projections.max("pharm_id"));
	    String maxPharmaID = (String) criteria.uniqueResult();
	    
	    if (maxPharmaID == null) {
	        return "PH001";
	    } else {
	        try {
	            int num = Integer.parseInt(maxPharmaID.substring(2));
	            num++; 
	          
//	            System.out.println(String.format("PH%03d", num));
	            return String.format("PH%03d", num);
	        } catch (NumberFormatException e) {
	            return "";
	        }
	    }
	}
	public static  boolean allreadyLicencedExist(String lic) {
		SessionFactory sf;
		Session session;
		sf = SessionHelper.getConnection();
	    session = sf.openSession();
	    Criteria criteria = session.createCriteria(PharmacyDetail.class);
	    criteria.add(Restrictions.eq("lic_no", lic));
	    if(criteria.uniqueResult()!=null) {
	    	return true;
	    }else {
	    	return false;
	    }
	}
	public static  boolean allreadyRegisExist(String reg) {
		SessionFactory sf;
		Session session;
		sf = SessionHelper.getConnection();
	    session = sf.openSession();
	    Criteria criteria = session.createCriteria(PharmacyDetail.class);
	    criteria.add(Restrictions.eq("regd_no", reg));
	    if(criteria.uniqueResult()!=null) {
	    	return true;
	    }else {
	    	return false;
	    }
	}
	public static  boolean allreadyPhoneExist(String phone) {
		SessionFactory sf;
		Session session;
		sf = SessionHelper.getConnection();
	    session = sf.openSession();
	    Criteria criteria = session.createCriteria(PharmacyDetail.class);
	    criteria.add(Restrictions.eq("phone", phone));
	    if(criteria.uniqueResult()!=null) {
	    	return true;
	    }else {
	    	return false;
	    }
	}
	public static  boolean allreadyEmailExist(String email) {
		SessionFactory sf;
		Session session;
		sf = SessionHelper.getConnection();
	    session = sf.openSession();
	    Criteria criteria = session.createCriteria(PharmacyDetail.class);
	    criteria.add(Restrictions.eq("email", email));
	    if(criteria.uniqueResult()!=null) {
	    	return true;
	    }else {
	    	return false;
	    }
	}
	
    public static boolean findIntInString(String str) {
        Pattern pattern = Pattern.compile("\\d");
        Matcher matcher = pattern.matcher(str);
        return matcher.find();
    }
	public static boolean findIntinString(String input) {
		Pattern intPatt=Pattern.compile("\\d");
		Matcher intMatch=intPatt.matcher(input);
		return intMatch.find();
	}
	
	public static boolean isIntContainsString(String str) {
	       return str.matches("^-?\\d+$");
	    }
	
    public static boolean isStringConvertibleToInt(String str) {
        try {
            // Attempt to parse the string to an integer
            Integer.parseInt(str);
            return true; // If successful, return true
        } catch (NumberFormatException e) {
            return false; // If an exception is caught, return false
        }
    }
	
	
	public static boolean validatePharmacy(PharmacyDetail pDetail) {
	    FacesContext context = FacesContext.getCurrentInstance();
	    String regexEmail = "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$";
	    String regexLic = "^[A-Z]{2}PH\\d{7}$";
	    boolean flag = true;

	    if (pDetail.getShop_name().length() == 0 || pDetail.getShop_name().equals("Shop Name")) {
	        context.addMessage("form:shop", new FacesMessage("Shop Name should not be Null"));
	        flag = false;
	    }else {
		    if (!pDetail.getShop_name().matches(".*[a-zA-Z].*")) {
		        context.addMessage("form:shop", new FacesMessage("Shop name should contain mix numbers and alphabates"));
		        flag = false;
		    }
	    }

	    if (pDetail.getAddress().length() == 0 || pDetail.getAddress().equals("Address")) {
	        context.addMessage("form:add", new FacesMessage("Address should not be Null"));
	        flag = false;
	    }else {
	    	if (!pDetail.getAddress().matches(".*[a-zA-Z].*")) {
		        context.addMessage("form:add", new FacesMessage("Address should contain mix numbers and alphabates"));
		        flag = false;
		    }
	    }

	    if (pDetail.getLic_no().length()==0 || pDetail.getLic_no().equals("ST-PH-7Digit")) {
	        context.addMessage("form:lic", new FacesMessage("Lic Number should not be Null"));
	        flag = false;
	    }else {
	    	if (!Pattern.matches(regexLic, pDetail.getLic_no())) {
		        context.addMessage("form:lic", new FacesMessage("Lic Number should be in StateCode-PharmacyCode-7Digit"));
		        flag = false;
		    }
	    	boolean licExist=allreadyLicencedExist(pDetail.getLic_no());
	    	if(licExist) {
		        context.addMessage("form:lic", new FacesMessage("This Licence number allready exist, better to login?"));
		        flag = false;
	    	}
	    }

	    if (pDetail.getOwner_name().length()==0 || pDetail.getOwner_name().equals("Owner Name")) {
	        context.addMessage("form:Name", new FacesMessage("Specify the Owner name"));
	        flag = false;
	    }else {
		    if (pDetail.getOwner_name().length() < 5) {
		        context.addMessage("form:Name", new FacesMessage("Owner name should have more than 4 characters"));
		        flag = false;
		    }else {
		    	boolean intInName=findIntinString(pDetail.getOwner_name());
		    	if(intInName) {
			        context.addMessage("form:Name", new FacesMessage("Owner name should not contains Numbers"));
			        flag=false;
		    	}
		    }
	    }

	    if (pDetail.getRegd_no().length()==0 || pDetail.getRegd_no().equals("Registration Number")) {
	        context.addMessage("form:Regd", new FacesMessage("Please provide registration number"));
	        flag = false;
	    }else {
	    	if (pDetail.getRegd_no().length() != 5) {
		        context.addMessage("form:Regd", new FacesMessage("Registration Number should be 5 digits"));
		        flag = false;
		    }
	    	else {
		    	if(!isIntContainsString(pDetail.getRegd_no())) {
			        context.addMessage("form:Regd", new FacesMessage("Registration should not contain String"));
			        flag = false;
		    	}
		    	if(allreadyRegisExist(pDetail.getRegd_no())) {
			        context.addMessage("form:Regd", new FacesMessage("Registration is already exist"));
			        flag = false;
		    	}
	    	}
	    }

	    if (pDetail.getQualification().length() < 1) {
	        context.addMessage("form:Qual", new FacesMessage("Qualification should not be null"));
	        flag = false;
	    }

	    if (pDetail.getDate_of_registration() == null ) {
	        context.addMessage("form:dates", new FacesMessage("Date should not be Null"));
	        flag = false;
	    } else {
	    	if(pDetail.getDate_of_registration().equals("date of registration")) {
	    		context.addMessage("form:dates", new FacesMessage("Date should not be Null"));
		        flag = false;
	    	}
	    	else {
	    		LocalDate currentDate = LocalDate.now();
		        LocalDate registrationDate = pDetail.getDate_of_registration().toInstant().atZone(ZoneId.systemDefault()).toLocalDate();

		        if (registrationDate.isAfter(currentDate)) {
		            context.addMessage("form:dates", new FacesMessage("Date should not be after Today's Date"));
		            flag = false;
		        }
	    	}
	    }

	    if (pDetail.getPhone().length() == 0 || pDetail.getPhone().equals("Phone Number")) {
	        context.addMessage("form:phone", new FacesMessage("Specify the Phone number"));
	        flag = false;
	    }
	    else {
	    	if (pDetail.getPhone().length() != 10) {
		        context.addMessage("form:phone", new FacesMessage("Phone number should contain 10 digits"));
		        flag = false;
		    }
	    	if(!isIntContainsString(pDetail.getPhone())) {
			        context.addMessage("form:phone", new FacesMessage("Phone number should not contain alphabets"));
			        flag = false;
		    	}
	    	if(allreadyPhoneExist(pDetail.getPhone())) {
		        context.addMessage("form:phone", new FacesMessage("Phone number already exist, try different phone number"));
		        flag = false;
	    	}
		    
	    }


	    if (pDetail.getEmail().length()==0 || pDetail.getEmail().equals("Email")) {
	        context.addMessage("form:email", new FacesMessage("Specify a email of the pharmacist"));
	        flag = false;
	    }else {
	    	if (!Pattern.matches(regexEmail, pDetail.getEmail())) {
		        context.addMessage("form:email", new FacesMessage("Email is not correct format"));
		        flag = false;
		    }
	    	if(allreadyEmailExist(pDetail.getEmail())) {
		        context.addMessage("form:email", new FacesMessage("Email already exists"));
		        flag = false;
	    	}
	    }


	    if (pDetail.getRegulatory().length() == 0 || pDetail.getRegulatory().equals("Regulator Name")) {
	        context.addMessage("form:regul", new FacesMessage("Specify Regulatory"));
	        flag = false;
	    }else {
	    	if (findIntInString(pDetail.getRegulatory())) {
		        context.addMessage("form:regul", new FacesMessage("No Alphabates should be there"));
		        flag = false;
		    }
	    }
	    return flag;
	}

	
	public String enrollPharma(PharmacyDetail pDetails) throws ParseException, ClassNotFoundException, SQLException {
		 FacesContext context = FacesContext.getCurrentInstance();
//		 System.out.println("Result is  " +validatePharmacy(pDetails));
		if(validatePharmacy(pDetails)) {
			
			System.out.println("Validation Success....");
			return daoImpl.EnrollPharmacy(pDetails);
		}
		
		context.addMessage("form:zero", new FacesMessage("=&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&"));
		return "Error in Enrolling the Pharmacy ";
	}
	
    public String submitForm(ContactBean contact) {
    	String contSubject="Thank You for Contacting Us";
    	String contBody = "Dear " + contact.getName() + ",\n\n"
    	        + "Thank you for reaching out to us through our website's contact page. We appreciate your interest and value your communication.\n\n"
    	        + "We have received your message and will get back to you as soon as possible. Our team is dedicated to providing prompt and helpful assistance.\n\n"
    	        + "Your Message:\n"
    	        + contact.getMessage() + "\n\n"
    	        + "If your inquiry is urgent, please feel free to contact us directly.\n\n"
    	        + "Once again, thank you for considering us. We look forward to connecting with you soon.\n\n"
    	        + "Best regards" ;

		MailSend.mailOtp(contact.getEmail(), contSubject, contBody);
	        return "Menubar.xhtml?faces-redirect=true"; // Redirect to a success page
    }
}
