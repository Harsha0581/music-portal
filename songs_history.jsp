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

<%@ include file = "user_menu.jsp" %>
<div class="container" style="background-color:;color:white">
  <h3>History</h3>
  <br><br>
   
   
   <div class="container" style='margin-top:-40px'>
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
session.setAttribute("url", "songs_history.jsp");
	 
try{
	  //gets path of web app on the server		
	  // String path = application.getRealPath("/");
	  Class.forName(JDBC_DRIVER);
	  conn = DriverManager.getConnection(DB_URL, USERNAME, PASSWORD);
      stmt = conn.createStatement();
	  String qry1="select A.song_id,A.album_name,A.music_company,A.singer_name,A.lyric_writer,A.publish_year,A.duration,A.language,A.description,A.file1,A.poster_file,A.views,A.likes,B.song_datetime from songs A, history B where A.song_id=B.song_id and B.username='"+session.getAttribute("username")+"'";
	  ResultSet rs=stmt.executeQuery(qry1);
	  ArrayList<Integer> al=new ArrayList<Integer>();
	  while( rs.next() )
	  {
		  if(al.contains(rs.getInt("song_id")))
		  {
			  continue;
		  }
		  al.add(rs.getInt("song_id"));
		  %>
		   <div class="col-md-4">
		    <div class="thumbnail">
		        <img src="<%=path+"/uploads/"+rs.getString("poster_file")%>" alt="Lights" style="width:100%; height:200px">
		        <div class="caption" style='background-color:#e0e0d1'>
		        <table class='table table-sm'>
		        	<tr>
		        		<td colspan='2'>
		        		<A href='play_song.jsp?url=songs_history.jsp&song_id=<%=rs.getString("song_id")%>&song=<%=path+"/uploads/"+rs.getString("file1")%>' class='btn btn-sm btn-success'>PLAY SONG</A>
		        		
		        		</td>
		        	<tr>
		        	<tr>
		        		<td>Viewed On:</td> <td><b><%=rs.getString("song_datetime") %></b></td>
		        	<tr>
		        	<tr>
		        		<td>Album:</td> <td><b><%=rs.getString("album_name") %></b></td>
		        	<tr>
		        	<tr>
		        		<td>Company:</td> <td><b><%=rs.getString("music_company") %></b></td>
		        	<tr>
		        	<tr>
		        		<td>Singer:</td> <td><b><%=rs.getString("singer_name") %></b></td>
		        	<tr>
		        	<tr>
		        		<td>Lyric Writer:</td> <td><b><%=rs.getString("lyric_writer") %></b></td>
		        	<tr>
		        	<tr>
		        		<td>Year:</td> <td><b><%=rs.getString("publish_year") %></b></td>
		        	<tr>
		        	<tr>
		        		<td>Language:</td> <td><b><%=rs.getString("language") %></b></td>
		        	<tr>
		        	<tr>
		        		<td>Description:</td> <td><b><%=rs.getString("description") %></b></td>
		        	<tr>
		        </table>
		        </div>
		      </a>
		    </div>
		  </div>
	<%	  
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