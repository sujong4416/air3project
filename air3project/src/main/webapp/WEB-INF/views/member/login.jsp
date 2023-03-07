<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<style type="text/css">

.login-btn {
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
/* 로그인 버튼에 대한 호버 스타일 */
.login-btn:hover {
  background-color: lightblue; /* 호버시 버튼 배경색 */
}

.btn-wrapper {
/*   display: flex; /* 요소들을 수평으로 정렬 */ */
  justify-content: space-between; /* 요소들을 양 끝으로 분산 배치 */
  width: 100%; /* 요소들이 가득차게 함 */
/*   max-width: 500px; /* 최대 너비를 500px으로 제한 */ */
  margin: 0 auto; /* 가운데 정렬 */
}

.button-1 {
  width: 100%; /* 첫 번째 줄 버튼은 전체 너비를 차지 */
  flex-basis: 100%; /* 첫 번째 줄 버튼은 전체 너비를 차지 */
  max-width: 100%; /* 첫 번째 줄 버튼은 전체 너비를 차지 */
}

.button-2 {
  width: 50%; /* 첫 번째 줄 버튼은 전체 너비를 차지 */
  flex-basis: 50%; /* 첫 번째 줄 버튼은 전체 너비를 차지 */
  max-width: 50%; /* 첫 번째 줄 버튼은 전체 너비를 차지 */
}

.btn-group{
	display: block;
}

.right{
	border-right: 2px solid white;
}

.form-size{
	height: 3em;
}
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

.smallBtn {
  display: inline-block;
  margin-right: 5px;
  margin-right: 5px;
  padding: 5px 10px;
  background-color: none;
  color: black;
  text-decoration: none;
}
.smallBtn:hover{
  text-decoration: none;
	
}
.smallBtnGroup{
	text-align: right;
}
</style>

<script type="text/javascript">

$(function(){
	
	if('${msg }' != '') {
		alert('${msg}');
		$("#id").focus();
	}

	
	$("#FindId").click(function(){
		location = "/member/findId.do";
	});
	
	$("#FindPw").click(function(){
		location = "/member/findPw.do";
	});
	
	$("#SignUp").click(function(){
		location = "/member/join.do";
	});
	
});

</script>

</head>
<body>
<div class="container form">
	<div class="path">
	  <span>Home</span>
	  <span>로그인 메뉴</span>
	</div>
	<h1>로그인</h1>
	<form action="login.do" method="post" >
	
		<div class="form-group">
			<label for="id">아이디</label>
			<input type="text" class="form-control form-size" id="id" name="id">
		</div>
		
		<div class="form-group">
			<label for="pw">비밀번호</label>
			<input type="password" class="form-control form-size" id="pw" name="pw">
		</div>
		<div class="smallBtnGroup">
			<a href="/member/findId.do" class="smallBtn">아이디찾기</a> / 
			<a href="/member/findPw.do" class="smallBtn">비밀번호찾기</a> / 
			<a href="/member/join.do" class="smallBtn">회원가입</a>
		</div>
		<div class="btn-wrapper">
			<button type="submit" class="btn btn-deafult button-1 login-btn">로그인</button>
<!-- 			<div class="btn-group"> -->
<!-- 				<button type="button" class="btn btn-deafult right button-2 login-btn" id="FindId">아이디찾기</button> -->
<!-- 				<button type="button" class="btn btn-deafult button-2 login-btn" id="FindPw">비밀번호찾기</button> -->
<!-- 			</div> -->
<!-- 			<button type="button" class="btn btn-deafult button-1 login-btn" id="SignUp">회원가입</button> -->
		</div>
		
	</form>
	
</div>
</body>
</html>

<%
	session.removeAttribute("msg");
%>
