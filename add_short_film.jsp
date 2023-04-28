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
	  document.getElementById("publish_date").value=date;
  }
  </script>
  <style>.body{
background-image:url(musicimages/background_1920x1080.gif);
background-repeat:no-repeat;
background-size:100%;color:white;

}</style>


</head>
<body class="body">

<%@ include file = "user_menu.jsp" %>
<section >
    <div class="container" style="background-color;color:white;width:80%">
        <div class="row">
           
            <div class="col-md-12">
                <h3 style="color: #229954">Upload Short Film</h3>
               <form name='f1' method='post' action="add_short_film_code.jsp" enctype="multipart/form-data">
   
					
<div class='row'>
	<div class='col-md-6'>
		<label for='title'>title:</label>
		<input type='text' class='form-control' id='title' placeholder='Enter title' name='title' required >
	</div>
	<div class='col-md-6'>
		<label for='producer'>producer:</label>
		<input type='text' class='form-control' id='producer' placeholder='Enter producer' name='producer' required >
	</div>
</div>
<div class='row'>
	<div class='col-md-6'>
		<label for='director'>director:</label>
		<input type='text' class='form-control' id='director' placeholder='Enter director' name='director' required >
	</div>
	<div class='col-md-6'>
		<label for='description'>description:</label>
		<textarea rows='3' class='form-control' id='description' placeholder='description' name='description' required ></textarea>
	</div>
</div>
<div class='row'>
	<div class='col-md-6'>
		<label for='publish_date'>publish_date:</label>
		<input type='text' class='form-control' id='publish_date' placeholder='Enter publish_date' name='publish_date' onclick="YEAR()" readonly >
	</div>
	<div class='col-md-6'>
		<label for='duration'>cost of short film:</label>
		<input type='number' class='form-control' id='duration' placeholder='Cost of short film ' name='duration' required >
	</div>
</div>
<div class='row'>
	<div class='col-md-6'>
		<label for='language'>language:</label>
		<select class='form-control' id='language' name='language'  >
		<option>Telugu</option>
		<option>Hindi</option>
		<option>English</option>
		</select>
	</div>
	<div class='col-md-6'>
		<label for='short_film_video_pic'>short_film_video_pic:</label>
		<input type='file' class='form-control' id='short_film_video_pic' placeholder='Enter short_film_video_pic' name='short_film_video_pic' required accept=".jpg,.png,.jpeg">
	</div>
	
	<div class='col-md-6'>
		<label for='film_file'>short_film_video:</label>
		<input type='file' class='form-control' id='film_file' placeholder='Enter short_film_video' name='film_file' required  accept=".mp4">
	</div>
</div>	
					<br>
                    <div class="form-row">
                           <input  type="submit" name="submit" class="btn btn-danger" value="Add">
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>
		
</body>
</html>
