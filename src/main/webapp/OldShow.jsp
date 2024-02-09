<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%> 
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%> 

<f:view>
<html>
<head>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    
    <script>
    
    function changeArrow(){
	var orderbyMedId = document.getElementById('form:orderbyMedId');
	alert(orderbyMedId.value);
    var arr1 = document.getElementById('arr1');
    var arr2 = document.getElementById('arr2'); 
    if (orderbyMedId.value === 'desc') {
    	arr1.style.display='none';
    }  else if(orderbyMedId.value === 'asc'){
    	arr2.style.display='none';
    }
    else{

        }
} 


/* function changeArrow(){
	var orderbyMedId = document.getElementById('form:orderbyMedId1');
	alert(orderbyMedId.value);
	 var arr2 = document.getElementById('arr2');
	  if(orderbyMedId.value === 'asc'){
	    	arr2.style.display='none';
	     }
	    else{

	        }
	}  */
	 
    function changeArrow(){
    	var orderbyMedName = document.getElementById('form:orderbyMedName');
    	alert(orderbyMedName.value);
        var arr1 = document.getElementById('arr1');
        var arr2 = document.getElementById('arr2');
        if (orderbyMedName.value === 'desc') {
        	arr1.style.display='none';
        } else if(orderbyMedName.value === 'asc'){
        	arr2.style.display='none';
        }else{

            }
    }
    function changeArrow(){
    	var orderbyEntryID = document.getElementById('form:orderbyEntryID');
    	alert(orderbyEntryID.value);
        var arr1 = document.getElementById('arr1');
        var arr2 = document.getElementById('arr2');
        if (orderbyEntryID.value === 'desc') {
        	arr1.style.display='none';
        } else if(orderbyEntryID.value === 'asc'){
        	arr2.style.display='none';
        }else{

            }
    }

    function changeArrow(){
    	var orderbyExpDate = document.getElementById('form:orderbyExpDate');
    	alert(orderbyExpDate.value);
        var arr1 = document.getElementById('arr1');
        var arr2 = document.getElementById('arr2');
        if (orderbyExpDate.value === 'desc') {
        	arr1.style.display='none';
        } else if(orderbyExpDate.value === 'asc'){
        	arr2.style.display='none';
        }else{

            }
    }
    
    
    


   /*  <script type="text/javascript">
        function resetPage() {
            location.reload(true); // Reloads the page, forcing a full reload from the server
        } */


    
        
    </script>
        
    
<style>
    /* Reset some default styles */
    body, h1, h2, h3, p, ul, li, table, form {
        margin: 0;
        padding: 0;
    }
/* body::before {
    content: "";
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.5); 
    z-index: 1; 
} */



 body {
            font-family: Arial, sans-serif;
            background-color: white; /* Light gray background */
            background-image: url("av6.jpg"); 
                
             background-size: cover;
            background-repeat: no-repeat;
            margin: 0;
            padding: 0;
        } 

        form {
        
            width: 75%;
           /*  background: opacity: 0.1; */ 
          /*   opacity: 0.8; 
         filter: alpha(opacity=80);  */
            margin: 100px auto 0;
            padding: 20px;
            border-radius: 8px;
            /* box-shadow: 0 0 10px rgba(0, 0, 0, 0.2); */
        }

        .container {
            background-color: white;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            padding: 20px;
            margin: 20px;
            
        }

      
        .button4{
         /*    background-color: white; 
            color: black; 
            border: 2px solid #666;
            align: right; */
           
         background-color: #008080; /* Light gray button */
            color: white; /* Dark gray text */
            border: 2px solid #666; /* Dark gray border */
            align: right;
            
        }
        
        .button4:hover {
           /*  background-color: #40E0D0;  */
            background-color: #006666;
            
            color: #fff; /* White text on hover */
        }
        
        .button4:disabled {
        opacity: 0.5; /* Reduce opacity for disabled buttons */
        cursor: not-allowed; /* Change cursor for disabled buttons */
    } 
 
  /*   .button4:not(:disabled) {
        background-color: goldenrod;/* Green background color */
        color: white; /* White text color on hover */
        transform: scale(1.1); /* Scale up slightly on hover for a subtle effect */
    }
       */     .button5 {
                width: 133px;
                height: 32px;
                border-radius: 11px;
            background-color: #EF2222; 
            color: white; 
            border: 2px solid #666; 
            align: right;
        }

        .button5:hover {
            background-color: black; 
            color: #fff; 
        }
         
                .button6 {
            background-color: white;
    color: black;
    border: 2px solid #666;
    align: right;
    width: 61px;
    height: 25px;
    border-radius: 6px;
    font-size: 13px;
        }
        
        .button6:hover {
            background-color: black; /* Dark gray button on hover */
            color: #fff; /* White text on hover */
            cursor: pointer;
            
        }
        
        .button6:disabled {
        opacity: 0.5; /* Reduce opacity for disabled buttons */
        cursor: not-allowed; /* Change cursor for disabled buttons */
    }
 

        .button7 {
            background-color: white; /* Light gray button */
            color: black; /* Dark gray text */
            border: 2px solid #666; /* Dark gray border */
            align: right;
            width: 56px;
            height: 26px;
            border-radius: 6px;
            font-size: 14px;
        }
        
        .button7:hover {
            background-color: black; /* Dark gray button on hover */
            color: #fff; /* White text on hover */
            
        }
        .button7:disabled {
        opacity: 0.5; /* Reduce opacity for disabled buttons */
        cursor: not-allowed; /* Change cursor for disabled buttons */
    }
 
    /* .button7:not(:disabled) {
        background-color: grey; 
        color: white; 
        transform: scale(1.1); 
    } */
    .button8 {
            background-color: white; /* Light gray button */
            color: black; /* Dark gray text */
            border: 2px solid #666; /* Dark gray border */
            align: right;
            width: 56px;
            height: 26px;
            border-radius: 6px;
            font-size: 14px;"
        }
        
        .button8:hover {
            background-color: black; /* Dark gray button on hover */
            color: #fff; /* White text on hover */
        }
        
        .button8:disabled {
        opacity: 0.5; /* Reduce opacity for disabled buttons */
        cursor: not-allowed; /* Change cursor for disabled buttons */
    }
 
  /*   .button8:not(:disabled) {
        background-color: grey; 
        color: white; 
        transform: scale(1.1); 
    } */
        
        .button9 {
            background-color: white;
    color: black;
    border: 2px solid #666;
    align: right;
    width: 61px;
    height: 25px;
    border-radius: 6px;
    font-size: 13px;
        }
        
        .button9:hover {
            background-color: black; /* Dark gray button on hover */
            color: #fff; /* White text on hover */
            cursor: pointer;
            
        }
        
        .button9:disabled {
        opacity: 0.5; /* Reduce opacity for disabled buttons */
        cursor: not-allowed; /* Change cursor for disabled buttons */
    }
 
       .button16 {
           /*  background-color: white;  
          
            color: black;  */
            border: 2px solid #666; /* Dark gray border */
           align: right;
    width: 61px;
    height: 25px;
    border-radius: 4px;
    font-size: 18px;
    margin-top: -120px;
    background-color: #D3D3D3; 
    color: #333;
        }
        
        .button16:hover {
          /*   background-color: black;   */
          background-color: #B0B0B0;
           
            color: #fff; /* White text on hover */
            cursor: pointer;
        }
        
        .button10 {
           /*  background-color: white;  */
           background-color: #FF6347;
            color: white; /* Dark gray text */
            border: 2px solid #666; /* Dark gray border */
           align: right;
    width: 61px;
    height: 25px;
    border-radius: 4px;
    font-size: 18px;
    margin-top: -120px;
        }
        
        .button10:hover {
           /*  background-color: black;  *//* Dark gray button on hover */
            background-color: #FF4500;
            color: #fff; /* White text on hover */
            cursor: pointer;
        }
        
       

        header {
            background-color: #333; /* Dark gray header background */
            color: #fff; /* White text */
            padding: 100px 0;
            text-align: center;
        }

   /*     h1 {
	font-size: 40px;
	color: darkblue; /* Dark gray heading text */
	/* margin-bottom: 20px; 
	 margin-bottom: 50px;
} */

/* Example CSS for the main heading */
h1 {
    font-size: 40px;
    color: navy;
    /* text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);  */
    text-shadow: 4px 4px 8px rgba(0, 0, 0, 0.5);
    margin-bottom: 50px;
    /* Additional styling as needed */
}




    /* Navigation menu styles */
    nav {
        background-color: #333; /* Dark gray color */
        color: #fff;
        padding: 10px;
        text-align: center;
    }

    ul {
        list-style: none;
    }

    ul li {
        display: inline;
        margin-right: 20px;
    }

    /* Main content container */
    .container {
        background-color: Brown;
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
        padding: 20px;
        margin: 20px;
    }

    /* Table styles */
    table {
        /* width: 100%;
        border-collapse: collapse;
        margin-top: -10%; */
    width: 118%;
    border-collapse: collapse;
    margin-top: -10%;
    margin-left: -85px;
    }

    th, td {
        text-align: center;
        padding: 7px;
        background-color: white;
    }

    th {
     /*    background-color: chocolate;  */
         /*    background-color: peru; */
             background-color: #D3D3D3;
            /*     background-color: saddlebrown; */
             /*    background-color: orange; */
       /*  color: #fff; */
        color: black;
    }

    tr:nth-child(even) {
        background-color: #f2f2f2;
    }

    tr:nth-child(odd) {
        background-color: #e2e2e2; /* Light gray color */
    }

    /* Button styles */
    .button {
        background-color: blue; /* Blue color */
        color: #fff;
        border: none;
        padding: 10px 20px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 14px;
        margin: 5px 2px;
        cursor: pointer;
        border-radius: 4px;
    }

    .button:hover {
        background-color: #0056b3; /* Darker blue color on hover */
    }
    .example input[type=text] {
	padding: 5px;
	font-size: 15px;
	border: 1px;
	border-radius: 15px 0px 0px 15px;
	float: center;
	background: #ffffff url("icon1.jpg") 8px 4px no-repeat;
	background-size: 18px 20px;
	padding-left: 30PX;
}

.dummy {
	padding: 5px;
	border-radius: 0px 15px 15px 0px;
	font-size: 15px;
	 background-color: orange; 
	
   /*  background-color: #40E0D0;  */
  /*  background:lightgreen; */
    
	color: white; /* Dark gray text */
	border: 2px solid #666; /* Dark gray border */
	align: right;
	margin-bottom: 120px;
}

.DUMMY:HOVER {
	/*  background: linear-gradient(to right, #2980b9, #5d6d7e); */
	 /*  background: goldenrod; */
	  /*  background-color: #FFA500; */
	  background-color: #D3D3D3;
}

.triangle{
       width: 0;
       height: 0;
       border-width: 0 5.5px 13px 5.5px;
       border-color: transparent transparent #11205 transparent;
       border-style: solid;
}


.triangleDown{
       width: 0;
       height: 0;
       border-width: 13px 5.5px 0 5.5px;
       border-color: #11206 transparent transparent transparent;
       border-style: solid;
}


.style {
    width: 140px;
    height: 35px;
    border-radius: 20px;
}

.elegant-button {
   /*  background: linear-gradient(to right, #08141c, #6a89cc); */
   background: darkblue;
/*     border: 2px solid #3498db; */
    /* border: 2px solid #336699; */
   /*  border: 2px solid #444; */
   border: 2px solid white;
    color: #fff;
    padding: 7px 10px;
    border-radius: 11px;
    font-size: 15px;
    font-weight: bold;
    cursor: pointer;
    transition: background 0.3s, color 0.3s;
    width: 151px;
    height: 36px;
          
           
           
}
 
.elegant-button:hover {
   /*  background: linear-gradient(to right, #2980b9, #5d6d7e); */
     background-color: #3399FF; 
   /*   background-color: #001F3F; */
    color: #fff;
}
.elegant-button:active {
    transform: scale(0.95);
}
 
/* Additional style for the search icon */
.elegant-button i {
    margin-right: 10px; /* Adjust the space between the button text and the icon */
   
}


.elegant-buttonR {
    background: linear-gradient(to right ,#F2A43E, #F29B29);
    border: 2px solid #3498db;
    color: #fff;
    padding: 5px;
   border-radius: 0px 15px 15px 0px;
    font-size: 15px;
    font-weight: bold;
    cursor: pointer;
    transition: background 0.3s, color 0.3s;
            align: right;
            width: 68px;
            height: 30px;
      
}
 
.elegant-buttonR:hover {
    background: linear-gradient(to right, #2980b9, red);
    color: #fff;
}
.elegant-buttonR:active {
    transform: scale(0.95);
}
 
/* Additional style for the search icon */
.elegant-buttonR i {
    margin-right: 10px; /* Adjust the space between the button text and the icon */
   
}   
 
   
}
/* .button15:disabled{
cursor: not-allowed;
} */

</style>


    </head>
   <body>
        
        <h:form id="medform">
        
        <center>
			<div class="example" >
				<h1>
					<h:outputText value="AVAILABLE STOCK" />
				</h1>
				<h:outputLabel for="medName"></h:outputLabel>
				<h:inputText id="medName" value="#{mainImpl.medName}"
					styleClass="example">
					
				</h:inputText>
				<h:commandButton
					action="#{paginationDao.getMedicinesList(mainImpl.medName)}"
					value="Search" styleClass="dummy " 
					actionListener="#{paginationDao.setShowErrorMessage(true)}" ></h:commandButton>
				<br />
				<h:message for="medform:medName" styleClass="error"
					style="color:red"></h:message>
				<br />
				
				    <h:commandButton action="#{paginationDao.clear()}" value="Reset" styleClass="button10"></h:commandButton>
				
<%-- 				<h:commandButton action="#{paginationDao.clear()}" value="Reset" styleClass="button10"></h:commandButton>
 --%>					
				<br>
				<br>
				<br>
			</div>
		</center>


		<center>
			
			<h:panelGroup rendered="#{empty paginationDao.getMedicinesList(mainImpl.medName) and paginationDao.showErrorMessage }"  >
<h:outputText value="No Records Found" style="color:red;font-weight:bold" />
   </h:panelGroup>
			
				<h:dataTable value="#{paginationDao.getMedicinesList(mainImpl.medName)}"
					var="i"  border="3">
					
				 <h:column>
                    <f:facet name="header">
                  
							<h:commandLink action="#{mainImpl.sortByEntryId()}"
								value="ENTRYID" styleClass="sortbutton" id="orderbyEntryId" style="text-decoration: none;color: black;">
								<br>
								<p id="arr1" style="display: inline; margin: 0;">&#11205;</p>
								<p id="arr2" style="display: inline; margin: 0;">&#11206;</p>
							</h:commandLink>
						</f:facet>
						<h:outputText value="#{i.entryId}" />
					</h:column>
           
              	    ƒ<h:column>
						<f:facet name="header">
							 <h:commandLink action="#{mainImpl.sortByMedId()}"
								value="STOCKID" styleClass="sortbutton" id="orderbyMedId" style="text-decoration: none;color: black;">
								<br>
								<p id="arr1" style="display: inline; margin: 0;">&#11205;</p>
								 <p id="arr2" style="display: inline; margin: 0;">&#11206;</p> 
							</h:commandLink> 
						</f:facet>
						<h:outputText value="#{i.medId}" />
					</h:column>
					ƒ<h:column>
                    <f:facet name="header">
                     <h:commandLink action="#{mainImpl.sortByMedName()}"
								value="STOCKNAME" styleClass="sortbutton" id="orderbyMedName" style="text-decoration: none;color: black;">
								<br>
								<p id="arr1" style="display: inline; margin: 0;">&#11205;</p>
								<p id="arr2" style="display: inline; margin: 0;">&#11206;</p>
							</h:commandLink> 
						</f:facet>
						<h:outputText value="#{i.medName}" />
						    </h:column>
					<h:column>
						<f:facet name="header">
							<h:outputLabel value="TYPE" />
						</f:facet>
						<h:outputText value="#{i.type}" />
					</h:column>

					<h:column>
						<f:facet name="header">
							<h:outputLabel value="QUANTITY" />
						</f:facet>
						<%-- <h:outputText  value="#{i.quantity}"
							style="#{i.quantity lt 6 ? 'color: red;' : 'color: black;'}" /> --%>
						
						 <h:outputText value="#{i.quantity}" 
						style="#{i.quantity <= 10 ? 'color: red;' : 'color: black;'}" />
					</h:column> 
					<h:column>
						<f:facet name="header">
							<h:outputLabel value="ENTRYDATE" />
						</f:facet>
						<h:outputText value="#{i.entryDate.toString().substring(0, 10)}" />
					</h:column>
					<h:column>
						<f:facet name="header">
							<h:outputLabel value="MANUFACTURE DATE" />
						</f:facet>
						<h:outputText value="#{i.mfgDate.toString().substring(0, 10)}" />
					</h:column>
					<h:column>
						
						<f:facet name="header">
							<h:outputLabel value="EXPIRYDATE" />
						</f:facet>
						<h:outputText value="#{i.expiryDate.toString().substring(0, 10)}"
						style="#{i.expiryWithinOneMonth or i.expired ? 'color: red;' : 'color: black;'}" />
						</h:column>
						
					<%-- 	<h:commandLink action="#{mainImpl.sortByExpDate()}"
								value="EXPIRYDATE" styleClass="sortbutton" id="orderbyExpDate" style="text-decoration: none;color:white">
								<p id="arr1" style="display: inline; margin: 0;">&#11205;</p>
								<p id="arr2" style="display: inline; margin: 0;">&#11206;</p>
							</h:commandLink> 
						</f:facet>
						<h:outputText value="#{i.expiryDate.toString().substring(0, 10)}"
						style="#{i.expiryWithinOneMonth or i.expired ? 'color: red;' : 'color: black;'}" />
					</h:column> --%>
					<h:column>
						<f:facet name="header">
							<h:outputLabel value="PRICE" />
						</f:facet>
						<h:outputText value="#{i.price}" />
					</h:column>
					<h:column>
						<f:facet name="header">
							<h:outputLabel value="UPDATE" />
						</f:facet>
						
						   	 	<h:commandButton
						
						 action="#{mainImpl.redirecttoUpdateMedicine(i.medId, i.medName, i.type, i.quantity, i.mfgDate, i.expiryDate, i.price)}"
value="UPDATE" styleClass="button4"> 
     
				
<%--     <h:commandButton
        type="button"
        value="UPDATE"
        styleClass="button4"
        onclick="updateMedicine()"
    />

     <script type="text/javascript">
        function updateMedicine() {
            var quantity = #{i.};
            var expiryWithinOneMonth = #{i.expiryWithinOneMonth};
            var expired = #{i.expired};

            if (!(expiryWithinOneMonth || expired || quantity < 20)) {
                // Perform the action if conditions are met
                #{mainImpl.redirecttoUpdateMedicine(i.medId, i.medName, i.type, i.quantity, i.mfgDate, i.expiryDate, i.price)};
            } else {
                // Optionally, show a message or perform other actions if conditions are not met
                console.log("Button is disabled due to conditions.");
            }
        }
    
 
    </script> --%>


      
      
<%-- 
 disabled="#{ not (i.expiryWithinOneMonth or i.expired or i.quantity lt 20) }"
style="#{ not (i.expiryWithinOneMonth or i.expired or i.quantity lt 20) ? 'cursor: not-allowed;' : ''}">   
 --%>

     
					</h:commandButton>
					</h:column>
				</h:dataTable>
				
				<br>
			
		<%-- <h:form id="form2">  --%>
		
				<!--The paging buttons-->
        <div style="margin-right:-90%;    -webkit-text-stroke: medium; color: white;" >
				<h:commandButton  styleClass="button6"  value="FIRST"
					action="#{paginationDao.pageFirst}"
					disabled="#{paginationDao.firstRow == 0}" ></h:commandButton>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					
				<h:commandButton   styleClass="button7"  value="PREV" action="#{paginationDao.pagePrevious}"
					disabled="#{paginationDao.firstRow == 0}" >
				<!-- 	<span style='font-size:35px;'>&#129184;</span> -->
				<%-- style="text-decoration: none;color:white;" --%>
					 </h:commandButton>
					&nbsp;
					
				<h:outputText value="&nbsp;" escape="false" />
				<h:commandButton styleClass="button8"  value="NEXT" action="#{paginationDao.pageNext}"
					disabled="#{paginationDao.firstRow + paginationDao.rowsPerPage >= paginationDao.totalRows}"  >
					<!--  <span style='font-size:35px;'>&#129185;</span> -->
					 <%-- style="text-decoration: none;color:white;" --%>
					</h:commandButton>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			
				<h:outputText value="&nbsp;" escape="false" />
				<h:commandButton  styleClass="button9"  value="LAST" action="#{paginationDao.pageLast}"
					disabled="#{paginationDao.firstRow + paginationDao.rowsPerPage >= paginationDao.totalRows}" ></h:commandButton>
			
				<h:outputText value="&nbsp;" escape="false" />
				<h:outputText styleClass="colour"
					value="Page #{paginationDao.currentPage} / #{paginationDao.totalPages}" />
				<br />

                 <br>
  
								
				<!-- Set rows per page -->
				<h:outputLabel for="rowsPerPage" value="Rows Per Page" />
				<h:inputText id="rowsPerPage"  styleClass="rowperpageInput"
				style=" height: 25px; border-radius: 4px;" value="#{paginationDao.rowsPerPage}" size="3" maxlength="3" converterMessage="Please enter numeric only" />
					&nbsp;&nbsp;
				<h:commandButton  styleClass="button16" value="SET"    action="#{paginationDao.pageFirst}" ></h:commandButton>
				
	            <h:message for="form2:rowsPerPage" style="color:red;font-weight:bold" />
				<br />
				
				</div>
				
					<h:messages id="globalMessages" globalOnly="true" style="color:red;font-weight:bolder"></h:messages> 
				<br/>	
				<h:commandButton action="TotalQuantity.jsp"  value="TOTAL QUANTITY"
					styleClass="elegant-button" >
				</h:commandButton>
		
		
<%--      action="#{mainImpl.redirecttoUpdateMedicine(i.medId,i.medName,i.type, i.quantity, i.mfgDate, i.expiryDate, i.price)}"  --%>



    <%--   </h:form>  --%>
		</center>
	</h:form>
    </body>
</html>
</f:view>
