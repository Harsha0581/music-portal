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
color:white;

}</style>
</head>
<body class="body">
<%@ include file = "admin_menu.jsp" %>
<div class="container" style="color:white">
  <h2>View Songs</h2>
  <form name='f1' method='post' action="#" enctype="">
	
        
        	<%@ page import="java.sql.*,java.io.*" %>
	<%@page import="java.util.ArrayList"%>
	<%@ page import="java.util.*" %>
 	
 		<%@ include file = "dbconnect.jsp" %>
 	
 	<%
	
 
    
Statement stmt = null;
	
String path=request.getContextPath(); //returns application path
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
	  String qry1="select song_id,album_name,music_company,singer_name,lyric_writer,publish_year,duration,language,description,file1,poster_file,views,likes from songs";
	  ResultSet rs=stmt.executeQuery(qry1);
	  if(rs.next())
	  {
		out.println("<br><table class='table table-bordered display' id='table_id'>");
		out.println("<thead class='thead-light'>");
		out.println("<tr><th></th><th></th>");				
				out.println("<th>song_id</th>");				
				out.println("<th>album_name</th>");				
				out.println("<th>music_company</th>");				
				out.println("<th>singer_name</th>");				
				out.println("<th>lyric_writer</th>");				
				out.println("<th>publish_year</th>");				
				out.println("<th>copy right	&#169;</th>");				
				out.println("<th>language</th>");				
				out.println("<th>description</th>");				
				out.println("<th>audio file</th>");
				out.println("<th>poster file</th>");
				
				out.println("<th>views</th>");				
				out.println("<th>likes</th>");		out.println("</tr>");
		out.println("</thead>");
		out.println("<tbody>");
						
		do
		{
			out.println("<tr style='background-color:black'>");			
			out.println("<th><A class='btn btn-sm btn-primary' href='view_songs_edit_code.jsp?song_id="+rs.getString("song_id")+"'>Edit</th> <th><A class='btn btn-sm btn-danger' href='view_songs_code.jsp?song_id="+rs.getString("song_id")+"'>Delete</A></th>");					
						out.println("<td style='background-color:black'>"+rs.getString("song_id")+"</td>");					
						out.println("<td>"+rs.getString("album_name")+"</td>");					
						out.println("<td>"+rs.getString("music_company")+"</td>");					
						out.println("<td>"+rs.getString("singer_name")+"</td>");					
						out.println("<td>"+rs.getString("lyric_writer")+"</td>");					
						out.println("<td>"+rs.getString("publish_year")+"</td>");					
						out.println("<td>"+rs.getString("duration")+"</td>");					
						out.println("<td>"+rs.getString("language")+"</td>");					
						out.println("<td>"+rs.getString("description")+"</td>");
		 out.println("<td><A href='"+path+"/uploads/"+rs.getString("file1")+"' download>Download</A></td>");
		 out.println("<td><img src='"+path+"/uploads/"+rs.getString("poster_file")+"' width='100px' height='100px'></img></td>");
		 				out.println("<td>"+rs.getString("views")+"</td>");					
						out.println("<td>"+rs.getString("likes")+"</td>");			
			out.println("</tr>");
		}while(rs.next());
		out.println("</tbody>");
		out.println("<thead class='thead-light'>");
		out.println("<tr><th></th><th></th>");				
				out.println("<th>song_id</th>");				
				out.println("<th>album_name</th>");				
				out.println("<th>music_company</th>");				
				out.println("<th>singer_name</th>");				
				out.println("<th>lyric_writer</th>");				
				out.println("<th>publish_year</th>");				
				out.println("<th>duration</th>");				
				out.println("<th>language</th>");				
				out.println("<th>description</th>");				
				out.println("<th>audio file</th>");
				out.println("<th>poster file</th>");
				out.println("<th>views</th>");				
				out.println("<th>likes</th>");			
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
