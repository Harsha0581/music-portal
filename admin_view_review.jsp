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
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
<style>.body{
background-image:url(musicimages/background_1920x1080.gif);
background-repeat:no-repeat;
background-size:100%;
color:white;

}</style>
</head>
<body class="body">
<center>

<br><br>
<%@ page import="java.sql.*,java.io.*" %>
	<%@ include file = "dbconnect.jsp" %>
	<%@ include file = "admin_menu.jsp" %>
<%
String path=request.getContextPath(); //returns application path
Statement stmt = conn.createStatement();
%>
	<table class='table table-sm' style='width:90%'>
	<caption><h3>Reviews...</h3></caption>
	<%
		String qry="select A.username,A.review,A.review_date,A.rating,B.poster_file,B.album_name,B.music_company,B.singer_name,B.language,B.poster_file from reviews A, songs B where A.song_id=B.song_id order by B.song_id";
		//out.println(qry);	
	ResultSet rs=stmt.executeQuery(qry);
		while( rs.next() )
		{
			out.print("<tr><td>");
			out.println("<table border='0px'><tr><td><img src='"+path+"/uploads/"+rs.getString("poster_file")+"' width='100px' height='100px'></img></td>");
			out.println("<td><b>&nbsp;&nbsp;&nbsp;"+rs.getString("album_name")+"<br>&nbsp;&nbsp;&nbsp;"+rs.getString("music_company")+"<br>&nbsp;&nbsp;&nbsp;"+rs.getString("singer_name")+"<br>&nbsp;&nbsp;&nbsp;"+rs.getString("language")+"</td>");
			out.println("</table>");
			out.print("</td></tr>");
			out.print("<tr><td><i>"+rs.getString("review_date")+"</i> - <b>"+rs.getString("username")+"</b>");
			out.print("<h4 style='color:gray'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+rs.getString("review")+"</h4><h4>Rating:"+rs.getString("rating")+"</h4>");
			out.print("</td></tr>");
		}
		
	%>
		
		
	</table>
	
	
</center>	

</body>
</html>