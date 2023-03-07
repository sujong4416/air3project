<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" href="/upload/favicon/favicon (1).ico"
	type="image/x-icon">
<link rel='stylesheet'
	href='https://cdn-uicons.flaticon.com/uicons-regular-rounded/css/uicons-regular-rounded.css'>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style type="text/css">
h1 {
  color: #004080; /* 글자색 */
  font-size: 32px; /* 폰트 크기 */
  font-weight: bold; /* 굵게 */
  text-align: center; /* 가운데 정렬 */
  margin-top: 50px; /* 위쪽 여백 */
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
.form-size{
	height: 3em;
}



</style>
<script type="text/javascript">

$(function(){
	
	$("#changeRevNo").change(function(){
		
		$("#changeRevNoForm").submit();
		
	});
	
	$("#use").click(function(){
		
		// 예매번호
		let revNo = $("#revNo").text();
		// 총결제금액
		let revTotal = $("#revTotal").text();

		opener.saveReservation.checkRevNo.value = revNo;
		opener.saveReservation.checkTotal.value = revTotal;
		opener.saveReservation.checkSave.value = revTotal*0.01;

		window.close();

	});
	
	
});

</script>

</head>
<body>
<div class="container">
	<h1>예매번호 검색</h1>
	
	<form method="post" id="changeRevNoForm">
	<select id="changeRevNo" name="revNo">
		<option value="">예매번호 선택</option>
		<c:forEach items="${list }" var="vo">
			<option value="${vo.revNo }">${vo.revNo }</option>
		</c:forEach>
	</select>
	</form>
	
	<form action="/mileage/saveReservation.do" method="post">
	<table class="table">

			<tr>
				<th>예약번호</th>
				<td id="revNo">${vo.revNo}</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>${vo.name}</td>
			</tr>
			<tr>
				<th>출발하는 공항</th>
				<td>${vo.startStation}</td>
			</tr>
			<tr>
				<th>출발 시간</th>
				<td>${vo.startDate}</td>
			</tr>
			<tr>
				<th>도착하는 공항</th>
				<td>${vo.endStation}</td>
			</tr>
			<tr>
				<th>기내식</th>
				<td>${vo.mealName}</td>
			</tr>
			<tr>
				<th>좌석</th>
				<td>${vo.seatInf}</td>
			</tr>
			<tr>
				<th>총 결제금액</th>
				<td id="revTotal">${vo.total}</td>
			</tr>
			
		</table>
		
	<button class="btn btn-default pull-right menu-btn" type="button" id="use">확인</button>
	
	</form>
	
</div>

</body>
</html>