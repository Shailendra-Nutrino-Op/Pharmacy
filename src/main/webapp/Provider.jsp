<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%> 
    <%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<f:view>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.min.css"/>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<style type="text/css">
/* styles.css */

body {
    font-family: cursive; /* Specify the font stack */
    font-size: 16px; /* Set the default font size */
    line-height: 1.6; /* Set the line height for better readability */
    color: #333; /* Set the text color */
    background-image: url("Background.jpg");  
    background-size: cover; 
}
h2 {
    font-size: 24px; /* Adjust the font size as needed */
    color: black; /* Set the text color */
    font-weight: bold; /* Make the text bold */
    margin-bottom: 10px; /* Add spacing at the bottom */
    text-align: center; /* Center the text */
    text-transform: uppercase; /* Convert the text to uppercase */
    padding-bottom: 5px; /* Add padding at the bottom of the heading */
    /* Add more styles as needed */
}
form {
    max-width: 400px;
        margin: 0 auto;
      background-color: #f5f5f5; /* Set the background color */
    padding: 20px; /* Add padding to the form content */
    border: 1px solid #ccc;
    border-radius: 8px; /* Add rounded corners for a nicer appearance */
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* Add a subtle box shadow */
    
    }
    input[type="text"] {
    width: 95%;
    padding: 8px;
    margin-bottom: 10px;
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
    border: none;
    border-radius: 3px;
    cursor: pointer;
    font-size: 16px;
    text-align: center;
    text-transform: uppercase;
    transition: background-color 0.3s ease-in-out;
}

input[type="submit"]:hover, input[type="reset"]:hover {
    background-color: #44f261; /* Change color on hover to a different color */
    transform: scale(1.05);
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
    color: #520000;
    border-color: #003f80;
    transition: background-color 0.3s ease-in-out, transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out, color 0.3s ease-in-out, border-color 0.3s ease-in-out;
}
    .button-spacing {
    margin-right: 20px;
       
}

</style>
</head>
<body>
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




<div class="new-container">
		<div class="s-media">
    <a href="Menu.jsp" class="s-item facebook" onclick="showLoader()">
    	<span class="fa fa-facebook">Menu</span>
    </a>
    
    <a href="contact.jsp" class="s-item skype" onclick="showLoader()">
    	<span class="fa fa-telegram">Contact</span>
    </a>
  
    <a href="https://www.skype.com" class="s-item instagram" onclick="showLoader()">
    	<span class="fa fa-instagram">Insta</span>
    </a>

    <a href="https://www.whatsapp.com" class="s-item whatsapp" onclick="showLoader()">
    	<span class="fa fa-whatsapp">Whatsapp</span>
    </a>

    <a id="sm-close"  class="s-item print">
        <span class="fa fa-arrow-right"></span>
    </a></div></div>
  		<h2>Provider Enroll</h2>
 		<h:form id="form">
        <h:panelGrid columns="2">
            <h:outputLabel for="providerId" value="Provider ID:" />
            <h:inputText id="providerId"  required="true" />

            <h:outputLabel for="firstName" value="First Name:" />
            <h:inputText id="firstName"  required="true" />

            <h:outputLabel for="lastName" value="Last Name:" />
            <h:inputText id="lastName"  required="true" />

            <h:outputLabel for="dateOfBirth" value="Date of Birth:" />
            <h:inputText id="dateOfBirth" required="true" />

            <h:outputLabel for="email" value="Email:" />
            <h:inputText id="email"  required="true" />

            <h:outputLabel for="licenseNumber" value="License Number:" />
            <h:inputText id="licenseNumber" required="true" />

            <h:outputLabel for="qualification" value="Qualification:" />
            <h:inputText id="qualification" required="true" />

            <h:outputLabel for="username" value="Username:" />
            <h:inputText id="username"  required="true" />

            <h:outputLabel for="status" value="Status:" />
            <h:inputText id="status"  />

            <h:outputLabel for="phoneNo" value="Phone Number:" />
            <h:inputText id="phoneNo"  required="true" />

            <h:outputLabel for="gender" value="Gender:" />
            <h:selectOneMenu id="gender" >
                <f:selectItem itemValue="MALE" itemLabel="Male" />
                <f:selectItem itemValue="FEMALE" itemLabel="Female" />
            </h:selectOneMenu>

            <h:outputLabel for="speciality" value="Speciality:" />
            <h:inputText id="speciality"  required="true" />

            <h:outputLabel for="address" value="Address:" />
            <h:inputText id="address"  required="true" />

            <h:outputLabel for="isActive" value="Is Active:" />
            <h:inputText id="isActive"  />

            <h:commandButton value="Submit" action="#{providerBean.saveProvider}" />
        </h:panelGrid>
    </h:form>
</body>
</html>
</f:view>