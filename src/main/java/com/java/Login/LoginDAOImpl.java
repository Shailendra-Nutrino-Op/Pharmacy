package com.java.Login;

import java.util.Map;
import java.util.Random;

import javax.faces.context.FacesContext;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Projection;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;




public class LoginDAOImpl implements LoginDAO{
	SessionFactory sf;
	Session session;
	public static int generateOtp() {
		Random r = new Random(System.currentTimeMillis());
		return ((1 + r.nextInt(2)) * 10000 + r.nextInt(10000));
	}

	@Override
	public String verifyOtp(Login login) {
		sf = SessionHelper.getConnection();
		Session session = sf.openSession();
		String pass = login.getDigit1()+ login.getDigit2()+ login.getDigit3()+ login.getDigit4()+
				login.getDigit5();
		
		System.out.println("password from otp"+pass);
		
		Criteria cr = session.createCriteria(Login.class);
		cr.add(Restrictions.eq("userName", login.getUserName()));
		cr.add(Restrictions.eq("otp", pass));
		cr.setProjection(Projections.rowCount());
		long count = (long) cr.uniqueResult();
		if(count == 1) {
			return "Demo.jsp?faces-redirect=true";
		}
		else {
			Map<String,Object> sessionMap =
					FacesContext.getCurrentInstance().getExternalContext().getSessionMap();
			sessionMap.put("passWordErr90", "Enter a valid OTP");
			return "ValidateOtp.jsp?faces-redirect=true";
		}
		
		
	}

	@Override
	public String loginDao(Login login) {
		System.out.println("Inside login");
		sf = SessionHelper.getConnection();
		Session session = sf.openSession();
		Criteria cr = session.createCriteria(Login.class);
		cr.add(Restrictions.eq("userName",login.getUserName()));
		cr.add(Restrictions.eq("password",EncryptPassword.getCode(login.getPassword())));
		
		cr.setProjection(Projections.rowCount());
		long count = (long) cr.uniqueResult();
		if(count == 1) {
			return"Demo.jsp?faces-redirect=true";
		}
		
		else {
			Map<String,Object> sessionMap =
					FacesContext.getCurrentInstance().getExternalContext().getSessionMap();
			sessionMap.put("passWordErr4", "Enter a valid UserName and Password.");
			return "Login.jsp?faces-redirect=true";
		}
	}

	@Override
	public String loginWithOtp(Login login) {
	    sf = SessionHelper.getConnection();
	    Session session = sf.openSession();
	    Transaction trans = session.beginTransaction();
	    Criteria cr = session.createCriteria(Login.class);
	    cr.add(Restrictions.eq("userName", login.getUserName()));
	   Map<String, Object> sessionMap = FacesContext.getCurrentInstance().getExternalContext().getSessionMap();
	   sessionMap.put("username", login.getUserName());

	    Login log = (Login) cr.uniqueResult();

	    if (log != null) {
	        String email = log.getEmail();
	        int otp = generateOtp();
	        
	        log.setLotp(String.valueOf(otp));
//	        session.save(log); // Hibernate will automatically generate the ID
	        

	        String subject = "Welcome to My app";
	        String body = "Welcome to Mr/Miss " + log.getUserName() + "\r\n"
	                + "Your OTP Generated Successfully..." + "\r\n" + "OTP is " + otp;

	        // Send email with OTP
	        MailSend.mailSend(email, "Otp Send Successfully...", body);
	        session.update(log);
	        session.getTransaction().commit();
	        return "OtpLogin.jsp?faces-redirect=true";
	    } else {
	        // Handle the case where the user is not found
	        // You may want to throw an exception, log an error, or take appropriate action
	    }

	    return null;
	}
	
	public String verifyOtpLogin(Login login) {
		sf = SessionHelper.getConnection();
		Session session = sf.openSession();
		String pass = login.getDigit1()+ login.getDigit2()+ login.getDigit3()+ login.getDigit4()+
				login.getDigit5();
		Criteria cr = session.createCriteria(Login.class);
		 Map<String, Object> sessionMap = 
				 FacesContext.getCurrentInstance().getExternalContext().getSessionMap();
		 String userName = (String) sessionMap.get("username");
		cr.add(Restrictions.eq("userName", userName));
		cr.add(Restrictions.eq("lotp", pass));
		cr.setProjection(Projections.rowCount());
		long count = (long) cr.uniqueResult();
		if(count == 1) {
			return "Demo.jsp?faces-redirect=true";
		}
		else {
			Map<String,Object> sessionMap2 =
					FacesContext.getCurrentInstance().getExternalContext().getSessionMap();
			sessionMap2.put("passWordErr91", "Enter a valid OTP");
			return "OtpLogin.jsp?faces-redirect=true";
		}
		
		
	}



}
