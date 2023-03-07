<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="~/Content/bootstrap-select/bootstrap-select.min.css" rel="stylesheet" type="text/css"  />
<script src="/Content/bootstrap-select/bootstrap-select.min.js" ></script>

<style type="text/css">

fieldset.scheduler-border {
  border: 1px solid #777 !important;
  padding: 0 1.4em 1.4em 1.4em !important;
  margin: 0 0 1.5em 0 !important;
  -webkit-box-shadow: 0px 0px 0px 0px #000;
  box-shadow: 0px 0px 0px 0px #000;
}
fieldset.scheduler-border-top{
	  margin-top: 30px !important;
}
legend.scheduler-border {
  font-size: 1.2em !important;
  font-weight: bold !important;
  text-align: left !important;
  width: auto;
  padding: 0 10px;
  border-bottom: none;
  margin-top: -15px;
  background-color: white;
  color: #004080;
}


.email1, .email2, .email3{
	width:40%;
}

.email{
	padding : 4px;
	display: table-cell;
}

.inline-left{
	padding-left: 0px; 
	padding-right: 5px; 
}

.inline-right{
	padding-right: 0px; 
	padding-left: 5px; 
}

.fs{
	border: 1px solid #36a6cb;
}

.popover-title {
    display:none;
  }
h1 {
  color: #004080; /* 글자색 */
  font-size: 32px; /* 폰트 크기 */
  font-weight: bold; /* 굵게 */
  text-align: center; /* 가운데 정렬 */
  margin-top: 50px; /* 위쪽 여백 */
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
.question-mark:hover .tooltiptext {
  visibility: visible;
  opacity: 1;
}

form label em {
	font-size : 15px;
	color: red;
	font-weight: 800;
}
label em {
	font-size : 15px;
	color: red;
	font-weight: 800;
}

.question-mark {
  position: relative;
  display: inline-block;
  cursor: help;
}

.tooltiptext {
  visibility: hidden;
  width: 120px;
  background-color: #555;
  color: #fff;
  text-align: center;
  border-radius: 6px;
  padding: 5px 0;
  position: absolute;
  z-index: 1;
  bottom: 150%;
  left: 50%;
  margin-left: -60px;
  opacity: 0;
  transition: opacity 0.3s;
}
.pwForm{
	max-width: 200px;
}
h3 {
  color: #333; /* 글자색 */
  font-size: 15px; /* 폰트 크기 */
  margin-left: 10px;
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

.cancel-btn{
	  background-color: white; /* 버튼 배경색 */
	  color: black; /* 버튼 글자색 */
	  border: 1px solid black;
	
}

fieldset {
  border: 2px solid #333;
  border-radius: 10px;
  padding: 10px;
}



</style>


<script type="text/javascript" src="/js/regEx.js"></script>

<script type="text/javascript">

$(function(){
	
	$("#updateBtn").click(function(){
		if(confirm("정보수정을 진행하시겠습니까?")) $("#updateForm").submit();
	});	
	
	// 취소버튼 이벤트
	$("#cancelBtn").click(function(){
		if(confirm("정보수정을 취소하시겠습니까?")) history.back();
	});
	
	// 가입버튼 이벤트
	$("#updateForm").submit(function(){
		
		// 한글이름
		if(!checkData(reg_name, $("#name"), reg_name_error_msg, 0 )) return false;

		// 영문이름
		if(!checkData(reg_ename, $("#e_name"), reg_ename_error_msg, 0 )) return false;

		// 아이디 중복체크
		if(!$("#id").val()) {
			alert("아이디를 입력해주세요.");
			$("#id").focus();
			return false;
		}
		
		// 생년월일
		if(!checkData(reg_birth, $("#birth"), reg_birth_error_msg, 0 )) return false;
		
		// 이메일
		if(!checkData(reg_email1, $("#email1"), reg_email1_error_msg, 0 )) return false;
		if(!checkData(reg_email2, $("#email2"), reg_email2_error_msg, 0 )) return false;
		
		// 휴대전화 번호
		if(!checkData(reg_tel, $("#tel"), reg_tel_error_msg, 0 )) return false;
		
		if($("#pw").val() == ""){
			alert("확인용 비밀번호를 입력해 주세요.");
			$("#pw").focus();
			return false;
		}

	});
	
	// 이메일 도메인 선택 - 입력
	$("#select").change(function(){
		$("#email2").val($("#select").val());
		
		if($("#select").val()==""){
			$("#email2").focus();
		}
		
	});
	
	// 영문이름 대문자로 변경
	$('#e_name').bind("keyup", function(){
	     $(this).val($(this).val().toUpperCase());
	});
	
});

</script>

</head>
<body>
<div class="container form">
	<div class="path">
	  <span>Home</span>
	  <span>마이 페이지</span>
	  <span>회원정보수정</span>
	</div>
	<h1>정보수정</h1>
	<h3>정보를 변경한 뒤 비밀번호를 입력하여 수정을 진행해 주세요.</h3>
	
	<div style="text-align: right;"><label><em> * </em> 필수입력사항</label></div>
	<form action="/member/update.do" method="post" id="updateForm">
	<fieldset class="scheduler-border">	
		<legend class="scheduler-border legendFont">기본정보</legend>
		
		<div class="form-row">
			<div class="form-group col-md-6 inline-left">
				<label for="name">한글 이름<em> * </em></label>
				<input class="form-control form-size" id="name" name="name" readonly value="${update.name }">
			</div>
			
			<div class="form-group col-md-6 inline-right">
				<label for="e_name">영문 이름<a href="#" data-toggle="tooltip" data-placement="bottom" title="여권의 영문 이름과 동일하게 입력해 주세요."><i class='far fa-question-circle question'></i></a><em> * </em></label>
				<input class="form-control form-size" id="e_name" name="e_name" readonly value="${update.e_name }">
			</div>
		</div>
			<div class="form-group">
				<label for="id">아이디<em> * </em></label>
				<input class="form-control form-size" id="id" name="id" readonly value="${update.id }">
			</div>
			
			<div class="form-group">
				<label for="birth">생년월일 (YYYY-MM-DD)<em> * </em></label>
				<div class="birth">
					<span class="box">
						<input class="form-control form-size" id="birth" name="birth" value="${update.birth }" >
					</span>
				</div>
			</div>
			
			<div class="form-group">
				<label for="gender">성별<em> * </em></label>
				<div>
					<c:if test="${update.gender == '남자' }">
						<input name="gender" type="radio" value="남자" checked="checked"
						style="width:50px"> 남자
						<input name="gender" type="radio" value="여자"
						style="width:50px"> 여자
					</c:if>
					<c:if test="${update.gender == '여자' }">
						<input name="gender" type="radio" value="남자" 
						style="width:50px"> 남자
						<input name="gender" type="radio" value="여자" checked="checked"
						style="width:50px"> 여자
					</c:if>
				</div>
			</div>
			
			<div class="form-group">
				<label for="email">이메일 주소<em> * </em></label>
				<div class="email1 email">
					<span class="box">
						<input class="form-control form-size" name="email" id="email1" value="${update.email1 }">
					</span>
				</div>
				<div class="email">@</div>
				<div class="email2 email">
					<span class="box">
						<input class="form-control form-size" id="email2" value="${update.email2 }">
					</span>
				</div>
				<div class="email3 email">
					<span class="box">
						<select aria-label="이메일" id="select" name="email2" class="form-control">
						<c:choose>
							<c:when test="${update.email2 == 'hanmail.net' }">
								<option value="">직접입력</option>
								<option selected>hanmail.net</option>
								<option>naver.com</option>
								<option>nate.com</option>
								<option>gmail.com</option>
							</c:when>
							<c:when test="${update.email2 == 'naver.com' }">
								<option value="">직접입력</option>
								<option>hanmail.net</option>
								<option selected>naver.com</option>
								<option>nate.com</option>
								<option>gmail.com</option>
							</c:when>
							<c:when test="${update.email2 == 'nate.com' }">
								<option value="">직접입력</option>
								<option>hanmail.net</option>
								<option>naver.com</option>
								<option selected>nate.com</option>
								<option>gmail.com</option>
							</c:when>
							<c:when test="${update.email2 == 'gmail.com' }">
								<option value="">직접입력</option>
								<option>hanmail.net</option>
								<option>naver.com</option>
								<option>nate.com</option>
								<option selected>gmail.com</option>
							</c:when>
						</c:choose>
						</select>
					</span>
				</div>
				
			</div>
			
			<div class="form-group">
				<label for="tel">휴대전화 번호<em> * </em></label>
				<input class="form-control form-size" id="tel" name="tel" value="${update.tel }">
			</div>
				
			<div class="form-group">
				<label for="country">거주국가<em> * </em></label>
				<select aria-label="거주국가" id="country" name="country" class="form-control form-size">
				
				<c:choose>
				<c:when test="${update.country == '대한민국' }">
					<option value="대한민국" selected>대한민국</option>
					<option value="일본">일본</option>
					<option value="중국">중국</option>
				</c:when>
				<c:when test="${update.country == '일본' }">
					<option value="대한민국">대한민국</option>
					<option value="일본" selected>일본</option>
					<option value="중국">중국</option>
				</c:when>
				<c:when test="${update.country == '중국' }">
					<option value="대한민국">대한민국</option>
					<option value="일본">일본</option>
					<option value="중국" selected>중국</option>
				</c:when>
				</c:choose>
				
				</select>
			</div>
	</fieldset>
	
	<fieldset class="scheduler-border scheduler-border-top">	
		<legend class="scheduler-border legendFont">여권정보</legend>
			<!-- 여권 정보 -->
			<div class="form-group">
				<label for="p_nationality">국적<em> * </em></label>
				<select aria-label="국적" id="p_nationality" name="p_nationality" class="form-control form-size">
				
				<c:choose>
				<c:when test="${update.p_nationality == '대한민국' }">
					<option value="대한민국" selected>대한민국</option>
					<option value="일본">일본</option>
					<option value="중국">중국</option>
				</c:when>
				<c:when test="${update.p_nationality == '일본' }">
					<option value="대한민국">대한민국</option>
					<option value="일본" selected>일본</option>
					<option value="중국">중국</option>
				</c:when>
				<c:when test="${update.p_nationality == '중국' }">
					<option value="대한민국">대한민국</option>
					<option value="일본">일본</option>
					<option value="중국" selected>중국</option>
				</c:when>
				</c:choose>
				
				</select>
				
			</div>
			
			<div class="form-group">
			
				<label for="p_country">발급 국가<em> * </em></label>
				<select aria-label="발급국가" id="p_country" name="p_country" class="form-control form-size">
				
				<c:choose>
				<c:when test="${update.p_country == '대한민국' }">
					<option value="대한민국" selected>대한민국</option>
					<option value="일본">일본</option>
					<option value="중국">중국</option>
				</c:when>
				<c:when test="${update.p_country == '일본' }">
					<option value="대한민국">대한민국</option>
					<option value="일본" selected>일본</option>
					<option value="중국">중국</option>
				</c:when>
				<c:when test="${update.p_country == '중국' }">
					<option value="대한민국">대한민국</option>
					<option value="일본">일본</option>
					<option value="중국" selected>중국</option>
				</c:when>
				</c:choose>
				
				</select>
			</div>
			
			<div class="form-group">
				<label for="p_no">여권번호<em> * </em></label>
				<input class="form-control form-size" id="p_no" name="p_no" value="${update.p_no }">
			</div>
				
			<div class="form-group">
				<label for="p_date">여권만료일 (YYYY-MM-DD)<em> * </em></label>
				<input class="form-control form-size" id="p_date" name="p_date" value="${update.p_date }">
			</div>
	</fieldset>
	
	<div class="form-group">
		<label for="pw">비밀번호 확인</label>
		<input class="form-control form-size pwForm" id="pw" name="pw" type="password">
	</div>
	
		<button type="button" id="updateBtn" class="btn btn-default menu-btn">수정완료</button>
		<button type="button" class="btn btn-default menu-btn cancel-btn" id="cancelBtn">취소</button>
		<button type="reset" class="btn btn-default menu-btn pull-right">새로입력</button>
	
	</form>
	
</div>
</body>
</html>