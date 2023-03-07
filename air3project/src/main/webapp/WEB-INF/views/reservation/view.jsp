<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 예약정보를 상세하게 보기</title>
<style type="text/css">


.dataRow:hover {
	background: #eee;
	cursor: pointer;
	
}
.table {
	border: 2px solid;
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
		// 기내식 수정하기 클릭 이벤트
		$(".mealBtn").click(
				function() {
					let revNo = $(".revNo").text();
					// 		  alert(revNo);
					location.href = "update.do?revNo=" + revNo
							+ "&page=${param.page}"
							+ "&perPageNum=${param.perPageNum}"
							+ "&key=${param.key}&word=${param.word}";
				});

		//삭제처리
		$(".deleteBtn").click(
				function() {
					let revNo = $(".revNo").text();
					//alert(revNo);
					if (!confirm("정말 삭제하시겠습니까?")) {
						return false;
					}

					location.href = "delete.do?revNo=" + revNo
							+ "&perPageNum=${param.perPageNum}";

				});
// 		//리스트로 가기
// 		$(".listBtn").click(function(){
// 			location.href="list.do?revNo=" + revNo";
// 		})
		

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
	</div>
	<br/>
		<h1>예약정보 상세보기</h1>
		<table class="table table-bordered">
			<tr>
				<th>예약번호</th>
				<td class="revNo">${viewVO.revNo}</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>${viewVO.name}</td>
			</tr>
			<tr>
				<th>연락처</th>
				<td>${viewVO.tel}</td>
			</tr>
			<tr>
				<th>출발하는 나라</th>
				<td>${viewVO.startStation}</td>
			</tr>
			<tr>
				<th>출발 시간</th>
				<td>${viewVO.startDate}</td>
			</tr>
			<tr>
				<th>도착하는 나라</th>
				<td>${viewVO.endStation}</td>
			</tr>
			<tr>
				<th>기내식</th>
				<td>${viewVO.mealName}</td>
			</tr>
			<tr>
				<th>좌석</th>
				<td>${viewVO.seatInf}</td>
			</tr>
			<tr>
				<th>총 결제금액</th>
				<td>${viewVO.total}</td>
			</tr>

		</table>
		<input type="hidden" name="mileage" value="0">
		<div>

				<button type="button" class="btn btn-default deleteBtn" id="deleteBtn" >예약내역 삭제</button>
			<button type="button" class="btn mealBtn btn-default" id="mealBtn">기내식 수정하기</button>
<!-- 		<button type="button" class="btn listBtn btn-default" id="listBtn">예약목록</button> -->
		</div>



	</div>
</body>
</html>

