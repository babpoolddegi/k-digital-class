<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
$(function(){
	$("#writeBtn").click(function(){
		if(${empty sessionScope.suser }){
			alert("로그인 하세요");
			location.href="../member/login"
			return false;
		}
		location.href="write"
	})
})
</script>

<div class="jumbotron jumbotron-fluid">
  <div class="container">
    <h1>Board List(${count})</h1>      
  </div>
</div>
<div class="container">
<input type="button" value="글쓰기" id="writeBtn" class="btn btn-primary"><br><br>
<table class="table table-hover">
	<thead>
		<tr>
			<th>번호</th>
			<th>아이디</th>
			<th>제목</th>
			<th>이메일</th>
			<th>조회수</th>
			<th>내용</th>
			<th>작성일자</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach items="${arr }" var="item">
		<tr>
		<td>${item.num }</td>
		<td>${item.userid }</td>
		<td><a href="detail?num=${item.num }">${item.subject }</a></td>
		<td>${item.email }</td>
		<td>${item.readCount }</td>
		<td>${item.content }</td>
		<td>${item.regdate }</td>
		</tr>
	</c:forEach>
	</tbody>
</table>	
</div>


<%@include file="../include/footer.jsp" %>