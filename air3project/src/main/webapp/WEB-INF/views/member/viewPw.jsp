<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
h1 {
  color: #004080; /* 글자색 */
  font-size: 32px; /* 폰트 크기 */
  font-weight: bold; /* 굵게 */
  text-align: center; /* 가운데 정렬 */
  margin-top: 50px; /* 위쪽 여백 */
}
h3 {
  color: #004080; /* 글자색 */
  font-size: 16px; /* 폰트 크기 */
  font-weight: bold; /* 굵게 */
  text-align: center; /* 가운데 정렬 */
  margin-top: 50px; /* 위쪽 여백 */
}
h4 {
  color: #555; /* 글자색 */
  font-size: 12px; /* 폰트 크기 */
  text-align: center; /* 가운데 정렬 */
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

.viewMenu {
/* 	display: flex; */
	align-items: center;
	background-color: #f9f9f9;
	border: 1px solid #ddd;
	border-radius: 4px;
	padding: 10px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	text-align: center;
	width: 75%;
	margin: 0 auto 20px;
}
		.viewMenu span {
			margin-right: 20px;
			font-size: 18px;
			color: #333;
			font-weight: bold;
		}
		.viewMenu span:last-child {
			margin-right: 0;
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
	$("#login").click(function(){
		location="/member/login.do";
	});
	
});

</script>
</head>
<body>
<div class="container">
	<div class="path">
	  <span>Home</span>
	  <span>비밀번호 찾기</span>
	  <span>임시비밀번호 발급</span>
	</div>
	<h1>임시비밀번호 발급 완료</h1>
	<div class="">
		<h3><span style="color:red;">임시비밀번호</span>가 발급되었습니다.</h3>
	</div>
	<div class="viewMenu">
		<span class="view">임시 비밀번호 : ${pw }</span>
	</div>
		<h4>발급된 임시비밀번호는 다시 조회가 불가능하니 잊어버지리 않도록 주의하시기 바랍니다.</h4>
		<h4>발급된 비밀번호는 임시적인 것이므로 로그인 후 꼭 비밀번호를 변경하십시오.</h4>

	<div style="text-align: center;">
		<button class="btn btn-info menu-btn" id="login">로그인</button>
	</div>	
</div>
</body>
</html>