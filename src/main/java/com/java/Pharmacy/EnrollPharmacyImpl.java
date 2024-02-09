package com.java.Pharmacy;

import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.faces.context.ExternalContext;
import javax.faces.context.FacesContext;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

public class EnrollPharmacyImpl {

	SessionFactory sf;
	Session session;

	public static String generateOtp() {
		Random r = new Random(System.currentTimeMillis());
		String otp = String.valueOf((1 + r.nextInt(2)) * 10000 + r.nextInt(10000));
		return otp;
	}

	// Id generation
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

	public String EnrollPharmacy(PharmacyDetail pharmacyDetails) {

		String Id = generateId();
		String otp = generateOtp();
		System.out.println("Generated Id is  " + Id);
		pharmacyDetails.setPharm_id(Id);
		System.out.println("Pharmacy Updated Details: " + pharmacyDetails);

		SessionFactory sessionFactory = SessionHelper.getConnection();
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.save(pharmacyDetails);
		transaction.commit();
		session.close();

		sf = SessionHelper.getConnection();
		session = sf.openSession();
		Transaction transaction1 = session.beginTransaction();
		Authentication auth = new Authentication();
		String encPass = EncryptPassword.getCode(pharmacyDetails.getPassword());
		auth.setPharmId(Id);
		auth.setOtp(otp);
		auth.setPassword(encPass);
		auth.setEmail(pharmacyDetails.getEmail());
		auth.setStatus("Auth Req");
		session.save(auth);
		transaction1.commit();
		session.close();

		String PharmacyEmail = pharmacyDetails.getEmail();
		String subject = "Pharmacy Enrollment Approval Notification";
		String body = "<html>" + "<head>" + "<style>" + "body {" + "  font-family: 'Helvetica', 'Arial', sans-serif;"
				+ "  line-height: 1.6;" + "  margin: 0;" + "  padding: 0;" + "  background-color: #f9f9f9;" + "}"
				+ ".container {" + "  max-width: 600px;" + "  margin: 20px auto;" + "  padding: 30px;"
				+ "  background-color: #ffffff;" + "  box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);"
				+ "  border-radius: 10px;" + "}" + "h1 {" + "  color: #333333;" + "  font-size: 24px;" + "}" + "p {"
				+ "  color: #555555;" + "  font-size: 16px;" + "  margin-bottom: 20px;" + "}" + ".otp {"
				+ "  background-color: #FF0000;" + "  color: #ffffff;" + "  padding: 8px 12px;"
				+ "  border-radius: 5px;" + "  font-size: 18px;" + "  display: inline-block;" + "}" + "</style>"
				+ "</head>" + "<body>" + "<div class='container'>" + "<h1>Dear " + pharmacyDetails.getOwner_name()
				+ ",</h1>"
				+ "<p>We are pleased to inform you that your application for pharmacy enrollment has been applied. Your pharmacy is now under approval.</p>"
				+ "<p>Your OTP for authentication is: <span class='otp'>" + otp + "</span></p>"
				+ "<img src='cid:image' style='max-width: 100%; height: auto; display: block; margin-top: 20px;' alt='Image'/>"
				+ "</div>" + "</body>" + "</html>";

		String imagepath = "D:\\163800845-removebg-preview.png";
		ImageMailSend.sendOtp(PharmacyEmail, subject, body, imagepath);

		System.out.println("==============Addd=================");
		System.out.println("Pharmacy Added");
		return "LoginPage.jsp?faces-redirect=true";

	}

	public List<PharmacyDetail> showPharmacy() {
		sf = SessionHelper.getConnection();
		session = sf.openSession();
		Criteria cr = session.createCriteria(PharmacyDetail.class);
		List<PharmacyDetail> showList = cr.list();
		return showList;
	}

	public String loginPharmacy(PharmacyDetail pharmacy) {
		sf = SessionHelper.getConnection();
		session = sf.openSession();
		Criteria cr = session.createCriteria(PharmacyDetail.class);
		cr.add(Restrictions.eq("email", pharmacy.getEmail()));
		PharmacyDetail pharm = (PharmacyDetail) cr.uniqueResult();

		Criteria cr1 = session.createCriteria(Authentication.class);
		cr1.add(Restrictions.eq("email", pharmacy.getEmail()));
		Authentication auth = (Authentication) cr1.uniqueResult();

		System.out.println("pharmacy: " + pharm != null);
		System.out.println("auth: " + auth != null);
		if (pharm != null) {
			String pass = EncryptPassword.getCode(pharmacy.getPassword());

			if (auth.getPassword().equals(pass)) {

				FacesContext facesContext = FacesContext.getCurrentInstance();
				ExternalContext externalContext = facesContext.getExternalContext();

				Map<String, Object> sessionMap = externalContext.getSessionMap();

				sessionMap.put("pharma", pharm);
				sessionMap.put("PharmaName", pharm.getShop_name());
				sessionMap.put("username", pharm.getEmail());

				return "PharmacyDashboard.jsp?faces-redirect=true";
			} else {
				Map<String, Object> sessionMap = FacesContext.getCurrentInstance().getExternalContext().getSessionMap();
				sessionMap.put("error", "No Pharmacy Details Available, Please Login");

				return "";
			}
		} else {
			Map<String, Object> sessionMap = FacesContext.getCurrentInstance().getExternalContext().getSessionMap();
			sessionMap.put("error", "No Pharmacy Details Available, Please Login with Correct Credentials");
			pharmacy.setEmail(null);
			pharmacy.setPassword(null);
			System.out.println("Pharma Not Available, Enrollment Required");
			return "";
		}
	}

}
