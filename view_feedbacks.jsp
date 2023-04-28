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
<div class="container" style="color:#ffffffff">
  <h2>Feedbacks..</h2>
  <form name='f1' method='post' action="#" enctype="" style="color:white">
	
        
        
	
   <br>

	
	
	
   </form>
   
   
   <div class="container" style='margin-top:-40px' style="color:white">
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
		
	 
try{
     
      

	  //gets path of web app on the server		
	  // String path = application.getRealPath("/");
	  Class.forName(JDBC_DRIVER);
	  conn = DriverManager.getConnection(DB_URL, USERNAME, PASSWORD);
      stmt = conn.createStatement();
	  String qry1="select date_format(fdate,'%d-%m-%Y') as fdate1,feedback,rating,username from feedback order by fid desc";
	  ResultSet rs=stmt.executeQuery(qry1);
	 if(rs.next())
	  {
		out.println("<br><table class='table table-bordered display' id='table_id' style='color:white'>");
		out.println("<thead class='thead-light'>");
		out.println("<tr>");out.println("<th>fdate</th>");out.println("<th>feedback</th>");out.println("<th>rating</th>");out.println("<th>username</th>");		out.println("</tr>");
		out.println("</thead>");
		out.println("<tbody>");
						
		do
		{
			out.println("<tr style='background-color:black'>");
		 out.println("<td style='background-color:black'>"+rs.getString("fdate1")+"</td>");
		 out.println("<td>"+rs.getString("feedback")+"</td>");
		 out.println("<td>"+rs.getString("rating")+"</td>");
		 out.println("<td>"+rs.getString("username")+"</td>");		out.println("</tr>");
		}while(rs.next());
		out.println("</tbody>");
		out.println("<thead class='thead-light'>");
		out.println("<tr>");out.println("<th>fdate</th>");out.println("<th>feedback</th>");out.println("<th>rating</th>");out.println("<th>username</th>");		out.println("</tr>");
		out.println("</thead>");
		out.println("</table></div>");
	  }
	 else
	  {
	 	  out.println("<h3>Records Not Found.</h3>");
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
