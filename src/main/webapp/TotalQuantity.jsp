<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%> 
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%> 

<f:view>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
                    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.min.css"/>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<style>
    /* Reset some default styles */
    body, h1, h2, h3, p, ul, li, table, form {
        margin: 0;
        padding: 0;
    }


body {
          /*   font-family: Arial, sans-serif;
            background-color: white; 
            background-image: url("ph5.jpg");
            background-size: cover;
            background-repeat: no-repeat;
            margin: 0;
            padding: 0; */
            
             font-family: Arial, sans-serif;                 
                    background-color: #f2f2f2;                 
	background-image: url("Background.jpg");
	background-size: cover; 
                    padding: 3px;
                    margin: 3px ;  
                    overflow-x: hidden;
        }

        form {
            width: 75%;
          /*   background: opacity: 0.5; */
            margin: 100px auto 0;
            padding: 20px;
            border-radius: 8px;
          /*   box-shadow: 0 0 10px rgba(0, 0, 0, 0.2); */
            
        
        }

        .container {
            background-color: white;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            padding: 20px;
            margin: 20px;
        }

      
        .button4{
            background-color: white; /* Light gray button */
            color: black; /* Dark gray text */
            border: 2px solid #666; /* Dark gray border */
            align: right;
            background-color: blue; /* Light gray button */
            color: white; /* Dark gray text */
            border: 2px solid #666; /* Dark gray border */
            align: right;
        }
        
        .button4:hover {
            background-color: #1839A6; /* Dark gray button on hover */
            color: #fff; /* White text on hover */
        }
        
        .button4:disabled {
        opacity: 0.5; /* Reduce opacity for disabled buttons */
        cursor: not-allowed; /* Change cursor for disabled buttons */
    }
 
    .button4:not(:disabled) {
        background-color: blue; /* Green background color */
        color: white; /* White text color on hover */
        transform: scale(1.1); /* Scale up slightly on hover for a subtle effect */
    }
           .button5 {
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
 
  
        
        .button10 {
            background-color: white; /* Light gray button */
            color: black; /* Dark gray text */
            border: 2px solid #666; /* Dark gray border */
           align: right;
    width: 61px;
    height: 25px;
    border-radius: 4px;
    font-size: 18px;
    margin-top: -120px;
        }
        
        .button10:hover {
            background-color: black; /* Dark gray button on hover */
            color: #fff; /* White text on hover */
            cursor: pointer;
        }
        
   

        header {
            background-color: #333; /* Dark gray header background */
            color: #fff; /* White text */
            padding: 100px 0;
            text-align: center;
        }

       h1 {
	font-size: 40px;
	color: white; /* Dark gray heading text */
	margin-bottom: 20px;
	 text-shadow: 4px 4px 8px rgba(0, 0, 0, 0.5);
   
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
/*         width: 100%;
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
        background-color: brown;/* Blue color */
        color: #fff;
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
	/* background-color: #DF7A2C;  */
	 background-color: brown;
	color: white; /* Dark gray text */
	border: 2px solid #666; /* Dark gray border */
	align: right;
	margin-bottom: 120px;
}

.DUMMY:HOVER {
	 background: linear-gradient(to right, #2980b9, red);
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
    background: linear-gradient(to right, #DC6E2E, brown);
    border: 2px solid #3498db;
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
    background: linear-gradient(to right, brown, #DC6E2E);
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
  
      
      <h:form id="medform">
   
        		<center>
        		<div class="example" style="">
                <h1>
                <h:outputText value="TOTAL QUANTITY"/>
                </h1>
                <br>
                <br>
           
            
            <h:outputLabel for="medName"></h:outputLabel>
				<h:inputText id="medName" value="#{medicines.medName}"
					styleClass="example">
					
				</h:inputText>
				<h:commandButton
					action="#{paginationTotal.getMedicinesTotalList(medicines.medName)}"
					value="Search" styleClass="dummy"  
					actionListener="#{paginationTotal.setShowErrorMessage(true)}" ></h:commandButton>
				<br />
				<h:message for="medform:medName" styleClass="error"
					style="color:red"></h:message>
				<br />
				
				<h:commandButton action="#{paginationTotal.clear()}" value="Reset" styleClass="button10"></h:commandButton>
				</div>
				<br>
				<br>
				<br>
		</center>

	<center>
			
			<h:panelGroup rendered="#{empty paginationTotal.getMedicinesTotalList(medicines.medName) and paginationTotal.showErrorMessage }"  >
<h:outputText value="No Records Found" style="color:red;font-weight:bold" />
   </h:panelGroup>
			
        <h:dataTable value="#{paginationTotal.getMedicinesTotalList(medicines.medName)}" var="i" border="3" >
                 <h:column>
                     <f:facet name="header">
                    	<h:outputLabel value="STOCK ID" />
                    </f:facet>
                    	<h:outputLabel value="#{i.medId}" />
               </h:column>    
                      <h:column>
                     <f:facet name="header">
                    	<h:outputLabel value="STOCK NAME" />
                    </f:facet>
                    	<h:outputLabel value="#{i.medName}" />
               </h:column>
                <h:column>
                     <f:facet name="header">
                    	<h:outputLabel value="TYPE" />
                    </f:facet>
                    	<h:outputLabel value="#{i.type}" />
               </h:column>
               <h:column>
                     <f:facet name="header">
                    	<h:outputLabel value="QUANTITY" />
                    </f:facet>
                    <h:outputText value="#{i.quantity}"
                    style="#{i.quantity == 5 ? 'color: red;' : 'color: black;'}" />
                </h:column>
    
                </h:dataTable>
                <br/>
         
				<!--The paging buttons-->
 <!--The paging buttons-->
<!-- <div style="margin-right:-90%;    -webkit-text-stroke: medium;" > -->
 <div style=" margin-right:-90%; margin_bottom: -90%; bottom: 20px; right: 20px;">
<h:commandButton styleClass="button6" value="FIRST" action="#{paginationTotal.pageFirst}" disabled="#{paginationTotal.firstRow == 0}" />

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

<%-- <h:commandLink  value="" action="#{paginationTotal.pagePrevious}" disabled="#{paginationTotal.firstRow == 0}"  style="text-decoration: none;color:black">
    <span style='font-size:35px;'>&#129184;</span>
</h:commandLink>
&nbsp;

<h:outputText  value="&nbsp;" escape="false" />
<h:commandLink  value="" action="#{paginationTotal.pageNext}" disabled="#{paginationTotal.firstRow + paginationTotal.rowsPerPage >= paginationTotal.totalRows}"  style="text-decoration: none;color:black">
    <span style='font-size:35px;'>&#129185;</span>
</h:commandLink> --%>
<h:commandButton   styleClass="button7"  value="PREV" action="#{paginationTotal.pagePrevious}"
					disabled="#{paginationTotal.firstRow == 0}" >
					 </h:commandButton>
					&nbsp;
					
				<h:outputText value="&nbsp;" escape="false" />
				<h:commandButton styleClass="button8"  value="NEXT" action="#{paginationTotal.pageNext}"
					disabled="#{paginationTotal.firstRow + paginationTotal.rowsPerPage >= paginationTotal.totalRows}"  >
					</h:commandButton>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

<h:commandButton styleClass="button9" value="LAST" action="#{paginationTotal.pageLast}" disabled="#{paginationTotal.firstRow + paginationTotal.rowsPerPage >= paginationTotal.totalRows}" >
</h:commandButton>

<h:outputText value="&nbsp;" escape="false" />
<h:outputText styleClass="colour" value="Page #{paginationTotal.currentPage} / #{paginationTotal.totalPages}" />
<br />

<br>

<!-- Set rows per page -->
<h:outputLabel for="rowsPerPage" value="Rows Per Page" />
<h:inputText id="rowsPerPage" styleClass="rowperpageInput" style=" height: 25px; border-radius: 4px;" value="#{paginationTotal.rowsPerPage}" size="3" maxlength="3" converterMessage="Please enter numeric only" />
&nbsp;&nbsp;
<h:commandButton styleClass="button10" value="SET" action="#{paginationTotal.pageFirst}"></h:commandButton>
<h:message for="form2:rowsPerPage" style="color:red;font-weight:bold" />
<br />

</div>
                
                <br>
                 <h:commandButton action="ShowMedicinesPagination.jsp"
                             value="SHOW STOCK"  styleClass="elegant-button">
                             </h:commandButton>
                
                
                </center>
        </h:form>
        				<style>
				body{margin:0;}
.s-media{
 position: fixed;
 top: -204px;
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
   
    </body>

</html>
</f:view>