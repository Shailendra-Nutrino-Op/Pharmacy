package com.java.Pharmacy;


import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;

@ManagedBean(name="cal")
@SessionScoped
public class Calendar {
	public static void main(String[] args) {
		String sub="Pharmacy Enrollmanet";
		String toemail="shailendrabharti8668@gmail.com";
		String body="The enrollment has been completed";
		String imagepath="D:\\Pharmacy\\Pharmacy\\src\\main\\webapp\\163800845-removebg-preview.png";
		ImageMailSend.sendOtp(toemail, sub, body, imagepath);
//		MailSend.mailOtp("shailendrabharti8668@gmail.com", sub, body);
	}
}