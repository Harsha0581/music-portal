<!DOCTYPE html>
<html lang="en">
<head>
  <title>Edit</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script>
  function YEAR(){
	  var date=new Date();
	  var year= date.getFullYear();
	  document.getElementById("publish_date").value=date;
  }
  </script>
  <style>.body{
background-image:url(musicimages/background_1920x1080.gif);
background-repeat:no-repeat;
background-size:100%;
color:white;

}</style>
</head>
<body class="body">

<%@ include file="user_menu.jsp" %>
<div class="container">
  <h2>Update Short Film</h2>
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
		
	String qry="select film_id,title,producer,director,description,publish_date,duration,language,short_film_video_pic,views,likes,status from short_films where film_id='"+request.getParameter("film_id")+"'";	
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
			out.println("<label class='form-check-label'>film_id</label>");
			out.println("<input type='text' class='form-control' name='film_id' value='"+rs.getString("film_id")+"' readonly>");
			out.println("</div>");			
			out.println("<div class='col-sm-3'>");
			out.println("<label class='form-check-label'>title</label>");
			out.println("<input type='text' class='form-control' name='title' value='"+rs.getString("title")+"' >");
			out.println("</div>");			
			out.println("<div class='col-sm-3'>");
			out.println("<label class='form-check-label'>producer</label>");
			out.println("<input type='text' class='form-control' name='producer' value='"+rs.getString("producer")+"' >");
			out.println("</div>");			
			out.println("<div class='col-sm-3'>");
			out.println("<label class='form-check-label'>director</label>");
			out.println("<input type='text' class='form-control' name='director' value='"+rs.getString("director")+"' >");
			out.println("</div>");			
			out.println("<div class='col-sm-3'>");
			out.println("<label class='form-check-label'>description</label>");
			out.println("<input type='text' class='form-control' name='description' value='"+rs.getString("description")+"' >");
			out.println("</div>");			
			out.println("<div class='col-sm-3'>");
			out.println("<label class='form-check-label'>publish_date</label>");
			out.println("<input type='text' class='form-control' name='publish_date' value='"+rs.getString("publish_date")+"' readonly>");
			out.println("</div>");			
			out.println("<div class='col-sm-3'>");
			out.println("<label class='form-check-label'>Cost of short film</label>");
			out.println("<input type='text' class='form-control' name='duration' value='"+rs.getString("duration")+"' >");
			out.println("</div>");			
			out.println("<div class='col-sm-3'>");
			out.println("<label class='form-check-label'>language</label>");
			out.println("<input type='text' class='form-control' name='language' value='"+rs.getString("language")+"' readonly>");
			out.println("</div>");			
			out.println("<div class='col-sm-3'>");
			out.println("<label class='form-check-label'>short_film_video_pic</label>");
			out.println("<input type='text' class='form-control' name='short_film_video_pic' value='"+rs.getString("short_film_video_pic")+"' readonly >");
			out.println("</div>");			
			out.println("<div class='col-sm-3'>");
			out.println("<label class='form-check-label'>view</label>");
			out.println("<input type='text' class='form-control' name='views' value='"+rs.getString("views")+"' readonly>");
			out.println("</div>");			
			out.println("<div class='col-sm-3'>");
			out.println("<label class='form-check-label'>likes</label>");
			out.println("<input type='text' class='form-control' name='likes' value='"+rs.getString("likes")+"' readonly >");
			out.println("</div>");			
			out.println("<div class='col-sm-3'>");
			out.println("<label class='form-check-label'>status</label>");
			out.println("<input type='text' class='form-control' name='status' value='"+rs.getString("status")+"' readonly >");
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
			String updateqry="update short_films set film_id='"+request.getParameter("film_id")+"',title='"+request.getParameter("title")+"',producer='"+request.getParameter("producer")+"',director='"+request.getParameter("director")+"',description='"+request.getParameter("description")+"',publish_date='"+request.getParameter("publish_date")+"',duration='"+request.getParameter("duration")+"',language='"+request.getParameter("language")+"',short_film_video_pic='"+request.getParameter("short_film_video_pic")+"',views='"+request.getParameter("views")+"',likes='"+request.getParameter("likes")+"',status='"+request.getParameter("status")+"'  where film_id='"+request.getParameter("film_id")+"'";
			int n=stmt.executeUpdate(updateqry);
			if(n>0)
				out.print("<script language='javascript'>window.alert('Record updated successfully');window.location='view_short_film.jsp';</script>");
		
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
