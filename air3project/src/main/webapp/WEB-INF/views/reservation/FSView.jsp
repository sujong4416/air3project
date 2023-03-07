<%@page import="com.air3.reservation.vo.ReservationVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서비스 정보</title>

<style type="text/css">
.St_FL_info {
	text-align: center;
	height: 160px;
	margin-top: 30px;
}

.sTime_info, .eTime_info {
	width: 25%;
	height: 100%;
	font-size: 25px;

}

#detail_view{
background-image: url("/upload/FSList/listsample.png");

background-size: cover;
}



.flight_info {
	padding-top: 15px;
	border: 1px solid #666;
}

.station_info {
	width: 100%;
	height: 25px;
	margin-top: 10px;
}

.detail_btn {
	height: 30%;
	
}

#prestige_select_btn, #flex_select_btn, #nomal_select_btn:hover {
	border: 1px solid bule;
}

#prestige_select_btn, #flex_select_btn, #nomal_select_btn {
	border: none;
}

.prestige_seat {
	border: 1px solid #eee;
}

.bg {
	background-color: #888;
	border: 1px solid #666666;
}
</style>

<script type="text/javascript">
	
// $(".detail_btn").click(function(){
	
	
// 	        let Flno = $(this).find("#flno").val();
// 	        alert(Flno);
// 			location = "/reservation/FSView.do?Flno=" + Flno;
	
// });
		
		
// 			$(".St_FL_info").click(function(){
		
// 	    let Flno = $(this).find("#flno").val();
// 		alert(Flno);
											
// 		location = "/reservation/infoWrite.do?Flno=" + Flno + "&people=" + ${param.people};
		
		
$(function(){

	$(".detail_btn").click(function(){
	
	let no = $(this).find("#cNo").val();
// 	alert(cno);
	
// 	return false;
	location= "/craftInf/view.do?no=" + no; 
		
		
	});
	

						
});
	


</script>
</head>
<body>
	<div class="container">

		<h3>출발 항공편</h3>



		<!-- c:forEach의 속성 - 반복회수가 저장되어 있는 vs-->




<div style ="height: 150px; width: 100%">
			
				<div class="flight_info pull-left"
					style="width: 100%; text-align: center; height: 100%; float: left; margin-top: 30px;;px; border-radius: 10px;">
			<div class="info_flight" style="height: 68%;">
					<div style="height: 40%; margin-top: 4px;">
						 <div class="sTime_info pull-left" style="width: 25%;height:100%;float: left;"> ${view.sTime } </div>
						 <div id="LT_info_icon" style="width: 50%; height: 100%; float: left;"> 
						 <div class="LT_info center" style="width:100%; height: 100%;">소요시간: ${view.leadTime } </div> 
						 </div> 
						<div class="eTime_info pull-right" style="width: 25%;float: left;"> ${view.eTime } </div>
					</div>
					<div class="station_info" style="width: 100%;">
					<div style="width: 25%; float: left;">
						<span class="s_station pull-left"  style="text-align: left; margin-left: 110px;">${view.startStation }</span> 
					</div>
					<div style="width: 50%; float: left;">
					<i class="fi fi-rr-arrow-alt-right" style="width: 100%"></i>
					</div>
					<div style="width: 25%; float: left;">
     				    <span class="e_station pull-right" style="text-align: right; margin-right: 110px;">${view.endStation }</span>
					</div>
					</div>
					<input type="hidden" id="flno" name="flno" value="${view.flightNo }">
					</div>
					<div class="detail_btn" style="height:30%; width: 100%; float: left; background: DodgerBlue; border-radius: 10px; padding-top: 10px;">
						<span class="cNo pull-left" style="margin-left: 110px; color: white;">항공기 번호 : ${view.cNo }</span> 
						<input type="hidden" id="flno" name="flno" value="${view.flightNo }">							
				        <span class="detail_view pull-right" style="margin-right: 110px; color: white;">항공기 상세보기</span>
				        <input type="hidden" value="${view.cNo }" id="cNo">
					</div>
			</div>
</div>


		<div class="row">
			<c:if test="${login != null }">

			</c:if>

<!-- 		</div> -->
<!-- 		<div> -->
<!-- 			<button class="btn btn-default pull-right" id="next_btn" -->
<!-- 				style="margin-top: 30px;">다음</button> -->
		</div>

	</div>
</body>
</html>