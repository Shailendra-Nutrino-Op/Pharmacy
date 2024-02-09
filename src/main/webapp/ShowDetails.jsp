<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
 
<f:view> 
    <html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insurance Details</title>
                               <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.min.css"/>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
  <style>
      #header{
            	box-shadow: 0px 4px 14px 0px rgba(0, 0, 0, 0.05);
                color: white;
                text-align: center;
                padding: 10px;
                display:flex;
                flex-direction: row;
                justify-content: space-between;
                padding-top: 0px;
                padding-bottom: 0px;
                background-color: #FFFFFF;
                align-items: center;
                
                      }
                      #header, h2{
                      margin: 0px; 
                      }
  #footer {
        background-color:#100720;
        display:flex;
        flex-direction:column;
        text-align: center;
        padding: 10px;
        padding-top: 60px;
        
    }

            #content {
                padding-top: 100px;
                padding-bottom: 100px;
                
                padding-left: 20px;
                padding-right: 20px;
                
                
            }
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
                width: 50%;
                margin-top: 20px;
            }

            th, td {
                border: 1px solid #ddd;
                text-align: left;
            }

            th {
                background-color: #5a2476bf;
                color: white;
       
            }

            td {
                background-color: #eaeafa;
                    padding: 16px

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
      <div id="header">
        <img src="pharmacy logo.png" style="height:auto; width:179px;"/>
        <div style="display: flex; flex-direction: row; gap:20px;"> 
        <a href="/" style="text-decoration: none;"><p style="font-size: 18px; font-weight: 600; color:#333333; font-family: sans-serif; cursor: pointer;">Home</p></a>
                 <p style="font-size: 18px; font-weight: 600; color:#333333; font-family: sans-serif;">Contact Us</p>
         <p style="font-size: 18px; font-weight: 600; color:#333333; font-family: sans-serif;">About Us</p>
         <p style="font-size: 18px; font-weight: 600; color:#333333; font-family: sans-serif;">Login</p>
         <p style="font-size: 18px; font-weight: 600; color:0A4ADF; font-family: sans-serif;">+91 7979797979</p>             
        </div>
        </div>
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
        				<style>
				body{margin:0;}
.s-media{
 position: fixed;
 top: -204px;
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
    </body>
    <footer id="footer">
      <div  style="display: flex; flex-direction: row; gap:20px;justify-content: center; align-items: center; margin-bottom: 20px;"> 
      <img style="width: 52px; height:52px;"alt="" src="facebook.png">
            <img style="width: 52px; height:52px;" alt="" src="ig[483].png">
            <img style="width: 52px; height:52px;"alt="" src="twitter.jpg">
             
                   
        </div>
       <div style="display: flex; flex-direction: row; gap:20px;justify-content: center; align-items: center;"> 
        <a href="/" style="text-decoration: none;"><p style="font-size: 18px; font-weight: 600; color:#FFF; font-family: sans-serif; cursor: pointer;">Home</p></a>
                 <p style="font-size: 18px; font-weight: 600; color:#FFF; font-family: sans-serif;">Contact Us</p>
         <p style="font-size: 18px; font-weight: 600; color:#FFF; font-family: sans-serif;">About Us</p>
         <p style="font-size: 18px; font-weight: 600; color:#FFF; font-family: sans-serif;">News</p>
         <p style="font-size: 18px; font-weight: 600; color:#FFF; font-family: sans-serif;">Our Team</p>         
        </div>
        <p style="font-size: 14px; font-weight: 500; color:#FFF; font-family: sans-serif;">&copy; 2023 Infinite Computer Solutions. All rights reserved.</p>
    </footer>
    </html>
</f:view>
