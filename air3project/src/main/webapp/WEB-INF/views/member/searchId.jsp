<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" href="/upload/favicon/favicon (1).ico"
	type="image/x-icon">
<link rel='stylesheet'
	href='https://cdn-uicons.flaticon.com/uicons-regular-rounded/css/uicons-regular-rounded.css'>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript" src="/js/regEx.js"></script>

<style type="text/css">
h1 {
  color: #004080; /* 글자색 */
  font-size: 32px; /* 폰트 크기 */
  font-weight: bold; /* 굵게 */
  text-align: center; /* 가운데 정렬 */
  margin-top: 50px; /* 위쪽 여백 */
}
.form{
	max-width: 850px;
}

.menu-btn {
  background-color: #004080; /* 버튼 배경색 */
  color: white; /* 버튼 글자색 */
  border: none; /* 버튼 테두리 없음 */
  padding: 12px 24px; /* 버튼 패딩 */
  text-align: center; /* 버튼 텍스트 가운데 정렬 */
  text-decoration: none; /* 버튼 텍스트에 밑줄 없음 */
  display: inline-block; /* 버튼을 inline 요소로 변경 */
  font-size: 16px; /* 버튼 글자 크기 */
  margin: 4px 0; /* 버튼 마진 */
  cursor: pointer; /* 커서 모양 변경 */
  border-radius: 4px; /* 버튼 모서리 둥글게 */
  flex-basis: calc((100% - 10px) / 2); /* 요소들의 너비를 계산하여 설정 */
  max-width: calc((100% - 10px) / 2); /* 요소들의 최대 너비를 계산하여 설정 */
  box-sizing: border-box; /* padding과 border를 포함한 크기로 지정 */
  transition: background-color 0.3s; /* 배경색 변경 시 부드럽게 */
  
  
}
.menu-btn:hover {
  background-color: lightblue; /* 호버시 버튼 배경색 */
  color: black;
}
.form-size{
	height: 3em;
}


.path {
 margin-top:15px;

  display: flex;
  align-items: center;
  font-size: 14px;
  font-weight: bold;
  color: #333;
}

.path span:not(:last-child)::after {
  content: "";
  display: inline-block;
  margin: 0 10px;
  width: 5px;
  height: 5px;
  border-radius: 50%;
  background-color: #ccc;
}

.path span:last-child {
  color: #666;
}


</style>


<script type="text/javascript">

$(function(){
	
	$("#closeBtn").click(function(){
		
		window.close();
	});
	
	
	$("#searchIdForm").submit(function(){
		
		if(!checkData(reg_id, $("#checkId"), reg_id_error_msg, 1 )) return false;
		
	});
	
	
	$("#use").click(function(){
		
		let id = $("#checkId").val();
		
		opener.writeForm.id.value = id;

		window.close();

	});
});

</script>

</head>
<body>
<div class="container form">
	<div class="path">
	  <span>Home</span>
	  <span>회원가입</span>
	  <span>아이디 중복체크</span>
	</div>
	<h1>아이디 중복체크</h1>
	<form action="/member/searchId.do" method="post" id="searchIdForm">
		<div class="form-group">
			<label for="checkId">아이디</label>
			<input class="form-control form-size" placeholder="영문자,숫자 6자 ~ 20자" id="checkId" name="checkId" value="${id }">
		</div>
		<c:if test="${result == 1 }">
		 <div class="alert alert-danger">
			[${id }]는 이미 사용중이거나 탈퇴한 아이디입니다.
		</div>
		</c:if>
		<c:if test="${result == 0 }">
		<div class="alert alert-success">
			[${id }]는 사용 가능한 아이디입니다.
		</div>
		</c:if>
		
		<button class="btn btn-default menu-btn" type="submit">중복체크</button>
		<button class="btn btn-default menu-btn" type="button" id="closeBtn">닫기</button>
		<c:if test="${result == 0 }">
		<button class="btn btn-default menu-btn pull-right" type="button" id="use">사용</button>
		</c:if>		
	</form>
</div>
</body>
</html>