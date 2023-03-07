<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<meta http-equiv="refresh" content="10; url=/">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style type="text/css">
h1 {
  color: #004080; /* 글자색 */
  font-size: 32px; /* 폰트 크기 */
  font-weight: bold; /* 굵게 */
  text-align: center; /* 가운데 정렬 */
  margin-top: 50px; /* 위쪽 여백 */
}
h3 {
  color: #555; /* 글자색 */
  font-size: 15px; /* 폰트 크기 */
  font-weight: bold; /* 굵게 */
  text-align: center; /* 가운데 정렬 */
}
h4 {
  color: #888; /* 글자색 */
  font-size: 12px; /* 폰트 크기 */
  text-align: center; /* 가운데 정렬 */
}
h2 {
  color: black; /* 글자색 */
  font-size: 15px; /* 폰트 크기 */
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

.path > span:not(:last-child)::after {
  content: "";
  display: inline-block;
  margin: 0 10px;
  width: 5px;
  height: 5px;
  border-radius: 50%;
  background-color: #ccc;
}

.path > span:last-child {
  color: #666;
}

.main-btn{
	  background-color: #004080; /* 버튼 배경색 */
  color: white; /* 버튼 글자색 */
  border: none; /* 버튼 테두리 없음 */
  padding: 12px 24px; /* 버튼 패딩 */
  text-align: center; /* 버튼 텍스트 가운데 정렬 */
  text-decoration: none; /* 버튼 텍스트에 밑줄 없음 */
  display: inline-block; /* 버튼을 inline 요소로 변경 */
  font-size: 16px; /* 버튼 글자 크기 */
  cursor: pointer; /* 커서 모양 변경 */
  border-radius: 4px; /* 버튼 모서리 둥글게 */
  flex-basis: calc((100% - 10px) / 2); /* 요소들의 너비를 계산하여 설정 */
  max-width: calc((100% - 10px) / 2); /* 요소들의 최대 너비를 계산하여 설정 */
  box-sizing: border-box; /* padding과 border를 포함한 크기로 지정 */
  transition: background-color 0.3s; /* 배경색 변경 시 부드럽게 */
  text-decoration: none;
}
.main-btn:hover {
  background-color: lightblue; /* 호버시 버튼 배경색 */
  color: black;
    text-decoration: none;
  
}

</style>



</head>
<body>
<div class="container">
	<div class="path">
	  <span>Home</span>
	  <span>마이 페이지</span>
	  <span>회원탈퇴 완료</span>
	</div>
	<div style="text-align: center;">
		<i class='fa fa-check-circle-o' style='font-size:80px;color:red'></i>
	</div>
	<h1>회원탈퇴가 완료되었습니다.</h1>
	<h3>그동안 이젠항공서비스를 이용해 주셔서 감사합니다.</h3>
	<h4>보다 나은 서비스로 다시 찾아 뵙겠습니다.</h4>
	
	<h2>
		<span id="timer">10</span>초 후 메인으로 이동됩니다.
	</h2>
	<div style="text-align: center;">
		<a href="/" class="main-btn">메인으로 이동</a>
	</div>
	
</div>
<script type="text/javascript">

$(function() {
	  let cnt = 10;
	  let Timer = setInterval(function() {
	    
		cnt--;
	    $("#timer").text(cnt);
	    
	    if (cnt < 0) {
	      clearInterval(Timer);
	    }
	    
	  }, 1000);

});

</script>



</body>
</html>

