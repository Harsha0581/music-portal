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

<A href='<%=session.getAttribute("url")%>' class='btn btn-primary'>BACK</A>
<br><br>
<%@ page import="java.sql.*,java.io.*" %>
	<%@ include file = "dbconnect.jsp" %>
<%@ include file = "user_menu.jsp" %>
<%
String song=request.getParameter("song");
Statement stmt = conn.createStatement();
String username=(String)session.getAttribute("username");
String song_id=request.getParameter("song_id");
String qry="insert into history(username, song_id,song_datetime) values('"+username+"',"+song_id+",now())";
stmt.executeUpdate(qry);



if(request.getParameter("x") != null)
{
	
	String q="select * from likes where song_id="+song_id+" and username='"+session.getAttribute("username")+"'";
	
	Statement st4=conn.createStatement();
	ResultSet rs4=st4.executeQuery(q);
	if(rs4.next())
	{
		
	}
	else
	{
		qry="update songs set likes=likes+1 where song_id="+song_id;
		stmt.executeUpdate(qry);
		
		q="insert into likes(username,song_id) values('"+session.getAttribute("username")+"',"+song_id+")";
		//out.println(q);
		
		stmt.executeUpdate(q);
	}
	
}
else
{
	qry="update songs set views=views+1 where song_id="+song_id;
	stmt.executeUpdate(qry);
}

qry="select views,likes from songs where song_id="+song_id;
ResultSet rs=stmt.executeQuery(qry);
int likes=0, views=0;
if(rs.next())
{
	likes=rs.getInt("likes");
	views=rs.getInt("views");
}
%>
		
		<iframe src="<%=song%>"  id="audio">
				
		</iframe>
		<br><br>
		 <i class="fa fa-eye" style="font-size:20px;color:red"></i>
		        		 &nbsp;&nbsp;&nbsp;
		        		 <%=views%>
		 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<A href='play_song.jsp?song_id=<%=song_id%>&x=1&song=<%=song%>'><i class="fa fa-thumbs-up" style="font-size:20px;color:blue"></i></A>
					&nbsp;&nbsp;&nbsp;
		        		 <%=likes%>
<br><br>
<form name='f1' method='post' action='add_review.jsp'>
<input type='hidden' name='song_id' value='<%=song_id%>'>
	<h4>Give your review</h4>
	<textarea name='review' cols='60' rows='5' style='width:400px' class='form-control'></textarea>
	<br>
	<h4>Rating</h4>
	<select name='rating' class='form-control' style='width:400px'>
		<option>1</option>
		<option>2</option>
		<option>3</option>
		<option>4</option>
		<option>5</option>
	</select>
	<br>
	<input type='submit' name='submit' value='POST' style='width:100px' class='btn btn-warning form-control'>
</form>
	<table class='table table-sm' style='width:90%'>
	<caption><h3>Reviews...</h3></caption>
	<%
		qry="select username,review,review_date,rating from reviews where song_id="+song_id+" order by id desc";
		rs=stmt.executeQuery(qry);
		while( rs.next() )
		{
			out.print("<tr><td><i>"+rs.getString("review_date")+"</i> - <b>"+rs.getString("username")+"</b>");
			out.print("<h4 style='color:gray'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+rs.getString("review")+"</h4><h4>Rating:"+rs.getString("rating")+"</h4>");
			out.print("</td></tr>");
		}
		
	%>
		
		
	</table>
	
	
</center>	

</body>
</html>