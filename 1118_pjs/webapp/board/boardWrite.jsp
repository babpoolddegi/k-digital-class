<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<div class="jumbotron jumbotron-fluid">
  <div class="container">
    <h1>Board Write</h1>      
  </div>
</div>
<form action="write" method="post">
<div class="container">
	<div class="form-group">
		<label for="userid">Userid:</label> 
		<input type="text"
		class="form-control" id="userid" placeholder="Enter userid" name="userid" value="${sessionScope.suser.userid }" readonly="readonly">
	</div>
	<div class="form-group">
		<label for="subject">Subject:</label> 
		<input type="text"
		class="form-control" id="subject" placeholder="Enter subject" name="subject">
	</div>
	<div class="form-group">
		<label for="email">Email:</label> 
		<input type="text"
		class="form-control" id="email" placeholder="Enter email" name="email" value="${sessionScope.suser.email }" readonly="readonly">
	</div>
	<div class="form-group">
		<label for="content">Content:</label> 
		<textarea class="form-control" rows="5" id="content" name="content"></textarea>
	</div>
	<button type="submit" class="btn btn-primary" id="writeBtn">글쓰기</button>
</div>
	
</form>


<%@include file="../include/footer.jsp"%>