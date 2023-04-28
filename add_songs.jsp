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
	  document.getElementById("publish_year").value=year;
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
    <div class="container" style="background-color:;width:80%">
        <div class="row">
           
            <div class="col-md-12">
                <h3 style="color: #229954">Add New Song</h3>
               <form name='f1' method='post' action="add_songs_code.jsp" enctype="multipart/form-data" style="color:white">
   
					
<div class='row'>
	<div class='col-md-6'>
		<label for='album_name'>album_name:</label>
		<input type='text' class='form-control' id='album_name' placeholder='Enter album_name' name='album_name' required >
	</div>
	<div class='col-md-6'>
		<label for='music_company'>music_company:</label>
		<input type='text' class='form-control' id='music_company' placeholder='Enter music_company' name='music_company' required >
	</div>
</div>
<div class='row'>
	<div class='col-md-6'>
		<label for='singer_name'>singer_name:</label>
		<input type='text' class='form-control' id='singer_name' placeholder='Enter singer_name' name='singer_name' required >
	</div>
	<div class='col-md-6'>
		<label for='lyric_writer'>lyric_writer:</label>
		<input type='text' class='form-control' id='lyric_writer' placeholder='Enter lyric_writer' name='lyric_writer' required >
	</div>
</div>
<div class='row'>
	<div class='col-md-6'>
		<label for='publish_year'>publish_year in websit:</label>
		<input type='text' class='form-control' id='publish_year' placeholder='Enter publish_year in websit' name='publish_year' required onclick="YEAR()" readonly >
	</div>
	<div class='col-md-6'>
		<label for='duration'>copy right from 	&#169;:</label>
		<input type='text' class='form-control' id='duration' placeholder='Enter duration' name='duration'  >
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
		<label for='description'>description:</label>
		<textarea rows='3' class='form-control' id='description' placeholder='description' name='description'  ></textarea>
	</div>
</div>
<div class='row'>
	<div class='col-md-6'>
		<label for='file1'>upload audio file:</label>
		<input type='file' class='form-control' id='file1' placeholder='Enter audio' name='file1' required accept=".mp3">
	</div>
	
	<div class='col-md-6'>
		<label for='file2'>upload poster:</label>
		<input type='file' class='form-control' id='file2' placeholder='Enter poster' name='file2' required accept=".png,.jpg,.jpeg">
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
