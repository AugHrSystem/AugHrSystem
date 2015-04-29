<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ability</title>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
</head>

<body>
<div class="container">

		<form>


			<ol class="breadcrumb">
				<li role="presentation" class="active"><a href="#">Home</a></li>
				<li role="presentation"><a href="‪#‎addModal‬"
					data-toggle="modal">Add Ability</a></li>
			</ol>
			<h2>Ability</h2>
			<table id="tbResult" class="table table-striped table-bordered">
				<thead>
					<tr class="success">

						<th>Special</th>
						<th>Action</th>

					</tr>


				</thead>
				<tbody></tbody>
			</table>

			<!-- <div class="form-group">
				<label>Employee :</label> <div class="dropdown">
					<select class="form-control">
						<option>Code Employee</option>
						<option>TH001</option>
						<option>TH002</option>
						<option>TH003</option>
						<option>TH004</option>
					</select>
				</div>
				</div>
				<br>
      
      <div class="form-group">
				<label>Special :</label> <div class="dropdown">
        <button class="btn btn-default dropdown-toggle" type="button" id="Special" data-toggle="dropdown">Code Employee
        <span class="caret"></span></button>
        <ul class="dropdown-menu" role="menu" aria-labelledby="menuspecial">
          <li role="presentation"><a role="menuitem" tabindex="-1" href="#">JAVA</a></li>
          <li role="presentation"><a role="menuitem" tabindex="-1" href="#">NET</a></li>
          <li role="presentation"><a role="menuitem" tabindex="-1" href="#">SAP</a></li>
          
        </ul>
      </div>
      </div> 
		
		
		
			<button type="button" class="btn btn-primary">Add</button> -->
		


		<!-- Button trigger modal -->
		<div class="form-group" align="right">
			<button type="button" class="btn btn-primary btn-lg"
				data-toggle="modal" data-target="#myModal">ADD</button>
		</div>

		<!-- Modal -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true" >
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">Ability Add</h4>
					</div>
					<div class="modal-body">


						<div class="form-group" >

							<div class="col col-lg-4 col-md-5 col-sm-6 col-xs-12" >
								<label>Employee :</label>
								<div class="dropdown">
									<select class="form-control">
										<option>Code Employee</option>
										<option>TH001</option>
										<option>TH002</option>
										<option>TH003</option>
										<option>TH004</option>
									</select>
								</div>
							</div>

							<div class="col col-lg-4 col-md-5 col-sm-6 col-xs-12">
								<label>Special :</label>
								<div class="dropdown">
									<button class="btn btn-default dropdown-toggle" type="button"
										id="Special" data-toggle="dropdown">
										Special <span class="caret"></span>
									</button>
									<ul class="dropdown-menu" role="menu"
										aria-labelledby="menuspecial">
										<li role="presentation"><a role="menuitem" tabindex="-1"
											href="#">JAVA</a></li>
										<li role="presentation"><a role="menuitem" tabindex="-1"
											href="#">NET</a></li>
										<li role="presentation"><a role="menuitem" tabindex="-1"
											href="#">SAP</a></li>

									</ul>
								</div>
							</div>

						</div>


<br>



					</div>



					<div class="form-group" align="center" >

						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						<button type="button" class="btn btn-primary">Save
							changes</button>
					</div>


				</div>
			</div>
		</div>

</form>
	</div>
</body>
</html>