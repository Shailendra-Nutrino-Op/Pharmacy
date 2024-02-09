<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<f:view>
    <html>
    <head>
    
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	                       <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.min.css"/>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<link rel="stylesheet" type="text/css" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
   <title>Search Page</title>       
   <script>
	$(document).ready(function() {
		$( ".datepicker" ).datepicker({
			dateFormat: 'yy-mm-dd',
			changeMonth: true,
			changeYear: true,
			yearRange: "1960:2037"
		});
	});
	</script>
	
	<style>
	.paginationButton {
        background-color: #5A2476;
        color: white;
        padding: 8px 12px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        margin-right: 5px;
    }

    .paginationButton:disabled {
        background-color: #ddd;
        color: #666;
        cursor: not-allowed;
    }

    .paginationInfo {
        margin-left: 10px;
        color: #333;
    }
   body {
            font-family: 'Helvetica', 'Arial', sans-serif;
            line-height: 1.6;
            color: #333;
            background-color: #f4f4f4;
            padding: 0px;
            margin: 0px;
        }

    #footer {
        background-color:#100720;
        display:flex;
        flex-direction:column;
        text-align: center;
        padding: 10px;
        padding-top: 60px;
        
    }
</style>
                
                <style>
                
                
          body {
    background: linear-gradient(to bottom, #79b2d0a8, #FFFFFF); /* Adjust gradient colors as needed */
}

 .datepicker {
	width: 100%;
	padding: 10px;
	margin-bottom: 15px;
	border: 1px solid #007bff; /* Border color for the selected state */
	border-radius: 5px;
	font-size: 16px;
	align-content: center;
	align-self: center;
	justify-content: center;
	color: #007bff; /* Text color for the selected state */
}
 
.datepicker:hover {
	background-color: #f8f9fa; /* Background color on hover */
}
 
.datepicker:focus {
	outline: none; /* Remove the outline on focus */
}

/*--------------------------- styles.css------------------------------------------------------- */

.my-form {
  width: 50%;
    margin: 0 auto;
    padding: 20px;
    background-color: white;
    border: 1px solid #ddd;
    border-radius: 5px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.my-form label {
    display: block;
    margin-bottom: 8px;
    font-weight: bold;
}


.my-form input[type="text"]
 {
    width: 33%;
    padding: 8px;
    margin-bottom: 12px;
    box-sizing: border-box;
    border: 1px solid #ccc;
    border-radius: 4px;
}

.my-form select {
    width: 32%;
    padding: 10px;
    margin-bottom: 12px;
    box-sizing: border-box;
    border: 1px solid #ccc;
    border-radius: 6px;
}
option{
    padding: 10px;
    border-radius: 6px;
}
.my-form input[type="submit"] {
    background-color: #3498db; /* Cool blue color */
    color: #fff;
    padding: 10px 15px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    transition: background-color 0.3s;
    font-size: 16px;
    font-weight: bold;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    margin-top: 10px;
}

.my-form input[type="submit"]:hover {
    background-color: #2980b9; /* Darker shade of blue on hover */
    color: #fff;
    transform: scale(1.1);
}
     /* styles.css */

.my-datatable {
    width: 100%;
    border-collapse: collapse;
    margin-top: 10px;
    background-color: white;
}

.my-datatable th, .my-datatable td {
    padding: 8px;
    border: 1px solid #ddd;
    text-align: left;
}

.my-datatable th {
    background-color: #3498db; /* Header background color */
    color: #fff;
}

.my-datatable tr:nth-child(even) {
    background-color: #f2f2f2; /* Alternating row background color */
}

.my-datatable tr:hover {
    background-color: #e0e0e0; /* Hovered row background color */
}
            #header{
            	box-shadow: 0px 4px 14px 0px rgba(0, 0, 0, 0.05);
                color: white;
                text-align: center;
                padding: 10px;
                display:flex;
                flex-direction: row;
                justify-content: space-between;
                padding-top: 0px;
                padding-bottom: 0px;
                background-color: #FFFFFF;
                align-items: center;
                
                      }
                      #header, h2{
                      margin: 0px; 
                      }

            #content {
                padding-top: 100px;
                padding-bottom: 100px;
                
                padding-left: 20px;
                padding-right: 20px;
                
                
            }
            .input-fields{
            display: flex;
                   margin-left: 113px;
    gap: 95px;
            }
        </style> 
        <script>
        function toggleInputText() {
            var selectedValue = document.getElementById("searchform:searchParameter").value;
            var SaleIDinput = document.getElementById("searchform:SaleIDinput");
            var PrescriptionIdinput = document.getElementById("searchform:PrescriptionIdinput");
            var UHIDinput = document.getElementById("searchform:UHIDinput");
            var ProviderIDinput = document.getElementById("searchform:ProviderIDinput");
            var startDateInput = document.getElementById("searchform:startDateInput");
            var endDateInput = document.getElementById("searchform:endDateInput");

            // Hide all input fields
            SaleIDinput.style.display = "none";
            PrescriptionIdinput.style.display = "none";
            UHIDinput.style.display = "none";
            ProviderIDinput.style.display = "none";
            startDateInput.style.display = "none";
            endDateInput.style.display = "none";

            // Show the selected input field
            if (selectedValue === "saleId") {
                SaleIDinput.style.display = "block";
            } else if (selectedValue === "prescription_Id") {
                PrescriptionIdinput.style.display = "block";
            } else if (selectedValue === "uHID") {
                UHIDinput.style.display = "block";
            } else if (selectedValue === "providerId") {
                ProviderIDinput.style.display = "block";
            }  else if (selectedValue === "dateRange") {
                startDateInput.style.display = "inline-block";
                endDateInput.style.display = "inline-block";
            } 
        }
       /*      StartDateinput.style.display = (selectedValue === "dateRange") ? "inline-block" : "none";
            
            // Show/Hide End Date input field based on the selected parameter
            EndDateinput.style.display = (selectedValue === "dateRange") ? "inline-block" : "none";
        } */
        
    	// Initialize the input field based on the default value
    	document.addEventListener('DOMContentLoaded', toggleInputText);

       	$(document).ready(function() {
    		$( ".datepicker" ).datepicker({
    			dateFormat: 'yy-mm-dd',
    			changeMonth: true,
    			changeYear: true,
    			yearRange: "1960:2037"
    		});
    	});

        </script>
<script>
function clearInput(input){
	input.value='';
}
</script>
    </head>
           <style>
.menu, .menu-bar, .menu-bar1 {
    position: fixed;
    top: 0;
    left: 0;
    height: 100%;
    list-style-type: none;
    margin: 0;
    padding: 0;
    background: #f7f7f7;
    z-index:10;  
    overflow:hidden;
    box-shadow: 2px 0 18px rgba(0, 0, 0, 0.26);
}
.menu li a{
  display: block;
  text-indent: -500em;
  height: 5em;
  width: 5em;
  line-height: 5em;
  text-align:center;
  color: #72739f;
  position: relative;
  border-bottom: 1px solid rgba(0, 0, 0, 0.05);
  transition: background 0.1s ease-in-out;
}
.menu li a:before {
  font-family: FontAwesome;
  speak: none;
  text-indent: 0em;
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  font-size: 1.4em;
}
.menu li a.search:before {
  content: "\f002";
}
.menu li a.archive:before {
  content: "\f187";
}
.menu li a.pencil:before {
  content: "\f040";
}
.menu li a.contact:before {
  content: "\f003";
}
.menu li a.about:before {
  content: "\f007";
}
.menu li a.home:before {
  content: "\f039";
}
.menu-bar li a:hover,
.menu-bar1 li a:hover,
.menu li a:hover,
.menu li:first-child a {
  background: #267fdd;
  color: #fff;
}
.menu-bar{
    overflow:hidden;
    
    left:5em;
    z-index:5;
    width:0;
    height:0;
    transition: all 0.1s ease-in-out;
}
.menu-bar1{
    overflow:hidden;
    left:5em;
    z-index:5;
    width:0;
    height:0;
    transition: all 0.1s ease-in-out;
}
.menu-bar li a{
  display: block;
  height: 4em;
  line-height: 4em;
  text-align:center;
  color: #72739f;
  text-decoration:none;  
  position: relative;
  font-family:verdana;
  border-bottom: 1px solid rgba(0, 0, 0, 0.05);
  transition: background 0.1s ease-in-out;
}
.menu-bar1 li a{
  display: block;
  height: 4em;
  line-height: 4em;
  text-align:center;
  color: #72739f;
  text-decoration:none;  
  position: relative;
  font-family:verdana;
  border-bottom: 1px solid rgba(0, 0, 0, 0.05);
  transition: background 0.1s ease-in-out;
}
.menu-bar li:first-child a{
    height:5em;
    background: #408289;
    color: #fff;    
    line-height:5
}
.menu-bar1 li:first-child a{
    height:5em;
    background: #408289;
    color: #fff;    
    line-height:5
}


.para{
    color:#033f72;
    padding-left:100px;
    font-size:3em;
    margin-bottom:20px;
}

.open{
    width:10em;
    height:100%;
}

@media all and (max-width: 500px) {
    .container{
        margin-top:100px;
    }
    .menu{
        height:5em;
        width:100%;
    }
    .menu li{
        display:inline-block;
        float:left;
    }
    .menu-bar li a{
        width:100%;
    }
    .menu-bar1 li a{
        width:100%;
    }
    .menu-bar{
        width:100%;
        left:0;
        height:0;
    }
    .menu-bar1{
        width:100%;
        left:0;
        height:0;
    }
    .open{
        width:100%;
        height:auto;
    }
    .para{
    padding-left:5px;
}  
}
@media screen and (max-height: 34em){
  .menu li,
  .menu-bar,
  .menu-bar1 {
    font-size:70%;
  }
}
@media screen and (max-height: 34em) and (max-width: 500px){
  .menu{
        height:3.5em;
    }
}
    </style>
    <script>
        $(document).ready(function(){
            $(".menu-button").click(function(){
                $(".menu-bar").toggleClass("open");
                $(".menu-bar1").removeClass("open"); // Close the other menu if it's open
            });

            $(".active").click(function(){
                $(".menu-bar1").toggleClass("open");
                $(".menu-bar").removeClass("open"); // Close the other menu if it's open
            });

            $(document).click(function(e) {
                // Collapse the menus when clicking anywhere on the document
                if (!$(e.target).closest('.menu, .menu-bar, .active').length) {
                    $(".menu-bar").removeClass("open");
                    $(".menu-bar1").removeClass("open");
                }
            });
        });
        
    </script>

      </head> 
    <body>
    <style>
	body{margin:0;}
.s-media{
 position: fixed;
 right: 0;
 z-index: 1000;
 transition:all linear 0.2s ;
}
.s-media a:first-child{
    border-radius: 0 5px 0 0;
}
.s-media a:last-child{
    border-radius: 0 0 5px 0;
}
.s-item {
    display:flex;
    width: 110px;
    height: 60px;
    color: white;
    font-size: 20px;
    line-height: 60px;
    text-align: center;
  	justify-content: center;
  	align-items:center;
	text-decoration: none;

    transition:all linear 0.2s ;
}
.s-item:hover {
    width:70px;
    
}

  
#sm-open {
    position: fixed;
    top: 290px ;
    right: -60px;
    border-radius:30px 0px 0px 30px;
    
    transition:all linear 0.2s ;
}
.facebook {background-color: #305891;
margin-top: 234px;
}
.skype {background-color: #27A7E7;}
.instagram {background-color: #4169e1;}
.whatsapp {background-color: #25D366; }
.print {background-color: #7CB0A4;}
.sm-collapse{right: -60px; }
		</style>
<div class="s-media">
    <a href="Menu.jsp" class="s-item facebook" onclick="showLoader()">
    <i class=""></i>
    <span>Menu</span>
</a>
    
    <a href="contact.jsp" class="s-item skype" onclick="showLoader()">
    	<span class="">Contact</span>
    </a>
  
    <a href="PharmacyDashboard.jsp" class="s-item instagram">
    	<span class="">Dashboard</span>
    </a>

    <a href="LoginPage.jsp" class="s-item whatsapp">
    	<span class="">Login</span>
    </a>

    <a id="sm-close"  class="s-item print">
        <span class="fa fa-arrow-right"></span>
    </a>

 </div>
    
    
    		<ul class="menu">

      <li title="home"><a href="#" class="menu-button home">menu</a></li>
      
      <li title="insurance"><a href="#" class="search">insurances</a></li>
      <li title="login"><a href="#" class="active about">Login</a></li>
      <li title="archive"><a href="#" class="archive">archive</a></li>
      <li title="contact"><a href="contact.jsp" class="contact">contact</a></li>
    </ul>
    
    <ul class="menu-bar">
        <li><a href="PharmacyEnrollment.jsp" class="menu-button">Pharmacy</a></li>
        <li><a href="Provider.jsp">Provider</a></li>
        <li><a href="Recipient.jsp">Patient</a></li>
        <li><a href="#">Insurance</a></li>
    </ul>
        <ul class="menu-bar1">
        <li><a href="LoginPage.jsp" class="menu-button">Pharmacy Login</a></li>
        <li><a href="LoginPage.jsp">Provider Login</a></li>
        <li><a href="LoginPage.jsp">Patient Login</a></li>
        <li><a href="LoginPage.jsp">Admin Login</a></li>
    </ul>
    <body>
   
        <div id="header">
        <img src="pharmacy logo.png" style="height:auto; width:179px; margin-left: 63px;"/>
        <div style="display: flex; flex-direction: row; gap:20px;"> 
        <a href="/" style="text-decoration: none;"><p style="font-size: 18px; font-weight: 600; color:#333333; font-family: sans-serif; cursor: pointer;">Home</p></a>
                 <p style="font-size: 18px; font-weight: 600; color:#333333; font-family: sans-serif;">Contact Us</p>
         <p style="font-size: 18px; font-weight: 600; color:#333333; font-family: sans-serif;">About Us</p>
         <p style="font-size: 18px; font-weight: 600; color:#333333; font-family: sans-serif;">Login</p>
         <p style="font-size: 18px; font-weight: 600; color:0A4ADF; font-family: sans-serif;">+91 7979797979</p>             
        </div>
        </div>

        <div id="content">
           
        <h:form styleClass="my-form" id="searchform">
         <center>
        <div>
        <h:selectOneMenu id="searchParameter" onchange="toggleInputText()">
            <f:selectItem itemValue="Select Parameter to Search" />
            <f:selectItem itemValue="saleId" itemLabel="Sale ID" />
            <f:selectItem itemValue="prescription_Id" itemLabel="Prescription ID" />
            <f:selectItem itemValue="uHID" itemLabel="UHID" />
            <f:selectItem itemValue="providerId" itemLabel="Provider ID" />
                <f:selectItem itemValue="dateRange" itemLabel="Date Range" />
            
        </h:selectOneMenu>
        </div>
        
        <%-- <h:panelGroup id="SaleIDinput" style="display:none;"> --%>
       <h:panelGroup id="SaleIDinput" style="display: #{not empty medicine.saleId ? 'block' : 'none'};">
            <h:outputLabel for="saleId">Sale ID</h:outputLabel><br/>
            <h:inputText id="saleId" value="#{medicine.saleId}"  autocomplete= "off" onfocus="clearInput(this)"/><br/>
              <h:message for="saleId" style="color: red" />
        </h:panelGroup>
        <h:panelGroup id="PrescriptionIdinput" style="display: #{not empty medicine.prescription_Id ? 'block' : 'none'};">
            <h:outputLabel for="prescription_Id">Prescription ID</h:outputLabel><br/>
            <h:inputText id="prescription_Id" value="#{medicine.prescription_Id}"  autocomplete= "off" onfocus="clearInput(this)"/><br/>
           <h:message for="prescription_Id" style="color: red" />
        </h:panelGroup>
        <h:panelGroup id="UHIDinput" style="display: #{not empty medicine.uHID ? 'block' : 'none'};">
            <h:outputLabel for="uHID">UHID</h:outputLabel><br/>
            <h:inputText id="uHID" value="#{medicine.uHID}" autocomplete= "off" onfocus="clearInput(this)" /><br/>
           <h:message for="uHID" style="color: red" />
        </h:panelGroup>
        <h:panelGroup id="ProviderIDinput" style="display: #{not empty medicine.providerId ? 'block' : 'none'};">
            <h:outputLabel for="providerId">Provider ID</h:outputLabel><br/>
            <h:inputText id="providerId" value="#{medicine.providerId}" autocomplete= "off" onfocus="clearInput(this)"/><br/>
            <h:message for="providerId" style="color: red" />
            
        </h:panelGroup><br/><br/>  
        
             
<div class="input-fields">
    <h:panelGroup id="startDateInput" style= "display: #{(param.selectedValue eq 'startDate' or not empty medicinesDao.startDate) ? 'inline-block' : 'none'} ;">   
        <h:outputLabel for="sDate" value="Sale Start Date " />
        <h:inputText value="#{medicinesDao.startDate}" id="sDate" styleClass="form-control datepicker" onkeydown="return false;"  onfocus="clearInput(this)">
            <f:convertDateTime pattern="yyyy-MM-dd" />
        </h:inputText></br>
        <h:message for="sDate" style="color: red" />
    </h:panelGroup>
    
    <h:panelGroup id="endDateInput" style= "display: #{(param.selectedValue eq 'endDate' or not empty medicinesDao.endDate) ? 'inline-block' : 'none'} ;">   
        <h:outputLabel for="eDate" value="Sale End Date   " />
        <h:inputText value="#{medicinesDao.endDate}" id="eDate" styleClass="form-control datepicker" onkeydown="return false;"  onfocus="clearInput(this)">
            <f:convertDateTime pattern="yyyy-MM-dd" /><br>
        </h:inputText></br>
        <h:message for="eDate" style="color: red" /></br> 
    </h:panelGroup>
</div>
            

             <h:messages id="globalMessages" globalOnly="true" style="color:red;"></h:messages>

                                  
        <h:commandButton id="searchButton" action="#{medicinesDao.searchAllSales(medicinesDao.startDate,medicinesDao.endDate,medicine.saleId,medicine.prescription_Id,medicine.providerId,medicine.uHID)}"
         value="Search" style="background-color: blue; color: white;"/></br>     
        <h:commandButton action="#{medicinesDao.clear()}" value="Reset" style="background-color: red; color: white; padding-left:20px; padding-right:20px;"/><br>    
           </center>
            </h:form>
            
         

        <h:form>
        <h:panelGroup rendered="#{not empty paginationDao.getSaleList() }">
            <center>
                <h2><h:outputText value="Sales List"/></h2>
            </center>
            <center>
            
            <h:dataTable value="#{paginationDao.getSaleList()}" var="s" border="3" styleClass="my-datatable">
                <%-- <h:dataTable value="#{saleList}" var="s" border="3"> --%>
                <h:column>
                    <f:facet name="header">
             <h:outputLabel> Sale ID	
					<h:commandLink action="#{paginationDao.sortBySaleId}">&#9757;</h:commandLink>
							<h:commandLink action="#{paginationDao.sortBySaleIdDes}">&#128071;</h:commandLink>
						</h:outputLabel>
                    </f:facet>
                      <h:commandLink style="text-decoration: none; color: #007bff; font-weight: bold;" action="#{medicinesDao.SearchSalesSingle(s.saleId)}" value="#{s.saleId}"/>
                </h:column>
                     <h:column>
                    <f:facet name="header">
                        <h:outputLabel> Pharmacy ID
                        <h:commandLink action="#{paginationDao.sortByPharmId}">&#9757;</h:commandLink>
							<h:commandLink action="#{paginationDao.sortByPharmIdDes}">&#128071;</h:commandLink>
							</h:outputLabel>
                    </f:facet>
                    <h:outputText value="#{s.pharm_id}"/>
                </h:column>
                 <h:column>
                    <f:facet name="header">
                       <h:outputLabel> Medicine Name
                        <h:commandLink action="#{paginationDao.sortByMedName}" style="text-decoration:none;" >&#9757;</h:commandLink>
							<h:commandLink action="#{paginationDao.sortByMedNameDes}">&#128071;</h:commandLink>
							</h:outputLabel>
                    </f:facet>
                    <h:outputText value="#{s.medName}"/>
                </h:column>
                 <h:column>
                    <f:facet name="header">
                        <h:outputLabel>Sale Date
                          <h:commandLink action="#{paginationDao.sortBySaleDate}">&#9757;</h:commandLink>
							<h:commandLink action="#{paginationDao.sortBySaleDateDes}">&#128071;</h:commandLink>  
                        </h:outputLabel>
                    </f:facet>
                    <h:outputText value="#{s.saleDate}">
                    <f:convertDateTime pattern="yyyy-MM-dd" />
                    </h:outputText>
                </h:column> 
                 <h:column>
                    <f:facet name="header">
                        <h:outputLabel>Quantity
                          <h:commandLink action="#{paginationDao.sortByQuantity}">&#9757;</h:commandLink>
							<h:commandLink action="#{paginationDao.sortByQuantityDes}">&#128071;</h:commandLink>
                        </h:outputLabel>
                    </f:facet>
                    <h:outputText value="#{s.quantity}"/>
                </h:column> 
                 <h:column>
                    <f:facet name="header">
                        <h:outputLabel>Provider ID
                          <h:commandLink action="#{paginationDao.sortByProviderId}">&#9757;</h:commandLink>
							<h:commandLink action="#{paginationDao.sortByProviderIdDes}">&#128071;</h:commandLink>
                        </h:outputLabel>
                    </f:facet>
                    <h:outputText value="#{s.providerId}"/>
                </h:column> 
                 <h:column>
                    <f:facet name="header">
                        <h:outputLabel>UHID
                          <h:commandLink action="#{paginationDao.sortByUHId}">&#9757;</h:commandLink>
							<h:commandLink action="#{paginationDao.sortByUHIdDes}">&#128071;</h:commandLink>
                        </h:outputLabel>
                    </f:facet>
                    <h:outputText value="#{s.uHID}"/>
                </h:column> 
                 <h:column>
                    <f:facet name="header">
                        <h:outputLabel>Prescription ID
                          <h:commandLink action="#{paginationDao.sortByPrescriptionId}">&#9757;</h:commandLink>
							<h:commandLink action="#{paginationDao.sortByPrescriptionIdDes}">&#128071;</h:commandLink>
                        </h:outputLabel>
                    </f:facet>
                    <h:outputText value="#{s.prescription_Id}"/>
                </h:column>          
            </h:dataTable>
            <h:commandButton value="first" action="#{paginationDao.pageFirst}" 
                 disabled="#{paginationDao.firstRow == 0}" styleClass="paginationButton"/> 
				<h:commandButton value="prev" action="#{paginationDao.pagePrevious}" 
                 disabled="#{paginationDao.firstRow == 0}" styleClass="paginationButton"/> 
				<h:outputText value="&nbsp;" escape="false"/> 
				<h:commandButton value="next" action="#{paginationDao.pageNext}" 
                 disabled="#{paginationDao.firstRow + paginationDao.rowsPerPage >= paginationDao.totalRows}" styleClass="paginationButton"/> 
				<h:outputText value="&nbsp;" escape="false"/> 
				<h:commandButton value="last" action="#{paginationDao.pageLast}" 
                 disabled="#{paginationDao.firstRow + paginationDao.rowsPerPage >= paginationDao.totalRows}" styleClass="paginationButton"/> 
				<h:outputText value="&nbsp;" escape="false"/> 
				<h:outputText value="Page #{paginationDao.currentPage} / #{paginationDao.totalPages}" styleClass="paginationInfo" /> 

                <br /> 
               
            </h:panelGroup>
            </h:form>
        </center>
        </div>
 
    </body>
    
      <footer id="footer">
      <div  style="display: flex; flex-direction: row; gap:20px;justify-content: center; align-items: center; margin-bottom: 20px;"> 
      <img style="width: 52px; height:52px;"alt="" src="facebook.png">
            <img style="width: 52px; height:52px;" alt="" src="ig1.png">
            <img style="width: 52px; height:52px;"alt="" src="twitter.jpg">
             
                   
        </div>
       <div style="display: flex; flex-direction: row; gap:20px;justify-content: center; align-items: center;"> 
        <a href="/" style="text-decoration: none;"><p style="font-size: 18px; font-weight: 600; color:#FFF; font-family: sans-serif; cursor: pointer;">Home</p></a>
                 <p style="font-size: 18px; font-weight: 600; color:#FFF; font-family: sans-serif;">Contact Us</p>
         <p style="font-size: 18px; font-weight: 600; color:#FFF; font-family: sans-serif;">About Us</p>
         <p style="font-size: 18px; font-weight: 600; color:#FFF; font-family: sans-serif;">News</p>
         <p style="font-size: 18px; font-weight: 600; color:#FFF; font-family: sans-serif;">Our Team</p>         
        </div>
        <p style="font-size: 14px; font-weight: 500; color:#FFF; font-family: sans-serif;">&copy; 2023 Infinite Computer Solutions. All rights reserved.</p>
    </footer>
</html>
</f:view>
