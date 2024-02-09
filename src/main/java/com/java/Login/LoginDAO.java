package com.java.Login;

public interface LoginDAO {
	public String verifyOtp(Login login);
	public String loginDao(Login login);
	public String loginWithOtp(Login login);
}
