package com.java.Login;

import java.util.Map;

import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;

public class Controller {
    private Login login;
    private LoginDAOImpl daoImpl;
    
    private PharmacyLogin pharma;
    private PharmaLoginImpl pharmaDao;
    

    public Login getLogin() {
		return login;
	}

	public void setLogin(Login login) {
		this.login = login;
	}

	public LoginDAOImpl getDaoImpl() {
		return daoImpl;
	}

	public void setDaoImpl(LoginDAOImpl daoImpl) {
		this.daoImpl = daoImpl;
	}

	public PharmacyLogin getPharma() {
		return pharma;
	}

	public void setPharma(PharmacyLogin pharma) {
		this.pharma = pharma;
	}

	public PharmaLoginImpl getPharmaDao() {
		return pharmaDao;
	}

	public void setPharmaDao(PharmaLoginImpl pharmaDao) {
		this.pharmaDao = pharmaDao;
	}

	public String loginValidate2() {
        if (addValid()) {
            return daoImpl.loginDao(login);
        }
        return "";
    }
	
	public String pharmaValidate() {
		if(pharmValid()) {
			return pharmaDao.loginDao(pharma);
		}
		return "";
	}
	
	public boolean pharmValid() {
		 FacesContext context = FacesContext.getCurrentInstance();
	        Map<String, Object> sessionMap = context.getExternalContext().getSessionMap();

	        String user = pharma.getEmail();
	       
	        boolean flag = true;

	        String pass = EncryptPassword.getCode(pharma.getPassword());
	        System.out.println("test : "+user);
	        if (pharma.getEmail().length() <= 0 || pharma.getEmail().equals("") || pharma.getEmail().isEmpty()) {
	            context.addMessage("form:username", new FacesMessage("User name cannot be empty"));
	            System.out.println("User name cannot be empty");
	            sessionMap.put("cerr", "user Name cannot be empty");
	            flag = false;
	        }

	        if (pharma.getPassword().length() <= 0) {
	            context.addMessage("form:passInput", new FacesMessage("Password cannot be empty"));
	            System.out.println("Password cannot be empty");
	            sessionMap.put("cerr2", "Password cannot be empty");
	            flag = false;
	        }

	        return flag;
	    
	}

    public boolean addValid() {
        FacesContext context = FacesContext.getCurrentInstance();
        Map<String, Object> sessionMap = context.getExternalContext().getSessionMap();

        String user = login.getUserName();
       
        boolean flag = true;

        String pass = EncryptPassword.getCode(login.getPassword());
        System.out.println("test : "+user);
        if (login.getUserName().length() <= 0 || login.getUserName().equals("") || login.getUserName().isEmpty()) {
            context.addMessage("form:username", new FacesMessage("User name cannot be empty"));
            System.out.println("User name cannot be empty");
            sessionMap.put("cerr", "user Name cannot be empty");
            flag = false;
        }

        if (login.getPassword().length() <= 0) {
            context.addMessage("form:passInput", new FacesMessage("Password cannot be empty"));
            System.out.println("Password cannot be empty");
            sessionMap.put("cerr2", "Password cannot be empty");
            flag = false;
        }

        return flag;
    }
}
