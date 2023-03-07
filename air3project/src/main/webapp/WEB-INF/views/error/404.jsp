<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>찾는 페이지가 존재하지 않아요.</title>
</head>
<body>
<div class="container">
<h1>현재 페이지 없음</h1>
<div class="well">${uri }</div>
<p>요청하신 페이지가 존재하지 않습니다. URL을 다시 입력해주세요</p>
<div class="well">
<a href="/" class="btn btn-default">메인으로 되돌아가기</a>
</div>
</div>

</body>
</html>


<%
	session.removeAttribute("uri");
%>

