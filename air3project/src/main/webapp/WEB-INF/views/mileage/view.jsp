<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style type="text/css">
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
  margin-bottom: 20px;
}
h3 {
  color: #333; /* 글자색 */
  font-size: 15px; /* 폰트 크기 */
  margin-left: 10px;
    text-align: center; /* 가운데 정렬 */
  margin: 10px 0;
}
table{
	margin-top: 20px;
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
td{
	text-align: right;
}

.form{
	max-width: 850px;
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



</style>
<script type="text/javascript">

$(function(){
	
	$("#viewDetail").click(function(){
		location="/mileage/viewDetail.do";
	});
	$("#mileageInfo").click(function(){
		location="/mileage/info.do";
	});
});

</script>
</head>
<body>
<div class="container form">
	<div class="path">
	  <span>Home</span>
	  <span>마이 페이지</span>
	  <span>마일리지</span>
	  <span>마일리지 현황
		<div class="dropdown">
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
	<h1>마일리지 현황</h1>
	<h3>현재까지 총 적립, 총 사용, 잔여 마일리지를 확인할 수 있습니다.</h3>
	<h3>적립, 사용의 상세내역을 확인하려면 상세조회를 클릭하세요.</h3>
	
	<table class="table">
		<tbody>
			<tr>
				<th>잔여 마일리지</th>
				<td>${view.balance } 마일</td>
			</tr>
		</tbody>
		
		<tbody>
			<tr>
				<th>사용 마일리지</th>
				<td>${view.umoney } 마일</td>
			</tr>
		</tbody>
		
		<tbody>
			<tr>
				<th>적립 마일리지</th>
				<td>${view.smoney } 마일</td>
			</tr>
		</tbody>
		
	</table>
	<div style="text-align: right;">
		<button class="btn btn-default menu-btn" type="button" id="mileageInfo">마일리지 적립신청</button>
		<button class="btn btn-default menu-btn" type="button" id="viewDetail">마일리지 상세조회</button>
	</div>	
</div>
</body>
</html>