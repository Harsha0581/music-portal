	<%@ page import="java.sql.*,java.io.*" %>
	<%@page import="java.util.ArrayList"%>
	<%@ page import="java.util.*" %>
    <%@ page import="java.util.Iterator" %>
	<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
   <%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
   <%@ page import="org.apache.commons.fileupload.FileItemFactory"%>
   <%@ page import="org.apache.commons.fileupload.FileItem"%>
    <%@ page import="org.apache.commons.fileupload.FileUpload"%>

	<%@ include file = "dbconnect.jsp" %>
	
	<%
	
 
    
Statement stmt = null;
	
String username="";
String password="";		
			if(request.getParameter("username")!=null)
				username=request.getParameter("username");
			else
				username="null";		
			if(request.getParameter("password")!=null)
				password=request.getParameter("password");
			else
				password="null";
String qry="select * from admin where username='"+username+"' and password='"+password+"'";	 
try{
     
      
Class.forName(JDBC_DRIVER);
	  conn = DriverManager.getConnection(DB_URL, USERNAME, PASSWORD);
      stmt = conn.createStatement();
	  ResultSet rs=stmt.executeQuery(qry);
	  if(rs.next())
	  {
		  		
		session.setAttribute("username",username);		
		session.setAttribute("password",password);
		  response.sendRedirect("admin_home.jsp");
	  }
	  else
	  {
		  response.sendRedirect("admin_login.jsp?msg=Invalid username/password");
	  }
	 
	  stmt.close();
	  conn.close();
	 }
	 catch(Exception ee)
	 {
		 out.println("<h3>Error :"+ee.toString());
	 }
	 %>