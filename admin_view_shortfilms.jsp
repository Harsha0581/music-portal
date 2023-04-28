<!DOCTYPE html>
<html lang="en">
<head>
  <title>View Records</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">
  
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
<style>.body{
background-image:url(musicimages/background_1920x1080.gif);
background-repeat:no-repeat;
background-size:100%;

}</style>
</head>
<body class="body">

<%@ include file = "admin_menu.jsp" %>
<div class="container" style="background-color: black;color:white">
  <h2>Short Films..</h2>
  <form name='f1' method='post' action="#" enctype="">
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
session.setAttribute("url","view_short_film.jsp");
	%>
	
   <br>

	
	
	
   </form>
   
   
   <div class="container" style='margin-top:-40px'>
   	
	<%
	 
try{
     
      

	  //gets path of web app on the server		
	  // String path = application.getRealPath("/");
	  Class.forName(JDBC_DRIVER);
	  conn = DriverManager.getConnection(DB_URL, USERNAME, PASSWORD);
      stmt = conn.createStatement();
	  String qry1="select film_id,title,producer,director,description,publish_date,duration,language,short_film_video_pic,views,likes,status,film_file from short_films";
	  ResultSet rs=stmt.executeQuery(qry1);
	  if(rs.next())
	  {
		out.println("<br><table class='table table-bordered display' id='table_id'style='color:white'>");
		out.println("<thead class='thead-light'>");
		out.println("<tr><th></th><th></th>");				
				out.println("<th>film_id</th>");				
				out.println("<th>title</th>");				
				out.println("<th>producer</th>");				
				out.println("<th>director</th>");				
				out.println("<th>description</th>");				
				out.println("<th>publish_date</th>");				
				out.println("<th>duration</th>");				
				out.println("<th>language</th>");				
				out.println("<th>short_film_video_pic</th>");
				out.println("<th>film_video</th>");
				out.println("<th>views</th>");				
				out.println("<th>likes</th>");				
				out.println("<th>status</th>");		out.println("</tr>");
		out.println("</thead>");
		out.println("<tbody>");
						
		do
		{
			out.println("<tr style='background-color:black'>");			
			out.println("<th><A class='btn btn-sm btn-primary' href='view_short_film_edit_code.jsp?film_id="+rs.getString("film_id")+"'>Edit</th> <th><A class='btn btn-sm btn-danger' href='view_short_film_code.jsp?film_id="+rs.getString("film_id")+"'>Delete</A></th>");					
						out.println("<td>"+rs.getString("film_id")+"</td>");					
						out.println("<td>"+rs.getString("title")+"</td>");					
						out.println("<td>"+rs.getString("producer")+"</td>");					
						out.println("<td>"+rs.getString("director")+"</td>");					
						out.println("<td>"+rs.getString("description")+"</td>");					
						out.println("<td>"+rs.getString("publish_date")+"</td>");					
						out.println("<td>"+rs.getString("duration")+"</td>");					
						out.println("<td>"+rs.getString("language")+"</td>");				
				out.println("<td><img src='"+path+"/uploads/"+rs.getString("short_film_video_pic")+"' width='100px' height='100px'></img></td>");
				%>
				<td>
        		<A href='play_song1.jsp?url=admin_view_shortfilms.jsp&song_id=<%=rs.getString("film_id")%>&song=<%=path+"/uploads/"+rs.getString("film_file")%>' class='btn btn-sm btn-success'>PLAY VIDEO</A>
        		
        		</td>
				
				<%
						out.println("<td>"+rs.getString("views")+"</td>");					
						out.println("<td>"+rs.getString("likes")+"</td>");					
						out.println("<td>"+rs.getString("status")+"</td>");			
			out.println("</tr>");
		}while(rs.next());
		out.println("</tbody>");
		out.println("<thead class='thead-light'>");
		out.println("<tr><th></th><th></th>");				
				out.println("<th>film_id</th>");				
				out.println("<th>title</th>");				
				out.println("<th>producer</th>");				
				out.println("<th>director</th>");				
				out.println("<th>description</th>");				
				out.println("<th>publish_date</th>");				
				out.println("<th>duration</th>");				
				out.println("<th>language</th>");				
				out.println("<th>short_film_video_pic</th>");				
				out.println("<th>view</th>");				
				out.println("<th>likes</th>");				
				out.println("<th>status</th>");			
		out.println("</tr>");
		out.println("</thead>");
		out.println("</table></div>");
		}
		else
		{
			out.println("<h1>Records Not Found</h1>");
		}
		stmt.close();
		conn.close();
	}
	 catch(Exception ee)
	 {
		 out.println("<h3>Error :"+ee.toString());
	 }
	%>
   </div>
   <br>
   
  
</div>
		<script>
		$(document).ready( function () {
    $('#table_id').DataTable();
} );
		</script>
		
</body>
</html>
