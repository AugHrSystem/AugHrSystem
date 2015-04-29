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
						<th>#</th>
						<th>Special</th>
						<th>Action</th>

					</tr>


				</thead>
				<tbody></tbody>
			</table>

			
		


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
								 <form:select path="masSpecial" class="form-control"
			id="masSpecial">
										<option value="-1">--- Select Special ---</option>
										<c:forEach var="obj" items="${SpecialList}">
											<option value="${obj.id }">${ obj.name}</option>
										</c:forEach>
									</form:select>
								<!-- <div class="dropdown">
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
								</div> -->
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
	
	<script type="text/javascript">
	var dt;

	$(document).ready(function() {
		dt = $('#tbResult').dataTable();
	

	

	

	//search name
	$("#btnSearch2").click(function() {

		search();

	});

	
	
	
	//add update
	
	
	$("#addModal").on("show.bs.modal", function(event) {

		/* var button=$(event.relatedTarget) //Button that triggered the model
		var productid=button.data("productid") //Extract info from data-* attribute*/
		
		clearModel();
		
		var button = $(event.relatedTarget);
		var productid = button.data("id");
		

		
		
		if (productid != null) {
			getid(productid);
		}

		$(this).find('.saveButton').off("click").on("click", function() {
			if(productid != null){
				//ajax update
				updateproduct(button, productid);
			}else{
				//ajax add
				
				addproduct();
			}
		});

	});
	
	 });
	 /* --- DeleteName --- */
		$("#deleteModal").on("show.bs.modal",function(event) {
			
			var button = $(event.relatedTarget) //Button that triggered the model เพื่อดูว่า evet ของ ปุ่มไหน
			var productid = button.data("id") //Extract info from data-* attribute
			
			$(this).find(".btnYes").off("click").on("click",function() {
				deleteproduct(button, productid);
			});
			
		});
		
	
	function search() {

		$.ajax({
					//{pageContext.request.contextPath}== http://localhost:8080/beertutor/

					url : "${pageContext.request.contextPath}/product/searchname",

					data : "product=" + $("#productName").val(),
					type : "POST",
					success : function(data) {
						//alert(JSON.stringify(data));

						dt.fnClearTable();

						for (var i = 0; i < data.length; i++) {
							var product = data[i];
							dt.fnAddData([
											product.name,
											product.description,
											product.productCategory.name,
											product.unit,
											product.price,
											'<button class="btn btn-warning active" type="button"  data-toggle="modal" data-target="#addModal" data-id="' + product.id + '"> Edit</button>',
											'<button class="btn btn-danger active" type="button" data-toggle="modal" data-target="#deleteModal" data-id="' + product.id + '">Delete</button>'

									])

						}

						/* $("#outputajax").text(
								JSON.stringify(data)); */
						//data เป๋น list เวลาเอาออกมาจะออกมาเป็นชุุด 
						//ex [{"id":1,"name":"bill","description":"chicken","unit":"2","price":20}]
						//alert(data[0].name);
					},
					error : function(data, textStatus, jqXML) {
						{
							$("#outputajax").text(textStatus)
						}
						;
					}

				});

	}
	
	
	
	
	
function getid(productid){
		
		
		$.ajax({
			//{pageContext.request.contextPath}== http://localhost:8080/beertutor/

			url : "${pageContext.request.contextPath}/product/findById",

			data : "id=" + productid,
			type : "POST",
			success : function(data) {
				//alert(JSON.stringify(data));
				$("#product2").val(data.name);
				//$("#productcategory2 option[value=\"" + data.productCategory.id + "\"]").attr("selected", "selected");
				$("#productcategory2").val(data.productCategory.id);
				$("#description2").val(data.description);
				$("#unit2").val(data.unit);
				$("#price2").val(data.price);

			},
			error : function(data, textStatus, jqXML) {
				{
					alert("error");
				}
				;
			}

		});
	}

	function addproduct() {

		
				$.ajax({
					url : "${pageContext.request.contextPath}/product/add",
					data : JSON.stringify({
						name : $("#product2").val(),
						productCategory : {
							id : $("#productcategory2").val(),
							name : $("#productcategory2 option:selected")
									.text()
						},
						description : $("#description2").val(),
						unit : $("#unit2").val(),
						price : $("#price2").val(),
					}),

					type : "POST",
					contentType : "application/json",
					dataType : "json",
					success : function(data) {
						//alert(JSON.stringify(data));

						dt.fnClearTable();

						clearModel();

						dt.fnAddData([

										data.name,
										data.description,
										data.productCategory.name,
										data.unit,
										data.price,

										/*  $("#product2").val(),
										 $("#productcategory2").val(),
										 $("#description2").val(),
										 $("#unit2").val(),
										 $("#price2").val(),  */
										'<button class="btn btn-warning active" type="button"  data-toggle="modal" data-target="#addModal" data-id="' + data.id + '">Edit</button>',
										'<button class="btn btn-danger active" type="button" data-toggle="modal" data-target="#deleteModal" data-id="' + data.id + '"> Delete</button>'

								]);

						$('#addModal').modal('toggle');
						
					},
					error : function() {
						alert("ERROR");
					}
				});

	}
	
	
	
	
	

	

	function updateproduct(button, productid) {
		/* productid = 12
		"id=" + productid
		id = id=12 */
		
		$.ajax({
			url : "${pageContext.request.contextPath}/product/update",
			data : JSON.stringify({
				id: productid,
				name : $("#product2").val(),
				productCategory : {
					id : $("#productcategory2").val(),
					name : $("#productcategory2 option:selected").text()
				},
				description : $("#description2").val(),
				unit : $("#unit2").val(),
				price : $("#price2").val(),
			}),

			type : "POST",
			contentType : "application/json",
			dataType : "json",
			success : function(data) {
				//alert(JSON.stringify(data));
				
				var tr = button.closest("tr");
				
				/* dt.fnUpdate([
					data.name,
					data.description,
					data.productCategory.name,
					data.unit,
					data.price,
					'<button class="btn btn-warning active" type="button"  data-toggle="modal" data-target="#addModal" data-id="' + data.id + '"><i class="icon-white icon-pencil" ></i> Edit</button>',
					'<button class="btn btn-danger active"><i class="icon-white icon-trash"></i> Delete</button>'
				], tr); */
 
				
				dt.fnUpdate(data.name, tr, 0 );
				dt.fnUpdate(data.description, tr, 1 );
				dt.fnUpdate(data.productCategory.name, tr, 2 );
				dt.fnUpdate(data.unit, tr, 3 );
				dt.fnUpdate(data.price, tr, 4 );
				
				$('#addModal').modal('toggle');

			},
			error : function() {
				alert("ERROR");
			}
		});
	}

	//var product = {id: "1", name: [{a: "1"}, {b: 2}]};
	
	function deleteproduct(button, productid) {
		
		$.ajax({
			url : "${pageContext.request.contextPath}/product/delete",
			data :"id=" + productid,
			type : "POST",
			
			success : function(data) {
				//alert(JSON.stringify(data));
				
				var tr = button.closest("tr");
				
				dt.fnDeleteRow( tr );
				
				$('#deleteModal').modal('toggle');
			},
			error : function() {
				alert("ERROR");
			}
		
			});
	}

	/* clear model หลังกดค่า */
	function clearModel() {
		$("#product2").val("");
		$("#productcategory2").val("-1");
		$("#description2").val("");
		$("#unit2").val("");
		$("#price2").val("");

	}


</script>
	
	
	
	
</body>
</html>