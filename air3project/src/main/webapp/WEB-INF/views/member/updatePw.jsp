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
  color: #666; /* 글자색 */
  font-size: 15px; /* 폰트 크기 */
  font-weight: bold; /* 굵게 */
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
.form-size{
	height: 3em;
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
.cancel-btn{
	  background-color: white; /* 버튼 배경색 */
	  color: black; /* 버튼 글자색 */
	  border: 1px solid black;
	
}

</style>
<script type="text/javascript" src="/js/regEx.js"></script>
<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>

<script type="text/javascript">

$(function(){
	$("#updatePwForm").submit(function(){
		
		
		
	});
	
	$("#cancelBtn").click(function(){
		if(confirm("비밀번호 변경을 취소하시겠습니까?")) history.back();
	});
	
	$("#updatePwForm").submit(function(){
		
		// 비밀번호
		if(!checkData(reg_pw, $("#chgPw"), reg_pw_error_msg, 0 )) {
			$("#chgPw").val("");
			return false;
		}
		
		// 비밀번호 확인
		if(!checkData(reg_pw, $("#chgPw2"), reg_pw_error_msg, 0 )) {
			$("#chgPw2").val("");
			return false;
		}
		
		// 비밀번호와 비밀번호 확인 같은지 체크
		if($("#chgPw").val() != $("#chgPw2").val()){
			alert("비밀번호가 일치하지 않습니다.");
			$("#chgPw, #chgPw2").val("");
			$("#chgPw").focus();
			return false;
		}
		
	});
	
});

</script>
</head>
<body>
<div class="container form">
	<div class="path">
	  <span>Home</span>
	  <span>마이 페이지</span>
	  <span>비밀번호 변경</span>
	</div>

	<div style="text-align: center;">
		<i class='fas fa-lock' style='font-size:80px;color:#004080'></i>
	</div>
	<h1>비밀번호 변경</h1>
	<h3>회원님의 개인정보보호를 위해 정기적으로 비밀번호를 변경해 주세요.</h3>
	<form action="/member/updatePw.do" method="post" id="updatePwForm">
		<div class="form-group">
				<label for="pw">현재 비밀번호</label>
				<input type="password" class="form-control form-size" id="pw" name="pw">
		</div>
	
		<div class="form-group">
				<label for="chgPw">신규 비밀번호</label>
				<input type="password" class="form-control form-size" id="chgPw" name="chgPw">
		</div>
	
		<div class="form-group">
				<label for="chgPw">신규 비밀번호 확인</label>
				<input type="password" class="form-control form-size" id="chgPw2">
		</div>
		<div style="text-align: center;">
			<button type="submit" class="btn menu-btn btn-info">확인</button>
			<button type="button" id="cancelBtn" class="btn menu-btn btn-info cancel-btn">취소</button>
		</div>
	</form>
	

</div>
</body>
</html>