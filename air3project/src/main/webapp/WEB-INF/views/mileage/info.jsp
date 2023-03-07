<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
  width: 50%;
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
  max-width: 500px;
  max-height: 32px;
  font-size: 15px;
  border: 0;
  border-radius: 15px;
  outline: none;
  padding-left: 10px;
  background-color: none;
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
    margin-bottom: 30px;
  
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
.won{
	text-align: right;
}
h2 {
  color: #004080; /* 글자색 */
  font-size: 25px; /* 폰트 크기 */
  font-weight: bold; /* 굵게 */
  margin-left: 10px;
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

<script type="text/javascript">
	$(function() {
		
		if('${msg }' != '') alert('${msg}');
		
		$(".cancelBtn").click(function(){
			
			if(confirm("마일리지 적립신청을 취소하시겠습니까?")){
				history.back();
			}
			
		});
		
		
		$("#searchRevNo").click(function(){
			window.open("/mileage/searchRevNo.do", "searchRevNo", "width=600, height=500, top=200, left=500");
		});
		
		
		$("#searchOrdNo").click(function(){
			window.open("/mileage/searchOrdNo.do", "searchOrdNo", "width=600, height=500, top=200, left=500");
		});
		
		$("#saveReservationBtn").click(function(){
			
			let revNo = $("#checkRevNo").val();
			
			if(revNo == "" || revNo == 0){
				alert("마일리지를 적립할 예매번호를 검색해 주세요.")
				return false;
			}
			
			$("#saveReservation").submit();
			
		});
		
		$("#saveOrderBtn").click(function(){
			
			let ordNo = $("#checkOrdNo").val();
			
			if(ordNo == "" || ordNo == 0){
				alert("마일리지를 적립할 주문번호를 검색해 주세요.")
				return false;
			}
			
			$("#saveOrder").submit();
			
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
<!-- 		<div class="dropdown"> -->
<!-- 			<button class="btn btn-default dropdown-toggle" type="button" id="menu1" data-toggle="dropdown">마일리지 -->
<!-- 			<span class="caret"></span></button> -->
<!-- 			<ul class="dropdown-menu" role="menu" aria-labelledby="menu1"> -->
<!-- 				<li class="member" role="presentation"><a role="menuitem" tabindex="-1" href="/mileage/info.do">마일리지 적립신청</a></li> -->
<!-- 				<li class="member" role="presentation"><a role="menuitem" tabindex="-1" href="/mileage/view.do">마일리지 현황</a></li> -->
<!-- 				<li class="member" role="presentation"><a role="menuitem" tabindex="-1" href="/mileage/viewDetail.do">마일리지 상세조회</a></li> -->
<!-- 			</ul> -->
<!-- 		</div> -->
		
		<h1>마일리지 적립 신청</h1>
		<h3>예매번호/주문번호를 검색하여 마일리지를 적립할 수 있습니다.</h3>
		<h3>마일리지는 결제금액의 1% 적립됩니다.</h3>
		<div class="tab">
			<button class="tablinks active" id="openTab1"
				onclick="openTab(event, 'tab1')">이젠항공</button>

			<button class="tablinks" id="openTab2"
				onclick="openTab(event, 'tab2')">쇼핑몰</button>
		</div>
<form action="/mileage/saveReservation.do" id="saveReservation" method="post">
		<div id="tab1" class="tabcontent" style="display: block;">
			<fieldset class="scheduler-border">
				<!-- 		<legend class="scheduler-border">기본정보</legend> -->
				<div class="row">
					<div class="col-md-4">
						<h2>기본정보</h2>
					</div>

					<div class="box col-md-8">
						<div class="field">
							<span class="title">이름</span>
							<p class="text">${view.name } / ${view.ename }</p>
						</div>

						<div class="field">
							<span class="title">아이디</span>
							<p class="text">${view.id }</p>
						</div>
					</div>
				</div>
			</fieldset>

			<fieldset class="scheduler-border">
				<!-- 		<legend class="scheduler-border">여권정보</legend> -->
				<div class="row">
					<div class="col-md-4">
						<h2>탑승정보</h2>
					</div>

					<div class="box col-md-8">
						<div class="field">
							<span class="title">예매번호</span>
							<p class="text" id="checkRevNop">
								<input id="checkRevNo" name="checkRevNo" readonly type="text">
							</p>
					    	<button class="btn btn-xs btn-default" type="button" id="searchRevNo">예매번호 검색</button>
						</div>
						<div class="field">
							<span class="title">총 결제금액</span>
							<p class="text">
								<input id="checkTotal" name="revTotal" readonly type="text">
								<span class="won" style="float: right;">원</span>
							</p>
						</div>
						<div class="field">
							<span class="title">적립 예정금액</span>
							<p class="text">
								<input id="checkSave" readonly type="text">
								<span class="won" style="float: right;">원</span>
							</p>
						</div>
					</div>
				</div>
			</fieldset>
			<button type="button" class="btn menu-btn btn-primary" id="saveReservationBtn">신청</button>
			<button type="button" class="btn menu-btn btn-default cancel-btn cancelBtn">취소</button>
		</div>
</form>
<form action="/mileage/saveOrder.do" id="saveOrder" method="post">
		<div id="tab2" class="tabcontent" style="display: none;">
			<fieldset class="scheduler-border">
				<!-- 		<legend class="scheduler-border">기본정보</legend> -->
				<div class="row">
					<div class="col-md-4">
						<h2>기본정보</h2>
					</div>

					<div class="box col-md-8">
						<div class="field">
							<span class="title">이름</span>
							<p class="text">${view.name } / ${view.ename }</p>
						</div>

						<div class="field">
							<span class="title">아이디</span>
							<p class="text">${view.id }</p>
						</div>
					</div>
				</div>
			</fieldset>

			<fieldset class="scheduler-border">
				<!-- 		<legend class="scheduler-border">여권정보</legend> -->
				<div class="row">
					<div class="col-md-4">
						<h2>구매정보</h2>
					</div>

					<div class="box col-md-8">
						<div class="field">
							<span class="title">주문번호</span>
							<p class="text" id="checkOrdNop">
								<input id="checkOrdNo" name="checkOrdNo" readonly type="text">
							</p>
					    	<button class="btn btn-xs btn-default" type="button" id="searchOrdNo">주문번호 검색</button>
						</div>
						<div class="field">
							<span class="title">총 결제금액</span>
							<p class="text">
								<input id="checkOrdTotal" name="ordTotal" readonly type="text">
								<span class="won" style="float: right;">원</span>
							</p>
						</div>
						<div class="field">
							<span class="title">적립 예정금액</span>
							<p class="text">
								<input id="checkOrd" readonly type="text">
								<span class="won" style="float: right;">원</span>
							</p>
						</div>
					</div>
				</div>
			</fieldset>

			<button type="submit" class="btn menu-btn btn-primary" id="saveOrderBtn">신청</button>
			<button type="button" class="btn menu-btn btn-default cancel-btn cancelBtn">취소</button>

		</div>
</form>
	</div>
	
	
	<script type="text/javascript">
	
	function openTab(evt, tabName) {
		var i, tabcontent, tablinks;

		tabcontent = document.getElementsByClassName("tabcontent"); // 컨텐츠를 불러옵니다.

		for (i = 0; i < tabcontent.length; i++) {
			tabcontent[i].style.display = "none"; //컨텐츠를 모두 숨깁니다.
		}

		tablinks = document.getElementsByClassName("tablinks"); //탭을 불러옵니다.

		for (i = 0; i < tablinks.length; i++) {
			tablinks[i].className = tablinks[i].className.replace(
					" active", ""); //탭을 초기화시킵니다.
		}

		document.getElementById(tabName).style.display = "block"; //해당되는 컨텐츠만 보여줍니다.

		evt.currentTarget.className += " active"; //클릭한 탭을 활성화시킵니다.
	}
	
	</script>
</body>
</html>

<% 
 session.removeAttribute("msg");
%>
