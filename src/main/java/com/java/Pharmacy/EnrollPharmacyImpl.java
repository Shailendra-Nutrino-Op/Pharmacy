package com.java.Pharmacy;



import java.security.SecureRandom;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.persistence.EntityManager;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.criterion.Subqueries;

public class EnrollPharmacyImpl implements PharmacyEnrollment{
	
	SessionFactory sf;
	Session session;
	
	
	private static final String ALPHA_NUMERIC_STRING = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";

    public static String generateAlphanumericOTP(int length) {
        StringBuilder builder = new StringBuilder();
        SecureRandom random = new SecureRandom();

        for (int i = 0; i < length; i++) {
            int index = random.nextInt(ALPHA_NUMERIC_STRING.length());
            builder.append(ALPHA_NUMERIC_STRING.charAt(index));
        }

        return builder.toString();
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
	            return String.format("PH%03d", num);
	        } catch (NumberFormatException e) {
	            return "";
	        }
	    }
	}


	@Override
	public String EnrollPharmacy(PharmacyDetail pharmacyDetails) throws ParseException, ClassNotFoundException, SQLException {
	
	        String Id = generateId();
	        String otp=generateAlphanumericOTP(8);
	        System.out.println("Generated Id is  " +Id);
	        pharmacyDetails.setPharm_id(Id);
	        System.out.println("Pharmacy Updated Details: " + pharmacyDetails);

	        SessionFactory sessionFactory = SessionHelper.getConnection();
	        Session session = sessionFactory.openSession();
	        Transaction transaction = session.beginTransaction();
	        session.save(pharmacyDetails);
	        transaction.commit();

	        session.close();
	    
       
		
		sf=SessionHelper.getConnection();
		session=sf.openSession();
		Transaction transaction1 = session.beginTransaction();
		Authentication auth= new Authentication();
        auth.setPharmId(Id);
        auth.setOtp(otp);
        auth.setEmail(pharmacyDetails.getEmail());
        auth.setStatus("Auth Req");
        session.save(auth);
        transaction1.commit();
        session.close();
        
		
		String PharmacyEmail=pharmacyDetails.getEmail();
		String subject="Pharmacy Enrollment Approval Notification";
		String body = "<html>"
                + "<head>"
                + "<style>"
                + "body {"
                + "  font-family: 'Helvetica', 'Arial', sans-serif;"
                + "  line-height: 1.6;"
                + "  margin: 0;"
                + "  padding: 0;"
                + "  background-color: #f9f9f9;"
                + "}"
                + ".container {"
                + "  max-width: 600px;"
                + "  margin: 20px auto;"
                + "  padding: 30px;"
                + "  background-color: #ffffff;"
                + "  box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);"
                + "  border-radius: 10px;"
                + "}"
                + "h1 {"
                + "  color: #333333;"
                + "  font-size: 24px;"
                + "}"
                + "p {"
                + "  color: #555555;"
                + "  font-size: 16px;"
                + "  margin-bottom: 20px;"
                + "}"
                + ".otp {"
                + "  background-color: #FF0000;"
                + "  color: #ffffff;"
                + "  padding: 8px 12px;"
                + "  border-radius: 5px;"
                + "  font-size: 18px;"
                + "  display: inline-block;"
                + "}"
                + "</style>"
                + "</head>"
                + "<body>"
                + "<div class='container'>"
                + "<h1>Dear " + pharmacyDetails.getOwner_name() + ",</h1>"
                + "<p>We are pleased to inform you that your application for pharmacy enrollment has been approved. Your pharmacy is now officially registered with our organization.</p>"
                + "<p>Your OTP for authentication is: <span class='otp'>" + otp + "</span></p>"
                + "<img src='cid:image' style='max-width: 100%; height: auto; display: block; margin-top: 20px;' alt='Image'/>"
                + "</div>"
                + "</body>"
                + "</html>";



		String imagepath="D:\\163800845-removebg-preview.png";
		ImageMailSend.sendOtp(PharmacyEmail, subject, body, imagepath);
		
		
	//	MailSend.mailOtp(PharmacyEmail, subject, body);
		System.out.println("================================Addd=================================================");
		System.out.println("Pharmacy Added");
		return "Menu.jsp?faces-redirect=true";
		
	}


	@Override
	public List<PharmacyDetail> showPharmacy() {
		sf=SessionHelper.getConnection();
		session=sf.openSession();
		Criteria cr= session.createCriteria(PharmacyDetail.class);
		List<PharmacyDetail> showList=cr.list();
		System.out.println("===================================Show====================================================");
		return showList;
	}
}
