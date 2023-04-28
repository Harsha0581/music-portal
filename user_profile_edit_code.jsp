<!DOCTYPE html>
<html lang="en">
<head>
  <title>Edit</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  </head>
<script>
function mobile1(){
	var phonenumber=(document.getElementById("mobile").value);
	var phonenumber_length=phonenumber.length;
	if( phonenumber !=""){
		if(phonenumber_length == 10){
			return true;
		}else{
			alert("Your phone number must have 10 digits only");
			document.getElementById("mobile").value="";
			return false;
		}
	}else{
		alert("you must fill the phone number");
		document.getElementById("mobile").value="";
		return false;
	}
}
</script>
<style>
  .body{
background-image:url(musicimages/background_1920x1080.gif);
background-repeat:no-repeat;
background-size:100%;
color:white;

}
  
  </style>
</head>
<body class="body">
<%@ include file="user_menu.jsp" %>
<div class="container" style="background-color:">
  <h2>Edit Profile..</h2>
  <form name='f1' method='post' action="#" enctype="">
	<div class="container">
        
        	<%@ page import="java.sql.*,java.io.*" %>
	<%@page import="java.util.ArrayList"%>
	<%@ page import="java.util.*" %>
 	<%
	
 final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
    
 final String DB_URL = "jdbc:mysql://localhost:3306/musicdb";
	

 final String USERNAME = "root";
	
 final String PASSWORD = "";
	

Connection conn = null;
    
Statement stmt = null;
	
String path=request.getContextPath(); //returns application path
		
	String qry="select uid,username,password,reg_date,mobile,email from users where uid='"+request.getParameter("uid")+"'";	
	try
	{
		  Class.forName(JDBC_DRIVER);
		conn = DriverManager.getConnection(DB_URL, USERNAME, PASSWORD);
        stmt = conn.createStatement();
		ResultSet rs=stmt.executeQuery(qry);
		//out.println("<div class='container'>");
		if(rs.next())
		{
			out.println("<div class='row'>");			
			out.println("<div class='col-sm-3'>");
			out.println("<label class='form-check-label'>uid</label>");
			out.println("<input type='text' class='form-control' name='uid' value='"+rs.getString("uid")+"' readonly>");
			out.println("</div>");			
			out.println("<div class='col-sm-3'>");
			out.println("<label class='form-check-label'>username</label>");
			out.println("<input type='text' class='form-control' name='username' value='"+rs.getString("username")+"' >");
			out.println("</div>");			
			out.println("<div class='col-sm-3'>");
			out.println("<label class='form-check-label'>password</label>");
			out.println("<input type='text' class='form-control' name='password' value='"+rs.getString("password")+"' >");
			out.println("</div>");			
			out.println("<div class='col-sm-3'>");
			out.println("<label class='form-check-label'>reg_date</label>");
			out.println("<input type='text' class='form-control' name='reg_date' value='"+rs.getString("reg_date")+"' readonly>");
			out.println("</div>");			
			out.println("<div class='col-sm-3'>");
			out.println("<label class='form-check-label'>mobile</label>");
			out.println("<input type='number' class='form-control' name='mobile' value='"+rs.getString("mobile")+"' id='mobile' onfocusout='mobile1()' >");
			out.println("</div>");			
			out.println("<div class='col-sm-3'>");
			out.println("<label class='form-check-label'>email</label>");
			out.println("<input type='email' class='form-control' name='email' value='"+rs.getString("email")+"' >");
			out.println("</div>");			out.println("</div><hr></hr>");
		}
		else
		{
			out.println("<h1>Records Not Found</h1>");
		}
		stmt.close();
		conn.close();
	}
	catch(Exception e1)
	{
		out.println("Error e1 :"+e1);
	}
	%>
   <br>
	<button type="submit" name='submit' class="btn btn-default btn-success">Submit</button>
	
	
	
	
	
	
   </form>
   
   <form name='f2' method='post' action='#'>
   	
	<%
	
	if(request.getParameter("submit")!=null)
	{
		try
		{
			conn = DriverManager.getConnection(DB_URL, USERNAME, PASSWORD);
			stmt = conn.createStatement();
			String updateqry="update users set uid='"+request.getParameter("uid")+"',username='"+request.getParameter("username")+"',password='"+request.getParameter("password")+"',reg_date='"+request.getParameter("reg_date")+"',mobile='"+request.getParameter("mobile")+"',email='"+request.getParameter("email")+"'  where uid='"+request.getParameter("uid")+"'";
			int n=stmt.executeUpdate(updateqry);
			if(n>0)
				out.print("<script language='javascript'>window.alert('Record updated successfully');window.location='user_profile.jsp';</script>");
		
			stmt.close();
			conn.close();
		}
		catch(Exception e1)
		{
			out.println("Error e1 :"+e1);
		}
	}
	%>
		
   </form>
</div>
		
		
</body>
</html>
