	<%@ page import="java.sql.*,java.io.*" %>
		
	<%
	
 final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
    
 final String DB_URL = "jdbc:mysql://localhost:3306/musicdb";
	

 final String USERNAME = "root";
	
 final String PASSWORD = "";
	

Connection conn = null;
    
Statement stmt = null;

String username="";
String password="";
String reg_date="";
String mobile="";
String email="";			if(request.getParameter("username")!=null)
				username=request.getParameter("username");
			else
				username="null";
						if(request.getParameter("password")!=null)
				password=request.getParameter("password");
			else
				password="null";
						if(request.getParameter("reg_date")!=null)
				reg_date=request.getParameter("reg_date");
			else
				reg_date="null";
						if(request.getParameter("mobile")!=null)
				mobile=request.getParameter("mobile");
			else
				mobile="null";
						if(request.getParameter("email")!=null)
				email=request.getParameter("email");
			else
				email="null";
			
String qry="insert into users(username,password,reg_date,mobile,email) values('"+username+"','"+password+"','"+reg_date+"','"+mobile+"','"+email+"')";
	 
try{
     
      
Class.forName(JDBC_DRIVER);
	  conn = DriverManager.getConnection(DB_URL, USERNAME, PASSWORD);
      stmt = conn.createStatement();
	  int n=stmt.executeUpdate(qry);
	  if(n==0)
		  out.println("<script language='javascript'>window.alert('Registration Failed.  Try Again!');window.location='users_new_registration.jsp';</script>");
	  else
		  out.println("<script language='javascript'>window.alert('Registration Success.');window.location='users_login.jsp';</script>");
		  
	  stmt.close();
	  conn.close();
	 }
	 catch(Exception ee)
	 {
		 out.println("<script language='javascript'>window.alert('Registration Failed.  Try Again!');window.location='users_new_registration.jsp';</script>");
	 }
	 %>