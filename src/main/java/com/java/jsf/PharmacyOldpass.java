package com.java.jsf;

public class PharmacyOldpass {
	
	private int authId;
	private String pharmaId;
	private String email;
	private String passWord;
	private String status;
	private String otp;
	private String resetPasword;
	private String oldPassWord;
	
	public int getAuthId() {
		return authId;
	}
	public void setAuthId(int authId) {
		this.authId = authId;
	}
	public String getPharmaId() {
		return pharmaId;
	}
	public void setPharmaId(String pharmaId) {
		this.pharmaId = pharmaId;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassWord() {
		return passWord;
	}
	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getOtp() {
		return otp;
	}
	public void setOtp(String otp) {
		this.otp = otp;
	}
	
	public String getResetPasword() {
		return resetPasword;
	}
	public void setResetPasword(String resetPasword) {
		this.resetPasword = resetPasword;
	}
	
	
	public String getOldPassWord() {
		return oldPassWord;
	}
	public void setOldPassWord(String oldPassWord) {
		this.oldPassWord = oldPassWord;
	}
	public PharmacyOldpass(int authId, String pharmaId, String email, String passWord, String status, String otp,
			String resetPasword, String oldPassWord) {
		super();
		this.authId = authId;
		this.pharmaId = pharmaId;
		this.email = email;
		this.passWord = passWord;
		this.status = status;
		this.otp = otp;
		this.resetPasword = resetPasword;
		this.oldPassWord = oldPassWord;
	}
	public PharmacyOldpass() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "PharmacyOldpass [authId=" + authId + ", pharmaId=" + pharmaId + ", email=" + email + ", passWord="
				+ passWord + ", status=" + status + ", otp=" + otp + ", resetPasword=" + resetPasword + ", oldPassWord="
				+ oldPassWord + "]";
	}
	
	
	
	

}
