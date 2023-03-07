<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>항공편 등록</title>

<!-- 라이브러리 등록  : CDN 방식 -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script type="text/javascript" src="/js/regEx.js"></script>

<script type="text/javascript">
function selectEndStation(station) {
    document.getElementById("endStation").value = station;
}
function selectStartStation(sStation) {
    document.getElementById("startStation").value = sStation;
}
function selectNo(no) {
    document.getElementById("cNo").value = no;
}

</script>

<script type="text/javascript">
$(function(){
	$("#writeForm").submit(function(){
		// 제목, 내용, 작성자, 비밀번호, 비밀번호, 비밀번호=비밀번호 확인 유효성 검사.
		
		
		
	});
	
	// 취소 이벤트
	$("#cancelBtn").click(function(){
		history.back();
	})
});
</script>
<style type="text/css">
	#selectDiv{
	 border: 1px solid white;
	float: left; 
	margin: 3px;
	width: 200px;
	Padding: 3px;
	background: #004080;
	color: white;
	font-weight: lighter;
	}
	#selectDiv:hover{
	border: 1px solid #004080;
	float: left; 
	margin: 3px;
	width: 200px;
	Padding: 3px;
	background: white;
	color: #004080;
	font-weight: lighter;
	}
	
	.container{
	color:#004080;
	}
</style>
</head>
<body>
<div class="container">
	<h1 style="color:#004080";>항공편 등록</h1>
	<form action="write.do" method="post" id="writeForm">
		
		<div class="form-group">
			<label for="cNo">기체번호
			<details>
    			<summary>비행가능비행기를 보시려면 클릭하세요</summary>

			<c:if test="${vo != null }">
				<!-- 데이터 있는 만큼 반복문 처리 -->
				<c:forEach items="${vo[0] }" var="vo">
					<div id="selectDiv"; onclick="selectNo('${vo.cNo }')">
									<p>기체번호 ${vo.cNo }</p>
									<p>기체이름 ${vo.cName }</p>
								</div>
						
					
				</c:forEach>
				</c:if>
			</details>
			</label>
			<input name="cNo" id="cNo" class="form-control">
		</div>
		<div class="form-group">
			<label for="startStation">출국공항
			<details>
    			<summary>비행가능공항를 보시려면 클릭하세요</summary>

			<c:if test="${vo != null }">
				<!-- 데이터 있는 만큼 반복문 처리 -->
				<c:forEach items="${vo[1] }" var="vo">
					<div id="selectDiv"
									; onclick="selectStartStation('${vo.startStation }');">
									<p>국가:${vo.startCon }</p>
									<p>지역:${vo.startStation }</p>
								</div>
						
					
				</c:forEach>
				</c:if>
			</details>
			</label>
			<textarea name="startStation" id="startStation" class="form-control"></textarea>
		</div>
		<div class="form-group">
			<label for="endStation">입국공항
			<details>
    			<summary>비행가능공항를 보시려면 클릭하세요</summary>

			<c:if test="${vo != null }">
				<!-- 데이터 있는 만큼 반복문 처리 -->
				<c:forEach items="${vo[1] }" var="vo">
					<div id="selectDiv"
									; onclick="selectEndStation('${vo.startStation }');">
									<p>국가:${vo.startCon }</p>
									<p>지역:${vo.startStation }</p>
								</div>
						
					
				</c:forEach>
				</c:if>
			</details>
			</label>
			<input name="endStation" id="endStation" class="form-control">
		</div>
		<div class="form-group">
			<label for="startDate">출국날짜</label>
			<input type="date" name="startDate" id="startDate" class="form-control">
		</div>
		<div class="form-group">
			<label for="startTime">출국시간 hh:mm</label>
			<input name="startTime" id="startTime" class="form-control" pattern="^(0[0-9]|1[0-9]|2[0-3]):[0-5][0-9]$">
		</div>
		<div class="form-group">
			<label for="endDay">입국날짜</label>
			<input type="date" name="endDate" id="endDate" class="form-control">
		</div>
		<div class="form-group">
			<label for="endTime">입국시간 hh:mm</label>
			<input name="endTime" id="endTime" class="form-control" pattern="^(0[0-9]|1[0-9]|2[0-3]):[0-5][0-9]$">
		</div>
		<div class="form-group">
			<label for="price">가격</label>
			<input type="number"name="price" id="price" class="form-control">
		</div>
		
		<button>등록</button>
		<button type="reset">새로입력</button>
		<button type="button" id="cancelBtn">취소</button>
	</form>
</div>
</body>
</html>