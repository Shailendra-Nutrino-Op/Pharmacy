package com.java.hib;

import java.io.IOException;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Map;

import javax.faces.application.FacesMessage;
import javax.faces.component.UICommand;
import javax.faces.context.ExternalContext;
import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;
import javax.servlet.http.HttpServletRequest;



public class JsfPaginationBean {

	private static final long serialVersionUID = 1L;
	private List<Medicines> cdList;
	private MainImpl queryHelper;
	
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
	private String medName;
	private static final int default_rows_perpage=5;
	public String getMedName() {
		return medName;
	}

	public void setMedName(String medName) {
		this.medName = medName;
	}
	/**
	 * Creates a new instance of JsfPaginationBean
	 */
	
//	  static 
//	  {
//		  rowsPerPage = 5; 
//		  }
	 
	public JsfPaginationBean() {

		System.out.println("Rows Per Page  " +rowsPerPage);
		queryHelper = new MainImpl();
		/**
		 * the below function should not be called in real world application
		 */
		// Set default values somehow (properties files?).
	   rowsPerPage = 5; // Default rows per page (max amount of rows to be displayed at once).
		pageRange = 8; // Default page range (max amount of page links to be displayed at once).
	}
	
	 public List<Medicines> getMedicinesList(String medName) { 
		 Map<String, Object> sessionMap = FacesContext.getCurrentInstance().getExternalContext().getSessionMap();
		 sessionMap.put("medName", medName);
		 cdList=null;
		 if(cdList == null) {
			 loadMed(medName);
		 }
		 return cdList;
	 }
	 
	 
	 
//	 private boolean sortAscending = true; 
//		
//		private List<Medicines> listMedicine;
//		
//		public List<Medicines> getListMedicine() {
//			return listMedicine;
//		}
//
//		public void setListMedicine(List<Medicines> listMedicine) {
//			this.listMedicine = listMedicine;
//		}
//		
//
//		public List<Medicines> sortByMedName() {
//
//				System.out.println();
//			   if(sortAscending){
//					
//				//ascending order
//				Collections.sort(listMedicine, new Comparator<Medicines>() {
//
//
//					@Override
//					public int compare(Medicines o1, Medicines o2) {
//						
//						return o1.getMedName().compareTo(o2.getMedName());
//						
//					}
//
//				});
//				System.out.println("Inside  " +listMedicine);
//				sortAscending = false;
//					
//			   }else{
//
//				//descending order
//					Collections.sort(listMedicine, new Comparator<Medicines>() {
//
//
//						@Override
//						public int compare(Medicines o2, Medicines o1) {
//							return o2.getMedName().compareTo(o1.getMedName());
//						}
//
//					});
//					sortAscending = true;
//			   }
//			   
//
//			   System.out.println("Sorted One  " +listMedicine);
//			   return listMedicine;
//			}
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
//------------------------------------------------------------
//	 private boolean sortAscending = true;
//	    public List<Medicines> getMedicinesList() {
//		return medicinesList;
//	}
//
//	public void setMedicinesList(List<Medicines> medicinesList) {
//		this.medicinesList = medicinesList;
//	}
//
//
//
//		private List<Medicines> medicinesList;
//
//	    
//
//	    public List<Medicines> sortByMedId() {
//	        System.out.println("Before sorting: " + medicinesList);
//
//	        if (medicinesList == null || medicinesList.isEmpty()) {
//	            System.out.println("List is null or empty. Not sorting.");
//	            return medicinesList;
//	        }
//
//	        // Ascending order
//	        try {
//	            Collections.sort(medicinesList, Comparator.comparing(Medicines::getMedId));
//	        } catch (Exception e) {
//	            System.err.println("Error during sorting: " + e.getMessage());
//	            e.printStackTrace();
//	        }
//
//	        // Toggle the sort order
//	        sortAscending = !sortAscending;
//
//	        System.out.println("After sorting: " + medicinesList);
//	        return medicinesList;
//	    }
//
//	    public List<Medicines> sortByMedIdDesc() {
//	        System.out.println("Before sorting: " + medicinesList);
//
//	        if (medicinesList == null || medicinesList.isEmpty()) {
//	            System.out.println("List is null or empty. Not sorting.");
//	            return medicinesList;
//	        }
//
//	        // Descending order
//	        try {
//	            Collections.sort(medicinesList, Comparator.comparing(Medicines::getMedId).reversed());
//	        } catch (Exception e) {
//	            System.err.println("Error during sorting: " + e.getMessage());
//	            e.printStackTrace();
//	        }
//
//	        // Toggle the sort order
//	        sortAscending = !sortAscending;
//
//	        System.out.println("After sorting: " + medicinesList);
//	        return medicinesList;
//	    }
	

	 
	 
	 
	 
	 
	 
//---------------------------------------------------------------
	 private boolean sortAscending = true;
     
     public List<Medicines> getMedicinesList() {
		return medicinesList;
	}

	public void setMedicinesList(List<Medicines> medicinesList) {
		this.medicinesList = medicinesList;
	}

	private List<Medicines> medicinesList;
     

//public List<Medicines> sortBymedId() {
//
//                   System.out.println("hiiiiiiiiiiiii");
//               if(sortAscending==true){
//                         
//                   //ascending order
//                   Collections.sort(medicinesList,new Comparator<Medicines>() {
//
//                         @Override
//                         public int compare(Medicines o1, Medicines o2) {
//                                // TODO Auto-generated method stub
//                                return o1.getMedId().compareTo(o2.getMedId()) ;
//                         }
//                   });
//
//                   
//                   System.out.println("Inside  " +medicinesList);
//                   sortAscending = false;
//                         
//               }
//            
//               System.out.println("Sorted One  " +medicinesList);
//               return medicinesList;
//            }

public List<Medicines> sortmedId() {
	System.out.println("sort medid");
	if(sortAscending) {
		Collections.sort(medicinesList,new Comparator<Medicines>() {

			@Override
			public int compare(Medicines o1, Medicines o2) {
				// TODO Auto-generated method stub
				return o1.getMedId().compareTo(o2.getMedId()) ;
			}
		});
		
		System.out.println("Inside " +medicinesList);
		sortAscending = false;
			
	}
	System.out.println("Sorted One " +medicinesList);
	return medicinesList;
}
//
//public List<Medicines> sortBymedIdDes() {
//
//    System.out.println("thisss");
//if(sortAscending==true){
//          
//    //ascending order
//    Collections.sort(medicinesList,new Comparator<Medicines>() {
//
//          @Override
//          public int compare(Medicines o1, Medicines o2) {
//                 // TODO Auto-generated method stub
//                 return o2.getMedId().compareTo(o1.getMedId()) ;
//          }
//    });
//
//    
//    System.out.println("Inside  " +medicinesList);
//    sortAscending = false;
//          
//}
//
//System.out.println("Sorted One  " +medicinesList);
//return medicinesList;
//}
//
//public List<Medicines> sortBymedName() {
//
//    System.out.println("hiiiiiiiiiiiii");
//if(sortAscending==true){
//          
//    //ascending order
//    Collections.sort(medicinesList,new Comparator<Medicines>() {
//
//          @Override
//          public int compare(Medicines o1, Medicines o2) {
//                 // TODO Auto-generated method stub
//                 return o1.getMedName().compareTo(o2.getMedName());
//          }
//    });
//
//    
//    System.out.println("Inside  " +medicinesList);
//    sortAscending = false;
//          
//}
//
//System.out.println("Sorted One  " +medicinesList);
//return medicinesList;
//}
//
//public List<Medicines> sortBymedNameDes() {
//
//    System.out.println("hiiiiiiiiiiiii");
//if(sortAscending==true){
//          
//    //ascending order
//    Collections.sort(medicinesList,new Comparator<Medicines>() {
//
//          @Override
//          public int compare(Medicines o1, Medicines o2) {
//                 // TODO Auto-generated method stub
//                 return o2.getMedName().compareTo(o1.getMedName());
//          }
//    });
//
//    
//    System.out.println("Inside  " +medicinesList);
//    sortAscending = false;
//          
//}
//
//System.out.println("Sorted One  " +medicinesList);
//return medicinesList;
//}


//---------------------------------------------------------------------------

//public void sortMedicinesBymedId() {
//	Map<String, Object> sessionMap = FacesContext.getCurrentInstance().getExternalContext().getSessionMap();
//	//
//				String medName=(String) sessionMap.get("searchMed");
//    MainImpl mainImpl = new MainImpl();
//    List<Medicines> sortedList = mainImpl.sortBymedID( firstRow, rowsPerPage);
//     setCdList(sortedList);
//}
//public void sortMedicinesBymedIdDes() {
//	Map<String, Object> sessionMap = FacesContext.getCurrentInstance().getExternalContext().getSessionMap();
//	//
//			String medName=(String) sessionMap.get("searchMed");
//	  MainImpl mainImpl = new MainImpl();
//    List<Medicines> sortedList = mainImpl.sortBymedIDDes( firstRow, rowsPerPage);
//     setCdList(sortedList);
//}
	 
//-------------------------------------------------------------------------
	
	 private boolean showErrorMessage;
		
		public boolean isShowErrorMessage() {
		    return showErrorMessage;
		}
	 
		public void setShowErrorMessage(boolean showErrorMessage) {
		    this.showErrorMessage = showErrorMessage;
		}
	public void setCdList(List<Medicines> cdList) {
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
		if(rowsPerPage<=0) {
			rowsPerPage=default_rows_perpage;
		}
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
	
	private void loadMed(String medName) {
//		if(rowsPerPage>0) {
		System.out.println("medName is   :   " +medName);
		System.out.println("First Row  " +firstRow);
		System.out.println("Count  " +rowsPerPage);
		cdList = queryHelper.searchByMedName(firstRow, rowsPerPage, medName);
		System.out.println("Employ Count is  " +cdList);
		totalRows = queryHelper.countRows(medName);
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
//	}else {
//		System.out.println("nothing");
//	}
}
	// Paging actions
	// -----------------------------------------------------------------------------
//	public void pageFirst() {
//		page(0);
//	}
//	public void pageNext() {
//		page(firstRow + rowsPerPage);
//	}
//	public void pagePrevious() {
//		page(firstRow - rowsPerPage);
//	}
//	public void pageLast() {
//		page(totalRows - ((totalRows % rowsPerPage != 0) ? totalRows % rowsPerPage : rowsPerPage));
//	}
//	public void page(ActionEvent event) {
//		page(((Integer) ((UICommand) event.getComponent()).getValue() - 1) * rowsPerPage);
//	}
	public void pageFirst() {
		/*
		 * if(rowsPerPage<=0) { FacesContext context =
		 * FacesContext.getCurrentInstance(); context.addMessage("form:rowPerPage", new
		 * FacesMessage("This should ")); }
		 */
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
		Map<String, Object> sessionMap = FacesContext.getCurrentInstance().getExternalContext().getSessionMap();
		String medName =  (String) sessionMap.get("medName");
		loadMed(medName);
	}

	
//	public void clear(String medName) {
//	    // Reset search-related variables
//	  
//		medName = null; // Assuming searchInput is a property in your managed bean
//	   
//	    // Reset pagination-related variables
//	    currentPage = 1; // Assuming currentPage is a property in your managed bean
//
//	    // Perform any other necessary reset operations
//
//	    // Optionally, reload the data after resetting (replace with your actual data loading logic)
//	    loadMed(medName);
//
//	    // You can also add a log statement or any additional logic as needed
//	    System.out.println("Search and pagination reset successfully!");
//	}

public void clear() throws IOException {
	  firstRow=0;
	  
	  MainImpl main = new MainImpl();
	 if( main.getMedName()!= null) {
		 main.setMedName("");
	 }
	 
	 
	 MainImpl.orderbyEntryID ="sort";
	 MainImpl.orderbyMedId = "sort";
	 MainImpl.orderbyMedName = "sort";
	
	 
	 MainImpl.orderbyEntryIDDes = "sort";
	 MainImpl.orderbyMedIdDes = "sort";
	 MainImpl.orderbyMedNameDes = "sort";
	 
	 
	 
//	   static String orderbyEntryID = "sort";
//		static String orderbyMedId = "sort";
//		static String orderbyMedName = "sort";
	  
//	  System.out.println("Clear");
//	  FacesContext.getCurrentInstance().getExternalContext().invalidateSession();
//	  FacesContext.getCurrentInstance().getExternalContext().getSessionMap().put("acceptList", null);
//	  
//	  ExternalContext ec = FacesContext.getCurrentInstance().getExternalContext();
//	  ec.redirect(((HttpServletRequest) ec.getRequest()).getRequestURI());
//	 
	
	/*
	 * medName="";
	 * 
	 * 
	 * loadMed(medName);
	 */
    
//    Medicines medicines=new Medicines();
//    if(medicines.getMedName()!=null) {
//        medicines.setMedName("");
//
//    }
    
//
//    loadMed(medName);
  
}
}

