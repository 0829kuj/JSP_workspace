<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- jsp에 자바 bean 객체 생성: id는 객체의 이름, scope는 범위 -->
	<jsp:useBean id="user1" class="beans.User" scope="request"/>
	<!-- 자바 bean에 값을 가져오기(get메서드) -->
	이메일: <%= user1.getEmail() %>
	비밀번호: <%= user1.getPassword() %>
	
</body>
</html>