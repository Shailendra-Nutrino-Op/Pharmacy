<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
 
<f:view> 
    <html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insurance Details</title>
  <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                margin: 0;
                padding: 0;
            }
 
            center {
                margin-top: 50px;
            }

            h2 {
                color: #333;
            }

            table {
                border-collapse: collapse;
                width: 80%;
                margin-top: 20px;
            }

            th, td {
                border: 1px solid #ddd;
                padding: 10px;
                text-align: left;
            }

            th {
                background-color: #5A2476;
                color: white;
            }

            td {
                background-color: #F6F8FA;
            }

            .commandButton {
                background-color: #5A2476;
                color: white;
                padding: 10px 15px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                margin-top: 20px;
            }

            .commandButton:hover {
                background-color: #45a049;
            }
        </style>
    </head>
    <body>
        <h:form>
            <center>
                <h2><h:outputText value="Sale Details"/></h2>
                
                <table border="1">
                    <tr>
                        <th><h:outputLabel value="Sales ID:" style="text-align: left;" /></th>
                        <td><h:outputText value="#{details.getSaleId()}" style="background-color: yellow;"/></td>
                    </tr>

                    <tr>
                        <th><h:outputLabel value="Pharmacy ID:" style="text-align: left;" /></th>
                        <td><h:outputText value="#{details.getPharm_id()}"/></td>
                    </tr>

                    <tr>
                        <th><h:outputLabel value="Entry ID:" style="text-align: left;" /></th>
                        <td><h:outputText value="#{details.getEntryId()}"/></td>
                    </tr>

                    <tr>
                        <th><h:outputLabel value="Medicine ID:" style="text-align: left;" /></th>
                        <td><h:outputText value="#{details.getMedId()}"/></td>
                    </tr>

                    <tr>
                        <th><h:outputLabel value="Medicine Name :" style="text-align: left;" /></th>
                        <td><h:outputText value="#{details.getMedName()}"/></td>
                    </tr>

                    <tr>
                        <th><h:outputLabel value="Sales Date:" style="text-align: left;" /></th>
                        <td>
                            <h:outputText value="#{details.getSaleDate()}">
                                <f:convertDateTime pattern="yyyy-MM-dd" />
                            </h:outputText>
                        </td>
                    </tr>

                    <tr>
                        <th><h:outputLabel value="Quantity:" style="text-align: left;"/></th>
                        <td><h:outputText value="#{details.getQuantity()}"/></td>
                    </tr>

                    <tr>
                        <th><h:outputLabel value="Price:" style="text-align: left;"/></th>
                        <td><h:outputText value="#{details.getPrice()}"/></td>
                    </tr>

                    <tr>
                        <th><h:outputLabel value="Total Price:" style="text-align: left;"/></th>
                        <td><h:outputText value="#{details.getTotalPrice()}"/></td>
                    </tr>

                    <tr>
                        <th><h:outputLabel value="Provider ID:" style="text-align: left;"/></th>
                        <td><h:outputText value="#{details.getProviderId()}"/></td>
                    </tr>

                    <tr>
                        <th><h:outputLabel value="UHID:" style="text-align: left;"/></th>
                        <td><h:outputText value="#{details.getuHID()}"/></td>
                    </tr>

                    <tr>
                        <th><h:outputLabel value="Prescription ID:" style="text-align: left;"/></th>
                        <td><h:outputText value="#{details.getPrescription_Id()}"/></td>
                    </tr>
                </table>
                </br>
               
                
                <h:commandButton value="Back" action="SearchSales.jsp?faces-redirect=true" styleClass="commandButton"></h:commandButton>
            </center>
        </h:form>
    </body>
    </html>
</f:view>
