<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
h3 {
  color: #666; /* 글자색 */
  font-size: 13px; /* 폰트 크기 */
  font-weight: bold; /* 굵게 */
  text-align: center; /* 가운데 정렬 */
  margin: 13px 0;
}
h1 {
  color: #004080; /* 글자색 */
  font-size: 32px; /* 폰트 크기 */
  font-weight: bold; /* 굵게 */
  text-align: center; /* 가운데 정렬 */
  margin-top: 50px; /* 위쪽 여백 */
  margin-bottom: 20px;
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


<script type="text/javascript">

$(function(){
	$("#cancelBtn").click(function(){
		if(confirm("회원탈퇴를 취소하시겠습니까?")) history.back();
	});
	
	$("#deleteBtn").click(function(){
		if(confirm("정말로 회원탈퇴를 하시겠습니까?"))
			$("#deleteForm").submit();
	});
});

</script>

</head>
<body>
<div class="container form">
	<div class="path">
	  <span>Home</span>
	  <span>마이 페이지</span>
	  <span>회원탈퇴</span>
	</div>
	<h1>회원탈퇴 비밀번호 확인</h1>
	<h3>회원 탈퇴를 원하시면 비밀번호를 입력하신 후 회원탈퇴 버튼을 클릭해 주세요.</h3>
	<h3>탈퇴 후에는 동일 아이디로 다시 가입할 수 없으며 회원정보는 삭제됩니다.</h3>
	<form action="/member/delete.do" method="post" id="deleteForm">
	
	<div class="form-group">
		<label for="id">아이디</label>
		<input class="form-control form-size" id="id" name="id" value="${login.id }" readonly>
	</div>
	
	<div class="form-group">
		<label for="pw">비밀번호</label>
		<input class="form-control form-size" id="pw" name="pw" type="password">
	</div>
	
	<div style="text-align: center;">
		<button type="button" class="btn btn-default menu-btn" id="deleteBtn">회원탈퇴</button>
		<button type="button" class="btn btn-default menu-btn cancel-btn" id="cancelBtn">취소</button>
	</div>
	</form>
	
</div>
</body>
</html>