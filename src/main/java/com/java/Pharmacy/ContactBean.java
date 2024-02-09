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

	@Override
	public String toString() {
		return "ContactBean [name=" + name + ", email=" + email + ", message=" + message + "]";
	}
    
    

}

