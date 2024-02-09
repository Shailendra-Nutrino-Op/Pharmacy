package com.java.sfp;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Map;

import javax.faces.component.UICommand;
import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;

public class JsfPaginationBean {

	private static final long serialVersionUID = 1L;
	private List<MedicineSales> cdList;
	private MedicineSalesDAOImpl queryHelper;
	/**
	 * pagination stuff
	 */
	private int totalRows;
	static private int firstRow;
	private int rowsPerPage;
	private int totalPages;
	private int pageRange;
	private Integer[] pages;
	private int currentPage;
	/**
	 * Creates a new instance of JsfPaginationBean
	 */
	public JsfPaginationBean() {
		queryHelper = new MedicineSalesDAOImpl();
		/**
		 * the below function should not be called in real world application
		 */
		// Set default values somehow (properties files?).
		rowsPerPage = 4; // Default rows per page (max amount of rows to be displayed at once).
		pageRange = 6; // Default page range (max amount of page links to be displayed at once).
	}
//	public List<MedicineSales> getSaleList() {
//		if (cdList == null) {
//			loadSales();
//		}
//		return cdList;
//	}
	public List<MedicineSales> getSaleList() {
		Map<String, Object> sessionMap = FacesContext.getCurrentInstance().getExternalContext().getSessionMap();
		if (cdList == null) {
			loadSales();
		}
		else if(cdList.isEmpty() || cdList.size()==0){
			sessionMap.put("NotFound", "No records");
		}
		
		return cdList;
	}
	
	public void setCdList(List<MedicineSales> cdList) {
		this.cdList = cdList;
	}
	public int getTotalRows() {
		return totalRows;
	}
	public void setTotalRows(int totalRows) {
		this.totalRows = totalRows;
	}
	public int getFirstRow() {
		return firstRow;
	}
	public void setFirstRow(int firstRow) {
		this.firstRow = firstRow;
	}
	public int getRowsPerPage() {
		return rowsPerPage;
	}
	public void setRowsPerPage(int rowsPerPage) {
		this.rowsPerPage = rowsPerPage;
	}
	public int getTotalPages() {
		return totalPages;
	}
	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}
	public int getPageRange() {
		return pageRange;
	}
	public void setPageRange(int pageRange) {
		this.pageRange = pageRange;
	}
	public Integer[] getPages() {
		return pages;
	}
	public void setPages(Integer[] pages) {
		this.pages = pages;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	
	private void loadSales() {
		System.out.println("First Row  " +firstRow);
		System.out.println("Count  " +rowsPerPage);
		cdList = queryHelper.getListOfMedSale(firstRow, rowsPerPage);
		System.out.println("Employ Count is  " +cdList);
		totalRows = queryHelper.countRows();
		System.out.println("Total Rows  " +totalRows);
		// Set currentPage, totalPages and pages.
		currentPage = (totalRows / rowsPerPage) - ((totalRows - firstRow) / rowsPerPage) + 1;
		totalPages = (totalRows / rowsPerPage) + ((totalRows % rowsPerPage != 0) ? 1 : 0);
		int pagesLength = Math.min(pageRange, totalPages);
		pages = new Integer[pagesLength];
		// firstPage must be greater than 0 and lesser than totalPages-pageLength.
		int firstPage = Math.min(Math.max(0, currentPage - (pageRange / 2)), totalPages - pagesLength);
		// Create pages (page numbers for page links).
		for (int i = 0; i < pagesLength; i++) {
			pages[i] = ++firstPage;
		}
	}
	// Paging actions
	// -----------------------------------------------------------------------------
	public void pageFirst() {
		page(0);
	}
	public void pageNext() {
		page(firstRow + rowsPerPage);
	}
	public void pagePrevious() {
		page(firstRow - rowsPerPage);
	}
	public void pageLast() {
		page(totalRows - ((totalRows % rowsPerPage != 0) ? totalRows % rowsPerPage : rowsPerPage));
	}
	public void page(ActionEvent event) {
		page(((Integer) ((UICommand) event.getComponent()).getValue() - 1) * rowsPerPage);
	}
	private void page(int firstRow) {
		this.firstRow = firstRow;
		loadSales();
	}
////////////////////sort sale id/////////////////////////
	public void sortBySaleId() {
		MedicineSalesDAOImpl medicineDao = new MedicineSalesDAOImpl();
        List<MedicineSales> sortedList = medicineDao.sortBySaleIdAsc(firstRow, rowsPerPage);
         setCdList(sortedList);
    }
	public void sortBySaleIdDes() {
		MedicineSalesDAOImpl medicineDao = new MedicineSalesDAOImpl();
        List<MedicineSales> sortedList = medicineDao.sortBySaleIdDesc( firstRow, rowsPerPage);
        setCdList(sortedList);
    }
//////////////////////////////////////////////////////////////
////////////////////sort pharmID/////////////////////////////
	public void sortByPharmId() {
		MedicineSalesDAOImpl medicineDao = new MedicineSalesDAOImpl();
        List<MedicineSales> sortedList = medicineDao.sortByPharmIdAsc(firstRow, rowsPerPage);
         setCdList(sortedList);
    }
	public void sortByPharmIdDes() {
		MedicineSalesDAOImpl medicineDao = new MedicineSalesDAOImpl();
        List<MedicineSales> sortedList = medicineDao.sortByPharmIdDesc( firstRow, rowsPerPage);
        setCdList(sortedList);
    }
////////////////////////////////////////////////////////////////////
////////////////////sort MedName/////////////////////////////
		public void sortByMedName() {
			MedicineSalesDAOImpl medicineDao = new MedicineSalesDAOImpl();
			List<MedicineSales> sortedList = medicineDao.sortByMedNameAsc(firstRow, rowsPerPage);
			setCdList(sortedList);
		}
		public void sortByMedNameDes() {
			MedicineSalesDAOImpl medicineDao = new MedicineSalesDAOImpl();
			List<MedicineSales> sortedList = medicineDao.sortByMedNameDesc( firstRow, rowsPerPage);
			setCdList(sortedList);
		}
////////////////////////////////////////////////////////////////////
////////////////////sort SaleDate/////////////////////////////
public void sortBySaleDate() {
MedicineSalesDAOImpl medicineDao = new MedicineSalesDAOImpl();
List<MedicineSales> sortedList = medicineDao.sortBySaleDateAsc(firstRow, rowsPerPage);
setCdList(sortedList);
}
public void sortBySaleDateDes() {
MedicineSalesDAOImpl medicineDao = new MedicineSalesDAOImpl();
List<MedicineSales> sortedList = medicineDao.sortBySaleDateDesc( firstRow, rowsPerPage);
setCdList(sortedList);
}
////////////////////////////////////////////////////////////////////
////////////////////sort Quantity/////////////////////////////
public void sortByQuantity() {
MedicineSalesDAOImpl medicineDao = new MedicineSalesDAOImpl();
List<MedicineSales> sortedList = medicineDao.sortByQuantityAsc(firstRow, rowsPerPage);
setCdList(sortedList);
}
public void sortByQuantityDes() {
MedicineSalesDAOImpl medicineDao = new MedicineSalesDAOImpl();
List<MedicineSales> sortedList = medicineDao.sortByQuantityDesc( firstRow, rowsPerPage);
setCdList(sortedList);
}
////////////////////////////////////////////////////////////////////
////////////////////sort ProviderId/////////////////////////////
public void sortByProviderId() {
MedicineSalesDAOImpl medicineDao = new MedicineSalesDAOImpl();
List<MedicineSales> sortedList = medicineDao.sortByProviderIdAsc(firstRow, rowsPerPage);
setCdList(sortedList);
}
public void sortByProviderIdDes() {
MedicineSalesDAOImpl medicineDao = new MedicineSalesDAOImpl();
List<MedicineSales> sortedList = medicineDao.sortByProviderIdDesc( firstRow, rowsPerPage);
setCdList(sortedList);
}
////////////////////////////////////////////////////////////////////
////////////////////sort UHId/////////////////////////////
public void sortByUHId() {
MedicineSalesDAOImpl medicineDao = new MedicineSalesDAOImpl();
List<MedicineSales> sortedList = medicineDao.sortByUHIdAsc(firstRow, rowsPerPage);
setCdList(sortedList);
}
public void sortByUHIdDes() {
MedicineSalesDAOImpl medicineDao = new MedicineSalesDAOImpl();
List<MedicineSales> sortedList = medicineDao.sortByUHIdDesc( firstRow, rowsPerPage);
setCdList(sortedList);
}
////////////////////////////////////////////////////////////////////
////////////////////sort SaleDate/////////////////////////////
public void sortByPrescriptionId() {
MedicineSalesDAOImpl medicineDao = new MedicineSalesDAOImpl();
List<MedicineSales> sortedList = medicineDao.sortByPrescriptionIdAsc(firstRow, rowsPerPage);
setCdList(sortedList);
}
public void sortByPrescriptionIdDes() {
MedicineSalesDAOImpl medicineDao = new MedicineSalesDAOImpl();
List<MedicineSales> sortedList = medicineDao.sortByPrescriptionIdDesc( firstRow, rowsPerPage);
setCdList(sortedList);
}
////////////////////////////////////////////////////////////////////

}
