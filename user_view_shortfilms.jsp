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

}</style>
</head>
<body class="body">

<%@ include file = "user_menu.jsp" %>
<div class="container" style="background-color:;color:white">

<h2>Short film</h2>
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
 		session.setAttribute("url", "user_view_shortfilms.jsp");
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
  	  	  qry1="select film_id,title,producer,director,description,publish_date,duration,language,film_file,short_film_video_pic,views,likes from short_films where title like '%"+search+"%' or description like '%"+search+"%'";
  	  
      }
      else
      {
	  	 qry1="select film_id,title,producer,director,description,publish_date,duration,language,film_file,short_film_video_pic,views,likes from short_films";
      }
	  ResultSet rs=stmt.executeQuery(qry1);
	
	  while( rs.next() )
	  {
		 
		  %>
		   <div class="col-md-4">
		    <div class="thumbnail">
		        <img src="<%=path+"/uploads/"+rs.getString("short_film_video_pic")%>" alt="Lights" style="width:100%; height:200px">
		        <div class="caption" style='background-color:#e0e0d1'>
		        <table class='table table-sm'>
		        	<tr>
		        		<td colspan='2'>
		        		<A href='play_song1.jsp?url=user_view_shortfilms.jsp&film_id=<%=rs.getString("film_id")%>&song=<%=path+"/uploads/"+rs.getString("film_file")%>' class='btn btn-sm btn-success'>PLAY Film</A>
		        		
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
		        		<td>Title:</td> <td><b><%=rs.getString("title") %></b></td>
		        	<tr>
		        	<tr>
		        		<td>Producer:</td> <td><b><%=rs.getString("producer") %></b></td>
		        	<tr>
		        	<tr>
		        		<td>Director:</td> <td><b><%=rs.getString("director") %></b></td>
		        	<tr>
		        	<tr>
		        		<td>Publish  Date:</td> <td><b><%=rs.getString("publish_date") %></b></td>
		        	<tr>
		        	<tr>
		        		<td>cost of film:</td> <td><b><%=rs.getString("duration") %></b></td>
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
