<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
이름 : ${person.name }<br>
아이디 : ${person.id }<br>
성별 : ${person.gender }<br>
직업 : ${person.job }<br>
<input type="button" value="수정" onclick="location.href='update?id=${person.id}'">
<input type="button" value="삭제" onclick="location.href='delete?id=${person.id}'">
</body>
</html>