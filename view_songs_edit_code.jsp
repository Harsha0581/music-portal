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
	<%@ include file = "dbconnect.jsp" %>
 	<%
	
 
    
Statement stmt = null;
	
String path=request.getContextPath(); //returns application path
		
	String qry="select song_id,album_name,music_company,singer_name,lyric_writer,publish_year,duration,language,description,file1,views,likes from songs where song_id='"+request.getParameter("song_id")+"'";	
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
			out.println("<label class='form-check-label'>song_id</label>");
			out.println("<input type='text' class='form-control' name='song_id' value='"+rs.getString("song_id")+"' readonly>");
			out.println("</div>");			
			out.println("<div class='col-sm-3'>");
			out.println("<label class='form-check-label'>album_name</label>");
			out.println("<input type='text' class='form-control' name='album_name' value='"+rs.getString("album_name")+"' >");
			out.println("</div>");			
			out.println("<div class='col-sm-3'>");
			out.println("<label class='form-check-label'>music_company</label>");
			out.println("<input type='text' class='form-control' name='music_company' value='"+rs.getString("music_company")+"' >");
			out.println("</div>");			
			out.println("<div class='col-sm-3'>");
			out.println("<label class='form-check-label'>singer_name</label>");
			out.println("<input type='text' class='form-control' name='singer_name' value='"+rs.getString("singer_name")+"' >");
			out.println("</div>");			
			out.println("<div class='col-sm-3'>");
			out.println("<label class='form-check-label'>lyric_writer</label>");
			out.println("<input type='text' class='form-control' name='lyric_writer' value='"+rs.getString("lyric_writer")+"' >");
			out.println("</div>");			
			out.println("<div class='col-sm-3'>");
			out.println("<label class='form-check-label'>publish_year</label>");
			out.println("<input type='text' class='form-control' name='publish_year' value='"+rs.getString("publish_year")+"' >");
			out.println("</div>");			
			out.println("<div class='col-sm-3'>");
			out.println("<label class='form-check-label'>duration</label>");
			out.println("<input type='text' class='form-control' name='duration' value='"+rs.getString("duration")+"' >");
			out.println("</div>");			
			out.println("<div class='col-sm-3'>");
			out.println("<label class='form-check-label'>language</label>");
			out.println("<input type='text' class='form-control' name='language' value='"+rs.getString("language")+"' >");
			out.println("</div>");			
			out.println("<div class='col-sm-3'>");
			out.println("<label class='form-check-label'>description</label>");
			out.println("<input type='text' class='form-control' name='description' value='"+rs.getString("description")+"' >");
			out.println("</div>");			
			out.println("<div class='col-sm-3'>");
			out.println("<label class='form-check-label'>file1</label>");
			out.println("<input type='text' class='form-control' name='file1' value='"+rs.getString("file1")+"' >");
			out.println("</div>");			
			out.println("<div class='col-sm-3'>");
			out.println("<label class='form-check-label'>views</label>");
			out.println("<input type='text' class='form-control' name='views' value='"+rs.getString("views")+"' >");
			out.println("</div>");			
			out.println("<div class='col-sm-3'>");
			out.println("<label class='form-check-label'>likes</label>");
			out.println("<input type='text' class='form-control' name='likes' value='"+rs.getString("likes")+"' >");
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
			String updateqry="update songs set song_id='"+request.getParameter("song_id")+"',album_name='"+request.getParameter("album_name")+"',music_company='"+request.getParameter("music_company")+"',singer_name='"+request.getParameter("singer_name")+"',lyric_writer='"+request.getParameter("lyric_writer")+"',publish_year='"+request.getParameter("publish_year")+"',duration='"+request.getParameter("duration")+"',language='"+request.getParameter("language")+"',description='"+request.getParameter("description")+"',file1='"+request.getParameter("file1")+"',views='"+request.getParameter("views")+"',likes='"+request.getParameter("likes")+"'  where song_id='"+request.getParameter("song_id")+"'";
			int n=stmt.executeUpdate(updateqry);
			if(n>0)
				out.print("<script language='javascript'>window.alert('Record updated successfully');window.location='view_songs.jsp';</script>");
		
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
