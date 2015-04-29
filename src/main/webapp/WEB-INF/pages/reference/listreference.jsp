<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Reference</title>

<!-- JQUERY ทำงานตามลำดับ เอา QUERY ไว้บนสุด เพราะ bootstrap มันจะเรียก JQERY  -->
<script src="<c:url value=" ../resources/js/jquery-1.10.2.min.js" />"></script>
<script src="<c:url value=" ../resources/js/jquery.dataTables.min.js" />"></script>
<script src="<c:url value=" ../resources/js/dataTables.bootstrap.js" />"></script>

<!-- CSS -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">

</head>


<body>


	<div class="container" style="padding-top: 5px"">

		<form>
		<ol class="breadcrumb">
			<li role="presentation" class="active"><a href="#">Home</a></li>
			<li role="presentation"><a href="‪#‎addModal‬" data-toggle="modal">Add Reference</a></li>
		</ol>
		
			<div style="padding-bottom: 10px">
				<h2>Reference</h2>
			</div>
			<div class="form-group">

				<table id="tbResult" class=" table table-striped table-bordered">
					<thead>
						<tr class="info">
						
							<th></th>
							<th></th>		
											
							<th>NAME</th>
							<th>ADDRESS</th>
							<th>TEL</th>
							<th>OCCUPATION</th>

						</tr>
					</thead>
					<tbody></tbody>
				</table>
			</div>

			<!-- Button trigger modal -->
			<div align="right">
				<button type="button" class="btn btn-info btn-md" 
				data-toggle="modal" data-target="#myModal">Add Reference </button>
			</div>
		</form>
	</div>


	<!-- ---------------------------------------Modal------------------------------------------------------------------ -->
	
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			
			<div class="modal-dialog modal-md">
				<div class="modal-content">
				
					<div class="modal-body">		
					<h4 class="modal-title" style="padding-bottom: 10px" id="myModalLabel">Add Reference</h4>
																				
					<div class="col col-lg-12 " style="padding-top: 10px">	
									
					<div class="form-group " align="left">
							<label for="name" >Name:</label>
							<input type="text" class="form-control" id="name" placeholder="Name"></input>						
				    </div>
				    
				    <div class="form-group "  align="left">
							<label for="address" >Address:</label>		
							<textarea class="form-control" rows="1" id="address" placeholder="Address"></textarea>		
				    </div>
				    
				    <div class="form-group "  align="left">
							<label for="tel" >Tel:</label>
							<input type="text" class="form-control" id="tel" placeholder="Tel"></input>							
				    </div>
				    
				    <div class="form-group "  align="left">
							<label for="oocupatiob" >Occupation:</label>
							<input type="text" class="form-control" id="oocupation" placeholder="Occupation"></input>							
				    </div>
					
					<div align="right">
						<button type="button" class="btn btn-info">Save changes</button>
						<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
					</div>	
				</div>
					<div class="modal-footer">
						
					</div>
				</div>
			</div>

		</div>
	</div>
		
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

	
</body>
</html>