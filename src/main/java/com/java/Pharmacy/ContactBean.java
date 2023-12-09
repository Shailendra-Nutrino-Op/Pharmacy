package com.java.Pharmacy;

import javax.faces.bean.ManagedBean;

@ManagedBean
public class ContactBean {
    private String name;
    private String email;
    private String message;

    // Getters and setters for the fields

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    // Method to process the form submission
    public String submitForm1(ContactBean contact) throws InterruptedException {
    	String contSubject="Connect to Hospital";
    	String contBody = "Hi " + contact.getName() + ",<br><br>"
    	        + "You have sent an application to your hospital. "
    	        + "The respective representative will contact you as soon as possible.<br><br>"
    	        + "<div>"
    	        + "<p style='font-size: 18px; font-weight: bold; color: #007bff; margin-bottom: 10px;'>Message:</p>"
    	        + "<p style='font-size: 16px; line-height: 1.5;'>" + contact.getMessage() + "</p>"

    	        + "</div>";

//		String imagepath="D:\\NewEJB2\\Pharmacy\\src\\main\\webapp\\163800845-removebg-preview.png";
//		ImageMailSend.sendOtp(contact.getEmail(), contSubject, contBody, imagepath);
		MailSend.mailOtp(contact.getEmail(), contSubject, contBody);
		String hosSubject="New Application from Customer";
		String hosEmail="Shailendrabharti8668@gmail.com";
		String hosBody = "<p style='font-size: 18px; font-weight: bold; color: #007bff; margin-bottom: 10px;'>" 
		        + contact.getName() + " has tried to contact the Hospital</p>"
		        + "<p style='font-size: 16px; line-height: 1.5;'>"
		        + "Please kindly answer the thread as soon as possible.</p>";
		String imagepath="D:\\Pharmacy\\Pharmacy\\src\\main\\webapp\\163800845-removebg-preview.png";
	
			System.out.println("Email Starts ");
//			ImageMailSend.sendOtp(hosEmail, hosSubject, hosBody, imagepath);
			System.out.println("Email Ends");
			Thread.sleep(10000);
			// TODO Auto-generated catch block
	
//		MailSend.mailOtp(hosEmail, hosSubject, hosBody);
        return "Menubar.xhtml?faces-redirect=true"; // Redirect to a success page
    }
    // Method to process the form submission

}

