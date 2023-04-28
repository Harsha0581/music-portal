	<%@ page import="java.sql.*,java.io.*" %>
	<%@page import="java.util.ArrayList"%>
	<%@ page import="java.util.*" %>
    <%@ page import="java.util.Iterator" %>
	<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
   <%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
   <%@ page import="org.apache.commons.fileupload.FileItemFactory"%>
   <%@ page import="org.apache.commons.fileupload.FileItem"%>
    <%@ page import="org.apache.commons.fileupload.FileUpload"%>

	
	
	<%
	
 final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
    
 final String DB_URL = "jdbc:mysql://localhost:3306/musicdb";
	

 final String USERNAME = "root";
	
 final String PASSWORD = "";
	

Connection conn = null;
    
Statement stmt = null;
String song_id=request.getParameter("song_id");
String review=request.getParameter("review");
String username=(String)session.getAttribute("username");
String rating=request.getParameter("rating");
String qry="insert into reviews (song_id,username,review,review_date,rating) values ("+song_id+",'"+username+"','"+review+"',curdate(),"+rating+")";	 
try{
     
      
	  Class.forName(JDBC_DRIVER);
	  conn = DriverManager.getConnection(DB_URL, USERNAME, PASSWORD);
      stmt = conn.createStatement();
	  int n=stmt.executeUpdate(qry);
	  if(n>0)
		  out.println("<script language='javascript'>window.alert('Review Posted Successfully.');window.history.back();</script>");
	  else
		  out.println("<script language='javascript'>window.alert('Review Not Posted .  Try Again!');window.history.back();</script>");
		  
	  stmt.close();
	  conn.close();
	 }
	 catch(Exception ee)
	 {
		 out.println("<h3>Error :"+ee.toString());
	 }
	 %>	<%!
	

	//function to generate random number
public int generateRandomNumber(int start, int end ){
    Random random = new Random();
    long fraction = (long) ((end - start + 1 ) * random.nextDouble());
    return ((int)(fraction + start));
}

%>