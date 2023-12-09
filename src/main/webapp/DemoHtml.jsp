<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jsf/html" prefix="h"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f"%>
<!DOCTYPE html>
<f:view>
    <html>
    <head>
        <meta charset="ISO-8859-1">
        <title>Insert title here</title>
        <link rel="stylesheet" href="demoHtml.css">
    </head>
    <body>
        <h:form>
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

        </h:form>
    </body>
    </html>
</f:view>
