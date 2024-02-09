package com.java.Pharmacy;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;
import java.util.Map;
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
	Connection connection;
	private EnrollPharmacyImpl daoImpl;
	PreparedStatement pst;
	SessionFactory sf;
	Session session;
	
	public PharmacyDetail getPharma() {
		return pharma;
	}
	public void setPharma(PharmacyDetail pharma) {
		this.pharma = pharma;
	}
		
	public EnrollPharmacyImpl getDaoImpl() {
		return daoImpl;
	}
	public void setDaoImpl(EnrollPharmacyImpl daoImpl) {
		this.daoImpl = daoImpl;
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
            Integer.parseInt(str);
            return true; 
        } catch (NumberFormatException e) {
            return false; 
        }
    }
    
    public static boolean containsSpecialCharacter(String input) {
        Pattern specialCharacterPattern = Pattern.compile("[@_!#$%^&*()<>?/\\|}{~:]");
        Matcher matcher = specialCharacterPattern.matcher(input);
        return matcher.find();
    }
    
    public static boolean checkChars(String ch) {
        String characters = "-+=.,/;`";
        for (int i = 0; i < characters.length(); i++) {
            if (ch.contains(String.valueOf(characters.charAt(i)))) {
                return true;
            }
        }
        return false;
    }
    
    
	
	public static boolean validatePharmacy(PharmacyDetail pDetail) {
	    FacesContext context = FacesContext.getCurrentInstance();
	    String regexEmail = "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$";
	    String regexLic = "^[A-Z]{2}PH\\d{7}$";
	    boolean flag = true;

	    if (pDetail.getShop_name().length() == 0) {
	        context.addMessage("form:shop", new FacesMessage("Give a Shop Name"));
	        flag = false;
	    }else {
		    if (!pDetail.getShop_name().matches(".*[a-zA-Z].*")) {
		        context.addMessage("form:shop", new FacesMessage("Shop name should contain mix numbers and alphabates"));
		        flag = false;
		    }
		    if (containsSpecialCharacter(pDetail.getShop_name())) {
		        context.addMessage("form:shop", new FacesMessage("Shop name should not contain Special characters"));
		        flag = false;
		    }
	    }
	    
	    /////////////////////////////////////////////////////////////////////////////

	    if (pDetail.getAddress().length() == 0) {
	        context.addMessage("form:add", new FacesMessage("Specify your address"));
	        flag = false;
	    }else {
	    	if (!pDetail.getAddress().matches(".*[a-zA-Z].*")) {
		        context.addMessage("form:add", new FacesMessage("Address should contain mix numbers and alphabates"));
		        flag = false;
		    }
	    	if (containsSpecialCharacter(pDetail.getAddress())) {
		        context.addMessage("form:add", new FacesMessage("Address should not contain Special characters"));
		        flag = false;
		    }
	    }
	    
	    ///////////////////////////////////////////////////////////////////////////////////

	    if (pDetail.getLic_no().length()==0) {
	        context.addMessage("form:lic", new FacesMessage("Licence number required"));
	        flag = false;
	    }else {
	    	if (!Pattern.matches(regexLic, pDetail.getLic_no())) {
		        context.addMessage("form:lic", new FacesMessage("Lic Number should be in StateCode-PH-7Digit"));
		        flag = false;
		    }
	    	boolean licExist=allreadyLicencedExist(pDetail.getLic_no());
	    	if(licExist) {
		        context.addMessage("form:lic", new FacesMessage("This Licence number allready exist, better to login?"));
		        flag = false;
	    	}
	    }
	    
	    ///////////////////////////////////////////////////////////////////////////////////

	    if (pDetail.getOwner_name().length()==0) {
	        context.addMessage("form:Name", new FacesMessage("Specify the Owner name"));
	        flag = false;
	    }else {
		    if (pDetail.getOwner_name().length() < 5) {
		        context.addMessage("form:Name", new FacesMessage("Owner name should have more than 5 characters"));
		        flag = false;
		    }else {
		    	boolean intInName=findIntinString(pDetail.getOwner_name());
		    	if(intInName) {
			        context.addMessage("form:Name", new FacesMessage("Owner name should not contains Numbers"));
			        flag=false;
		    	}
		    	if (containsSpecialCharacter(pDetail.getOwner_name())) {
			        context.addMessage("form:Name", new FacesMessage("Owners name  should not contains Special characters"));
			        flag = false;
			    }
		    	if (checkChars(pDetail.getOwner_name())) {
			        context.addMessage("form:Name", new FacesMessage("Owners name  should not contains characters"));
			        flag = false;
			    }
		    }
	    }
	    
	    ///////////////////////////////////////////////////////////////////////////////////

	    if (pDetail.getRegd_no().length()==0 ) {
	        context.addMessage("form:Regd", new FacesMessage("Provide registration number"));
	        flag = false;
	    } else {
		    if(pDetail.getRegd_no().contains("-") || pDetail.getRegd_no().substring(0, 1).equals("0")) {
		    	 context.addMessage("form:Regd", new FacesMessage("Give appropriate number"));
			        flag = false;
		    }
	    	if (pDetail.getRegd_no().length() != 5) {
		        context.addMessage("form:Regd", new FacesMessage("5 digit Regn. required"));
		        flag = false;
		    }
	    	else {
		    	if (containsSpecialCharacter(pDetail.getRegd_no())) {
			        context.addMessage("form:Regd", new FacesMessage("Special character not allowed"));
			        flag = false;
			    }else {
			    	if(!isIntContainsString(pDetail.getRegd_no())) {
				        context.addMessage("form:Regd", new FacesMessage("String not allowed"));
				        flag = false;
			    	}
			    }
		    	
		    	if(allreadyRegisExist(pDetail.getRegd_no())) {
			        context.addMessage("form:Regd", new FacesMessage("Registration is already exist"));
			        flag = false;
		    	}
	    	}
	    }
	    
	    ///////////////////////////////////////////////////////////////////////////////////

	    if (pDetail.getQualification().length() < 1) {
	        context.addMessage("form:Qual", new FacesMessage("Select a Qualification"));
	        flag = false;
	    }
	    
	    ///////////////////////////////////////////////////////////////////////////////////

	    if (pDetail.getDate_of_registration() == null ) {
	        context.addMessage("form:dates", new FacesMessage("Specify the Reg. Date"));
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
		            context.addMessage("form:dates", new FacesMessage("Should not be after Today's Date"));
		            flag = false;
		        }
	    	}
	    }
	    
	    ///////////////////////////////////////////////////////////////////////////////////

	    if (pDetail.getPhone().length() == 0 ) {
	        context.addMessage("form:phone", new FacesMessage("Specify the Phone number"));
	        flag = false;
	    }
	    
	    else {
	    	if(pDetail.getPhone().contains("-")) {
	    		context.addMessage("form:phone", new FacesMessage("Phone number should be appropriate"));
		        flag = false;
	    	}
	    	if(pDetail.getPhone().charAt(0)=='0') {
	    		context.addMessage("form:phone", new FacesMessage("Remove 0 from start"));
		        flag = false;
	    	}
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

	    ///////////////////////////////////////////////////////////////////////////////////

	    if (pDetail.getEmail().length()==0 ) {
	        context.addMessage("form:email", new FacesMessage("Specify a email of the pharmacist"));
	        flag = false;
	    }else {
	    	if (!Pattern.matches(regexEmail, pDetail.getEmail())) {
		        context.addMessage("form:email", new FacesMessage("Email is not correct format"));
		        flag = false;
		    }
	    	if(allreadyEmailExist(pDetail.getEmail())) {
		        context.addMessage("form:email", new FacesMessage("Email already exists, want to Login?"));
		        flag = false;
	    	}
	    }

	    ///////////////////////////////////////////////////////////////////////////////////

	    if (pDetail.getRegulatory().length() == 0) {
	        context.addMessage("form:regul", new FacesMessage("Specify Regulatory"));
	        flag = false;
	    }else {
	    	if (findIntInString(pDetail.getRegulatory())) {
		        context.addMessage("form:regul", new FacesMessage("No number should be there"));
		        flag = false;
		    }
	    	if (containsSpecialCharacter(pDetail.getRegulatory())) {
		        context.addMessage("form:regul", new FacesMessage("Regulatory should not contain Special charaters"));
		        flag = false;
		    }
	    	if(pDetail.getRegulatory().contains("-") || pDetail.getRegulatory().contains("+") || pDetail.getRegulatory().contains("=")) {
	    		context.addMessage("form:regul", new FacesMessage("Regulatory should not contain Special charaters"));
		        flag = false;
	    	}
	    }
	    
	    ///////////////////////////////////////////////////////////////////////////////////
	    
	    String regexPass="^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$";
	    if(pDetail.getPassword().length() == 0) {
	        context.addMessage("form:pass", new FacesMessage("Password required"));
	        flag = false;
	    }else {
	    	if(!Pattern.matches(regexPass, pDetail.getPassword())) {
		        context.addMessage("form:pass", new FacesMessage("Require Uppercase, lowercase, Number, Special character"));
		        flag = false;
	    	}
	    }
	    if(pDetail.getSecu_Question().length()==0) {
	        context.addMessage("form:secQ", new FacesMessage("Question required"));
	    	flag=false ;
	    }
	    if(pDetail.getSecu_Answer().length()==0) {
	        context.addMessage("form:secA", new FacesMessage("Security Answer required"));
	     flag=false;
	    }
	    
	    return flag;
	}

	
	public String enrollPharma(PharmacyDetail pDetails) throws ParseException, ClassNotFoundException, SQLException {
		if(validatePharmacy(pDetails)) {
			
			System.out.println("Validation Success....");
			return daoImpl.EnrollPharmacy(pDetails);
		}
		
		return "";
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
	        return "Menu.jsp?faces-redirect=true"; // Redirect to a success page
    }
    
    public String logout() {
              return "LoginPage.jsp?faces-redirect=true";
    }
    
    public void Reset(PharmacyDetail pharmacy) {
    	pharmacy.setShop_name(null);
    	pharmacy.setAddress(null);
    	pharmacy.setLic_no(null);
    	pharmacy.setOwner_name(null);
    	pharmacy.setRegd_no(null);
    	pharmacy.setQualification(null);
    	pharmacy.setDate_of_registration(null);
    	pharmacy.setPhone(null);
    	pharmacy.setEmail(null);
    	pharmacy.setRegulatory(null);
    	pharmacy.setPassword(null);
    }
}
