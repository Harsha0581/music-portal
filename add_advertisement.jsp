<html lang="en">
<head>
  <title>Add Record</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script>
  function YEAR(){
	  var date=new Date();
	  var year= date.getFullYear();
	  document.getElementById("poster_date").value=date;
  }
  </script>
<style>.body{
background-image:url(musicimages/background_1920x1080.gif);
background-repeat:no-repeat;
background-size:100%;

}</style>

</head>
<body class="body">

<%@ include file = "admin_menu.jsp" %>
<section >
    <div  style="background-color: black;color:white;width:35%">
        <div class="row">
           
            <div class="col-md-12">
                <h1 style="color:green">Add Advertisement</h1>
               <form name='f1' method='post' action="add_advertisement_code.jsp" enctype="multipart/form-data">
   
					
	
<div class='row'>
	<div class='col-md-12'>
		<label for='poster_pic'>poster_pic:</label>
		<input type='file' class='form-control' id='poster_pic' placeholder='Enter poster_pic' name='poster_pic' required accept=".jpg,.png,.jpeg">
	</div>
</div>
<div class='row'>
	<div class='col-md-12'>
		<label for='poster_date'>poster_date:</label>
		<input type='text' class='form-control' id='poster_date' placeholder='Enter poster_date' name='poster_date' required onclick="YEAR()" readonly>
	</div>
</div>
<div class='row'>
	<div class='col-md-12'>
		<label for='status'>status:</label>
		<select class='form-control' id='status' name='status'  >
		<option>Active</option>
		<option>In-Active</option>
		</select>
	</div>
</div>
					
                 
					<div class='col-md-12'>
					  <br>
					   <input   type="submit" name="submit" class="btn btn-danger form-control" value="Add">
					</div>
                    </div>
                </form>
            </div>
        </div>
    
</section>
		
</body>
</html>
