<%@ page import="java.sql.*,java.io.*" %>
<%
	
 final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
    
 final String DB_URL = "jdbc:mysql://localhost:3306/musicdb";
	

 final String USERNAME = "root";
	
 final String PASSWORD = "";
	

Connection conn = null;

Class.forName(JDBC_DRIVER);
conn = DriverManager.getConnection(DB_URL, USERNAME, PASSWORD);

%>