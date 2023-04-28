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
<body style="background-color: #ffffff;background-image: url(images/)">

<%@ include file="admin_menu.jsp" %>
<div class="container" style="background-color: #ffffff">
  <h2>Edit Record</h2>
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
		
	String qry="select id,poster_pic,poster_date,status from advertisement where id='"+request.getParameter("id")+"'";	
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
			out.println("<label class='form-check-label'>id</label>");
			out.println("<input type='text' class='form-control' name='id' value='"+rs.getString("id")+"' readonly>");
			out.println("</div>");			
			out.println("<div class='col-sm-3'>");
			out.println("<label class='form-check-label'>poster_pic</label>");
			out.println("<input type='text' class='form-control' name='poster_pic' value='"+rs.getString("poster_pic")+"' >");
			out.println("</div>");			
			out.println("<div class='col-sm-3'>");
			out.println("<label class='form-check-label'>poster_date</label>");
			out.println("<input type='text' class='form-control' name='poster_date' value='"+rs.getString("poster_date")+"' >");
			out.println("</div>");			
			out.println("<div class='col-sm-3'>");
			out.println("<label class='form-check-label'>status</label>");
			out.println("<input type='text' class='form-control' name='status' value='"+rs.getString("status")+"' >");
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
			String updateqry="update advertisement set id='"+request.getParameter("id")+"',poster_pic='"+request.getParameter("poster_pic")+"',poster_date='"+request.getParameter("poster_date")+"',status='"+request.getParameter("status")+"'  where id='"+request.getParameter("id")+"'";
			int n=stmt.executeUpdate(updateqry);
			if(n>0)
				out.print("<script language='javascript'>window.alert('Record updated successfully');window.location='view_advertisement.jsp';</script>");
		
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
