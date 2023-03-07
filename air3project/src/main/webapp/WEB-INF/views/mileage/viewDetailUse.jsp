<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style type="text/css">
fieldset.scheduler-border {
	border: 1px solid #777 !important;
	padding: 1.4em 1.4em 1.4em 1.4em !important;
	margin: 0 0 1.5em 0 !important;
	-webkit-box-shadow: 0px 0px 0px 0px #000;
	box-shadow: 0px 0px 0px 0px #000;
	margin-top: 30px !important;
}
fieldset {
  border: 2px solid #333;
  border-radius: 10px;
  padding: 10px;
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
	color: black;
}

.text {
	font-size: 1.5rem;
	line-height: 1.56;
	border-bottom: 1px solid #d9dbe1;
	font-weight: 600;
}

p {
	margin-bottom: 2rem;
}

.field+.field {
	margin-top: 4rem;
}

.field {
	width: 100%;
}

#chgPwBtn {
	margin: 0 10px;
}

.title {
	margin-bottom: 1rem;
	font-size: 1.2rem;
	display: block;
	color: gray;
}
.tab {
  border: 1px groove #ddd !important;
  width: 100%;
  height: 50px;
}

.tablinks {
  float: left;
  width: 100%;
  height: 100%;
  border: none;
  outline: none;
  font-size: 16px;
  font-weight: bold;
  color: #000;
  background-color: #fff;
}

.tablinks.active {
  color: #fff;
  background-color: #002b80;
}

input {
  width: 500px;
  height: 32px;
  font-size: 15px;
  border: 0;
  border-radius: 15px;
  outline: none;
  padding-left: 10px;
  background-color: none;
}

.form_radio_btn {
	display: inline-block;
	width: calc(25% - 6px);
	height : 45px;
 		border: 1px solid #EAE7E7;
 		border-radius: 10px;
}
.form_radio_btn input[type=radio] {
	display: none;
}
.form_radio_btn label {
	display: block;
  		border-radius: 10px;
 			margin: 0 auto;
  		text-align: center;
  		height: -webkit-fill-available;
  		line-height: 45px;
}
 
/* Checked */
.form_radio_btn input[type=radio]:checked + label {
	background: #184DA0;
	color: #fff;
}
 
/* Hover */
.form_radio_btn label:hover {
	color: #666;
}
 
/* Disabled */
.form_radio_btn input[type=radio] + label {
	background: #F9FAFC;
	color: #666;
}

.mileage-review__details {
    text-align: right;
    color: #00256c;
    word-break: break-word;
}

.result{
	margin:0;
}

.total-result{
	display: flex;
	justify-content: flex-end;
}

.date{
	width:39%;
}

.datePicker{
	margin: 20px 0 0 0;
}

/* .tabcontent{ */
/* 	display: none; */
/* } */

/* .tabcontent.active{ */
/* 	display: inherit; */
/* } */
.dropdown-submenu {
  position: relative;
}

.dropdown-submenu>.dropdown-menu {
  top: 0;
  left: 100%;
  margin-top: -6px;
  margin-left: -1px;
  -webkit-border-radius: 0 6px 6px 6px;
  -moz-border-radius: 0 6px 6px;
  border-radius: 0 6px 6px 6px;
}

.dropdown-submenu:hover>.dropdown-menu {
  display: block;
}

.dropdown-submenu>a:after {
  display: block;
  content: " ";
  float: right;
  width: 0;
  height: 0;
  border-color: transparent;
  border-style: solid;
  border-width: 5px 0 5px 5px;
  border-left-color: #ccc;
  margin-top: 5px;
  margin-right: -10px;
}

.dropdown-submenu:hover>a:after {
  border-left-color: #fff;
}

.dropdown-submenu.pull-left {
  float: none;
}

.dropdown-submenu.pull-left>.dropdown-menu {
  left: -100%;
  margin-left: 10px;
  -webkit-border-radius: 6px 0 6px 6px;
  -moz-border-radius: 6px 0 6px 6px;
  border-radius: 6px 0 6px 6px;
}
.path {
 margin-top:15px;

  display: flex;
  align-items: center;
  font-size: 14px;
  font-weight: bold;
  color: #333;
}
.path>span{
	height: 100%;
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

.dropdown {
  position: relative;
  display: inline-block;
}

.dropdownBtn {
  background: none;
  border: none;
  color: #333;
  font-size: 24px;
  cursor: pointer;
}

.dropdownMenu {
  position: absolute;
  top: 100%;
  left: 0;
  z-index: 1;
  display: none;
  padding: 10px;
  background-color: #fff;
  border: 1px solid #ccc;
}

.dropdown:hover .dropdownMenu {
  display: block;
}

.dropdownMenu a {
  display: block;
  padding: 5px 10px;
  color: #333;
  text-decoration: none;
  text-align:center;
  width: 10em;
}

.dropdownMenu a:hover {
  background-color: #f5f5f5;
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
  margin-left: 10px;
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
label:hover{
	cursor: pointer;
}
.date{
	border: 1px solid #888;
}
#saveBtn{
	background: white;
	border: none;
}


</style>

<script type="text/javascript">

$(function(){
	
	// 적립 상세조회 이벤트 
	if("${useCheck.checkPeriod }" == "") { // 1개월 선택시 그대로 1개월 checked
		$("#useRadio-1").attr("checked", "checked");
	}
	
	if("${useCheck.checkType }" == "") { // 전체 선택시 그대로 전체 checked
		$("#useRadio-11").attr("checked", "checked");
	}

	if("${useCheck.checkType }" == 1) { // 전체 선택시 그대로 전체 checked
		$("#useRadio-11").attr("checked", "checked");
	}
	
	if("${useCheck.checkType }" == 2) { // 이젠항공 선택시 그대로 이젠항공 checked
		$("#useRadio-12").attr("checked", "checked");
	}
	
	if("${useCheck.checkType }" == 3) { // 쇼핑몰 선택시 그대로 쇼핑몰 checked
		$("#useRadio-13").attr("checked", "checked");
	}
	
	if("${useCheck.checkPeriod }" == 12) { // 1년 선택시 그대로 1년 checked
		$("#useRadio-3").attr("checked", "checked");
	}
	
	if("${useCheck.checkPeriod }" == 6) { // 6개월 선택시 그대로 6개월 checked
		$("#useRadio-2").attr("checked", "checked");
	}
	
	if("${useCheck.checkPeriod }" == 1) { // 1개월 선택시 그대로 1개월 checked
		$("#useRadio-1").attr("checked", "checked");
	}
	
	if("${useCheck.checkPeriod }" == 99) { // 직접입력 선택시 그대로 직접입력 checked
		$("#useRadio-4").attr("checked", "checked");
		$("#datePicker").show();

	}
	
	if("${useCheck.startDate}" != "") $("#startDate").val('${useCheck.startDate}')
	
	if("${useCheck.endDate}" != "") $("#endDate").val('${useCheck.endDate}')
	
	$(".useRadio-1").click(function(){ // 조회기간 변경시 submit
		$("#checkUsePeriodType").submit();
	});
	
	$(".useRadio-11").click(function(){ // 조회유형 변경시 submit
		$("#checkUsePeriodType").submit();
	});
	
	$("#useRadio-4").click(function(){
		$("#datePicker").show();
	});
	
	$("#saveBtn").click(function(){
		location = "/mileage/viewDetail.do";
	});
	
});

</script>

</head>
<body>
<div class="container">
		<div class="path">
	  <span>Home</span>
	  <span>마이 페이지</span>
	  <span>마일리지</span>
	  <span>마일리지 적립신청
		<div class="dropdown multi-level">
			<button class="dropdownBtn"><i class="fa fa-chevron-down"></i></button>
			<div class="dropdownMenu">
				<a href="/mileage/view.do">마일리지 현황</a>
				<a href="/mileage/info.do">마일리지 적립신청</a>
				<div class="dropdown-submenu">
					<a href="/mileage/viewDetail.do">마일리지 상세조회</a>
					<div class="dropdown-menu">
						<a href="/mileage/viewDetailUse.do">사용 마일리지</a>
						<a href="/mileage/viewDetail.do">적립 마일리지</a>
					</div>
				</div>
			</div>
		</div>
	  
	  </span>
	</div>

	<h1>마일리지 상세조회 (사용)</h1>
			<h3>기간과 유형을 선택하여 사용한 마일리지를 확인할 수 있습니다.</h3>
		
		<div class="saveBtn" style="text-align: right;">
			<button id="saveBtn" style="color: #b30000;">적립 마일리지 <i class="fa fa-chevron-right"></i></button>
		</div>
	
		<div class="tab">
			<button class="tablinks active" id="openTab2">사용</button>
		</div>
<!-- <form action="/mileage/saveDetail.do" id="saveDetail" method="post"> -->
		<div id="tab1" class="tabcontent" style="display: block;">
			<fieldset class="scheduler-border">
				<!-- 		<legend class="scheduler-border">기본정보</legend> -->
				<form id="checkUsePeriodType" method="post">
				<div class="row">
				<input type="hidden" name="saveOrUse" value="2">
					<div class="col-md-6">
						<label for="userSex" class="form-label">조회 기간</label>
						<div class="form_toggle row-vh d-flex flex-row justify-content-between" >
							<div class="form_radio_btn radio_male">
								<input class="useRadio-1" id="useRadio-1" type="radio" name="radios1" value="1">
								<label for="useRadio-1">1개월</label>
							</div>
														 
							<div class="form_radio_btn">
								<input class="useRadio-1" id="useRadio-2" type="radio" name="radios1" value="6">
								<label for="useRadio-2">6개월</label>
							</div>

							<div class="form_radio_btn">
								<input class="useRadio-1" id="useRadio-3" type="radio" name="radios1" value="12">
								<label for="useRadio-3">1년</label>
							</div>

							<div class="form_radio_btn">
								<input id="useRadio-4" type="radio" name="radios1" value="99">
								<label for="useRadio-4">직접입력</label>
							</div>
						</div>
						<div class="datePicker" id="datePicker" style="display: none;">
							<input type="date" class="date" name="startDate" id="startDate">
							<input type="date" class="date" name="endDate" id="endDate">
							<button class="btn btn-default">조회</button>
						</div>
					</div>				
<!-- 				</form> -->
<!-- 				<form id="checkType"> -->
					<div class="col-md-6">
						<label for="userSex" class="form-label">조회 유형</label>
						<div class="form_toggle row-vh d-flex flex-row justify-content-between" >
							<div class="form_radio_btn radio_male">
								<input class="useRadio-11" id="useRadio-11" type="radio" name="radios2" value="1">
								<label for="useRadio-11">전체</label>
							</div>
														 
							<div class="form_radio_btn">
								<input class="useRadio-11" id="useRadio-12" type="radio" name="radios2" value="2">
								<label for="useRadio-12">이젠항공</label>
							</div>

							<div class="form_radio_btn">
								<input class="useRadio-11" id="useRadio-13" type="radio" name="radios2" value="3">
								<label for="useRadio-13">쇼핑몰</label>
							</div>

						</div>
					</div>
				</div>
				</form>				
			</fieldset>

			<fieldset class="scheduler-border">
				<!-- 		<legend class="scheduler-border">여권정보</legend> -->
				<div class="row">
					<div class="col-md-6">
						<h2>조회 결과</h2>
					</div>
					
					<div class="col-md-6 total-result">
						<div class="col-md-6 mileage-review__details">
							<span>총 건수</span>
							<p class="result">
							${fn:length(use) } 건
							</p>
						</div>
	
						<div class="col-md-6 mileage-review__details">
							<span>사용 마일리지</span>
							<p class="result">
							<c:set var="total" value="0"></c:set>
							<c:forEach items="${use }" var="vo">
								<c:set var="total" value="${total+vo.umoney }"></c:set>
							</c:forEach>${total } 마일
							</p>
						</div>
					</div>
				</div>
			</fieldset>
			
			<table class="table">
				<thead>
					<tr>
						<td>구분</td>
						<td>날짜</td>
						<td>마일리지</td>
					</tr>
				</thead>
				<c:if test="${use == null }">
				<tbody>
					<tr>
						<td colspan="3" style="text-align: center;">조회결과가 없습니다.</td>
					</tr>
				</tbody>
				</c:if>
				<tbody>
					<c:forEach items="${use }" var="vo">
						<tr>
							<td>${vo.smemo }</td>
							<td>${vo.regdt }</td>
							<td>${vo.umoney }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
		</div>
<!-- </form> -->

	</div>
</body>
</html>