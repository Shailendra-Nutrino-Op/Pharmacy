package com.java.Pharmacy;

import java.util.Date;

public class PharmacyDetail {
	private String pharm_id;
	private String shop_name;
	private String address;
	private String lic_no;
	private String owner_name;
	private String regd_no;
	private Date date_of_registration;
	private String qualification;
	private String phone;
	private String email;
	private String regulatory;
	private String password;
	private String secu_Question;
	private String secu_Answer;
	
	
	
	public String getSecu_Question() {
		return secu_Question;
	}
	public void setSecu_Question(String secu_Question) {
		this.secu_Question = secu_Question;
	}
	public String getSecu_Answer() {
		return secu_Answer;
	}
	public void setSecu_Answer(String secu_Answer) {
		this.secu_Answer = secu_Answer;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getPharm_id() {
		return pharm_id;
	}
	public void setPharm_id(String pharm_id) {
		this.pharm_id = pharm_id;
	}
	public String getShop_name() {
		return shop_name;
	}
	public void setShop_name(String shop_name) {
		this.shop_name = shop_name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getLic_no() {
		return lic_no;
	}
	public void setLic_no(String lic_no) {
		this.lic_no = lic_no;
	}
	public String getOwner_name() {
		return owner_name;
	}
	public void setOwner_name(String owner_name) {
		this.owner_name = owner_name;
	}
	public String getRegd_no() {
		return regd_no;
	}
	public void setRegd_no(String regd_no) {
		this.regd_no = regd_no;
	}
	public Date getDate_of_registration() {
		return date_of_registration;
	}
	public void setDate_of_registration(Date date_of_registration) {
		this.date_of_registration = date_of_registration;
	}
	public String getQualification() {
		return qualification;
	}
	public void setQualification(String qualification) {
		this.qualification = qualification;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getRegulatory() {
		return regulatory;
	}
	public void setRegulatory(String regulatory) {
		this.regulatory = regulatory;
	}
	@Override
	public String toString() {
		return "PharmacyDetail [pharm_id=" + pharm_id + ", shop_name=" + shop_name + ", address=" + address
				+ ", lic_no=" + lic_no + ", owner_name=" + owner_name + ", regd_no=" + regd_no
				+ ", date_of_registration=" + date_of_registration + ", qualification=" + qualification + ", phone="
				+ phone + ", email=" + email + ", regulatory=" + regulatory + ", password=" + password
				+ ", secu_Question=" + secu_Question + ", secu_Answer=" + secu_Answer + "]";
	}
	
    

	
	
	
	
	
	
}
