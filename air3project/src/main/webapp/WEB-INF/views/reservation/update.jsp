<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기내식 변경하기</title>
<style type="text/css">
.dataRow:hover {
	background: #eee;
	cursor: pointer;
}
input {
  border: none;
}
fieldset {
  border: none;
  padding: 0;
  margin: 0;
}

.table {
	border: 2px solid #0059b3;
	border-radius: 8px;
	padding: 10px;
}

th, td {
  text-align: center;
  padding: 10px;
  font-size: 16px;
  border: 1px solid #dddddd;
}

th{
  opacity: 0.9;
 background: #0059b3;
  color: #ffffff;
}
.path {
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
<script type="text/javascript">
	$(function() {

		//취소하는 것.. 뷰로 돌아가기
		$("#cancelBtn").click(function() {
			history.back();
		});

		let mealNo = '${mealNo}';
		//value값으로 설정
		$("#mealNo").val(mealNo).prop("selected",true);
	});
</script>
</head>
<body>
	<div class="container">
	<div class="path">
	  <span>main</span>
<!-- 	  <span>&gt;</span> -->
	  <span>예약목록</span>
<!-- 	  <span>&gt;</span> -->
	  <span>예약 상세보기</span>
<!-- 	  <span>&gt;</span> -->
	  <span>기내식 수정</span>
	</div>
	<br/>
	
		<form action="update.do" method="post" id="updateForm">
		<input type ="hidden" name ="page" value="${param.page}">
		<input type ="hidden" name ="perPageNum" value="${param.perPageNum}">
		<input type ="hidden" name ="key" value="${param.key}">
		<input type ="hidden" name ="word" value="${param.word}">
			
	<fieldset>
	<legend>기내식 변경하기</legend>

			<div class="form-group">
				<label for="revNo">예약번호</label> <input readonly name="revNo"
					id="revNo" class="form-control" value="${updateVO.revNo}">
			</div>
			<div class="form-group">
				<label for="name">이름</label> <input readonly name="name" id="name"
					class="form-control" value="${updateVO.name}">
			</div>
			<div class="form-group">
				<label for="startStation">출발하는 나라</label> <input readonly
					name="startStation" id="startStation" class="form-control"
					value="${updateVO.startStation}">
			</div>
			<div class="form-group">
				<label for="startDate">출발시간</label> <input readonly name="startDate"
					id="startDate" class="form-control" value="${updateVO.startDate}">
			</div>
			<div class="form-group">
				<label for="endStation">도착하는 나라</label> <input readonly
					name="endStation" id="endStation" class="form-control"
					value="${updateVO.endStation}">
			</div>
<!-- 			<div class="form-group"> -->
<!-- 				<label for="mealNo">기내식<br/> -->
<!-- 				1: 일반기내식 2: 샐러드 3:알러지 안전식단 4: 프로틴식단 -->
<!-- 				</label> <select class="form-control" -->
<!-- 					id="mealNo" name="mealNo"> -->
<!-- 					<option>기내식을 선택하세요</option> -->
<!-- 					<option>1</option> -->
<!-- 					<option>2</option> -->
<!-- 					<option>3</option> -->
<!-- 					<option>4</option> -->
<!-- 				</select> -->
<!-- 			</div> -->
<div class="form-group">
				<label for="mealNo">기내식<br /> 
				1: 일반기내식 2: 샐러드 3:알러지 안전식단 4:프로틴식단
				</label> <select class="form-control" id="mealNo" name="mealNo" onchange="">
					<option value="" ${test == ''? 'selected = " selected"' :'' }>기내식을 선택하세요</option>
					<option value="1" ${test == '1'? 'selected = " selected"' :'' }>1 : 일반기내식</option>
					<option value="2" ${test == '2'? 'selected = " selected"' :'' }>2 : 샐러드</option>
					<option value="3" ${test == '3'? 'selected = " selected"' :'' }>3 : 알러지 안전식단</option>
					<option value="4" ${test == '4'? 'selected = " selected"' :'' }>4 : 프로틴 식단</option>
				</select>
			</div>



			<div class="form-group">
				<label for="seatInf">좌석</label> <input readonly name="seatInf"
					id="seatInf" class="form-control" value="${updateVO.seatInf}">
			</div>

			<div class="form-group">
				<label for="total">총결제금액</label> <input readonly name="total"
					id="total" class="form-control" value="${updateVO.total}">
			</div>
</fieldset>
			<button>수정</button>
			<button type="button" id="cancelBtn">취소</button>
		</form>

	</div>

</body>
</html>