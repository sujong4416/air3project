<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#client_info{
width: 100%;
float: left;
border: 1px solid #eee;
display: none;

}

#name, #gender_birth, #member_ship{
width: 100%;
height: 120px;
padding: 12px;;
border-bottom: 1px solid #eee;
}

#gender, #birth{
width: 45%;
height: 100%;
}

#Fname, #Lname, #Air_line , #tel_no, #email{
width: 45%;
height: 80%;
}

#Fname, #gender, #men, #tel_no{
float: left;

}

#Lname, #birth , #woman, #email{

float: right;
}

#client1{
width: 100%;
height: 60px;
margin-top: 50px;
background: #004080;
color: white;

}
#tel_email_info{
width: 100%;
height: 60px;
margin-top: 20px;

color: white;

}



.St_FL_info {
	text-align: center;
	height: 160px;
	margin-top: 30px;
}

.sTime_info, .eTime_info {
	width: 25%;
	height: 100%;
	font-size: 25px;
    border: 1px solid #eee;
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



.bg {
	background-color: #888;
	border: 1px solid #666666;
}
label, input{
margin-top: 6px;
}
</style>

<script type="text/javascript">
$(function(){
	
	$('document').ready(function(){
		
		$("#client_info").show();
		
	});
	
	
	$("#c_info_check").click(function() {
		
		       $("#client_info").slideUp();
		
		});
	$("#c_info_toggle").click(function() {
		
		       $("#client_info").slideDown();
		
		});
	
	$("#c_info_check").click(function() {
		
		       $("#client_info").slideUp();
		
		});
	$("#c_info_toggle").click(function() {
		
		       $("#client_info").slideDown();
		
		});
	
	
  	$("#seat_btn").click(function(){
  		let cNo = $("#cno").val();
  		alert(cNo);
  		
  		window.open('/seat/seat.do?cNo='+ cNo + '&People=${param.people}&Flno=${param.Flno}', 'seat','width=1920, height=1080, left=300, top=200status=no, scrollbars=yes , resizable=no');
  		
  	});

	});   
	    

	         	
	
</script>

</head>
<body>
<c:set var = "frist" value = "${mview.name}"/>
<c:set var = "Fname" value = "${fn:substring(frist, 0, 1)}" />
<c:set var = "last" value = "${mview.name}"/>
<c:set var = "Lname" value = "${fn:substring(last, 1, 3)}" />
<div class="container">
	<h1>서비스 정보 등록</h1>
<input type="hidden" value="${param.Flno }">

<div style ="height: 150px; width: 100%">
			
				<div class="flight_info pull-left"
					style="width: 100%; text-align: center; height: 100%; float: left; margin-top: 30px; border-radius: 10px;">
			<div id="location_div" style="height: 68%;">
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
						<span class="FlightNo pull-left" style="margin-left: 110px; color: white;">항공편 번호 : ${view.flightNo }</span> 
						<input type="hidden" id="flno" name="flno" value="${view.flightNo }">							
				        <span class="detail_view pull-right" style="margin-right: 110px; color: white;">상세보기</span>
					</div>
			</div>
</div>


	
	
	<form action="write.do" method="post"  id="writeForm">
	<div style="width: 100%; height: 100%">
	<div>
	<div id="client1">
	<div style="width: 80%; height: 100%; float: left;">
	<h3 style="margin-left: 15px; font-size: 20px;  margin-top: 15px;">고객1</h3>
	</div>
	<div style="width: 20%; height: 100%; float: left;">
	<button class="btn btn-default pull-right" id="c_info_toggle" type="button"
	 style="margin-right: 15px; margin-top: 15px; height: 30px;">내리기</button>
	</div>
	</div>
	<div >
	<div id="client_info">
	<div id="name">
	<div id="Fname">
	<label for="firstName">승객 성</label><br/>
	<input name="id" value="${Fname }" style="height: 45px; width: 100%;">
	</div>
	<div id="Lname">
	<label for="lastName">승객 이름</label><br/>
	<input name="id" value="${Lname }" style="height: 45px; width: 100%;">
	</div>
	</div>
	<div id="gender_birth">
<div id="gender">
	<label for="lastName">고객 성별</label><br/>
	<input name="id" value="${mview.gender }" style="height: 45px; width: 100%;">
	</div>
	<div id="birth">
	<label for="birth">생년월일</label><br/>
	<input name="birth" value="${mview.birth }" style="height: 45px; width: 100%;">
	</div>
	</div>
	<div class="btn_group pull-right" style="margin-top: 20px; height: 60px;">
		<button class="btn btn-default" type="button" id="c_info_check" style="height: 40px; margin-bottom: 20px; margin-right: 15px;">확인</button>
		</div>
	</div>
	
	
	</div>
	</div>
	<div>

	<div id="tel_email_info">
	<div style="width: 80%; height: 100%; background: #004080; float: left;">
	<h3 style="margin-left: 15px; font-size: 20px;  margin-top: 15px;">연락처 정보</h3>
	</div>
	<div style="width: 20%; height: 100%;background: #004080; float: left;">
	<button class="btn btn-default pull-right" id="t_info_toggle" type="button"
	 style="margin-right: 15px; margin-top: 15px;  height: 30px;">내리기</button>
	</div>
	</div>
	
	<div id="telemail_info">
	<div id="tel">
	<div id="tel_no">
	<label for="telno">전화번호</label><br/>
	<input name="telno" value="${Lname }" style="height: 45px; width: 100%;">
	</div>
	<div id="email">
	<label for="email">이메일</label><br/>
	<input name="email" value="${mview.email1 }@${mview.email2}" style="height: 45px; width: 100%;">
	</div>

	<input type="hidden" id="cno" name="cno" value="${view.cNo }">
	<div class="btn_group pull-right" style="margin-top: 20px; height: 60px; width: 100%;">
		<button class="btn btn-default pull-right" type="button" id="c_info_check" style="height: 40px; margin-bottom: 20px; margin-right: 15px;">확인</button>
		</div>
	</div>
	<div style="width: 100%; height: 100px;">
	<div style="width: 45%; height: 100%;">
	<div>
	<label>좌석</label>
	<input id="Seat_Num">
	</div>
	<div style="width: 100%; height: 100%; float: left; text-align: center;">
	<a type="button" class="btn btn-default" id="seat_btn" style="width:100%; height: 100%;">등록</a>
	</div>
	</div>
	<div style="width: 45%; height: 100%; float: right; text-align: center;">
	<button class="btn btn-default" style="width:100%; height: 100%;">기내식 선택</button>	
	</div>
	</div>
	</div>
	</div>
	<div class="btn_group pull-right" style="margin-top: 30px;">
		<button class="btn btn-default">등록</button>
		<button class="btn btn-default" type="reset">새로입력</button>
		<button class="btn btn-default" type="button" id="cancelBtn">취소</button>
	</div>
</div>
	</form>
</div>
</body>
</html>