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
        body{
        background: linear-gradient(rgba(196, 102, 0, 0.6), rgba(155, 89, 182, 0.6));
        }
     
            .menu-form {
    display: flex;
    justify-content: space-between; /* Adjust horizontal alignment */
    align-items: center;
    padding: 10px 20px; /* Add padding for spacing */
    background-color: #333; /* Background color for the menu */
    color: #fff; /* Text color for the menu items */
    position: fixed; /* Fixed positioning to keep the menu at the top */
    top: 0; /* Position it at the top of the viewport */
    left: 0; /* Position it on the left edge */
    right: 0; /* Extend it to the right edge */
    z-index: 1000; /* Ensure it's above other content */
}


            .menu-option {
                margin: 10px;
            }

            .menu-option a {
                text-decoration: none;
                background-color: rgb(85, 131, 241);
                color: white;
                padding: 10px 20px;
                border-radius: 7px;
                box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.1);
                transition: background-color 0.3s;
                display: inline-block;
            }

            .menu-option a:hover {
                background-color: rgb(39, 166, 75);
            }
            .menu-form > h:commandLink {
    background: none repeat scroll 0 0 #ff7f50;
    border-radius: 3px;
    padding: 3px 6px;
	display: block;
	border-bottom:1px solid #E67248;
	    box-shadow: 0 1px 2px #e67248;
		-webkit-box-shadow: 0 1px 2px #e67248;
		-moz-box-shadow: 0 1px 2px #e67248;
}
            
            .button-spacing {
    margin-right: 80px;
}
        </style>
    </head>
    <body>
       <h:form>
            <div class="menu-form">
                <div class="menu-option">
                    <h:commandLink action="Provider.jsp" value="Provider" styleClass="button-spacing"/>
                </div>
                <div class="menu-option">
                    <h:commandLink action="Provider.jsp" value="Recipient" styleClass="button-spacing"/>
                </div>
                <div class="menu-option">
                    <h:commandLink action="Provider.jsp" value="Admin" styleClass="button-spacing"/>
                </div>
                <div class="menu-option">
                    <h:commandLink action="Provider.jsp" value="Insurance" styleClass="button-spacing"/>
                </div>
                <div class="menu-option">
                    <h:commandLink action="PharmacyEnrollment.jsp" value="Pharmacy" styleClass="button-spacing"/>
                </div>
            </div>
        </div>
        </h:form>
    </body>
    </html>
</f:view>
