package com.java.Pharmacy;

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
	
	public static void main(String[] args) {
		System.out.println(findIntInString("fhfhgh4g"));
	}
}
