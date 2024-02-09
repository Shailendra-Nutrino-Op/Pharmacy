package com.java.jsf;

import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.naming.NamingException;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;

public class PharmacyOldPasscontroller {
	private  PharmacyOldPassImpl pharmaOldpassImpl;
	private PharmacyOldpass pharmaOldpass;
	
	
	
	public PharmacyOldPassImpl getPharmaOldpassImpl() {
		return pharmaOldpassImpl;
	}

	public void setPharmaOldpassImpl(PharmacyOldPassImpl pharmaOldpassImpl) {
		this.pharmaOldpassImpl = pharmaOldpassImpl;
	}

	public PharmacyOldpass getPharmaOldpass() {
		return pharmaOldpass;
	}

	public void setPharmaOldpass(PharmacyOldpass pharmaOldpass) {
		this.pharmaOldpass = pharmaOldpass;
	}

	public String ResetPassWord(String usernamere) throws NamingException {
		if (addValid()) {
			pharmaOldpass.setEmail(usernamere);
				return pharmaOldpassImpl.ResetPassWordOldpasss(pharmaOldpass);
		}
		return "";
	}
	
	public boolean addValid() {
		Map<String, Object> sessionMap = FacesContext.getCurrentInstance().getExternalContext().getSessionMap();
			FacesContext context = FacesContext.getCurrentInstance();
			
		String passCode=pharmaOldpass.getPassWord();
		String oldPass=pharmaOldpass.getOldPassWord();
		//String retypePaccode=customer.getRetypePassCode();
		Pattern patternPass = Pattern.compile(passCode);
		Matcher matcherPass = patternPass.matcher(String.valueOf(pharmaOldpass.getResetPasword()));
		//String userName=customer.;
		boolean flag=true;
		
		if(pharmaOldpass.getOldPassWord().isEmpty()) {
			context.addMessage("form:oldPassWord", new FacesMessage("Please enter current password."));
			flag= false;
		}
//		if(!(pharmaOldpass.getPassWord().contains(oldPass))) {
//			context.addMessage("form:oldPassWord", new FacesMessage("Provide Valid Old passWord"));
//			flag= false;
//		}
		if(pharmaOldpass.getPassWord().isEmpty()) {
			context.addMessage("form:password", new FacesMessage("Please enter password."));
			flag= false;
		}
		if(pharmaOldpass.getResetPasword().isEmpty()) {
				context.addMessage("form:retypePassWord", new FacesMessage("Please enter confirm password."));
				flag= false;
			}
		
		if(!(passCode.matches("^\\S+$")) ) {
			   context.addMessage("form:password", new FacesMessage("Spaces are not allowed."));
			   flag= false;
		   }
		
		if(!( 8 <= passCode.length() && passCode.length() <= 32)  )
		   {
			context.addMessage("form:password", new FacesMessage("Password must be at least 8 characters long.e.g:John@123"));
			flag= false;
		   }
		   if(!(passCode.matches(".*\\d.*")) ) {
			   context.addMessage("form:password", new FacesMessage("Password must include at least one number.e.g:John@123"));
			   flag= false;
		   }
		   if(!(passCode.matches(".*[a-z].*"))) {
			   context.addMessage("form:password", new FacesMessage("Password must include at least one small letter.e.g:John@123"));
			   flag= false;
		   }
		   if(!(passCode.matches(".*[A-Z].*"))) {
		     context.addMessage("form:password", new FacesMessage("Password must include at least one capital letter.e.g:John@123"));
		     flag= false;
		   }
		    if(!(passCode.matches(".*[!@#$%^&*()_+\\-=\\[\\]{};':\"\\\\|,.<>/?].*"))) {
		    	context.addMessage("form:password", new FacesMessage("Password must include at least one special character.e.g:John@123"));
		    	flag= false;
		   }
		    
		   
		    if(!matcherPass.matches()) {
				context.addMessage("form:retypePassWord", new FacesMessage("Password and confirm password must match."));
				flag= false;
			}
		    sessionMap.remove("resetErr");
		    sessionMap.remove("passWordErr");
	    return flag;
	}
	

}
