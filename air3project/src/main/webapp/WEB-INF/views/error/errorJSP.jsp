<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- 이 jsp는 예외를 처리하는 페이지 입니다. 라고 선언해 놓는다. : exception사용 가능 -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서버실행오류</title>
</head>
<body>
<div class ="container">
<h1>서버 실행 오류-errorJSP.jsp</h1>
<!-- messege를 쓰면 getMessege를 나오게 된다. -->
<div class ="alert alert-danger"><%= exception.getMessage() %></div>
<p>다시한번 더 실행하거나 <br/> 전산을 담당하는 담당자에게 문의하세요 </p>
</div>
</body>
</html>