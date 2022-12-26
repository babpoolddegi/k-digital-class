<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../include/header.jsp"%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
 <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
 <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<div class="jumbotron jumbotron-fluid">
<div class="container">
	<h2>Product List</h2>
</div>
</div>
<div class="container">
<div class="row">
	<c:forEach items="${products}" var="plist">
		<div class="col">
  			<div class="card" style="width:300px">
    		<img class="card-img-top" src="../upload/${plist.filename}" alt="Card image" style="width:100%;">
    		<div class="card-body">
      		<h4 class="card-title">${plist.pname}</h4>
     		 <p class="card-text">${plist.description}</p>
     		 <a href="pdetail?productId=${plist.productId }"><button type="button" class="btn btn-secondary">상세보기</button></a>
 	 		</div>
 	 		</div>	
		</div>
	</c:forEach>
</div>
</div>

<%@include file="../include/footer.jsp"%>