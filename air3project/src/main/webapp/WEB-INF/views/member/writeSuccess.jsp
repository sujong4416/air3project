<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style type="text/css">
.form{
	max-width: 850px;
}
h1 {
  color: #666; /* 글자색 */
  font-size: 32px; /* 폰트 크기 */
/*   font-weight: bold; /* 굵게 */ */
  text-align: center; /* 가운데 정렬 */
  margin-top: 50px; /* 위쪽 여백 */
}
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
.login-btn:hover {
  background-color: lightblue; /* 호버시 버튼 배경색 */
}

.boldText{
	color: black;
	font-weight: bold;
}
h3 {
  color: #666; /* 글자색 */
  font-size: 16px; /* 폰트 크기 */
  font-weight: bold; /* 굵게 */
  text-align: center; /* 가운데 정렬 */
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
	
	$("#loginBtn").click(function(){
		location="/member/login.do";
	});
	
});

</script>

</head>
<body>
	<div class="container form">
		<div class="path">
	  <span>Home</span>
	  <span>회원가입</span>
	  <span>회원가입 완료</span>
	</div>
		<div style="text-align: center;">
		<i class="fa fa-check-circle-o" style="font-size:80px;color:#004080;"></i>
		</div>
		<div style="text-align: center;">
			<h1>이젠항공 <span class="boldText">회원가입이 완료</span>되었습니다.</h1>
			<h3>로그인 후 모든 서비스를 이용할 수 있습니다.</h3>
		</div>
	
		<div style="text-align: center;">
			<button type="submit" id="loginBtn" class="btn btn-deafult login-btn">로그인페이지로 이동</button>
		</div>
	</div>
</body>
</html>