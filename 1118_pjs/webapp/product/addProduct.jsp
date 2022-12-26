<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>
<div class="jumbotron jumbotron-fluid">
	<div class="container">
		<h1>상품등록</h1>
	</div>
</div>
<div class="container">
<form action="pInsert" method="post" enctype="multipart/form-data">
	<div class="form-group">
		<label for="name">Name:</label> <input type="text"
			class="form-control" id="name" placeholder="Enter Name" name="name">
	</div>

	<div class="form-group">
		<label for="unitprice">UnitPrice:</label> <input type="text"
			class="form-control" id="unitprice" placeholder="Enter Unitprice"
			name="unitPrice">
	</div>

	<div class="form-group">
		<label for="description">Description:</label> <input type="text"
			class="form-control" id="description" placeholder="Enter Description"
			name="description">
	</div>

	<div class="form-group">
		<label for="manufacturer">Manufacturer:</label> <input type="text"
			class="form-control" id="manufacturer" placeholder="Enter Manufacturer"
			name="manufacturer">
	</div>
	<div class="form-group">
		<label for="category">Category:</label> <input type="text"
			class="form-control" id="category" placeholder="Enter Category"
			name="category">
	</div>
	<div class="form-group">
		<label for="unitsInStock">UnitsInStock:</label> <input type="text"
			class="form-control" id="unitsInStock" placeholder="Enter UnitsInStock"
			name="unitsInStock">
	</div>
	<div class="form-group">
	<label class="col-sm-2">Condition:</label>
		<div class="form-check-inline">
			<label class="form-check-label"> <input type="radio"
				class="form-check-input" name="condition" value="New" checked>New
			</label>
		</div>
		<div class="form-check-inline">
			<label class="form-check-label"> <input type="radio"
				class="form-check-input" name="condition" value="Old">Old
			</label>
		</div>
		<div class="form-check-inline">
			<label class="form-check-label"> <input type="radio"
				class="form-check-input" name="condition" value="Refurbished" >Refurbished
			</label>
		</div>
	</div>
	<div class="form-group">
		<label for="file">File:</label> <input type="file"
			class="form-control" id="productImage" placeholder="Enter File"
			name="productImage">
	</div>
	<br /> <br />


	<button type="submit" class="btn btn-primary">상품추가</button>
</form>
</div>



<%@include file="../include/footer.jsp" %>