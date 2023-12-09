package com.java.Pharmacy;

import java.sql.SQLException;
import java.text.ParseException;
import java.util.List;

public interface PharmacyEnrollment {
	String EnrollPharmacy(PharmacyDetail pharmacyDetails) throws ParseException, ClassNotFoundException, SQLException;
	List<PharmacyDetail> showPharmacy();
}
