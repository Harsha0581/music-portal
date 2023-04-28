<html lang="en">
<head>
  <title>Add</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>.body{
background-image:url(musicimages/background_1920x1080.gif);
background-repeat:no-repeat;
background-size:100%;

}</style>


</head>
<body class="body">

<%@ include file = "user_menu.jsp" %>
<section >
    <div class="container" style="background-color:;color:white;width:40%">
        <div class="row">
           
            <div class="col-md-12">
                <h1 style="color: green">Post Feedback</h1>
               <form name='f1' method='post' action="add_feedback_code.jsp" enctype="">
   
					
	
<div class='row'>
	<div class='col-md-12'>
		<label for='feedback'>feedback:</label>
		<textarea rows='3' class='form-control' id='feedback' placeholder='feedback' name='feedback' required ></textarea>
	</div>
</div>
<div class='row'>
	<div class='col-md-12'>
		<label for='rating'>rating:</label>
		<select class='form-control' id='rating' name='rating'  >
		<option>1</option>
		<option>2</option>
		<option>3</option>
		<option>4</option>
		<option>5</option>
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
