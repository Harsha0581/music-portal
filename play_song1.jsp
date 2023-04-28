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
String song_id=request.getParameter("film_id");
String qry;



if(request.getParameter("x") != null)
{
	
	String q="select * from filmliks where film_id1="+song_id+" and username='"+session.getAttribute("username")+"'";
	
	Statement st4=conn.createStatement();
	ResultSet rs4=st4.executeQuery(q);
	if(rs4.next())
	{
		
	}
	else
	{
		qry="update short_films set likes=likes+1 where film_id="+song_id;
		stmt.executeUpdate(qry);
		
		 q="insert into filmliks(username,film_id1) values('"+session.getAttribute("username")+"',"+song_id+")";
		//out.println(q);
		
		stmt.executeUpdate(q);
	}
	
}
else
{
	qry="update short_films set views=views+1 where film_id="+song_id;
	stmt.executeUpdate(qry);
}

qry="select views,likes from short_films where film_id="+song_id;
ResultSet rs=stmt.executeQuery(qry);
int likes=0, views=0;
if(rs.next())
{
	likes=rs.getInt("likes");
	views=rs.getInt("views");
}
%>
		
		<video controls
		
		 src="<%=song%>">
		</video>
		<br><br>

		 <i class="fa fa-eye" style="font-size:50px;color:red"></i>
		        		 &nbsp;&nbsp;&nbsp;
		        		<%=views%>
		 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<A href='play_song1.jsp?film_id=<%=song_id%>&x=1&song=<%=song%>'><i class="fa fa-thumbs-up" style="font-size:50px;color:blue"></i></A>
					&nbsp;&nbsp;&nbsp;
		        		 <%=likes%>
<br><br>

		
	</table>
	
	
</center>

</body>
</html>