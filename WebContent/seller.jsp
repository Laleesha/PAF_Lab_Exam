<%@ page import="com.models.Seller" %>
<%@ page import= "javax.sql.*" %>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%
	Seller seller =new Seller();
	String sellersGrid = "";
	String rudFeedback = "";
	
	if(request.getParameter("hidMode") !=null && request.getParameter("hidMode").equalsIgnoreCase("save"))
	{
		rudFeedback = seller.saveAnSeller(request.getParameter("txtItemName"), request.getParameter("txtItemDesc"));
	}
	if(request.getParameter("hidMode") !=null && request.getParameter("hidMode").equalsIgnoreCase("update"))
	{
		rudFeedback = seller.updateAnSeller(request.getParameter("hidID"), request.getParameter("txtItemName"), request.getParameter("txtItemDesc"));
	}
	if(request.getParameter("hidMode") !=null && request.getParameter("hidMode").equalsIgnoreCase("remove"))
	{	
		rudFeedback = seller.deleteAnSeller(request.getParameter("hidID"));
	}
	sellersGrid = seller.getSellers();
	%>        
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width-device-width, initial-scale=1">

<link href="css/bootstrap.min.css" rel="stylesheet">
<title>Items</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src=Controllers/jQuery.js></script>
<script type="text/javascript" src=Controllers/controllerMain.js></script>
</head>
<body>
	<form id="formSellers" action="seller.jsp" method="post">
		<input id="hidMode" name="hidMode" type="hidden" value="save">
		<input id="hidID" name="hidID" type="hidden" value="0" ><br>
		Seller Name: <input id="txtSellerName" type="text" name="textSellerName"> <br>
		Seller Address: <input id="txtSellerAddr" type="text" name="textSellerDesc"> <br>
		<input id="btnSave" type="button" name="btnSave" value="Save"><br><br>
		<div id="divStsMsgItem"><% out.println(rudFeedback); %></div>
		<% out.println(sellersGrid);  %>
	</form>
	
</body>
</html>