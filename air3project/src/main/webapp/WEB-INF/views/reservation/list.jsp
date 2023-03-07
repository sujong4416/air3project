<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>항공예약 리스트</title>
<style type="text/css">
.data:hover {
	background: #eee;
	cursor: pointer;
}

.table {
	border: 2px solid #0059b3;
	border-radius: 8px;
	padding: 10px;
}

div {
	padding-bottom: 05px;
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

thead {
background-color: rgba(135, 206, 250, 0.5);

}


</style>
<script type="text/javascript">
$(function() {
	//key를 셋팅해보자
	if ("${param.key}"){
		$("#key").val("${param.key}");
	}
	
	//perpageNum을 셋팅해보자
	if ("${param.perPageNum}")
		$("#perPageNum").val("${param.perPageNum}");
	
	$(function() {
		// 클릭 이벤트
		$(".data").click(
				function() {
					let revNo = $(this).find(".rev").text();
					location.href = "view.do?revNo=" + revNo
							+ "&page=${param.page}"
							+ "&perPageNum=${param.perPageNum}"
							+ "&key=${param.key}&word=${param.word}";
				});
		//한페이지에 보여줄 데이터 개수 변경 이벤트
		$("#perPageNum").change(function() {
			$("#changePerPageNumForm").submit();
		});
	});
});
</script>

</head>
<body>
	<div class="container">
	<div class="path">
	  <span>main</span>
	  <span>예약목록</span>
	</div>
	<br/>
		<h1 align="center">항공예약 리스트</h1>
		<div class="dataRow">
			<div class="col-md-9">
				<form class="form-inline">
					<input name="perPageNum" value="${param.perPageNum }" type="hidden">
					<div class="form-group">
						<select class="form-control" id="key" name="key">
							<c:if test="${login.gradeNo ==1}">
								<option value="ss">출발하는 도시</option>
								<option value="sd">출발 날짜</option>
							</c:if>
							<c:if test="${login.gradeNo ==9}">
								<option value="i">아이디</option>

							</c:if>
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
			<div class="col-md-2text-right">
				<form class="form-inline" id="changePerPageNumForm">
					<div class="form-group">
						<label>보고싶은 글의 양</label> <select name="perPageNum" id="perPageNum"
							class="form-control">
							<option>10</option>
							<option>15</option>
							<option>20</option>
						</select>
					</div>
				</form>
			</div>
		</div>

		<table class="table">
			<thead>
				<tr class="trTable">
					<th>예약번호</th>
					<c:if test="${login.gradeNo ==9 }">
				    <th>아이디</th>
					</c:if>
					<th>이름</th>
					<th>출발하는 도시공항</th>
					<th>출발 시간</th>
					<th>도착하는 나라</th>
				</tr>
			</thead>
			<tbody>
				<!-- 데이터가 있는 만큼 반복문 처리 -->
				<c:forEach items="${revList}" var="vo">
					<tr class="data">
						<td class="rev">${vo.revNo}</td>
						<c:if test="${login.gradeNo ==9 }">
				         <td>${vo.id }</td>
						</c:if>
						<td>${vo.name}</td>
						<td>${vo.startStation}</td>
						<td>${vo.startDate}</td>
						<td>${vo.endStation}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="col-md-9 text-right">
			<pageNav:pageNav listURI="list.do" pageObject="${pageObject }" />
		</div>

	</div>

</body>
</html>