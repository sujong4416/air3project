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
  color: #004080; /* ????????? */
  font-size: 32px; /* ?????? ?????? */
  font-weight: bold; /* ?????? */
  text-align: center; /* ????????? ?????? */
  margin-top: 50px; /* ?????? ?????? */
}
h3 {
  color: #333; /* ????????? */
  font-size: 15px; /* ?????? ?????? */
  margin-left: 10px;
    text-align: center; /* ????????? ?????? */
  
}

.menu-btn {
  background-color: #004080; /* ?????? ????????? */
  color: white; /* ?????? ????????? */
  border: none; /* ?????? ????????? ?????? */
  padding: 12px 24px; /* ?????? ?????? */
  text-align: center; /* ?????? ????????? ????????? ?????? */
  text-decoration: none; /* ?????? ???????????? ?????? ?????? */
  display: inline-block; /* ????????? inline ????????? ?????? */
  font-size: 16px; /* ?????? ?????? ?????? */
  cursor: pointer; /* ?????? ?????? ?????? */
  border-radius: 4px; /* ?????? ????????? ????????? */
  flex-basis: calc((100% - 10px) / 2); /* ???????????? ????????? ???????????? ?????? */
  max-width: calc((100% - 10px) / 2); /* ???????????? ?????? ????????? ???????????? ?????? */
  box-sizing: border-box; /* padding??? border??? ????????? ????????? ?????? */
  transition: background-color 0.3s; /* ????????? ?????? ??? ???????????? */
  
  
}
fieldset {
  border: 2px solid #333;
  border-radius: 10px;
  padding: 10px;
}
.menu-btn:hover {
  background-color: lightblue; /* ????????? ?????? ????????? */
  color: black;
}
label:hover{
	cursor: pointer;
}
.date{
	border: 1px solid #888;
}
#useBtn{
	background: white;
	border: none;
}
/* .tabcontent{ */
/* 	display: none; */
/* } */

/* .tabcontent.active{ */
/* 	display: inherit; */
/* } */

</style>

<script type="text/javascript">

$(function(){
	
	// ?????? ???????????? ????????? 
	if("${saveCheck.checkPeriod }" == "") { // 1?????? ????????? ????????? 1?????? checked
		$("#saveRadio-1").attr("checked", "checked");
	}
	
	if("${saveCheck.checkType }" == "") { // ?????? ????????? ????????? ?????? checked
		$("#saveRadio-11").attr("checked", "checked");
	}

	if("${saveCheck.checkType }" == 1) { // ?????? ????????? ????????? ?????? checked
		$("#saveRadio-11").attr("checked", "checked");
	}
	
	if("${saveCheck.checkType }" == 2) { // ???????????? ????????? ????????? ???????????? checked
		$("#saveRadio-12").attr("checked", "checked");
	}
	
	if("${saveCheck.checkType }" == 3) { // ????????? ????????? ????????? ????????? checked
		$("#saveRadio-13").attr("checked", "checked");
	}
	
	if("${saveCheck.checkPeriod }" == 12) { // 1??? ????????? ????????? 1??? checked
		$("#saveRadio-3").attr("checked", "checked");
	}
	
	if("${saveCheck.checkPeriod }" == 6) { // 6?????? ????????? ????????? 6?????? checked
		$("#saveRadio-2").attr("checked", "checked");
	}
	
	if("${saveCheck.checkPeriod }" == 1) { // 1?????? ????????? ????????? 1?????? checked
		$("#saveRadio-1").attr("checked", "checked");
	}
	
	if("${saveCheck.checkPeriod }" == 99) { // ???????????? ????????? ????????? ???????????? checked
		$("#saveRadio-4").attr("checked", "checked");
		$("#datePicker").show();

	}
	
	if("${saveCheck.startDate}" != "") $("#startDate").val('${saveCheck.startDate}')
	
	if("${saveCheck.endDate}" != "") $("#endDate").val('${saveCheck.endDate}')
	
	$(".saveRadio-1").click(function(){ // ???????????? ????????? submit
		$("#checkSavePeriodType").submit();
	});
	
	$(".saveRadio-11").click(function(){ // ???????????? ????????? submit
		$("#checkSavePeriodType").submit();
	});
	
	$("#saveRadio-4").click(function(){
		$("#datePicker").show();
	});
	
	$("#useBtn").click(function(){
		location = "/mileage/viewDetailUse.do";
	});
	
});

</script>

</head>
<body>
<div class="container">
		<div class="path">
	  <span>Home</span>
	  <span>?????? ?????????</span>
	  <span>????????????</span>
	  <span>???????????? ????????????
		<div class="dropdown multi-level">
			<button class="dropdownBtn"><i class="fa fa-chevron-down"></i></button>
			<div class="dropdownMenu">
				<a href="/mileage/view.do">???????????? ??????</a>
				<a href="/mileage/info.do">???????????? ????????????</a>
				<div class="dropdown-submenu">
					<a href="/mileage/viewDetail.do">???????????? ????????????</a>
					<div class="dropdown-menu">
						<a href="/mileage/viewDetailUse.do">?????? ????????????</a>
						<a href="/mileage/viewDetail.do">?????? ????????????</a>
					</div>
				</div>
			</div>
		</div>
	  
	  </span>
	</div>

	<h1>???????????? ???????????? (??????)</h1>
	<h3>????????? ????????? ???????????? ????????? ??????????????? ????????? ??? ????????????.</h3>
		<div class="useBtn" style="text-align: right;">
			<button id="useBtn" style="color: #b30000;">?????? ???????????? <i class="fa fa-chevron-right"></i></button>
		</div>
	
		<div class="tab">
			<button class="tablinks active" id="openTab1">??????</button>
		</div>
<!-- <form action="/mileage/saveDetail.do" id="saveDetail" method="post"> -->
		<div id="tab1" class="tabcontent" style="display: block;">
			<fieldset class="scheduler-border">
				<!-- 		<legend class="scheduler-border">????????????</legend> -->
				<form id="checkSavePeriodType" method="post">
				<div class="row">
				<input type="hidden" name="saveOrUse" value="1">
					<div class="col-md-6">
						<label for="userSex" class="form-label">?????? ??????</label>
						<div class="form_toggle row-vh d-flex flex-row justify-content-between" >
							<div class="form_radio_btn radio_male">
								<input class="saveRadio-1" id="saveRadio-1" type="radio" name="radios1" value="1">
								<label for="saveRadio-1">1??????</label>
							</div>
														 
							<div class="form_radio_btn">
								<input class="saveRadio-1" id="saveRadio-2" type="radio" name="radios1" value="6">
								<label for="saveRadio-2">6??????</label>
							</div>

							<div class="form_radio_btn">
								<input class="saveRadio-1" id="saveRadio-3" type="radio" name="radios1" value="12">
								<label for="saveRadio-3">1???</label>
							</div>

							<div class="form_radio_btn">
								<input id="saveRadio-4" type="radio" name="radios1" value="99">
								<label for="saveRadio-4">????????????</label>
							</div>
						</div>
						<div class="datePicker" id="datePicker" style="display: none;">
							<input type="date" class="date" name="startDate" id="startDate">
							<input type="date" class="date" name="endDate" id="endDate">
							<button class="btn btn-default">??????</button>
						</div>
					</div>				
<!-- 				</form> -->
<!-- 				<form id="checkType"> -->
					<div class="col-md-6">
						<label for="userSex" class="form-label">?????? ??????</label>
						<div class="form_toggle row-vh d-flex flex-row justify-content-between" >
							<div class="form_radio_btn radio_male">
								<input class="saveRadio-11" id="saveRadio-11" type="radio" name="radios2" value="1">
								<label for="saveRadio-11">??????</label>
							</div>
														 
							<div class="form_radio_btn">
								<input class="saveRadio-11" id="saveRadio-12" type="radio" name="radios2" value="2">
								<label for="saveRadio-12">????????????</label>
							</div>

							<div class="form_radio_btn">
								<input class="saveRadio-11" id="saveRadio-13" type="radio" name="radios2" value="3">
								<label for="saveRadio-13">?????????</label>
							</div>

						</div>
					</div>
				</div>
<!-- 				<div class="row"> -->
<!-- 					<div class="col-md-6"> -->
<!-- 						<input type="date" class="date" name="startDate" id="startDate"> -->
<!-- 						<input type="date" class="date" name="endDate" id="endDate"> -->
<!-- 						<button>??????</button> -->
<!-- 					</div> -->
<!-- 				</div> -->
				</form>				
			</fieldset>

			<fieldset class="scheduler-border">
				<!-- 		<legend class="scheduler-border">????????????</legend> -->
				<div class="row">
					<div class="col-md-6">
						<h2>?????? ??????</h2>
					</div>
					
					<div class="col-md-6 total-result">
						<div class="col-md-6 mileage-review__details">
							<span>??? ??????</span>
							<p class="result">
							${fn:length(save) } ???
							</p>
						</div>
	
						<div class="col-md-6 mileage-review__details">
							<span>?????? ????????????</span>
							<p class="result">
							<c:set var="total" value="0"></c:set>
							<c:forEach items="${save }" var="vo">
								<c:set var="total" value="${total+vo.smoney }"></c:set>
							</c:forEach>${total } ??????
							</p>
						</div>
					</div>
				</div>
			</fieldset>
			
			<table class="table">
				<thead>
					<tr>
						<td>??????</td>
						<td>??????</td>
						<td>????????????</td>
					</tr>
				</thead>
				<c:if test="${save == null }">
				<tbody>
					<tr>
						<td colspan="3" style="text-align: center;">??????????????? ????????????.</td>
					</tr>
				</tbody>
				</c:if>
				<tbody>
					<c:forEach items="${save }" var="vo">
						<tr>
							<td>${vo.smemo }</td>
							<td>${vo.regdt }</td>
							<td>${vo.smoney }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
		</div>
<!-- </form> -->
<!-- <form action="/mileage/saveOrder.do" id="saveOrder" method="post"> -->
		<div id="tab2" class="tabcontent" style="display: none;">
			<fieldset class="scheduler-border">
				<!-- 		<legend class="scheduler-border">????????????</legend> -->
				<div class="row">
				<form id="checkUsePeriodType">
				<input type="hidden" name="saveOrUse" value="2">
					<div class="col-md-6">
						<label for="userSex" class="form-label">?????? ??????</label>
						<div class="form_toggle row-vh d-flex flex-row justify-content-between" >
							<div class="form_radio_btn radio_male">
								<input class="useRadio-1" id="useRadio-1" type="radio" name="radios1" value="1">
								<label for="useRadio-1">1??????</label>
							</div>
														 
							<div class="form_radio_btn">
								<input class="useRadio-1" id="useRadio-2" type="radio" name="radios1" value="6">
								<label for="useRadio-2">6??????</label>
							</div>

							<div class="form_radio_btn">
								<input class="useRadio-1" id="useRadio-3" type="radio" name="radios1" value="12">
								<label for="useRadio-3">1???</label>
							</div>

							<div class="form_radio_btn">
								<input class="useRadio-1" id="useRadio-4" type="radio" name="radios1">
								<label for="useRadio-4">????????????</label>
							</div>
						</div>
					</div>				
<!-- 				</form> -->
<!-- 				<form id="checkType"> -->
					<div class="col-md-6">
						<label for="userSex" class="form-label">?????? ??????</label>
						<div class="form_toggle row-vh d-flex flex-row justify-content-between" >
							<div class="form_radio_btn radio_male">
								<input class="useRadio-11" id="useRadio-11" type="radio" name="radios2" value="1">
								<label for="useRadio-11">??????</label>
							</div>
														 
							<div class="form_radio_btn">
								<input class="useRadio-11" id="useRadio-12" type="radio" name="radios2" value="2">
								<label for="useRadio-12">????????????</label>
							</div>

							<div class="form_radio_btn">
								<input class="useRadio-11" id="useRadio-13" type="radio" name="radios2" value="3">
								<label for="useRadio-13">?????????</label>
							</div>

						</div>
					</div>
				</form>		
				</div>
			</fieldset>

		</div>
<!-- </form> -->
	</div>
	
</body>
</html>