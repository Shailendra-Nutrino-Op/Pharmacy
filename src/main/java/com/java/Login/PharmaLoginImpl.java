package com.java.Login;

import java.util.Map;

import javax.faces.context.FacesContext;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

public class PharmaLoginImpl implements PharmaLoginDAO{
	
	SessionFactory sf;
	Session session;

	@Override
	public String validateOtp(PharmacyLogin pharma) {
		String otp = pharma.getDigit1()+pharma.getDigit2()+pharma.getDigit3()+pharma.getDigit4()+pharma.getDigit5();
		sf = SessionHelper.getConnection();
		Session session = sf.openSession();
		Criteria cr = session.createCriteria(PharmacyLogin.class);
		cr.add(Restrictions.eq("email", pharma.getEmail()));
		cr.add(Restrictions.eq("otp", otp));
		cr.setProjection(Projections.rowCount());
		long count = (long) cr.uniqueResult();
		if(count == 1) {
			return "Demo.jsp?faces-redirect=true";
			
		}
		else {
			
			Map<String,Object> sessionMap =
								FacesContext.getCurrentInstance().getExternalContext().getSessionMap();
						sessionMap.put("passWordErr", "Enter a valid password and try again.");
			return "PharmaValidate.jsp?faces-redirect=true";
		}
	}

	@Override
	public String loginDao(PharmacyLogin pharma) {
		sf = SessionHelper.getConnection();
		Session session = sf.openSession();
		Criteria cr = session.createCriteria(PharmacyLogin.class);
		cr.add(Restrictions.eq("email",pharma.getEmail()));
		cr.add(Restrictions.eq("password",EncryptPassword.getCode(pharma.getPassword())));
		
		cr.setProjection(Projections.rowCount());
		long count = (long) cr.uniqueResult();
		if(count == 1) {
			return"Demo.jsp?faces-redirect=true";
		}
		
		else {
			Map<String,Object> sessionMap =
					FacesContext.getCurrentInstance().getExternalContext().getSessionMap();
			sessionMap.put("passWordErr", "Enter a valid UserName and Password");
			
			return "PhrmaLogin.jsp?faces-redirect=true";
		}
	}

}
