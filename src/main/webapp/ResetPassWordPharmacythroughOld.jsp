<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>

<f:view>
	<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		                       <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.min.css"/>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Page</title>
<link rel="stylesheet" href="resetstyle.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
	<style type="text/css">
	</style>
</head>
<script>
	function clearForm() {
		document.getElementById("form:oldPassWord").value = "";
		document.getElementById("form:password").value = "";
		document.getElementById("form:retypePassWord").value = "";
	}
	function showAlert() {
		alert("Strong password criteria:\n- Minimum 8 characters\n- Include both uppercase and lowercase letters\n- Include at least one number\n- Include at least one special character\n- For example Satyaprakash@123");
	}
</script>
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
		<div class="form-box">
			<h1>Reset Your Password</h1>	
			<!-- Error Messages -->
			<h:outputText id="errm" value="#{resetErr}" style="margin-left: 82px;
    color: red;"/>
			<h:outputText id="errmessage" value="#{passWordErr}" style="margin-left: 37px;
    color: red;"/>
			<div class="input-box">
				<i class="fa fa-key"></i> <label for="oldPassWord">Current
					password</label>
				<h:inputText id="oldPassWord" value="#{pharmaOldpass.oldPassWord}"
					maxlength="22" autocomplete="off" />
				<br>
			</div>
			<h:message for="form:oldPassWord" styleClass="error"></h:message>
			<div class = "main_input">
			<div class="input-box">
				<i class="fa-solid fa-lock"></i> <label for="password">New
					password</label>
				<div class="eye">
					<i id="hide1" class="fa-regular fa-eye"></i> <i id="hide2"
						class="fa-regular fa-eye-slash"></i>
				</div>
				<div id="passInputWrapperc">
					<h:inputSecret id="password" value="#{pharmaOldpass.passWord}"
						maxlength="22" autocomplete="off"
						onkeyup="checkPasswordStrength(this.value)" onkeydown="return preventPaste(event)" onclick="disablerightclick()"/>
				</div>			
			</div>
				<div id="password-strength" style="height: 5px;width: 80%;margin-left: 51px;position: relative;top:-27px;margin-bottom: 12px"></div>
			</div>
			<h:message for="form:password" styleClass="error"></h:message>
			<div class="input-box" id="retypepass">
				<i class="fa-solid fa-lock"></i> <label for="retypePassWord">Retype
					new password</label>
				<div class="eye1">
					<i id="hide3" class="fa-regular fa-eye"></i> <i id="hide4"
						class="fa-regular fa-eye-slash"></i>
				</div>
				<div id="passInputWrapper">
					<h:inputSecret id="retypePassWord"
						value="#{pharmaOldpass.resetPasword}" maxlength="22"
						autocomplete="off" onkeydown="return preventPaste(event)" />
				</div>
			</div>
			<h:message for="form:retypePassWord" styleClass="error"></h:message>
			<h:commandButton action="#{oldpharmacontro.ResetPassWord(username)}"
				value="Change password" styleClass="resetbtn"/>
			<h:commandButton value="Clear" onclick="clearForm()"
				styleClass="resettbtn" />	
			<a href="PatientForgotpassword.jsp" Class="anch">Forgot password?</a>
		</div>
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
		<script>
			$(document).ready(function() {
				$('#hide1, #hide2').on('click', function() {
					var passInput = $("#passInputWrapperc input");
					var showPassIcon = $("#hide1");
					var showPassSlashIcon = $("#hide2");
					if (passInput.attr('type') === 'password') {
						passInput.attr('type', 'text');
						showPassIcon.hide();
						showPassSlashIcon.show();
					} else {
						passInput.attr('type', 'password');
						showPassIcon.show();
						showPassSlashIcon.hide();
					}
				});
			});

			$(document).ready(function() {
				$('#hide3, #hide4').on('click', function() {
					var passInput = $("#passInputWrapper input");
					var showPassIcon = $("#hide3");
					var showPassSlashIcon = $("#hide4");

					if (passInput.attr('type') === 'password') {
						passInput.attr('type', 'text');
						showPassIcon.hide();
						showPassSlashIcon.show();
					} else {
						passInput.attr('type', 'password');
						showPassIcon.show();
						showPassSlashIcon.hide();
					}
				});
			});
			function checkPasswordStrength(password) {
			    var strengthMeter = document.getElementById("password-strength");
			    var minLength = 5; // Set your desired minimum length
			    var hasUpperCase = /[A-Z]/.test(password);
			    var hasLowerCase = /[a-z]/.test(password);
			    var hasNumbers = /\d/.test(password); // Check for numbers
			    var hasSpecialChars = /[!@#$%^&*(),.?":{}|<>]/.test(password);

			    if (!password) {
			        strengthMeter.style.display = "none"; // Hide the strength meter
			    } else if (password.length < minLength) {
			        strengthMeter.style.display = "block"; // Show the strength meter
			        strengthMeter.style.backgroundColor = "red"; // Weak
			    } else if (hasUpperCase && hasLowerCase && hasNumbers && hasSpecialChars && password.length > minLength) {
			        strengthMeter.style.display = "block"; // Show the strength meter
			        strengthMeter.style.backgroundColor = "green"; // Strong
			    } else {
			        strengthMeter.style.display = "block"; // Show the strength meter
			        strengthMeter.style.backgroundColor = "orange"; // Medium
			    }
			}
			function preventPaste(event) {
			    // Check for key combination (Ctrl + V for paste)
			    if (event.ctrlKey && event.key === 'v') {
			        event.preventDefault();
			        return false;
			    }
			    return true;
			}
			function disablerightclick() {
	            document.addEventListener('contextmenu',
	                event => event.preventDefault());
	 
	            elm.innerHTML = "Right click disabled";
	        }  
		</script>
	</h:form>
</body>
	</html>
</f:view>