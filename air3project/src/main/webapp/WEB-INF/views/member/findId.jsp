<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
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

.email1, .email2, .email3{
	width:40%;
	
}

.email{
	padding : 4px;
	display: table-cell;
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
	
	$("#findIdForm").submit(function(){
		// 한글이름
		if(!checkData(reg_name, $("#name"), reg_name_error_msg, 0 )) return false;
		
		// 이메일
		if(!checkData(reg_email1, $("#email1"), reg_email1_error_msg, 0 )) return false;
		if(!checkData(reg_email2, $("#email2"), reg_email2_error_msg, 0 )) return false;
		
		
		// 생년월일
		if(!checkData(reg_birth, $("#birth"), reg_birth_error_msg, 0 )) return false;
		
		location="/member/viewId.do";
		
	});
	
	// 이메일 도메인 선택 - 입력
	$("#select").change(function(){
		$("#email2").val($("#select").val());
		
		if($("#select").val()==""){
			$("#email2").focus();
		}
		
	});
	
	
	$("#cancelBtn").click(function(){
		if(confirm("아이디 찾기를 취소하시겠습니까?")) history.back();
	});
	
});

</script>

</head>
<body>
<div class="container form">
	<div class="path">
	  <span>Home</span>
	  <span>아이디 찾기</span>
	</div>
	<h1>아이디 찾기</h1>

	<form action="/member/findId.do" method="post" id="findIdForm">
		<div class="form-group">
				<label for="name">이름</label>
				<input type="text" class="form-control form-size" id="name" name="name">
		</div>
	
		<div class="form-group">
				<label for="email">이메일 주소</label>
				<div class="email1 email">
					<span class="box">
						<input class="form-control form-size" placeholder="영문+숫자+[-_.]" name="email" id="email1">
					</span>
				</div>
				<div class="email">@</div>
				<div class="email2 email">
					<span class="box">
						<input class="form-control form-size" id="email2" name="email2">
					</span>
				</div>
				<div class="email3 email">
					<span class="box">
						<select aria-label="이메일" id="select" name="form-size" class="form-control">
						<option value="">직접입력</option>
						<option>hanmail.net</option>
						<option>naver.com</option>
						<option>nate.com</option>
						<option>gmail.com</option>
						</select>
					</span>
				</div>
				
			</div>
	
<!-- 		<div class="form-group"> -->
<!-- 				<label for="email">이메일</label> -->
<!-- 				<input type="text" class="form-control form-size" id="eamil" name="email"> -->
<!-- 		</div> -->
	
		<div class="form-group">
				<label for="birth">생년월일</label>
				<input type="text" placeholder="YYYY-MM-DD" class="form-control form-size" id="birth" name="birth">
		</div>
		
		<div style="text-align: center;">
			<button type="submit" class="btn btn-info menu-btn">확인</button>
			<button type="button" id="cancelBtn" class="btn btn-info menu-btn cancel-btn">취소</button>
		</div>
	</form>
	
</div>
</body>
</html>