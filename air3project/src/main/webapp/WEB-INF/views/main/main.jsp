<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
#main_banner{
background-image: url("/upload/main/imgSample2.jpg");
background-position: left;
background-size: cover;


}
#searcher{
margin: auto;
background: white;
}


</style>
<script type="text/javascript">
$(function(){
	 
	if('${msg }' != '') alert('${msg}');
	
	$("#searchBtn").click(function(){
	
		let people = $("#peopleNo").val();
	 	 
	 $("#listForm").attr("action", "/reservation/FSlist.do?people=" + people);
		 
	 });
	 
	  
});



	$(".dataRow").click(function(){
		
		let no = $(this).find(".no").text();
		if (!no) no = $(this).data("no"); // 태그안에 data-no 속성으로 값이 저장되어 있어야 한다.

	
		if ($(this).hasClass("image")) location = "/image/view.do?no=" + no;
	});	
	





</script>

</head>
<body>

	<div class="container-fluid" id="main_banner" style="width: 100%; height: 420px; border: 1px solid #666; float: left;">
<div id="searcher" style="width: 55%; height:60%;  border: 1px solid #666; position:relative;margin-top: 80px; ">
	
	<form action=""  id="listForm" method="post">
		<div  style="width: 100%; text-align: center; border: 1px solid #666; height:100%; position: absolute; float: left;">
			<div
				style="height: 150px; text-align: center; border-bottom: 1px solid #666; ">
				<div class="inputDiv" style="border-color: #004080;">
				<div style="margin-top:60px">
					<label for="startcountry">국가</label> <select id="startcountry"
						name="startcountry">
						<option value="">선택</option>
						<option value="korea">한국</option>
						<option value="china">중국</option>
						<option value="japan">일본</option>
						<!-- 추가 국가 옵션 -->
					</select> <label for="startstation">지역</label> <select id="startStation" name="startStation">
						<option value="">선택</option>
					</select>
					</div>
				</div>
				<div style="float:left; border-top:3px solid #004080">
				<img alt="a" src="/upload/craftInf/search.jpg" style="margin-top:47px">
				</div>
				<div class="inputDiv" style="border-color: #004080;">
				<div style="margin-top:60px">
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
					<div style="margin-top:60px">
					<label for="date">출발날짜</label> 
					<input type="date" name="startDate" id="startDate" class="startDate" style="border:none">
					</div>
					<div id="peopel">
					<label>승객수</label>
					<input id="peopleNo" name="peopleNo">
					</div>
				</div>
			</div>
		<div style="text-align: center; height: 30px">
			<button id="searchBtn" style="margin-top: 25px">항공편 검색</button>
		</div>
		</div>
	</form>
	</div>
	

</div>




<div class="row" style="margin-top: 500px;">
  <div style="width: 60%; margin: auto;">
    <div class="panel-group">
	 <div class="panel panel-default">
	 <div class="panel-heading">서비스 정보</div>
	 <div class="panel-body"><jsp:include page="mServiceList.jsp"></jsp:include></div>
	</div>
   </div>
				</div>
			</div>

<div>${list }</div>
${Productlist }
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
<%
	session.removeAttribute("msg");
%>
