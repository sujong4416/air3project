<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>항공기 리스트</title>
<script type="text/javascript">
$(function(){
	//이미지 보기로 보내는 이벤트 
	$(".dataRow").click(function(){
		let no = $(this).find(".cNo").text();
   
		location="/craftInf/view.do?no="+no;
		
	});
});
</script>
<style type="text/css">
	.table{
	width:40%;
	float:left;
	}
	
	th{
		border-botton:1px solid red;
	}
	.dataRow:hover{
	background: #003d99;
	color: white;
	cursor: pointer;
}
</style>
</head>
<body>
<div class="container"style="width:60%">
<div>
<img alt="main" src="/upload/craftInf/craftMain.jpg" style="width:100%; position: relative;">
</div>
<div style="background: #003d99; color: white; width:600px; height:50px">
대한항공은 최고의 엔지니어가 관리하는 보잉사와 에어버스사의 최신 항공기를 보유중이며,</br> 
승객 여러분의 편안하고 안전한 여행을 위해 최선을 다하고 있습니다.
</div>
</div>
<div class="container" style="margin-top:40px">

<div>
<div>

	<table class="table">
	<caption style="color: #003d99; font-size:40px">보잉</caption>
	<thead>
		<tr>
			<th>항공기번호</th>
			<th>항공기네임</th>
			
		</tr>
	</thead>
	<tbody>
		<!-- 데이터 있는 만큼 반복문 처리 -->
		<c:forEach items="${list[0] }" var="list">
			<tr class="dataRow">
				<td class="cNo">${list.cNo }</td>
				<td>${list.cName }</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
</div>
<div>

<table class="table" style="margin-left:20%">
<caption style="color: #003d99; font-size:40px">에어버스</caption>
	<thead>
		<tr>
			<th>항공기번호</th>
			<th>항공기네임</th>
			
		</tr>
	</thead>
	<tbody>
		<!-- 데이터 있는 만큼 반복문 처리 -->
		<c:forEach items="${list[1] }" var="list">
			<tr class="dataRow">
				<td class="cNo">${list.cNo }</td>
				<td>${list.cName }</td>
			</tr>
		</c:forEach>
	</tbody>
</table>

</div>
</div>

</div>
<c:if test="${login != null && login.gradeNo == 9}">
<div class="container">
<a href="write.do">항공기 등록</a>

</div>
	</c:if>


</body>
</html>