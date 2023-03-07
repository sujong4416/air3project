<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>항공편 수정</title>

<!-- 라이브러리 등록  : CDN 방식 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script type="text/javascript" src="/js/regEx.js"></script>

<script type="text/javascript">
	$(function() {

		// 취소 이벤트
		$("#cancelBtn").click(function() {
			history.back();
		})
	});
</script>
<script type="text/javascript">
	$(function() {

		$("#updateForm").submit(
				function() {
					// 한글이름
					if (!checkData(reg_station, $("#startStation"),
							reg_station_error_msg, 0))
						return false;

					let no = $
					{
						vo[1].flightNo
					}
					;

					location = "fList.do?no="+ no 
						+ "&page=" + request.getParameter("page")
						+ "&perPageNum=" + request.getParameter("perPageNum")
						+ "&key=" + request.getParameter("key")
						+ "&word=" + URLEncoder.encode(request.getParameter("word"),"utf-8")
						;

				});

	});

	$(function() {
		$("#station").click(function() {

			let station = $("this").find.text();
			$("#statStation").val() = station;

		});

	});
	
</script>
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
		<h1 style="color:#004080";>항공편 수정</h1>
		<form action="update.do" method="post" id="updateForm">
			<input type="hidden" name="page" value="${param.page }"> <input
				type="hidden" name="perPageNum" value="${param.perPageNum }">
			<input type="hidden" name="key" value="${param.key }"> <input
				type="hidden" name="word" value="${param.word }">
			<div class="form-group">
				<label for="flightNo">항공편번호</label> <input name="flightNo"
					id="flightNo" class="form-control" readonly
					value="${vo[1].flightNo }">
			</div>
			<div class="form-group">
				<label for="cNo"> 비행기번호 <details>
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


				</label> <input name="cNo" id="cNo" class="form-control"
					value="${vo[1].cNo }">
			</div>
			<div class="form-group">
				<label for="startStation">출국공항 <details>
						<summary>출국가능공항 보시려면 클릭하세요</summary>

						<c:if test="${vo != null }">
							<!-- 데이터 있는 만큼 반복문 처리 -->
							<c:forEach items="${vo[2] }" var="vo">
								<div id="selectDiv"
									; onclick="selectStartStation('${vo.startStation }');">
									<p>국가:${vo.startCon }</p>
									<p>지역:${vo.startStation }</p>
								</div>


							</c:forEach>
						</c:if>
					</details>
				</label> <input name="startStation" id="startStation" class="form-control"
					value="${vo[1].startStation }">
			</div>
			<div class="form-group">
				<label for="endStation">도착공항 <details>
						<summary>출국가능공항 보시려면 클릭하세요</summary>

						<c:if test="${vo != null }">
							<!-- 데이터 있는 만큼 반복문 처리 -->
							<c:forEach items="${vo[2] }" var="vo">
								<div id="selectDiv"
									; onclick="selectEndStation('${vo.startStation }');">
									<p>국가:${vo.startCon }</p>
									<p>지역:${vo.startStation }</p>
								</div>


							</c:forEach>
						</c:if>
					</details>
				</label> <input name="endStation" id="endStation" class="form-control"
					value="${vo[1].endStation }">
			</div>
			<div class="form-group">
				<label for="startDate">출국시간(yyyy-mm-dd hh:mm)</label> <input
					name="startDate" id="startDate" class="form-control"
					value="${vo[1].startDate }"
					pattern="^\d{4}-\d{2}-\d{2}\s\d{2}:\d{2}$" title="형식에 맞지않는다.">
			</div>
			<div class="form-group">
				<label for="endDate">도착시간(yyyy-mm-dd hh:mm)</label> <input
					name="endDate" id="endDate" class="form-control"
					value="${vo[1].endDate }"
					pattern="^\d{4}-\d{2}-\d{2}\s\d{2}:\d{2}$" title="형식에 맞지않는다.">
			</div>
			<div class="form-group">
				<label for="writer">가격</label> <input type="number" name="price"
					id="price" class="form-control" value="${vo[1].price }">
			</div>


			<button type="submit">수정</button>
			<button type="reset">새로입력</button>
			<button type="button" id="cancelBtn">취소</button>
		</form>
	</div>
</body>
</html>