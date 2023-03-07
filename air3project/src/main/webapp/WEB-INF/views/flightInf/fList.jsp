<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>항공편 리스트</title>

<!-- 라이브러리 등록  : CDN 방식 -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
.dataRow:hover{
	background: #eee;
	cursor: pointer;
}
</style>

<script type="text/javascript">

</script>

</head>
<body>
<div class="container">
<h1 style="color:#004080";>항공편 리스트</h1>
<div class="col-md-9">
		<form class="form-inline">
			<input name="perPageNum" value="${param.perPageNum }" type="hidden">
		  	<div class="form-group">
		  		<select class="form-control" id="key" name="key">
				    
				    <option value="s">출발지</option>
				    <option value="e">도착지</option>
				    
				</select>
		  	</div>
			<div class="form-group">
			    <input type="text" class="form-control" placeholder="Search" 
			    name="word" value="${param.word }">
			</div>
		    <button class="btn btn-default" type="submit">
		        <i class="glyphicon glyphicon-search"></i>
		    </button>
		</form>
	</div>

<table class="table">
	<thead style="border-bottom: 3px solid #004080; ">
		<tr>
			<th>항공편번호</th>
			<th>기체번호</th>
			<th>출국공항</th>
			<th>도착공항</th>
			<th>출국시간</th>
			<th>도착시간</th>
			<th>가격</th>
			
		</tr>
	</thead>
	<tbody>
		<!-- 데이터 있는 만큼 반복문 처리 -->
		<c:forEach items="${list }" var="vo">
			<tr class="dataRow">
				<td class="flightNo">${vo.flightNo }</td>
				<td>${vo.cNo }</td>
				<td>${vo.startStation }</td>
				<td>${vo.endStation }</td>
				<td>${vo.startDate }</td>
				<td>${vo.endDate }</td>
				<td>${vo.price }</td>
				<td><a href="update.do?no=${vo.flightNo }&page=${param.page}&perPageNum=${param.perPageNum}&key=${param.key }&word=${param.word}">수정</a></td>
				<td><a href="delete.do?no=${vo.flightNo }">삭제</a></td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<div class="row">
<div class="col-md-9 text-right">
		<pageNav:pageNav listURI="fList.do" pageObject="${pageObject }" />
	</div>
		<a href="write.do" class="btn btn-default" style="color:white; background: #004080">새로운 항공편 등록</a>
		
	
</div>
</div>
</body>
</html>