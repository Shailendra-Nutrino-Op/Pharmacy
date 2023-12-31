<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%> 
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<f:view>
    <!DOCTYPE html>
    <html>
    <head>
        <meta charset="ISO-8859-1">
        <title>Menu Options</title>
        <style>
        
* {
    margin: 0;
    padding: 0;
}

html {
    height: 100%;
    background: linear-gradient(rgba(196, 102, 0, 0.6), rgba(155, 89, 182, 0.6));
}


body {
    font-family: montserrat, arial, verdana;
}
div {
      display: inline-block;
      width: 60%; /* Adjust the width as needed */
      margin: 10px;
      padding: 10px;
      background-color: #b3b6e8;
      border: 1px  #ddd;
    }

/* Form Styles */
.msform {
    width: 400px;
    margin: 170px auto;
    text-align: center;
    position: relative;
}

.msform fieldset {
    background: white;
    border: 0 none;
    border-radius: 3px;
    box-shadow: 0 0 15px 1px rgba(0, 0, 0, 0.4);
    padding: 20px 30px;
    box-sizing: border-box;
    width: 80%;
    margin: 0 10%;
    position: relative;
}

.msform fieldset:not(:first-of-type) {
    display: none;
}
.menu-options {
    display: flex;
    justify-content: center;
}

/* Remove margin from individual action buttons */
.msform .action-button {
    margin: 0 5px;
}

.msform input,
.msform textarea {
    padding: 15px;
    border: 1px solid #ccc;
    border-radius: 3px;
    margin-bottom: 10px;
    width: 100%;
    box-sizing: border-box;
    font-family: montserrat;
    color: #2C3E50;
    font-size: 13px;
}

.msform .action-button {
    width: 100px;
    background: #27AE60;
    font-weight: bold;
    color: white;
    border: 0 none;
    border-radius: 1px;
    cursor: pointer;
    padding: 10px;
    margin: 10px 5px;
    text-decoration: none;
    font-size: 14px;
}

.msform .action-button:hover,
.msform .action-button:focus {
    box-shadow: 0 0 0 2px white, 0 0 0 3px #27AE60;
}

.fs-title {
    font-size: 15px;
    text-transform: uppercase;
    color: #2C3E50;
    margin-bottom: 10px;
}

.fs-subtitle {
    font-weight: normal;
    font-size: 13px;
    color: #666;
    margin-bottom: 20px;
}

/* Progress Bar */
#progressbar {
    margin-bottom: 30px;
    overflow: hidden;
    counter-reset: step;
}

#progressbar li {
    list-style-type: none;
    color: white;
    text-transform: uppercase;
    font-size: 9px;
    width: 33.33%;
    float: left;
    position: relative;
}

#progressbar li:before {
    content: counter(step);
    counter-increment: step;
    width: 20px;
    line-height: 20px;
    display: block;
    font-size: 10px;
    color: #333;
    background: white;
    border-radius: 3px;
    margin: 0 auto 5px auto;
}

#progressbar li:after {
    content: '';
    width: 100%;
    height: 2px;
    background: white;
    position: absolute;
    left: -50%;
    top: 9px;
    z-index: -1;
}

#progressbar li:first-child:after {
    content: none;
}

#progressbar li.active:before,
#progressbar li.active:after {
    background: #27AE60;
    color: white;
}

        </style>
    </head>
    <body>
       <h:form styleClass="msform">
    <div class="menu-form">
        <div class="menu-option">
            <h:commandLink action="Provider.jsp" value="Provider" styleClass="action-button button-spacing" /><br/>
        </div>
        <div class="menu-option">
            <h:commandLink action="Provider.jsp" value="Recipient" styleClass="action-button button-spacing" /><br/>
        </div>
        <div class="menu-option">
            <h:commandLink action="Provider.jsp" value="Admin" styleClass="action-button button-spacing" /><br/>
        </div>
        <div class="menu-option">
            <h:commandLink action="Provider.jsp" value="Insurance" styleClass="action-button button-spacing" /><br/>
        </div>
        <div class="menu-option">
            <h:commandLink action="PharmacyEnrollment.jsp" value="Pharmacy" styleClass="action-button button-spacing" /><br/>
        </div>
    </div>
</h:form>

    </body>
    </html>
</f:view>
