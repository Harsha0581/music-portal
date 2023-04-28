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
background-size:500%;

}</style>
</head>
<body class="body">

<%@ include file = "user_menu.jsp" %>
<div class="container" style="background-color:;color:white">

<h2>Songs</h2>
  <form name='f1' method='get' action='#'>
  <div class='row'>
  	<div class='col-sm-2'>
  		Search:
  	</div>
  	<div class='col-sm-4'>
  		<input type='text' name='search' id='search' class='form-control'>
  	</div>
  	<div class='col-sm-2'>
  		<input type='submit' name='submit' value='Show' onclick='show_songs()'>
  	</div>
  </div>
  </form>	
 <br>   
        	<%@ page import="java.sql.*,java.io.*" %>
	<%@page import="java.util.ArrayList"%>
	<%@ page import="java.util.*" %>
 	
 	<%@ include file = "dbconnect.jsp" %>
 	
 	<%
 		session.setAttribute("url", "user_view_songs.jsp");
		Statement stmt = null;
		String path=request.getContextPath(); //returns application path
	%>
  
   
   <div class="container" style='margin-top:-40px'>
     <br><br>
   	 <div class="row">
	<%
	 
try{
	  //gets path of web app on the server		
	  // String path = application.getRealPath("/");
	  Class.forName(JDBC_DRIVER);
	  conn = DriverManager.getConnection(DB_URL, USERNAME, PASSWORD);
      stmt = conn.createStatement();
      String qry1;
      if(request.getParameter("submit") != null)
      {
    	 String search=request.getParameter("search");
  	  	  qry1="select song_id,album_name,music_company,singer_name,lyric_writer,publish_year,duration,language,description,file1,poster_file,views,likes from songs where album_name like '%"+search+"%' or description like '%"+search+"%'";
  	  
      }
      else
      {
	  	 qry1="select song_id,album_name,music_company,singer_name,lyric_writer,publish_year,duration,language,description,file1,poster_file,views,likes from songs";
      }
	  ResultSet rs=stmt.executeQuery(qry1);
	 
	  while( rs.next() )
	  {
		  %>
		   <div class="col-md-4">
		    <div class="thumbnail">
		        <img src="<%=path+"/uploads/"+rs.getString("poster_file")%>" alt="Lights" style="width:100%; height:200px">
		        <div class="caption" style='background-color:#e0e0d1'>
		        <table class='table table-sm'>
		        	<tr>
		        		<td colspan='1'>
		        		<A href='play_song.jsp?url=user_view_songs.jsp&song_id=<%=rs.getString("song_id")%>&song=<%=path+"/uploads/"+rs.getString("file1")%>' class='btn btn-sm btn-success'>PLAY SONG</A>
		        		
		        		</td>
		        		<td colspan='1'>
		        		<A href='chat.jsp?url=user_view_songs.jsp&song_id=<%=rs.getString("song_id")%>&song=<%=path+"/uploads/"+rs.getString("file1")%>' class='btn btn-sm btn-success'>LIKE MINDED CHAT</A>
		        		
		        		</td>
		        	<tr>
		        	<tr>
		        		
		        		 <td>
		        		 <i class="fa fa-eye" style="font-size:20px;color:red"></i>
		        		 &nbsp;&nbsp;&nbsp;
		        		 <%=rs.getInt("views")%>
		        		 </td>
		        		 
		        		 <td> <i class="fa fa-thumbs-up" style="font-size:20px;color:blue"></i>
							&nbsp;&nbsp;&nbsp;
		        		 <%=rs.getInt("likes")%>
		        		 </td>
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
		        		<td>Duration:</td> <td><b><%=rs.getString("duration") %></b></td>
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
