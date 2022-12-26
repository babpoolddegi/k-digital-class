<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<form action="gInsert" method="post">
<table align="center">
	<tr>
		<td>글쓴이</td>
		<td><input type="text" name="name" id="name"><br></td>
	</tr>
	<tr>
		<td>내용</td>
		<td><input type="text" size="80" name="content" id="content"><br></td>
	</tr>
	<tr>
	<td>평가</td>
	<td>  
 	<input type="radio" name="grade" id="score"  value="excellent" checked >아주잘함(excellent)    
	<input type="radio" name="grade" value="good">잘함(good)     
	<input type="radio" name="grade" value="normal">보통(normal)   
	<input type="radio" name="grade" value="fail">노력(fail)  <br>  
	</td>
	</tr>
	<td colspan="2">
	<input type="submit" value="입력"> 
	</td>
</table>

</form>
</body>
</html>