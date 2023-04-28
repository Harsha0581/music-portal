	<%@ page import="java.sql.*,java.io.*" %>
	<%@page import="java.util.ArrayList"%>
	<%@ page import="java.util.*" %>
		<%@ include file = "dbconnect.jsp" %>
 	<%
  
Statement stmt = null;
	
String path=request.getContextPath(); //returns application path
		
	
	String qry="delete from songs where song_id='"+request.getParameter("song_id")+"'";	
	try
	{
		  Class.forName(JDBC_DRIVER);
		conn = DriverManager.getConnection(DB_URL, USERNAME, PASSWORD);
        stmt = conn.createStatement();
		int n=stmt.executeUpdate(qry);
		if(n>0)
			out.print("<script language='javascript'>window.alert('Record deleted successfully');window.location='view_songs.jsp';</script>");
		
		stmt.close();
		conn.close();
	}
	catch(Exception e1)
	{
		out.println("Error e1 :"+e1);
	}
	%>
		