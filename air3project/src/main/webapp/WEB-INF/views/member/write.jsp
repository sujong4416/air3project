<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="~/Content/bootstrap-select/bootstrap-select.min.css" rel="stylesheet" type="text/css"  />
<script src="/Content/bootstrap-select/bootstrap-select.min.js" ></script>

<style type="text/css">

fieldset.scheduler-border {
  border: 1px groove #ddd !important;
  padding: 0 1.4em 1.4em 1.4em !important;
  margin: 0 0 1.5em 0 !important;
  -webkit-box-shadow: 0px 0px 0px 0px #000;
  box-shadow: 0px 0px 0px 0px #000;
}
.fieldset.scheduler-border-top{

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
h3 {
  color: #333; /* 글자색 */
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

.form{
	max-width: 850px;
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

.question-mark:hover .tooltiptext {
  visibility: visible;
  opacity: 1;
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


<script type="text/javascript" src="/js/regEx.js"></script>
<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>

<script type="text/javascript">

$(function(){
	
	if('${msg }' != '') alert('${msg}');
	
	// 취소버튼 이벤트
	$("#cancelBtn").click(function(){
		if(confirm("회원가입을 취소하시겠습니까?")) history.back();
	});
	
	// 아이디 툴팁
	if($("#id").val()=="") {
		$('[data-toggle="popover"]').popover(); 
	}
	
	// 가입버튼 이벤트
	$("#writeForm").submit(function(){
		
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
		
		// 비밀번호
		if(!checkData(reg_pw, $("#pw"), reg_pw_error_msg, 0 )) {
			$("#pw").val("");
			return false;
		}
		
		// 비밀번호 확인
		if(!checkData(reg_pw, $("#pw2"), reg_pw_error_msg, 0 )) {
			$("#pw2").val("");
			return false;
		}
		
		// 비밀번호와 비밀번호 확인 같은지 체크
		if($("#pw").val() != $("#pw2").val()){
			alert("비밀번호가 일치하지 않습니다.");
			$("#pw, #pw2").val("");
			$("#pw").focus();
			return false;
		}
		
		// 생년월일
		if(!checkData(reg_birth, $("#birth"), reg_birth_error_msg, 0 )) return false;
		
		// 이메일
		if(!checkData(reg_email1, $("#email1"), reg_email1_error_msg, 0 )) return false;
		if(!checkData(reg_email2, $("#email2"), reg_email2_error_msg, 0 )) return false;
		
		// 휴대전화 번호
		if(!checkData(reg_tel, $("#tel"), reg_tel_error_msg, 0 )) return false;
		
		if($("#p_no").val()=="") {
			alert('여권번호를 입력해 주세요.');
			$("#p_no").focus();
			return false;
		}
		
		if($("#p_date").val()==""){
			alert('여권 만료일을 입력해 주세요.');
			$("#p_date").focus();
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
	
	// 아이디 중복체크
	$("#searchId").click(function(){
		window.open("/member/searchId.do", "idCheck", "width=600, height=400, top=200, left=500");
	});
	
	  $('[data-toggle="tooltip"]').tooltip();   


	
});

</script>

</head>
<body>
<div class="container form">
	<div class="path">
	  <span>Home</span>
	  <span>회원가입</span>
	  <span>정보입력</span>
	</div>
	<h1>회원가입</h1>
	<h3>회원이 되어 다양한 서비스를 이용해 보세요!</h3>
	<div style="text-align: right;"><label><em> * </em> 필수입력사항</label></div>
	
	<form action="/member/write.do" method="post" id="writeForm">
	<fieldset class="scheduler-border">	
		<legend class="scheduler-border legendFont">기본정보</legend>


		<div class="form-row">
			<div class="form-group col-md-6 inline-left">
				<label for="name">한글 이름<em> * </em></label>
				<input class="form-control" id="name" name="name" placeholder="한글 2자 ~ 5자" autofocus="autofocus">
			</div>
			
			<div class="form-group col-md-6 inline-right">
				<label for="e_name">영문 이름<a href="#" data-toggle="tooltip" data-placement="bottom" title="여권의 영문 이름과 동일하게 입력해 주세요."><i class='far fa-question-circle question'></i></a><em> * </em></label>
				<input class="form-control" id="e_name" placeholder="영문 4자 ~ 30자" name="e_name">
			</div>
		</div>
			<div class="form-group">
				<label for="id">아이디<em> * </em></label>
				<div class="input-group">
					<input class="form-control" id="id" name="id" readonly
							data-toggle="popover" data-trigger="hover" 
							data-placement="bottom" data-content="아이디 중복체크를 해주세요.">
					<div class="input-group-btn">
				    	<button class="btn btn-default" type="button" id="searchId">아이디 중복체크</button>
		    		</div>
				</div>
			</div>
		
		<div class="form-row">
			<div class="form-group col-md-6 inline-left">
				<label for="pw">비밀번호<em> * </em></label>
				<input class="form-control" id="pw" name="pw" placeholder="영문+숫자+특수문자(!@#$%^&*) 조합 8자 ~ 20자" type="password">
			</div>
			
			<div class="form-group col-md-6 inline-right">
				<label for="pw2">비밀번호 확인<em> * </em></label>
				<input class="form-control" id="pw2" placeholder="영문+숫자+특수문자(!@#$%^&*) 조합 8자 ~ 20자" type="password">
			</div>
		</div>
			
			<div class="form-group">
				<label for="birth">생년월일<em> * </em></label>
				<div class="birth">
					<span class="box">
						<input class="form-control" placeholder="YYYY-MM-DD" id="birth" name="birth" >
					</span>
				</div>
			</div>
			
			<div class="form-group">
				<label for="gender">성별<em> * </em></label>
				<div>
					<input name="gender" type="radio" value="남자" checked="checked"
					style="width:50px"> 남자
					<input name="gender" type="radio" value="여자"
					style="width:50px"> 여자
				</div>
			</div>
			
			<div class="form-group">
				<label for="email">이메일 주소<em> * </em></label>
				<div class="email1 email">
					<span class="box">
						<input class="form-control" placeholder="영문+숫자+[-_.]" name="email" id="email1">
					</span>
				</div>
				<div class="email">@</div>
				<div class="email2 email">
					<span class="box">
						<input class="form-control" id="email2" name="email2" >
					</span>
				</div>
				<div class="email3 email">
					<span class="box">
						<select aria-label="이메일" id="select" class="form-control">
						<option value="">직접입력</option>
						<option>hanmail.net</option>
						<option>naver.com</option>
						<option>nate.com</option>
						<option>gmail.com</option>
						</select>
					</span>
				</div>
				
			</div>
			
			<div class="form-group">
				<label for="tel">휴대전화 번호<em> * </em></label>
				<input class="form-control" id="tel" placeholder="000-0000-0000" name="tel">
			</div>
				
			<div class="form-group">
				<label for="country">거주국가<em> * </em></label>
				<select aria-label="거주국가" id="country" name="country" class="form-control">
				<option value="대한민국">대한민국</option>
				<option value="일본">일본</option>
				<option value="중국">중국</option>
				</select>
			</div>
	</fieldset>
	
	<fieldset class="scheduler-border scheduler-border-top">	
		<legend class="scheduler-border legendFont">여권정보</legend>
			<!-- 여권 정보 -->
			<div class="form-group">
				<label for="p_nationality">국적<em> * </em></label>
				<select aria-label="국적" id="p_nationality" name="p_nationality" class="form-control">
				<option value="대한민국">대한민국</option>
				<option value="일본">일본</option>
				<option value="중국">중국</option>
				</select>
			</div>
			
			<div class="form-group">
				<label for="p_country">발급 국가<em> * </em></label>
				<select aria-label="발급국가" id="p_country" name="p_country" class="form-control">
				<option value="대한민국">대한민국</option>
				<option value="일본">일본</option>
				<option value="중국">중국</option>
				</select>
			</div>
			
			<div class="form-group">
				<label for="p_no">여권번호<em> * </em></label>
				<input class="form-control" id="p_no" name="p_no">
			</div>
				
			<div class="form-group">
				<label for="p_date">여권만료일<em> * </em></label>
				<input class="form-control" id="p_date" placeholder="YYYY-MM-DD" name="p_date">
			</div>
	</fieldset>
	
		<button class="btn btn-default menu-btn">가입</button>
		<button type="button" class="btn btn-default menu-btn" id="cancelBtn">취소</button>
		<button type="reset" class="btn btn-default menu-btn pull-right">새로입력</button>
	
	</form>
	<script type="text/javascript">
	
	
	</script>
</div>
</body>
</html>

<%
	session.removeAttribute("msg");
%>
