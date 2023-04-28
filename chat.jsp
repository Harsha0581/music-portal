<%@ page import="java.sql.*,java.io.*" %>
		
	<%
	
 final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
    
 final String DB_URL = "jdbc:mysql://localhost:3306/musicdb";
	

 final String USERNAME = "root";
	
 final String PASSWORD = "";
	

Connection conn = null;
    
Statement stmt = null;

String message="";
String msg="";
String song_id=request.getParameter("song_id");
try{
     
      
Class.forName(JDBC_DRIVER);
	  conn = DriverManager.getConnection(DB_URL, USERNAME, PASSWORD);
      stmt = conn.createStatement();
      
      if(request.getParameter("submit")!=null)
      {
	   	  message=request.getParameter("message");
   		  String qry="insert into chatting(song_id,username,message,chat_time) values('"+song_id+"','"+session.getAttribute("username")+"','"+message+"',now())";
     	
		  int n=stmt.executeUpdate(qry);
      }  
      
      
      String qry="select username, message, chat_time from chatting where song_id="+song_id;
      ResultSet rs=stmt.executeQuery(qry);
     
      while(rs.next())
      {
    	  msg+=rs.getString("username")+": "+rs.getString("message")+" - "+rs.getString("chat_time")+"\n";
      }
		 
	 }
	 catch(Exception ee)
	 {
		 out.println("<h3>Error :"+ee.toString());
	 }
	 %>
<html lang="en">
<head>
  <title>Chat</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
   <style>
  .body{
background-image:url(musicimages/background_1920x1080.gif);
background-repeat:no-repeat;
background-size:100%;
color:white;

}
  
  </style>


</head>
<body class="body">

<%@ include file = "user_menu.jsp" %>
<section >
    <div class="container" style="background-color:;color:white;width:40%">
        <div class="row">
           
            <div class="col-md-12">
                <h1 style="color: green">Chatting</h1>
               <form name='f1' method='get' action="#" enctype="">
               <input type='hidden' name='song_id' value='<%=song_id%>'>
   				   <div class='row'>
						<div class='col-md-12'>
							<label for='feedback'>Users</label>
							<textarea rows='8' class='form-control' id='messages' placeholder='chat messages' name='messages' readonly ><%=msg%></textarea>
						</div>
					</div>
                
					<div class='col-md-12'>
					  <br><label for='message'>Message</label>
					  <input type="text" name="message" class='form-control'> &nbsp;
					   <input   type="submit" name="submit" class="btn btn-danger form-control" value="Send" requested>
					</div>
                    </div>
                </form>
            </div>
        </div>
    
</section>
		
</body>
</html>
