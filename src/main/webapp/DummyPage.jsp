<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%> 
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<f:view>
<html xmlns="http://www.w3.org/1999/xhtml"
      xmlns:f="http://java.sun.com/jsf/core"
      xmlns:p="http://primefaces.org/ui"
      xmlns:h="http://java.sun.com/jsf/html">
		<h:head>
<title>Calendar Example</title>  
</h:head>  

<h:body>
	<h:form id="form">
    <!-- Shop Name -->
    <h:outputLabel for="shop">Shop Name:</h:outputLabel>
    <h:inputText id="shop" value="#{pharma.shop_name}" />
    <h:message for="shop" style="color: red" />

    <!-- Address -->
    <h:outputLabel for="add">Address:</h:outputLabel>
    <h:inputText id="add" value="#{pharma.address}" />
    <h:message for="add" style="color: red" />

    <!-- License Number -->
    <h:outputLabel for="lic">License Number:</h:outputLabel>
    <h:inputText id="lic" value="#{pharma.lic_no}" />
    <h:message for="lic" style="color: red" />

    <!-- Owner Name -->
    <h:outputLabel for="Name">Owner Name:</h:outputLabel>
    <h:inputText id="Name" value="#{pharma.owner_name}" />
    <h:message for="Name" style="color: red" />

    <!-- Registration Number -->
    <h:outputLabel for="Regd">Registration Number:</h:outputLabel>
    <h:inputText id="Regd" value="#{pharma.regd_no}" />
    <h:message for="Regd" style="color: red" />

    <!-- Qualification -->
    <h:outputLabel for="Qual">Qualification:</h:outputLabel>
    <h:inputText id="Qual" value="#{pharma.qualification}" />
    <h:message for="Qual" style="color: red" />

    <!-- Date of Registration -->
    <h:outputLabel for="dates">Date of Registration:</h:outputLabel>
    <h:inputText id="dates" value="#{pharma.date_of_registration}">
        <f:convertDateTime pattern="yyyy-MM-dd" />
    </h:inputText>
    <h:message for="dates" style="color: red" />

    <!-- Phone -->
    <h:outputLabel for="phone">Phone:</h:outputLabel>
    <h:inputText id="phone" value="#{pharma.phone}" />
    <h:message for="phone" style="color: red" />

    <!-- Email -->
    <h:outputLabel for="email">Email:</h:outputLabel>
    <h:inputText id="email" value="#{pharma.email}" />
    <h:message for="email" style="color: red" />

    <!-- Regulator -->
    <h:outputLabel for="regul">Regulator:</h:outputLabel>
    <h:inputText id="regul" value="#{pharma.regulatory}" />
    <h:message for="regul" style="color: red" />

    <h:commandButton value="Enroll" action="#{enrollController.enrollPharma(pharma)}" styleClass="button-spacing" />
    <h:commandButton value="Reset" type="reset" styleClass="button-spacing"/>
    <h:commandButton value="Sign In" action="PharmacyLogin.jsp" />
</h:form>

	
</h:body>
</html>
</f:view>