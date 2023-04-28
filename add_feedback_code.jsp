	<%@ page import="java.sql.*,java.io.*" %>
		
	<%
	
 final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
    
 final String DB_URL = "jdbc:mysql://localhost:3306/musicdb";
	

 final String USERNAME = "root";
	
 final String PASSWORD = "";
	

Connection conn = null;
    
Statement stmt = null;

String feedback="";
String rating="";			

		if(request.getParameter("feedback")!=null)
				feedback=request.getParameter("feedback");
			else
				feedback="null";
						if(request.getParameter("rating")!=null)
				rating=request.getParameter("rating");
			else
				rating="null";
			
	String qry="insert into feedback(feedback,rating,fdate,username) values('"+feedback+"','"+rating+"',curdate(),'"+session.getAttribute("username")+"')";
	 
try{
     
      
Class.forName(JDBC_DRIVER);
	  conn = DriverManager.getConnection(DB_URL, USERNAME, PASSWORD);
      stmt = conn.createStatement();
	  int n=stmt.executeUpdate(qry);
	  if(n==0)
		  out.println("<script language='javascript'>window.alert('Feedback Not Added.  Try Again!');window.location='add_feedback.jsp';</script>");
	  else
		  out.println("<script language='javascript'>window.alert('Feedback Posted Successfully.');window.location='add_feedback.jsp';</script>");
		  
	  stmt.close();
	  conn.close();
	 }
	 catch(Exception ee)
	 {
		 out.println("<h3>Error :"+ee.toString());
	 }
	 %>