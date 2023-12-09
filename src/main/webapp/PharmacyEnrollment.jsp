<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<f:view>
	<!DOCTYPE html>
	<html xmlns="http://www.w3.org/1999/xhtml"
		xmlns:h="http://xmlns.jcp.org/jsf/html"
		xmlns:f="http://xmlns.jcp.org/jsf/core"
		xmlns:p="http://primefaces.org/ui">
<head>
<title>Pharmacy Registration Form</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
	            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.min.css"/>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<style>
html {
	height: 100%;
}

body {
	font-family: 'Raleway', Helvetica, sans-serif;
	font-size: 16px; /* Set the default font size */
	line-height: 1.6; /* Set the line height for better readability */
	color: #333; /* Set the text color */
	background-image: url("Background.jpg");
	background-size: cover;
}

h2 {
	font-size: 24px; /* Adjust the font size as needed */
	color: #007BFF; /* Set the text color */
	font-weight: bold; /* Make the text bold */
	margin-bottom: 10px; /* Add spacing at the bottom */
	text-align: center; /* Center the text */
	text-transform: uppercase; /* Convert the text to uppercase */
	padding-bottom: 5px; /* Add padding at the bottom of the heading */
	/* Add more styles as needed */
}

form {
	max-width: 600px;
	    margin-right: 70px;
    margin-top: 62px;
	background-color: #f5f5f594;
	padding: 20px;
	border: 1px solid #ccc;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
	/* Center the form vertically on the page */
	flex-direction: column;
	align-items: center;
	/* Add a subtle transition effect */
	transition: box-shadow 0.3s ease-in-out;
}

/* Hover effect - increase box shadow on hover */
form:hover {
	box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
	/* Additional hover effects */
	transform: scale(1.01); /* Scale up the form on hover */
	background-color: #f0f0f0; /* Change background color on hover */
}

label {
	display: block;
	margin-bottom: 10px; /* Increased margin for more spacing */
	font-weight: bold;
	color: #333;
	margin: 5px;
	font-size: 16px; /* Adjust the font size */
	text-transform: uppercase; /* Convert text to uppercase */
	letter-spacing: 1px; /* Add some letter spacing */
	text-shadow: 1px 1px 1px rgba(0, 0, 0, 0.1);
	/* Add a subtle text shadow */
	transition: color 0.3s ease-in-out; /* Add a smooth color transition */
}

/* Hover effect - change color on hover */
label:hover {
	color: #ff5733; /* Change color on hover */
}

.labels {
	display: inline-block;
	text-align: center;
	width: 90%;
	padding: 5px;
	vertical-align: top;
	margin-top: 10px;
}

input[type="text"] {
	width: 76%;
	padding: 8px;
    margin-left: 59px;
	margin-bottom: 10px;
	    margin-right: 37px;
	border: 1px solid #ccc;
	border-radius: 3px;
	font-size: 16px;
	color: black;
	background-color: #e1f5fe;
	box-shadow: 0 2px 2px rgba(0, 0, 0, 0.1);
	transition: border-color 0.3s, box-shadow 0.3s;
}

input[type="text"]:hover {
	background-color: #f0f0f0; /* Change the background color on hover */
	border-color: #007BFF; /* Change the border color on hover */
}

input[type="text"]:focus {
	border-color: #007bff;
	box-shadow: 0 2px 4px rgba(0, 123, 255, 0.2);
	outline: none;
}

input[type="submit"], input[type="reset"] {
	background-color: #007bff;
	color: #fff;
	padding: 10px 10px;
	margin-right: 65px;
    margin-left: 55px;
	border: none;
	border-radius: 3px;
	cursor: pointer;
	font-size: 16px;
	text-align: center;
	text-transform: uppercase;
	transition: background-color 0.3s ease-in-out;
}

input[type="submit"]:hover, input[type="reset"]:hover {
	background-color: #44f261;
	/* Change color on hover to a different color */
	transform: scale(1.05);
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
	color: #520000;
	border-color: #003f80;
	transition: background-color 0.3s ease-in-out, transform 0.3s
		ease-in-out, box-shadow 0.3s ease-in-out, color 0.3s ease-in-out,
		border-color 0.3s ease-in-out;
}

.button-spacing {
	margin-right: 20px;
}

.error-message {
	color: red;
	font-weight: lighter;
	margin-top: 5px;
	margin-bottom: 5px;
	    margin-left: 58px;
	font-size: 13px; /* Adjust the font size */
	text-align: center; /* Center the text */
	background-color: #ffebee; /* Add a background color */
	padding: 10px; /* Add padding for better visual appearance */
}

footer {
	background-color: #300c0ca3;
	color: #fff;
	padding: 20px 0;
	margin-top: 37px;
	border-radius: 10px;
}

.footer-content {
	display: flex;
	justify-content: space-around;
	max-width: 1200px;
	margin: 0 auto;
}

.footer-section {
	flex: 1;
	padding: 0 20px;
}

h3 {
	font-size: 18px;
}

ul {
	list-style-type: none;
	padding: 0;
}

li {
	margin-bottom: 10px;
}

a {
	color: #fff;
	text-decoration: none;
}

a:hover {
	text-decoration: underline;
}

.social-icon {
	font-size: 24px;
	margin-right: 10px;
	color: #fff;
}

.footer-bottom {
	text-align: center;
	margin-top: 20px;
	font-size: 14px;
}

.success-notification {
	display: none;
	padding: 10px;
	background-color: #4CAF50;
	color: #fff;
	margin-bottom: 15px;
	border-radius: 4px; /* Add rounded corners */
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	/* Add a subtle shadow for depth */
	transition: opacity 0.3s ease-in-out;
	/* Add a smooth fade-in/out effect */

	/* Optional: Adjust other styles as needed */
}

.success-notification.show {
	display: block; /* Override display:none to make it visible */
}

/* Optional: Add hover effect */
.success-notification:hover {
	opacity: 0.9;
}

.success-notification {
	display: none;
	padding: 10px;
	background-color: #4CAF50;
	color: #fff;
	margin-bottom: 15px;
}
/* Add this to your existing CSS or in a style block in your HTML */
.Qual {
	width: 473px; /* Set the width of the dropdown */
	padding: 8px;
	font-size: 14px;
	margin-left: 60px;
	margin-right: 50px;
	margin-bottom: 10px;
	background-color: #e1f5fe;
	border-radius: 5px;
	box-shadow: 0 2px 2px rgba(0, 0, 0, 0.1);
	transition: border-color 0.3s, box-shadow 0.3s;
}

/* Style the dropdown arrow */
.Qual:after {
	content: '\25BC'; /* Unicode character for down arrow */
	position: absolute;
	top: 50%;
	right: 10px;
	transform: translateY(-50%);
}

/* Style the dropdown options */
.Qual option {
	font-size: 14px;
	background-color: #fff; /* Set the background color of options */
	color: #333; /* Set the text color of options */
	background-color: #e1f5fe;
}

/* Style the selected option */
.Qual option:checked {
	background-color: #e6e6e6;
	/* Set the background color of the selected option */
}

#lic:-ms-input-placeholder {
	color: blue;
	font-style: italic;
}

#lic::placeholder {
	color: blue;
	font-style: italic;
}
</style>
<style>
	body{margin:0;}
.s-media{
 position: fixed;
 top: 50px ;
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
    <style>
 	@import url("//cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.min.css");
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
    .new-container {
      display: flex;
            justify-content: space-between;
      
    }
    
    .heading {
      text-align: center;
      font-size: 2em; /* Adjust the font size as needed */
      margin-top: 20%;
      padding: 20px;
      width: 50%; /* Enlarge to half of the page */
    }
    .image-class {
  width: 50%; /* Adjust the percentage or use a specific value */
  height: auto; /* Maintain the aspect ratio */
    max-width: 283px;
    margin-left: 215px;
    box-shadow: 0 0 20px 13px rgba(0, 0, 0, 0.5);
    border-radius: 200px;
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
<script>
	    $(document).ready(function() {
	
	$('#sm-close').click(function(){
		$('.s-media').addClass('sm-collapse');
        $('#sm-open').delay(300).css('right', '0');
	});

    $('#sm-open').click(function(){
        $('#sm-open').css('right', '-60px');
        $('.s-media').removeClass('sm-collapse');
        
    });
});
	
</script>

</head>
<body>

		<ul class="menu">

      <li title="home"><a href="#" class="menu-button home">menu</a></li>
      
      <li title="search"><a href="#" class="search">insurances</a></li>
      <li title="login"><a href="#" class="active about">Login</a></li>
      <li title="archive"><a href="#" class="archive">archive</a></li>
      <li title="contact"><a href="contact.jsp" class="contact">contact</a></li>
    </ul>
    
    <ul class="menu-bar">
        <li><a href="PharmacyEnrollment.jsp" class="menu-button">Pharmacy</a></li>
        <li><a href="Provider.jsp">Provider</a></li>
        <li><a href="Recipient.jsp">Patient</a></li>
        <li><a href="#">Insurance</a></li>
        <li><a href="Admin.jsp">Admin</a></li>
    </ul>
        <ul class="menu-bar1">
        <li><a href="LoginPage.jsp" class="menu-button">Pharmacy Login</a></li>
        <li><a href="LoginPage.jsp">Provider Login</a></li>
        <li><a href="LoginPage.jsp">Patient Login</a></li>
        <li><a href="LoginPage.jsp">Admin Login</a></li>
    </ul>

		<div class="s-media">
    <a href="Menu.jsp" class="s-item facebook" onclick="showLoader()">
    <i class=""></i>
    <span>Menu</span>
</a>
    
    <a href="contact.jsp" class="s-item skype" onclick="showLoader()">
    	<span class="">Contact</span>
    </a>
  
    <a href="https://www.skype.com" class="s-item instagram">
    	<span class="">Insta</span>
    </a>

    <a href="https://www.whatsapp.com" class="s-item whatsapp">
    	<span class="">Whatsapp</span>
    </a>

    <a id="sm-close"  class="s-item print">
        <span class="fa fa-arrow-right"></span>
    </a>

 </div>

 <a id="sm-open"  class="s-item print sm-collapse">
        <span class="fa fa-arrow-left">&#8594;</span>
    </a>

	<div class="new-container">
  <div class="logo" style="  width: 600px; margin: 10px ;">
  <h2 style=" font-family: impact, sans-serif;
    text-transform: uppercase;
  color: #007bff;
    font-size: 4.4rem;     margin-top: 40%;
    margin-left: 150px;
  text-shadow: 0 4px 26px #000;">Pharmacy <br/>Enroll</h2>
  <div>
  <img alt="pharmacy" src="pharmacyicon.png" class="image-class">
  </div>
</div>

		<h:form id="form">

			<!-- Shop Name -->
			<h:outputLabel styleClass="labels">Shop Name:</h:outputLabel>
			<h:inputText id="shop" value="#{pharma.shop_name}" 
			onfocus="if (this.value=='Shop Name') this.value='';"
				onblur="if (this.value=='') this.value='Shop Name';"
				style="color: #333; font-style: italic;"/>
			<h:message for="form:shop" styleClass="error-message" />

			<!-- Address -->
			<h:outputLabel styleClass="labels">Address:</h:outputLabel>
			<h:inputText id="add" value="#{pharma.address}" 
			onfocus="if (this.value=='Address') this.value='';"
				onblur="if (this.value=='') this.value='Address';"
				style="color: #333; font-style: italic;"/>
			<h:message for="form:add" styleClass="error-message" />

			<!-- License Number -->
			<h:outputLabel styleClass="labels">License Number:</h:outputLabel>
			<h:inputText id="lic" value="#{pharma.lic_no}"
				onfocus="if (this.value=='ST-PH-7digit') this.value='';"
				onblur="if (this.value=='') this.value='ST-PH-7digit';"
				style="color: #333; font-style: italic;" />

			<h:message for="form:lic" styleClass="error-message" />

			<!-- Owner Name -->
			<h:outputLabel styleClass="labels">Owner Name:</h:outputLabel>
			<h:inputText id="Name" value="#{pharma.owner_name}" 				
			onfocus="if (this.value=='Owner Name') this.value='';"
				onblur="if (this.value=='') this.value='Owner Name';"
				style="color: #333; font-style: italic;"/>
			<h:message for="form:Name" styleClass="error-message" />

			<!-- Registration Number -->
			<h:outputLabel styleClass="labels">Registration Number:</h:outputLabel>
			<h:inputText id="Regd" value="#{pharma.regd_no}" 
			onfocus="if (this.value=='Registration Number') this.value='';"
				onblur="if (this.value=='') this.value='Registration Number';"
				style="color: #333; font-style: italic;"/>
			<h:message for="form:Regd" styleClass="error-message" />

			<!-- Qualification -->
			<h:outputLabel styleClass="labels">Qualification:</h:outputLabel>
			<h:selectOneMenu id="Qual" value="#{pharma.qualification}"
				styleClass="Qual">
				<f:selectItem itemLabel="-- Select Qualification --" itemValue="" />	
					<f:selectItem itemLabel="Doctor of Pharmacy (Pharm.D.)"
					itemValue="Pharm.D." />
				<f:selectItem itemLabel="Ph.D. in Pharmacy" itemValue="Ph.D." />
				<f:selectItem
					itemLabel="Master of Science in Pharmacy (M.Sc. Pharm.)"
					itemValue="M.Sc. Pharm." />
				<f:selectItem itemLabel="Master of Pharmacy (M.Pharm.)"
					itemValue="M.Pharm." />
				<f:selectItem itemLabel="Master of Business Administration (MBA)"
					itemValue="MBA" />
				<f:selectItem
					itemLabel="Doctor of Science in Pharmacy (D.Sc. Pharm.)"
					itemValue="D.Sc. Pharm." />
				<f:selectItem
					itemLabel="Postgraduate Diploma in Clinical Pharmacy (PGDipClinPharm)"
					itemValue="PGDipClinPharm" />
				<f:selectItem itemLabel="Doctor of Public Health (DrPH)"
					itemValue="DrPH" />
				<f:selectItem itemLabel="Master of Public Health (MPH)"
					itemValue="MPH" />
				<f:selectItem
					itemLabel="Doctor of Science in Pharmaceutical Sciences (D.Sc.)"
					itemValue="D.Sc." />
				<f:selectItem
					itemLabel="Postgraduate Certificate in Pharmacy Practice (PGCertPharmPrac)"
					itemValue="PGCertPharmPrac" />
				<!-- Add other degrees as needed -->
			</h:selectOneMenu>
			<h:message for="form:Qual" styleClass="error-message" />


			<!-- Date of Registration -->
			<h:outputLabel value="Date of Registration" styleClass="labels" />
			<h:inputText id="dates" value="#{pharma.date_of_registration}">
				<f:convertDateTime pattern="yyyy-MM-dd" />
			</h:inputText>
			<h:message for="form:dates" styleClass="error-message" />


			<!-- Phone -->
			<h:outputLabel styleClass="labels">Phone:</h:outputLabel>
			<h:inputText id="phone" value="#{pharma.phone}"
			onfocus="if (this.value=='Phone Number') this.value='';"
				onblur="if (this.value=='') this.value='Phone Number';"
				style="color: #333; font-style: italic;" />
			<h:message for="form:phone" styleClass="error-message" />

			<!-- Email -->
			<h:outputLabel styleClass="labels">Email:</h:outputLabel>
			<h:inputText id="email" value="#{pharma.email}" 
			onfocus="if (this.value=='Email') this.value='';"
				onblur="if (this.value=='') this.value='Email';"
				style="color: #333; font-style: italic;"/>
			<h:message for="form:email" styleClass="error-message" />

			<!-- Regulator -->
			<h:outputLabel styleClass="labels">Regulator:</h:outputLabel>
			<h:inputText id="regul" value="#{pharma.regulatory}" 
			onfocus="if (this.value=='Regulator Name') this.value='';"
				onblur="if (this.value=='') this.value='Regulator Name';"
				style="color: #333; font-style: italic;"/>
			<h:message for="form:regul" styleClass="error-message" />
			<br />
			<br />

			<h:commandButton action="#{enrollController.enrollPharma(pharma)}"
				value="Enroll" styleClass="button-spacing" />
			<h:commandButton value="Reset"  
				styleClass="button-spacing" />
				
			<h:commandButton value="SignUp" action="NewFile.html" onclick="showLoader()"/>
		</h:form>
	</div>
		<script type="text/javascript">
		function showLoader() {
			document.getElementById('loader').style.display = 'block';
		}
	</script>
	<div id="loader">
		<div class="spinner"></div>
	</div>
	<style>
	#loader {
                    display: none;
                    position: fixed;
                    top: 0;
                    left: 0;
                    width: 100%;
                    height: 100%;
                    background-color: #defcf9;
                    text-align: center;
                    z-index: 0;
                }
 
                .spinner {
                    position: absolute;
                    height: 3em;
                    width: 3em;
                    top: 50%;
                    left: 50%;
                    box-sizing: border-box;
                    margin-left: -1.5em;
                    margin-top: -1.5em;
                    border: 0.21em solid;
                    border-color: #E67676 #F2F062 #A9E6E6 #7692E4;
                    border-radius: 50%;
                    box-shadow: 0 0 2.4em blue;
                    opacity: 0.9;
                    animation: spin 2s infinite linear;
                }
 
                @keyframes spin {
                    from {
                        transform: rotate(0deg);
                    }
                    to {
                        transform: rotate(360deg);
                    }
                }
	
	</style>

	<footer>
		<div class="footer-content">
			<div class="footer-section">
				<h3>Quick Links</h3>
				<a href="#" class="social-icon"><i class="f"></i></a>
				<a href="#" class="social-icon"><i class="fab fa-twitter"></i></a> <a
					href="#" class="social-icon"><i class="fab fa-linkedin"></i></a> <a
					href="#" class="social-icon"><i class="fab fa-instagram"></i></a>

			</div>

			<div class="footer-section">
				<h3>Contact Us</h3>
				<p>Email: info@hospitalmanagementsystem.com</p>
				<p>Phone: +91 123-456-7890</p>
				<p>Address: Kundahalli, EPIP Zone, Whitefield, Banglore</p>
			</div>

			<div class="footer-section">
				<h3>Connect with Us</h3>
				<a href="#" class="social-icon"><i class="f"></i></a>
				<a href="#" class="social-icon"><i class="fab fa-twitter"></i></a> <a
					href="#" class="social-icon"><i class="fab fa-linkedin"></i></a> <a
					href="#" class="social-icon"><i class="fab fa-instagram"></i></a>
			</div>
		</div>

		<p class="footer-bottom">&copy; 2023 Your Hospital Management
			System. All rights reserved.</p>
	</footer>

</body>
	</html>

</f:view>