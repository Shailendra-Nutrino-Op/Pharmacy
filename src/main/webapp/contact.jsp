<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<f:view>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.min.css"/>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<style type="text/css">
/* styles.css */

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
.contact-form-container {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    height: 22vh; /* Set the container to 100% of the viewport height */
}

.contact-form-title {
    font-size: 60px;
    color: #333;
    margin-bottom: 20px;
}


form {
	max-width: 600px;
	margin: 0 auto;
	background-color: ##f5f5f5ad;
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
	background-color:##f0f0f0; /* Change background color on hover */
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
h:outputLabel {
    display: block;
    margin-bottom: 8px;
}

.message-input {
    min-height: 100px;
    border: 1px solid #ddd;
    border-radius: 4px;
    margin-left: -79px;
    padding: 8px;
    box-sizing: border-box;
    resize: vertical;
    background-color: #e1f5fe;
    box-shadow: 0 2px 2px rgba(0, 0, 0, 0.1);
    transition: border-color 0.3s, box-shadow 0.3s;
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

</head>
<body>
	<div class="new-container">
		<div class="s-media">
    <a href="Menu.jsp" class="s-item facebook" onclick="showLoader()">
    	<span class="fa">Menu</span>
    </a>
    
    <a href="contact.jsp" class="s-item skype" onclick="showLoader()">
    	<span class="fa fa-telegram">Contact</span>
    </a>
  
    <a href="https://www.skype.com" class="s-item instagram" onclick="showLoader()">
    	<span class="fa">Insta</span>
    </a>

    <a href="https://www.whatsapp.com" class="s-item whatsapp" onclick="showLoader()">
    	<span class="fa fa-whatsapp">Whatsapp</span>
    </a>

    <a id="sm-close"  class="s-item print">
        <span class="fa fa-arrow-right"></span>
    </a></div></div>
	
	  <div class="contact-form-container">
    <h:outputText value="Contact Form" styleClass="contact-form-title" />
</div>

   		<ul class="menu">

      <li title="home"><a href="#" class="menu-button home">menu</a></li>
      <li title="login"><a href="#" class="active about">Login</a></li>
      <li title="archive"><a href="#" class="archive">Services</a></li>
      <li title="contact"><a href="contact.jsp" class="contact">contact</a></li>
    </ul>
    
    <ul class="menu-bar">
        <li><a href="PharmacyEnrollment.jsp" class="menu-button">Pharmacy</a></li>
        <li><a href="Provider.jsp">Provider</a></li>
        <li><a href="Recipient.jsp">Patient</a></li>
        <li><a href="Admin.jsp">Admin</a></li>
    </ul>
        <ul class="menu-bar1">
        <li><a href="LoginPage.jsp" class="menu-button">Pharmacy Login</a></li>
        <li><a href="LoginPage.jsp">Provider Login</a></li>
        <li><a href="LoginPage.jsp">Patient Login</a></li>
        <li><a href="LoginPage.jsp">Admin Login</a></li>
    </ul>


      <h:form>
        <h:outputLabel for="name">Name:</h:outputLabel>
        <h:inputText id="name" value="#{contactBean.name}" required="true" />

        <br/>

        <h:outputLabel for="email">Email:</h:outputLabel>
        <h:inputText id="email" value="#{contactBean.email}" required="true" />

        <br/>

        <h:outputLabel for="message">Message:</h:outputLabel>
        <div style="display: flex;justify-content: space-around;">
                <h:inputTextarea id="message" value="#{contactBean.message}" rows="5" cols="30" required="true" styleClass="message-input" />
         

        <h:commandButton value="Submit" action="#{enrollController.submitForm(contactBean)}" onclick="showLoader()"/>
        </div>

    </h:form>
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
                    animation: spin 1s infinite linear;
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
</body>
</html>
</f:view>