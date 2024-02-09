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
            <link rel="stylesheet" href="pharmacss.css"/>
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.min.css"/>
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css"/>
             <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
   
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
	    
		function showLoader() {
			document.getElementById('loader').style.display = 'block';
		}
	
</script>
<script>
   $(document).ready(function() {
      $(".datepicker").datepicker({
         dateFormat: 'yy-mm-dd',  // Set the desired date format
         changeMonth: true,
         changeYear: true
      });
   });
</script>
<style type="text/css">
.SecQ{
		width: 76%; /* Set the width of the dropdown */
	padding: 11px;
	font-size: 14px;
	margin-left: 70px;
	margin-right: 50px;
	margin-bottom: 10px;
	background-color: #e1f5fe;
	border: 1px solid #ccc;
	border-radius: 5px;
	box-shadow: 0 2px 2px rgba(0, 0, 0, 0.1);
	transition: border-color 0.3s, box-shadow 0.3s;
}
</style>

</head>
<body>
        <div class="image-cont" style="position: fixed;right: 10px;">
        <a href="Menu.jsp">
        <img src="163800845-removebg-preview.png" alt="Website Logo" width="100" height="100"/>
        </a>
    	</div>

		<ul class="menu">

      <li title="home"><a href="#" class="menu-button home">menu</a></li>
            <li title="login"><a href="#" class="active about">Login</a></li>
      <li title="services"><a href="#" class="archive">services</a></li>
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
  text-shadow: 0 4px 26px #000;  -webkit-text-stroke: 1px #000000ad;">Pharmacy <br/>Enroll</h2>
  <div>
  <img alt="pharmacy" src="logoss.png" class="image-class">
  </div>
</div>

		<h:form id="form">

			<!-- Shop Name -->
			<h:outputLabel styleClass="labels">Shop Name:</h:outputLabel>
			<h:inputText id="shop" value="#{pharma.shop_name}" />
			<h:message for="form:shop" styleClass="error-message" />

			<!-- Address -->
			<h:outputLabel styleClass="labels">Address:</h:outputLabel>
			<h:inputText id="add" value="#{pharma.address}"		/>
			<h:message for="form:add" styleClass="error-message" />

			<!-- License Number -->
			<h:outputLabel styleClass="labels">License Number:</h:outputLabel>
			<h:inputText id="lic" value="#{pharma.lic_no}"/>

			<h:message for="form:lic" styleClass="error-message" />

			<!-- Owner Name -->
			<h:outputLabel styleClass="labels">Owner Name:</h:outputLabel>
			<h:inputText id="Name" value="#{pharma.owner_name}" 	/>
			<h:message for="form:Name" styleClass="error-message" />

			<table>
			<tr>
			
			<th>             			<!-- Registration Number -->
			<h:outputLabel styleClass="labels" style="margin-left: 56px;">Registration Number:</h:outputLabel>  </th>
			
			<th>            <!-- Qualification -->
			<h:outputLabel styleClass="labels" style="margin-left:-43px;">Qualification:</h:outputLabel>  </th>
			</tr>
			
			<tr>
			<td> 			<h:inputText id="Regd" value="#{pharma.regd_no}" /> </td>
			<td>  			<h:selectOneMenu id="Qual" value="#{pharma.qualification}"
				styleClass="Qual">
					<f:selectItem itemLabel="Select Qualification" itemValue="" />	
					<f:selectItem itemLabel="Doctor of Pharmacy (Pharm.D.)"
					itemValue="Pharm.D." />
				<f:selectItem itemLabel="Ph.D. in Pharmacy" itemValue="Ph.D." />
				<f:selectItem
					itemLabel="Master of Science in Pharmacy (M.Sc. Pharm.)"
					itemValue="M.Sc. Pharm." />
				<f:selectItem itemLabel="Master of Pharmacy (M.Pharm.)"
					itemValue="M.Pharm." />
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
			</h:selectOneMenu> </td>
			</tr>
			
			<tr>
			<td> <h:message for="form:Regd" styleClass="error-message" /> </td>
			<td> <h:message for="form:Qual" styleClass="error-message" style=" margin-left: 36px;" /> </td>
			</tr>
			
			</table>


			<!-- Date of Registration -->
			<h:outputLabel value="Date of Registration   (yyyy-MM-dd)" styleClass="labels" />
			<h:inputText id="dates" value="#{pharma.date_of_registration}" styleClass="datepicker" onkeydown="return false">
				<f:convertDateTime pattern="yyyy-MM-dd" />
			</h:inputText>
			<h:message for="form:dates" styleClass="error-message" />


			<!-- Phone -->
			<h:outputLabel styleClass="labels">Phone:</h:outputLabel>
			<h:inputText id="phone" value="#{pharma.phone}"				/>
			<h:message for="form:phone" styleClass="error-message" />

			<!-- Email -->
			<h:outputLabel styleClass="labels">Email:</h:outputLabel>
			<h:inputText id="email" value="#{pharma.email}"				/>
			<h:message for="form:email" styleClass="error-message" />

			<!-- Regulator -->
			<h:outputLabel styleClass="labels">Regulatory:</h:outputLabel>
			<h:inputText id="regul" value="#{pharma.regulatory}" />
			<h:message for="form:regul" styleClass="error-message" />
			
			<h:outputLabel styleClass="labels">Password:</h:outputLabel>
            <h:inputText id="pass" value="#{pharma.password}"  	/> <br/>
            <input type="checkbox" onclick="myPass()">Show
				
			<h:message for="form:pass" styleClass="error-message" />
			
			<h:outputLabel styleClass="labels">Security Question</h:outputLabel>
			<h:selectOneMenu id="secQ" value="#{pharma.secu_Question}"
				styleClass="SecQ">
								<f:selectItem itemLabel="Security Question" itemValue="" />	
					<f:selectItem itemLabel="What was the name of your first pet?"
					itemValue="What was the name of your first pet?" />
				<f:selectItem itemLabel="In what city were you born?" itemValue="In what city were you born?" />
				<f:selectItem
					itemLabel="What is your favorite book?"
					itemValue="What is your favorite book?" />
				<f:selectItem itemLabel="What is your favorite food?"
					itemValue="What is your favorite food?" />
				<f:selectItem
					itemLabel="What is your ideal vacation destination?"
					itemValue="What is your ideal vacation destination?" />
				<f:selectItem
					itemLabel="If you could have any superpower, what would it be?"
					itemValue="If you could have any superpower, what would it be?" />
					
				<!-- Add other degrees as needed -->
			</h:selectOneMenu>
						<h:message for="form:secQ" styleClass="error-message" />
			
			
			<h:outputLabel styleClass="labels">Security Answer:</h:outputLabel>
			<h:inputText id="secA" value="#{pharma.secu_Answer}" />
						<h:message for="form:secA" styleClass="error-message" />
			
			
			<br />
			<br />

         <div style="display: flex; justify-content: space-between;">
         			<h:commandButton action="#{enrollController.enrollPharma(pharma)}"
				value="Enroll" styleClass="button-spacing"/>
			<h:commandButton value="Reset" id="clearAllButton" action="#{enrollController.Reset(pharma) }"
				styleClass="button-spacing" />
				
			<h:commandButton value="Sign In?" action="LoginPage.jsp" onclick="showLoader()"/>
         </div>
		</h:form>
	</div>
	<div id="loader">
		<div class="spinner"></div>
	</div>

	<footer>
		<div class="footer-content">
        <div class="footer-section">
            <h3>Quick Links</h3>
            <ul>
                <li><a href="Menu.jsp">Home</a></li>
                <li><a href="#">Features</a></li>
                <li><a href="#">About Us</a></li>
                <li><a href="contact.jsp">Contact</a></li>
            </ul>
        </div>

			<div class="footer-section">
				<h3>Contact Us</h3>
				<p>Email: Info@hospitalmanagementsystem.com</p>
				<p>Phone: +91 123-456-7890</p>
				<p>Address: Kundahalli, EPIP Zone, Whitefield, Banglore</p>
			</div>

			<div class="footer-section">
				<h3>Connect with Us</h3>
				<a href="#" class="social-icon"><i class="f"></i></a>
				<a href="#" class="social-icon"><i class="fab fa-twitter"></i></a>
				 <a	href="#" class="social-icon"><i class="fab fa-linkedin"></i></a> 
				 <a	href="#" class="social-icon"><i class="fab fa-instagram"></i></a>
			</div>
		</div>

		<p class="footer-bottom">&copy; 2023 Your Hospital Management
			System. All rights reserved.</p>
	</footer>
<script defer>
  function myPass() {
    var x = document.querySelector("#pass");
    if (x.type === "password") {
      x.type = "text";
    } else {
      x.type = "password";
    }
  }
</script>
</body>
	</html>
</f:view>