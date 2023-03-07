<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>air3.reservation</title>
<!-- 라이브러리 등록  : CDN 방식 -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<div class= "container">
<div style="height:150px">
<h1>항공예약</h1>
</div>
<form action="list.do" id="listForm" method="post">
<div style="width:70%; text-align:center">
<div style="height:150px; text-align: center;  box-shadow: 5px 5px 5px 5px #f2f2f2; ">
		<div class="inputDiv" style="border-color: #80bfff;">
		<label for="startStation">출발지</label>
		<input name ="startStation" id = "startStation" class = "startStation">
		</div>
		<div class="inputDiv" style="border-color: #80bfff;">
		<label for="endStation">도착지</label>
		<input name = "endStation" id = "endStation" class = "endStation">
		</div>
		<div class="inputDiv" style="height:147px; border-top-color: #004080; border-left: 3px solid; border-left-color: #bfbfbf;">
		<label for="date">출발날짜</label>
		<input type= "date" name = "startDate" id = "startDate" class = "startDate">
		</div>
		</div>
</div>
<div style="text-align: center; height:30px">
<button style="margin-top : 10px">항공편 검색</button>
</div>
	</form>

<div class="container" style="margin-top:100px">

		<table class="table">
			<thead>
				<tr>
					<th>번호</th>
					<th>기종</th>
					<th>국가</th>
					<th>출국공항</th>
					<th>도착국가</th>
					<th>도착공항</th>
					<th>출발시간</th>
					<th>도착시간</th>
					<th>가격</th>
				</tr>
			</thead>
			<tbody>
			<c:if test="${list != null }">
				<!-- 데이터 있는 만큼 반복문 처리 -->
				<c:forEach items="${list }" var="vo">
					<tr class="dataRow">
						<td class="no">${vo.cNo }</td>
						<td>${vo.cName }</td>
						<td>${vo.startCon }</td>
						<td>${vo.startStation }</td>
						<td>${vo.endCon }</td>
						<td>${vo.endStation }</td>
						<td>${vo.startDate }</td>
						<td>${vo.endDate }</td>
						<td>${vo.price }</td>
						
					</tr>
				</c:forEach>
				</c:if>
			</tbody>
		</table>
</div>
</div>

</body>
</html>