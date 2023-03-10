<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../include/header.jsp"%>
<script>
$(function(){
	$("#delBtn").click(function(){
		if(confirm("정말 삭제할까요?")){
			location.href="delete?num=${board.num}"
		}
	})
})
</script>

<div class="jumbotron jumbotron-fluid">
	<div class="container">
		<h1>Board Detail</h1>
	</div>
</div>
<div class="container">
	<table class="table table-hover">
		<tr>
			<th>글번호</th>
			<td>${board.num }</td>
			<th>조회수</th>
			<td>${board.readCount }</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${board.userid }</td>
			<th>작성일</th>
			<td>${board.regdate }</td>
		</tr>
		<tr>
			<th>글제목</th>
			<td colspan="3">${board.subject }</td>
		</tr>
		<tr>
			<th>글내용</th>
			<td colspan="3">${board.content }</td>
		</tr>
	</table>
	<br />
<c:if test="${sessionScope.suser.userid==board.userid }">
<button type="button" class="btn btn-primary"
	onclick="location.href='update?num=${board.num}'">수정</button>
<button type="button" class="btn btn-primary" id="delBtn">삭제</button>
</c:if>

<div class="container mt-5">
		<div class="form-group">
			<label for="comment">Comment:</label>
			<textarea class="form-control" rows="5" id="msg" name="text"></textarea>
		</div>
		<button type="button" class="btn btn-success" id="commentBtn">Comment Write</button>
	</div>
	<div class="mt-5">댓글(<span class ="cntSpan"></span>)</div>
	<div id="result"></div>
</div>
<script>
var init = function(){
	$.getJSON("cmtList", 
			{"bnum":${"#num"}.val()},
			function(resp){
				var str = "<table class='table table-hover'>"
				$.each(resp.jarr, function(key,val){
					str+="<tr>"
					str+="<td>"+val.msg+"</td>"
					str+="<td>"+val.userid+"</td>"
					str+="<td>"+val.regdate+"</td>"
					str+="</tr>"
				}) 
				str +="</table>"
				$(".ctnSpan").html(resp.count);
				$("#result").html(str);
			})
}
$("#commentBtn").on("click", function(){
	if($("#msg").val()==""){
		alert("메세지를 입력하세요")
		return;
	}
	$.ajax({
		type:"post",
		url:"commentInsert",
		data : {"msg":$("#msg").val(),"bnum":$("#num").val()}
	})
	.done(function(resp){
		if(resp.trim()=="1"){
			alert("로그인 하세요")
			location.href="../member/login";
		}else{
			alert("성공");
			init();
			$("#msg").val("");
		}
	})
	.fail(function(e){
		alert("error"+e);		
	})
})

init();
</script>

<%@include file="../include/footer.jsp"%>