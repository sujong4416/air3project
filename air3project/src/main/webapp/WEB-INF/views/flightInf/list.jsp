<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>항공편 검색</title>
<style type="text/css">
.inputDiv {
	border-top: 3px solid;
	float: left;
	width: 30%;
	height: 100px;
}

#serchBtn{
margin-top:10px;
	width:100px;
	height:50px;
	background: #004080;
	border: 0px;
	color:white;
}
td{
	
	border-bottom:2px solid  #004080;
}

</style>
<!-- 라이브러리 등록  : CDN 방식 -->

</head>
<body>
	<div class="container" style="height: 120px">
	<div style="margin-top: 50px;">
		<h1><strong>항공편 현황</strong></h1>
	</div>
	</div>
<div class="container">
	<h4>대한항공 직항편의 실시간 운항 정보를 확인하실 수 있으며 비정상 운항편에 대한 운항정보확인서 발급이 가능합니다.</h4>
</div>
	<form action="list.do" id="listForm" method="post"> <!-- 포스트 방식 사용 -->
		<div class="container" style="width: 60%; text-align: center">
			<div
				style="height: 150px; text-align: center; box-shadow: 5px 5px 5px 5px #f2f2f2;">
				<div class="inputDiv" style="border-color: #004080;">
				<div style="margin-top:53px">
					<label for="startcountry">국가</label> 
					<select id="startcountry" name="startcountry"> <!-- 샐럭트 방식을 통해 선택 국가선택시 자바스크립트를 통해 
																		나오는 지역을제한했다.-->
						<option value="">선택</option>
						<option value="korea">한국</option>
						<option value="china">중국</option>
						<option value="japan">일본</option>
						<!-- 추가 국가 옵션 -->
					</select> 
					<label for="startstation">지역</label> 
					<select id="startStation" name="startStation">
						<option value="">선택</option>
					</select>
					</div>
				</div>
				<div style="float:left; border-top:3px solid #004080">
				<img alt="a" src="/upload/craftInf/search.jpg" style="margin-top:47px">
				</div>
				<div class="inputDiv" style="border-color: #004080;">
				<div style="margin-top:53px">
					<label for="endcountry">국가</label> <select id="endcountry"
						name="endcountry">
						<option value="">선택</option>
						<option value="korea">한국</option>
						<option value="china">중국</option>
						<option value="japan">일본</option>
						<!-- 추가 국가 옵션 -->
					</select> <label for="endstation">지역</label> <select id="endStation" name="endStation">
						<option value="">선택</option>
					</select>
					</div>
				</div>
				<div class="inputDiv"
					style="height: 147px; border-top-color: #004080; border-left: 3px solid; border-left-color: #bfbfbf;">
					<div style="margin-top:53px">
					<label for="date">출발날짜</label> 
					<input type="date" name="startDate" id="startDate" class="startDate" style="border:none">
					</div>
				</div>
			</div>
		</div>
		<div style="text-align: center; height: 30px">
			<button id="serchBtn" style="margin-top: 25px">항공편 검색</button>
		</div>
	</form>

	<div class="container" style="margin-top: 100px">

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
	<div class="container">
	<c:if test="${login != null && login.gradeNo == 9}">
		<a href="fList.do" class="btn btn-default">항공편 관리</a>
	</c:if>
	</div>
	<script>
  const countrySelect1 = document.getElementById("startcountry");
  const regionSelect1 = document.getElementById("startStation");
  
  // 국가 선택지 변경 시, 해당 국가에 대한 지역 선택지를 변경
  countrySelect1.addEventListener("change", function() {
    const selectedCountry1 = countrySelect1.value;
    
    // 이전에 선택한 지역 선택지 제거
    regionSelect1.innerHTML = "<option value='1'>--선택--</option>";
    
    // 선택한 국가에 따라 지역 선택지 변경
    if (selectedCountry1 === "korea") {
      regionSelect1.innerHTML += `
        <option value="인천">인천</option>
        <option value="부산">부산</option>
        
        <!-- 추가 한국 지역 옵션 -->
      `;
    } else if (selectedCountry1 === "japan") {
      regionSelect1.innerHTML += `
        <option value="도쿄">도쿄</option>
        <option value="나고야">나고야</option>
        
        <!-- 추가 미국 지역 옵션 -->
      `;
    } else if (selectedCountry1 === "china") {
      regionSelect1.innerHTML += `
        <option value="상하이">상하이</option>
        <option value="베이징">베이징</option>
        
        <!-- 추가 일본 지역 옵션 -->
      `;
    }
    
  });
  const countrySelect2 = document.getElementById("endcountry");
  const regionSelect2 = document.getElementById("endStation");
  
  // 국가 선택지 변경 시, 해당 국가에 대한 지역 선택지를 변경
  countrySelect2.addEventListener("change", function() {
    const selectedCountry2 = countrySelect2.value;
    
    // 이전에 선택한 지역 선택지 제거
    regionSelect2.innerHTML = "<option value='2'>--선택--</option>";
    
    // 선택한 국가에 따라 지역 선택지 변경
    if (selectedCountry2 === "korea") {
      regionSelect2.innerHTML += `
          <option value="인천">인천</option>
          <option value="부산">부산</option>

        <!-- 추가 한국 지역 옵션 -->
      `;
    } else if (selectedCountry2 === "japan") {
      regionSelect2.innerHTML += `
    	  <option value="도쿄">도쿄</option>
          <option value="나고야">나고야</option>
        <!-- 추가 미국 지역 옵션 -->
      `;
    } else if (selectedCountry2 === "china") {
      regionSelect2.innerHTML += `
    	  <option value="상하이">상하이</option>
          <option value="베이징">베이징</option>
        <!-- 추가 일본 지역 옵션 -->
      `;
    }
    
  });
  
</script>
</body>
</html>