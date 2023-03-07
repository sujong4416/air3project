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
.form-size{
	height: 3em;
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
<script type="text/javascript">

$(function(){
	
	$("#findPwForm").submit(function(){
		// 아이디
		if(!checkData(reg_id, $("#checkId"), reg_id_error_msg, 1 )) return false;
		
		// 한글이름
		if(!checkData(reg_name, $("#name"), reg_name_error_msg, 0 )) return false;
		
		// 생년월일
		if(!checkData(reg_birth, $("#birth"), reg_birth_error_msg, 0 )) return false;
		
		
		location="/member/viewPw.do";

	});
	
	$("#cancelBtn").click(function(){
		if(confirm("비밀번호 찾기를 취소하시겠습니까?")) history.back();
	});
	
});

</script>

</head>
<body>
<div class="container form">
	<div class="path">
	  <span>Home</span>
	  <span>비밀번호 찾기</span>
	</div>
	<h1>비밀번호 찾기</h1>

	<form action="/member/findPw.do" method="post" id="findPwForm">
		<div class="form-group">
				<label for="id">아이디</label>
				<input type="text" class="form-control form-size" id="id" name="id">
		</div>
	
		<div class="form-group">
				<label for="name">이름</label>
				<input type="text" class="form-control form-size" id="name" name="name">
		</div>
	
		<div class="form-group">
				<label for="birth">생년월일</label>
				<input type="text" placeholder="YYYY-MM-DD" class="form-control form-size" id="birth" name="birth">
		</div>

		<div style="text-align: center;">
			<button type="submit" class="btn btn-info menu-btn">확인</button>
			<button type="button" id="cancelBtn " class="btn btn-info menu-btn cancel-btn">취소</button>
		</div>
	</form>
	
</div>
</body>
</html>