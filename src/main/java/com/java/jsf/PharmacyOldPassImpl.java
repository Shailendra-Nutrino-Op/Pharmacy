package com.java.jsf;

import java.util.Map;

import javax.faces.context.FacesContext;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

public class PharmacyOldPassImpl {
	SessionFactory sf;
	Session session;
	
	public String ResetPassWordOldpasss(PharmacyOldpass pharmacy) {
		String oldpass=EncryptPassword.getCode(pharmacy.getOldPassWord().trim());
		System.out.println(oldpass+" "+pharmacy.getOldPassWord());
		sf = SessionHelper.getConnection();
		session = sf.openSession();
		String username = pharmacy.getEmail().trim();
		Criteria cr=session.createCriteria(PharmacyOldpass.class);
		cr.add(Restrictions.eq("email", username));
		cr.add(Restrictions.eq("passWord", oldpass));

		PharmacyOldpass pharmaFound=(PharmacyOldpass) cr.uniqueResult();
		if(pharmaFound!=null) {
			String pass1=oldpass;
			String pass2=EncryptPassword.getCode(pharmacy.getPassWord());
			if((!(pass1.contentEquals(pass2)))){
				sf = SessionHelper.getConnection();
				session = sf.openSession();
				Transaction trans = session.beginTransaction();
				String encr=EncryptPassword.getCode(pharmacy.getPassWord());
				pharmaFound.setPassWord(encr);
				pharmaFound.setStatus("Active");
				pharmaFound.setOtp("");
				session.update(pharmaFound);
				String email=pharmaFound.getEmail();
				String subject = "Security alert";
				String messageText = "Hello,\n\nThe password for your LIC account "+email+" was changed."
						+ "if you didn't change it, you should recover your account.";
				MailSend.mailSend(email, subject, messageText);
				session.getTransaction().commit();
				return"LoginPage.jsp?faces-redirect=true";
			 }else {
				 Map<String,Object> sessionMap = 
							FacesContext.getCurrentInstance().getExternalContext().getSessionMap();
				 sessionMap.put("resetErr", "Can Not Use Previous Password");
				return"ResetPassWordPharmacythroughOld.jsp?faces-redirect=true";
			}
			
		}else {

			Map<String,Object> sessionMap = 
					FacesContext.getCurrentInstance().getExternalContext().getSessionMap();
			sessionMap.put("passWordErr", "Enter a valid password and try again.");
		  return"ResetPassWordPharmacythroughOld.jsp?faces-redirect=true";
		}
	}
}
