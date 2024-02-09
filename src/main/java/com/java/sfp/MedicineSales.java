package com.java.sfp;

import java.sql.Timestamp;

public class MedicineSales {
    private String saleId;
    private String pharm_id;
    private int entryId;
    private String medId;
    private String medName;
    private Timestamp saleDate;
    private int quantity;
    private double price;
    private double totalPrice;
    private String providerId;
    private String uHID;
    private String prescription_Id;
	public MedicineSales(String saleId, String pharm_id, int entryId, String medId, String medName, Timestamp saleDate,
			int quantity, double price, double totalPrice, String providerId, String uHID, String prescription_Id) {
		super();
		this.saleId = saleId;
		this.pharm_id = pharm_id;
		this.entryId = entryId;
		this.medId = medId;
		this.medName = medName;
		this.saleDate = saleDate;
		this.quantity = quantity;
		this.price = price;
		this.totalPrice = totalPrice;
		this.providerId = providerId;
		this.uHID = uHID;
		this.prescription_Id = prescription_Id;
	}
	public MedicineSales() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getSaleId() {
		return saleId;
	}
	public void setSaleId(String saleId) {
		this.saleId = saleId;
	}
	public String getPharm_id() {
		return pharm_id;
	}
	public void setPharm_id(String pharm_id) {
		this.pharm_id = pharm_id;
	}
	public int getEntryId() {
		return entryId;
	}
	public void setEntryId(int entryId) {
		this.entryId = entryId;
	}
	public String getMedId() {
		return medId;
	}
	public void setMedId(String medId) {
		this.medId = medId;
	}
	public String getMedName() {
		return medName;
	}
	public void setMedName(String medName) {
		this.medName = medName;
	}
	public Timestamp getSaleDate() {
		return saleDate;
	}
	public void setSaleDate(Timestamp saleDate) {
		this.saleDate = saleDate;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public double getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}
	public String getProviderId() {
		return providerId;
	}
	public void setProviderId(String providerId) {
		this.providerId = providerId;
	}
	public String getuHID() {
		return uHID;
	}
	public void setuHID(String uHID) {
		this.uHID = uHID;
	}
	public String getPrescription_Id() {
		return prescription_Id;
	}
	public void setPrescription_Id(String prescription_Id) {
		this.prescription_Id = prescription_Id;
	}
	@Override
	public String toString() {
		return "MedicineSales [saleId=" + saleId + ", pharm_id=" + pharm_id + ", entryId=" + entryId + ", medId="
				+ medId + ", medName=" + medName + ", saleDate=" + saleDate + ", quantity=" + quantity + ", price="
				+ price + ", totalPrice=" + totalPrice + ", providerId=" + providerId + ", uHID=" + uHID
				+ ", prescription_Id=" + prescription_Id + "]";
	}
    
}
