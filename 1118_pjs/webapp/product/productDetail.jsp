<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>
<div class="d-flex container">
	<div class="card" style="width:500px">
		<img class="card-img-top" src="/upload/${product.filename}" alt="Product image" style="width:100%">
	</div>
	<div class="container">
		<table class="table table-borderless">
		<tr>
			<th width="200px">상품명(분류)</th>
			<td>${product.pname}(${product.category})</td>
		</tr>
		<tr>
			<th>가격</th>
			<td>${product.unitPrice }</td>
		</tr>
		<tr>
			<th>상품설명</th>
			<td>${product.description }</td>
		</tr>
		<tr>
			<th>제조사</th>
			<td>${product.manufacturer }</td>
		</tr>
		<tr>
			<th>재고수</th>
			<td>${product.unitsInStock }</td>
		</tr>
		<tr>
			<th>상품상태</th>
			<td>${product.condition }</td>
		</tr>
		</table>
		<button type="button" class="btn btn-primary">장바구니</button>
		<button type="button" class="btn btn-secondary">구매하기</button>
	</div>
	
</div>

<%@include file="../include/footer.jsp"%>