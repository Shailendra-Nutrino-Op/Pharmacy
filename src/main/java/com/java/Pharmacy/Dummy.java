package com.java.Pharmacy;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;

public class Dummy {
	public static boolean isIntContainsString(String str) {
	       return str.matches("^-?\\d+$");
	    }
    public static boolean findIntInString(String str) {
        Pattern pattern = Pattern.compile("\\d");
        Matcher matcher = pattern.matcher(str);
        return matcher.find();
    }
    public static boolean containsSpecialCharacter(String input) {
        Pattern specialCharacterPattern = Pattern.compile("[@_!#$%^&*()<>?/\\|}{~:]");
        Matcher matcher = specialCharacterPattern.matcher(input);
        return matcher.find();
    }
    
    public static boolean checkChars(String ch) {
        String characters = "-+=.,/";
        for (int i = 0; i < characters.length(); i++) {
            if (ch.contains(String.valueOf(characters.charAt(i)))) {
                return true;
            }
        }
        return false;
    }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
	
	public static void main(String[] args) {
//       System.out.println(EncryptPassword.getCode("Shailendra1981#"));
//       System.out.println(EncryptPassword.getCode("46a3f3bc81f82cf89fc1f5eb98a8b219"));
		
	//	System.out.println(new EnrollPharmacyImpl().generateOtp());
//		System.out.println( containsSpecialCharacter("Shailendra#"));
//		System.out.println("012345".substring(0, 1));
//    System.out.println(checkChars(":"));
		String body="<!DOCTYPE html>\r\n"
				+ "<html>\r\n"
				+ "	<head>\r\n"
				+ "		<meta charset=\"utf-8\" />\r\n"
				+ "		<title>A simple, clean, and responsive HTML invoice template</title>\r\n"
				+ "\r\n"
				+ "		<style>\r\n"
				+ "			.invoice-box {\r\n"
				+ "				max-width: 800px;\r\n"
				+ "				margin: auto;\r\n"
				+ "				padding: 30px;\r\n"
				+ "				border: 1px solid #eee;\r\n"
				+ "				box-shadow: 0 0 10px rgba(0, 0, 0, 0.15);\r\n"
				+ "				font-size: 16px;\r\n"
				+ "				line-height: 24px;\r\n"
				+ "				font-family: 'Helvetica Neue', 'Helvetica', Helvetica, Arial, sans-serif;\r\n"
				+ "				color: white;\r\n"
				+ "			}\r\n"
				+ "\r\n"
				+ "			.invoice-box table {\r\n"
				+ "				width: 100%;\r\n"
				+ "				line-height: inherit;\r\n"
				+ "				text-align: left;\r\n"
				+ "			}\r\n"
				+ "\r\n"
				+ "			.invoice-box table td {\r\n"
				+ "				padding: 5px;\r\n"
				+ "				vertical-align: top;\r\n"
				+ "			}\r\n"
				+ "\r\n"
				+ "			.invoice-box table tr td:nth-child(2) {\r\n"
				+ "				text-align: right;\r\n"
				+ "			}\r\n"
				+ "\r\n"
				+ "			.invoice-box table tr.top table td {\r\n"
				+ "				padding-bottom: 20px;\r\n"
				+ "			}\r\n"
				+ "\r\n"
				+ "			.invoice-box table tr.top table td.title {\r\n"
				+ "				font-size: 45px;\r\n"
				+ "				line-height: 45px;\r\n"
				+ "				color: #333;\r\n"
				+ "			}\r\n"
				+ "\r\n"
				+ "			.invoice-box table tr.information table td {\r\n"
				+ "				padding-bottom: 40px;\r\n"
				+ "			}\r\n"
				+ "\r\n"
				+ "			.invoice-box table tr.heading td {\r\n"
				+ "				background: #eee;\r\n"
				+ "				border-bottom: 1px solid #ddd;\r\n"
				+ "				font-weight: bold;\r\n"
				+ "			}\r\n"
				+ "\r\n"
				+ "			.invoice-box table tr.details td {\r\n"
				+ "				padding-bottom: 20px;\r\n"
				+ "			}\r\n"
				+ "\r\n"
				+ "			.invoice-box table tr.item td {\r\n"
				+ "				border-bottom: 1px solid #eee;\r\n"
				+ "			}\r\n"
				+ "\r\n"
				+ "			.invoice-box table tr.item.last td {\r\n"
				+ "				border-bottom: none;\r\n"
				+ "			}\r\n"
				+ "\r\n"
				+ "			.invoice-box table tr.total td:nth-child(2) {\r\n"
				+ "				border-top: 2px solid #eee;\r\n"
				+ "				font-weight: bold;\r\n"
				+ "			}\r\n"
				+ "\r\n"
				+ "			@media only screen and (max-width: 600px) {\r\n"
				+ "				.invoice-box table tr.top table td {\r\n"
				+ "					width: 100%;\r\n"
				+ "					display: block;\r\n"
				+ "					text-align: center;\r\n"
				+ "				}\r\n"
				+ "\r\n"
				+ "				.invoice-box table tr.information table td {\r\n"
				+ "					width: 100%;\r\n"
				+ "					display: block;\r\n"
				+ "					text-align: center;\r\n"
				+ "				}\r\n"
				+ "			}\r\n"
				+ "\r\n"
				+ "			/** RTL **/\r\n"
				+ "			.invoice-box.rtl {\r\n"
				+ "				direction: rtl;\r\n"
				+ "				font-family: Tahoma, 'Helvetica Neue', 'Helvetica', Helvetica, Arial, sans-serif;\r\n"
				+ "			}\r\n"
				+ "\r\n"
				+ "			.invoice-box.rtl table {\r\n"
				+ "				text-align: right;\r\n"
				+ "			}\r\n"
				+ "\r\n"
				+ "			.invoice-box.rtl table tr td:nth-child(2) {\r\n"
				+ "				text-align: left;\r\n"
				+ "			}\r\n"
				+ "		</style>\r\n"
				+ "	</head>\r\n"
				+ "\r\n"
				+ "	<body>\r\n"
				+ "		<div class=\"invoice-box\">\r\n"
				+ "			<table cellpadding=\"0\" cellspacing=\"0\">\r\n"
				+ "				<tr class=\"top\">\r\n"
				+ "					<td colspan=\"2\">\r\n"
				+ "						<table>\r\n"
				+ "							<tr>\r\n"
				+ "								<td class=\"title\">\r\n"
				+ "									<img\r\n"
				+ "										src=\"https://sparksuite.github.io/simple-html-invoice-template/images/logo.png\"\r\n"
				+ "										style=\"width: 100%; max-width: 300px\"\r\n"
				+ "									/>\r\n"
				+ "								</td>\r\n"
				+ "\r\n"
				+ "								<td>\r\n"
				+ "									Invoice #: 123<br />\r\n"
				+ "									Created: January 1, 2023<br />\r\n"
				+ "									Due: February 1, 2023\r\n"
				+ "								</td>\r\n"
				+ "							</tr>\r\n"
				+ "						</table>\r\n"
				+ "					</td>\r\n"
				+ "				</tr>\r\n"
				+ "\r\n"
				+ "				<tr class=\"information\">\r\n"
				+ "					<td colspan=\"2\">\r\n"
				+ "						<table>\r\n"
				+ "							<tr>\r\n"
				+ "								<td>\r\n"
				+ "									Sparksuite, Inc.<br />\r\n"
				+ "									12345 Sunny Road<br />\r\n"
				+ "									Sunnyville, CA 12345\r\n"
				+ "								</td>\r\n"
				+ "\r\n"
				+ "								<td>\r\n"
				+ "									Acme Corp.<br />\r\n"
				+ "									John Doe<br />\r\n"
				+ "									john@example.com\r\n"
				+ "								</td>\r\n"
				+ "							</tr>\r\n"
				+ "						</table>\r\n"
				+ "					</td>\r\n"
				+ "				</tr>\r\n"
				+ "\r\n"
				+ "				<tr class=\"heading\">\r\n"
				+ "					<td>Payment Method</td>\r\n"
				+ "\r\n"
				+ "					<td>Check #</td>\r\n"
				+ "				</tr>\r\n"
				+ "\r\n"
				+ "				<tr class=\"details\">\r\n"
				+ "					<td>Check</td>\r\n"
				+ "\r\n"
				+ "					<td>1000</td>\r\n"
				+ "				</tr>\r\n"
				+ "\r\n"
				+ "				<tr class=\"heading\">\r\n"
				+ "					<td>Item</td>\r\n"
				+ "\r\n"
				+ "					<td>Price</td>\r\n"
				+ "				</tr>\r\n"
				+ "\r\n"
				+ "				<tr class=\"item\">\r\n"
				+ "					<td>Website design</td>\r\n"
				+ "\r\n"
				+ "					<td>$300.00</td>\r\n"
				+ "				</tr>\r\n"
				+ "\r\n"
				+ "				<tr class=\"item\">\r\n"
				+ "					<td>Hosting (3 months)</td>\r\n"
				+ "\r\n"
				+ "					<td>$75.00</td>\r\n"
				+ "				</tr>\r\n"
				+ "\r\n"
				+ "				<tr class=\"item last\">\r\n"
				+ "					<td>Domain name (1 year)</td>\r\n"
				+ "\r\n"
				+ "					<td>$10.00</td>\r\n"
				+ "				</tr>\r\n"
				+ "\r\n"
				+ "				<tr class=\"total\">\r\n"
				+ "					<td></td>\r\n"
				+ "\r\n"
				+ "					<td>Total: $385.00</td>\r\n"
				+ "				</tr>\r\n"
				+ "			</table>\r\n"
				+ "		</div>\r\n"
				+ "	</body>\r\n"
				+ "</html>\r\n";

		String imagepath="D:\\163800845-removebg-preview.png";

		ImageMailSend.sendOtp("forsocial69@gmail.com", "Billing", body, imagepath);
		
	}
}
