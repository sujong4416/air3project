<%@page import="java.util.ArrayList"%>
<%@page import="com.air3.reservation.vo.ReservationVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
 
 
 
   .bg { background-color: #eeeeee; 
   border: 1px solid #666666; }

#seat{
background-image: url("/upload/seat/seat2.png");
background-position: center;
background-size: cover;
height: 2470px;

margin: auto;

}

.no_seat{
background: red;
color: white;
}
#seat_selector{
display: block;
position: fixed;
}
</style>

<script type="text/javascript">


$(function(){
	
	
	
	
	
	
	$(".select_seat").click(function(){
		
		let peopleNum = $("#people").val();
		alert(peopleNum);
		
		
// 		if($('.select_seat').toggleClass('bg') =< peopleNum{)

//         for(var i=1;i<=peopleNum;i++){ 
	
			$(this).toggleClass('bg');
			alert($(this).hasClass('bg'));
			let value = $(this).attr('value');
			alert("선택하신 좌석은 :"+ value+ "입니다.");
//         }
// 	}

// 		if($("#seat_1").val() == 0 && $(this).hasClass('bg') == true){
			
// 			$("#seat_1").val(value);
// 		}
			var i;
			var cnt = ${param.People};
		
			if($(this).hasClass('bg') == true){ // true

				if($("#seat_1").val() == ""){ // 좌석이 비어있으면 선택한 좌석 입력
					
					$("#seat_1").val(value);
					
				} else{ // 좌석이 비어있지 않으면 선택 불가
					
					$(this).removeClass('bg');
					alert($(this).removeClass('bg'));

					alert("선택불가");
					
				} // if else
				
			} else { // false
					
				if(value == $("#seat_1").val()){ // 선택한 좌석이랑 입력되어 있는 좌석이랑 같으면 삭제
					
					$("#seat_1").val("");
				} // if
				
			} // if else
			
// 			if($(this).hasClass('bg') == true){ // true
				
// 				for(i =1; i<=cnt; i++){

// 					if($("#seat_"+i).val() == ""){ // 좌석이 비어있으면 선택한 좌석 입력
						
// 						$("#seat_"+i).val(value);
						
// 					} else{ // 좌석이 비어있지 않으면 선택 불가
						
// 					} // if else
				
// 				} // for
				
// 			} else { // false
				
// 				for(i =1; i<=cnt; i++){
					
// 					if(value == $("#seat_"+i).val()){ // 선택한 좌석이랑 입력되어 있는 좌석이랑 같으면 삭제
						
// 						$("#seat_"+i).val("");
// 					} // if
// 				} // for
				
// 			} // if else



		
	});
	
	$("#select_seat").click(function(){
		
		let seat = $(".bg").attr('value');
		$(opener.document).find("#Seat_Num").val(seat);
		self.close();
	});
	
// 	$(".select_seat").click(function(){
// 		alert("22222");
// 		$(this).toggleClass('bg');
// 		alert($(this).hasClass('bg'));
// 		let value = $(this).attr('value');
// 		alert("선택하신 좌석은 :" value "입니다.");
// 	});
	
// 	$("#select_seat").click(function(){
// // 		alert($(window.opener).find("#Seat_Num").text());
// 		let seat = $(".bg").attr('value');
// 		alert(seat);
// // 		$("#Seat_Num",opener.document).val(seat); // jQuery 방식 1
// 		$(opener.document).find("#Seat_Num").val(seat);
// 		self.close();
// 	});


	
});


</script>
</head>
<body>
<div class="container-fluid">
<%-- ${seat } --%>
	
	
			<div style="width: 80%; height: 300px;margin: auto;">
			<div style="text-align: center; width: 100%; height: 65px; background: DodgerBlue; padding-top: 15px;border-top-left-radius: 10px;border-top-right-radius: 10px;">
			<strong style="font-size: 25px; color: white;">사전  좌석  예약</strong>
			</div>
			<div style="width: 100%; height: 150px;">
		
			
				<div class="flight_info pull-left"
					style="width: 100%; text-align: center; height: 100%; float: left; border-bottom-left-radius: 10px; border-bottom-right-radius: 10px;">
			<div class="info_flight" style="height: 68%;">
					<div style="height: 40%; margin-top: 4px;">
						 <div class="sTime_info pull-left" style="width: 25%;height:100%;float: left;"> ${FS.sTime } </div>
						 <div id="LT_info_icon" style="width: 50%; height: 100%; float: left;"> 
						 <div class="LT_info center" style="width:100%; height: 100%;">소요시간: ${FS.leadTime } </div> 
						 </div> 
						<div class="eTime_info pull-right" style="width: 25%;float: left;"> ${FS.eTime } </div>
					</div>
					<div class="station_info" style="width: 100%;">
					<div style="width: 25%; float: left;">
						<span class="s_station pull-left"  style="text-align: left; margin-left: 130px;">${FS.startStation }</span> 
					</div>
					<div style="width: 50%; float: left;">
					<i class="fi fi-rr-arrow-alt-right" style="width: 100%"></i>
					</div>
					<div style="width: 25%; float: left;">
     				    <span class="e_station pull-right" style="text-align: right; margin-right: 130px;">${FS.endStation }</span>
					</div>
					</div>
					<input type="hidden" id="flno" name="flno" value="${FS.flightNo }">
					</div>
					<div class="detail_btn" style="height:29%; width: 100%; float: left; background: #eee; border-radius: 10px; padding-top: 10px;">
						<span class="FlightNo pull-left" style="margin-left: 110px;">항공편 번호 : ${FS.flightNo }</span> 
		
</div>
			</div>
			
			</div>
			<div>

<div id="seat_selector" style="margin-top: 100px;">
 <div class="panel-group" style="width: 150px;">
    <div class="panel panel-primary">
      <div class="panel-heading" style="background: DodgerBlue">좌석 선택</div>
      <div class="panel-body">
      <c:forEach begin="1" end="${param.People}">
<c:set var="cnt" value="${cnt+1 }"></c:set>
<div class="seat_seat">
<div>
<label>좌석 ${cnt} :</label>
</div>
<div>
<input id="seat_${cnt}"style="width: 100%;">
</div>
</div>

</c:forEach>
<button class="btn btn-default pull-right" id="select_seat" style="margin-top: 15px;">좌석등록</button>
      
      </div>


</div>
			
			</div>
			
		</div>
		
			</div>
		
			</div>
		
			</div>
		
			<div class="container" id="seat">
		
			
			<div>
			
		
	<%
	
	List<String> list = new ArrayList<>();
	
	list = (List<String>)request.getAttribute("seat"); %>			
			
	<div id="seat1" style="text-align: right; width: 140px; margin-left: 265px;; margin-top: 45px;float: left;">
		
			<%
			int numL = 2;
			int cntL = 0;
			int alphabetL;
			int iL;
			for ( iL = 1; iL <= numL; iL++ ) {
				for ( alphabetL = 64+iL; cntL <= iL ; cntL++) {
					
					
				} %>
	        <span class="seat seat_ALP" style="width: 50px;height: 50px; margin-right: 25px; margin-left: 22px;"><%= (char)alphabetL %></span>
			<%} %>
		<br/>
		
		
			<% for(int r=1;r<=17;r++){ %>
					
					<%
						

			
			for ( iL = 1; iL <= numL; iL++ ) {
				
				for ( alphabetL = 64+iL; cntL <= iL ; cntL++) {
					
					
					
					
				} %>
				
				
				
				<%
					if(list !=null && list.contains((char)alphabetL+""+r)){
				
				%>
				
					<button disabled="disabled" class="btn btn-default seat no_seat" style="width: 45px;height: 45px; margin-top: 10px; margin-right: 10px; font-size: 5px;" value="<%=(char)alphabetL %><%=r %>"><%=(char)alphabetL %><%=r %></button>
				<%
					} else{
				%>
				
					<button class="btn btn-default seat select_seat" style="width: 45px;height: 45px; margin-top: 10px; margin-right: 10px; font-size: 5px;" value="<%=(char)alphabetL %><%=r %>"><%=(char)alphabetL %><%=r %></button>
					
					<% } %>
					
					
					
				<% } %>
					
				
				<br>
				<%} %>
			<br>
			
		
	</div>
	
	<div id="number_1" style="float: left; text-align: center; margin-top: 78px;">
		

			
			<% for(int r=1;r<=17;r++){ %>
			<div style="margin-top: 10px; width: 40px; height:45px;;">
					<span class="num_1" style="font-size: 11px;"><%=r %></span>
			</div>
				
			
				<%} %>
	
	
	</div>
	
	
	<div class="seat_2" style="text-align: left; width: 235px; margin-left: 10px; margin-top: 45px;float: left;">
		
		<%
			int numM = 4;
			int cntM = 0;
			int alphabet_M;
			int iM;
			for ( iM = 1; iM <= numM; iM++ ) {
				for ( alphabet_M = 64+iM+numL; cntM <= iM ; cntM++) {
					
				
				} %>
	        <span class="seat seat_no" style=" width: 45px; height:45px; margin-left: 18px; margin-right: 28px;"><%= (char)alphabet_M %></span>
			<%} %>
		<br/>
			<% for(int r=1;r<=17;r++){ %>
					<%
			
			for ( iM = 1; iM <= numM; iM++ ) {
				for ( alphabet_M = 64+iM+numL; cntM <= iM ; cntM++) {
					
				
				} %>
							<%
					if(list !=null && list.contains((char)alphabet_M+""+r)){
				
				%>
				
					<button disabled="disabled" class="btn btn-default seat no_seat" style="width: 45px;height: 45px; margin-top: 10px; margin-right: 10px; font-size: 5px;" value="<%=(char)alphabet_M %><%=r %>"><%=(char)alphabet_M %><%=r %></button>
				<%
					} else{
				%>
				
					<button class="btn btn-default seat select_seat" style="width: 45px;height: 45px; margin-top: 10px; margin-right: 10px; font-size: 5px;" value="<%=(char)alphabet_M %><%=r %>"><%=(char)alphabet_M %><%=r %></button>
					
					<% } %>
				<%} %>
					
				
				<br>
				<%} %>
			<br>
	
	</div>
	
		
	<div id="number_2" style="float: left; text-align: center; margin-top: 78px;">
		

			
			<% for(int r=1;r<=17;r++){ %>
			<div style="margin-top: 10px; width: 40px; height:45px;">
					<span class="num_1" style="font-size: 11px;"><%=r %></span>
			</div>
				
			
				<%} %>
	
	
	</div>
	
		
	<div class="seat_3" style="text-align: left; width: 120px; margin-left: 10px; margin-top: 45px; float: left;">
		
		<%
			int numR = 2;
			int cntR = 0;
			int alphabet_R;
			int iR;
			for ( iR = 1; iR <= numR; iR++ ) {
				for ( alphabet_R = 64+iR+numL+numM; cntR <= iR ; cntR++) {
					
				
				} %>
	        <span class="seat seat_no" style=" width: 45px; height:45px; margin-left: 18px; margin-right: 25px;"><%= (char)alphabet_R %></span>
			<%} %>
		<br/>
			<% for(int r=1;r<=17;r++){ %>
					<%
			
			for ( iR = 1; iR <= numR; iR++ ) {
				for ( alphabet_R = 64+iR+numL+numM; cntR <= iR ; cntR++) {
					
				
				} %>
								<%
					if(list !=null && list.contains((char)alphabet_R+""+r)){
				
				%>
				
					<button disabled="disabled" class="btn btn-default seat no_seat" style="width: 45px;height: 45px; margin-top: 10px; margin-right: 10px; font-size: 5px;" value="<%=(char)alphabet_R %><%=r %>"><%=(char)alphabet_R %><%=r %></button>
				<%
					} else{
				%>
				
					<button class="btn btn-default seat select_seat" style="width: 45px;height: 45px; margin-top: 10px; margin-right: 10px; font-size: 5px;" value="<%=(char)alphabet_R %><%=r %>"><%=(char)alphabet_R %><%=r %></button>
					
					<% } %>
				<%} %>
					
				
				<br>
				<%} %>
			<br>
	
	</div>
	
	
	
	
			</div>
		
			<div style="margin-top: 1180px;">
	<div id="seat4" style="text-align: right; width: 140px; margin-left: 265px;; margin-top: 45px; float: left;">
		
	
		
			<% for(int r=17;r<=30;r++){ %>
					<%
			
			for ( iL = 1; iL <= numL; iL++ ) {
				for ( alphabetL = 64+iL; cntL <= iL ; cntL++) {
					
				
				} %>
										<%
					if(list !=null && list.contains((char)alphabetL+""+r)){
				
				%>
				
					<button disabled="disabled" class="btn btn-default seat no_seat" style="width: 45px;height: 45px; margin-top: 10px; margin-right: 10px; font-size: 5px;" value="<%=(char)alphabetL %><%=r %>"><%=(char)alphabetL %><%=r %></button>
				<%
					} else{
				%>
				
					<button class="btn btn-default seat select_seat" style="width: 45px;height: 45px; margin-top: 10px; margin-right: 10px; font-size: 5px;" value="<%=(char)alphabetL %><%=r %>"><%=(char)alphabetL %><%=r %></button>
					
					<% } %>
					
				<%} %>
					
				
				<br>
				<%} %>
			<br>
			
		
	</div>
	
	<div id="number_3" style="float: left; text-align: center; margin-top: 60px;">
		

			
			<% for(int r=17;r<=30;r++){ %>
			<div style="margin-top: 10px; width: 40px; height:45px;">
					<span class="num_1" style="font-size: 11px;"><%=r %></span>
			</div>
				
			
				<%} %>
	
	
	</div>
	
	
	<div class="seat_5" style="text-align: left; width: 235px; margin-left: 10px; margin-top: 45px; float: left;">


			<% for(int r=17;r<=30;r++){ %>
					<%
			
			for ( iM = 1; iM <= numM; iM++ ) {
				for ( alphabet_M = 64+iM+numL; cntM <= iM ; cntM++) {
					
				
				} %>
									<%
					if(list !=null && list.contains((char)alphabet_M+""+r)){
				
				%>
				
					<button disabled="disabled" class="btn btn-default seat no_seat" style="width: 45px;height: 45px; margin-top: 10px; margin-right: 10px; font-size: 5px;" value="<%=(char)alphabet_M %><%=r %>"><%=(char)alphabet_M %><%=r %></button>
				<%
					} else{
				%>
				
					<button class="btn btn-default seat select_seat" style="width: 45px;height: 45px; margin-top: 10px; margin-right: 10px; font-size: 5px;" value="<%=(char)alphabet_M %><%=r %>"><%=(char)alphabet_M %><%=r %></button>
					
					<% } %>
				<%} %>
					
				
				<br>
				<%} %>
			<br>
	
	</div>
	
		
	<div id="number_4" style="float: left; text-align: center; margin-top: 60px;">
		

			
			<% for(int r=17;r<=30;r++){ %>
			<div style="margin-top: 10px; width: 40px; height:45px;">
					<span class="num_1" style="font-size: 11px;"><%=r %></span>
			</div>
				
			
				<%} %>
	
	
	</div>
	
		
	<div class="seat_6" style="text-align: left; width: 120px; margin-left: 10px; margin-top: 45px;float: left;">
		
	
			<% for(int r=17;r<=30;r++){ %>
					<%
			
			for ( iR = 1; iR <= numR; iR++ ) {
				for ( alphabet_R = 64+iR+numL+numM; cntR <= iR ; cntR++) {
					
				
				} %>
									<%
					if(list !=null && list.contains((char)alphabet_R+""+r)){
				
				%>
				
					<button disabled="disabled" class="btn btn-default seat no_seat" style="width: 45px;height: 45px; margin-top: 10px; margin-right: 10px; font-size: 5px;" value="<%=(char)alphabet_R %><%=r %>"><%=(char)alphabet_R %><%=r %></button>
				<%
					} else{
				%>
				
					<button class="btn btn-default seat select_seat" style="width: 45px;height: 45px; margin-top: 10px; margin-right: 10px; font-size: 5px;" value="<%=(char)alphabet_R %><%=r %>"><%=(char)alphabet_R %><%=r %></button>
					
					<% } %>
				<%} %>
					
				
				<br>
				<%} %>
			<br>
	
	</div>
	
	
	
	
			</div>
			
			



			

			
	</div>
	<div>
<%-- <c:forEach items="${seat }" var="vo"> --%>
<%-- 	<input type="hidden" id="seatInf" value="${vo.seatInf }">			 --%>
<%-- </c:forEach> --%>
	</div>
	<input id="people" type="hidden" value="${param.People}">


</body>
</html>