<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%> 
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%> 

<f:view>
<html>
    <head>

	<!-- DatePicker JavaScript & CSS -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
                    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.min.css"/>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
 
<!-- DatePicker CSS -->
<link rel="stylesheet" type="text/css" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
 
<script>
    $(document).ready(function() {
        $(".datepicker").datepicker({
            dateFormat: 'yy-mm-dd',
            changeMonth: true,
            changeYear: true,
            yearRange: "1960:2037"
        });
    });

</script> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
    /* Page layout and background */
body {
    font-family: "Times New Roman", Arial, sans-serif;
	background-image: url("Background.jpg");
	background-size: cover;
       color: #fff; /* Text color for better visibility on the gradient */
      background-repeat: no-repeat;
			  
    
    background-size: cover;
    margin: 0;
   /*   overflow-x: hidden; */
    
}    


form {
    margin: 25px auto;
    padding: 15px;
    background-color: rgba(255, 255, 255, 0.8);
    border: 1px solid #ddd;
    border-radius: 5px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    width: 40%;
    display: flex;
    flex-direction: column; /* Align form elements in a column */
}


.inputText, .selectOneMenu, .inputTextarea {
    width: 100%;
    padding: 6px 12px;
    margin: 3px 0;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}

.commandButton {
    background-color: #007bff;
    color: #fff;
    border: none;
    padding: 10px 20px;
    text-align: center;
    text-decoration: none;
    font-size: 16px;
    margin: 10px 0;
    cursor: pointer;
    border-radius: 4px;
    transition: background-color 0.3s ease;
}

.commandButton:hover {
    background-color: #0056b3;
}
.button:HOVER {
	background-color: green;
}

.message {
    color: red;
    font-family: Miriam Libre;
}
h2{
   text-align: center; color: #51B262;   text-shadow: 4px 4px 8px rgba(0, 0, 0, 0.3);
    padding: 0px;  font-family: 'Arial', sans-serif;font-size:30px;
}

.style {
      background: #51B262;
      /*  border: 2px solid; */
      color: white; 
    border: 2px solid #666; 
    align: right;
    width: 115px;
    height: 39px;
    border-radius: 14px;
}
.style:hover {
            background-color: #6DD975; /* Dark gray button on hover */
            color: #fff; /* White text on hover */
        }
        
        
        .style1 {
      background:#379FE5;
      /*  border: 2px solid; */
      color: white; 
   border: 2px solid #666; 
    align: right;
    width: 115px;
    height: 39px;
    border-radius: 14px;
}

.style1:hover {
            background-color: #1C76B2; /* Dark gray button on hover */
            color: #fff; /* White text on hover */
        }
        
        .elegant-button {
    background: linear-gradient(to right, #08141c, #51B262);
    border: 2px solid #3498db;
    color: #fff;
    padding: 7px 10px;
    border-radius: 8px;
    font-size: 16px;
    font-weight: bold;
    cursor: pointer;
    transition: background 0.3s, color 0.3s;
}
 
.elegant-button:hover {
    background: linear-gradient(to right, #2980b9, #5d6d7e);
    color: #fff;
}
.elegant-button:active {
    transform: scale(0.95);
}
 
/* Additional style for the search icon */
.elegant-button i {
    margin-right: 10px; /* Adjust the space between the button text and the icon */
   
}
        


        </style>  
        
        
        <script>
    function isNumberKey(evt) {
        var charCode = (evt.which) ? evt.which : event.keyCode;
        if (charCode > 31 && (charCode < 48 || charCode > 57)) {
            return false;
        }
        return true;
    }
</script>
        
        
    </head>
    <body>
    
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
  
    
        <h:form id="form">
   
       
        	<h2>
    <h:outputText value="UPDATE MEDICINES"/>
</h2>

            <center>
   
	MED ID   : 

	 <h:inputText value="#{medId}" readonly="true" disabled="true" styleClass="inputText "></h:inputText><br/>
		<br />

	MED NAME :

	<h:inputText value="#{medName}" readonly="true" disabled="true" styleClass="inputText "></h:inputText><br/>
		<br />
	
	TYPE     :

	<h:inputText value="#{type}"  readonly="true" disabled="true" styleClass="inputText "></h:inputText><br/>
		<br />

	QUANTITY :

	<h:inputText id="quantity" value="#{quantity}" converterMessage="Please enter numeric only"  styleClass="inputText "
	 onkeypress="return isNumberKey(event)"></h:inputText><br/>
			<h:message for="form:quantity" style="color:red;"/>
		<br />

	MFG DATE :

	<h:inputText id="mfgDate" value="#{mfgDate}" styleClass="form-control datepicker inputText ">
	<f:convertDateTime pattern="yyyy-MM-dd"/>
	</h:inputText><br/>
		<h:message for="form:mfgDate" style="color:red;"></h:message>
		<br />
	
	EXPIRYDATE: 

	<h:inputText id="expiryDate" value="#{expiryDate}" styleClass="form-control datepicker inputText ">
	<f:convertDateTime pattern="yyyy-MM-dd"/>
	</h:inputText><br/>
		<h:message for="form:expiryDate" style="color:red;"></h:message>
		<br />
	

	PRICE     :

	<h:inputText  id="price" value="#{price}" converterMessage="Please enter numeric only" styleClass="inputText "
	 onkeypress="return isNumberKey(event)"></h:inputText><br/>
	      <h:message for="form:price" style="color:red;" />
	      <br/>

     
     <h:commandButton action="#{medController.addMedicines(medId, medName, type, quantity, mfgDate, expiryDate, price)}"
                      style="font-size:18px;" value="UPDATE" styleClass="style">
                             </h:commandButton>
                             
                             &nbsp; &nbsp; &nbsp; &nbsp;
       	<h:commandButton action="#{mainImpl.clear2()}" value="Reset" style="font-size:18px;" styleClass="style1"></h:commandButton>
                             
         <h:messages id="globalMessages" globalOnly="true" layout="table" style="color: red; font-weight: bold" />   
         
  
                </center>
                		<style>
				body{margin:0;}
.s-media{
 position: fixed;
 top: -200px ;
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
               
        </h:form>
        
    </body>
</html>
</f:view>
