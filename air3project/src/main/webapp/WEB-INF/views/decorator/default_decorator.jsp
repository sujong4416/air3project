<!-- sitemesh 사용을 위한 설정 파일 -->
<!-- 작성자 : 강세형	 -->
<!-- 작성일 : 2023-02-20 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="decorator"
	uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>웹짱:<decorator:title /></title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" href="/upload/favicon/favicon (1).ico"
	type="image/x-icon">
<link rel='stylesheet'
	href='https://cdn-uicons.flaticon.com/uicons-regular-rounded/css/uicons-regular-rounded.css'>
<link rel='stylesheet'
	href='https://cdn-uicons.flaticon.com/uicons-solid-rounded/css/uicons-solid-rounded.css'>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script> -->
	
<style type="text/css">

.nav {
	height: 90px;
	border-bottom: 1px solid #666;
	background: white;
	margin-bottom: 0px;
	border-radius: 0px;
}

footer {
	background-color: #004080;
	padding: 25px;
	color: white;
}

/* Hide the carousel text when the screen is less than 600 pixels wide */
@media ( max-width : 1020px) {
	.menu-Btn {
		display: none;
		height: 100%
	}
}

article {
	min-height: 400px;
	margin-bottom: 100px;
	border-top: 1px solid DodgerBlue;
}

#welcome {
	color: grey;
	margin: 0 auto;
}

.q-menu {
	height: 100%;
	padding: 15px;
	width: 30%;
	float: left;
	text-align: center;
}

.fi {
	font-size: 23px;

}

#menu_icon {
	margin-top: 30px;
	height: 30px;
}

.menu_icon {
	float: left;
	height: 90px;
	text-align: center;
}


#customer_service {

	width: 100%;
	display: none;
	position: absolute;
	z-index: 5;
	background: white;
	height: 160px;
	border-bottom: 2px solid DodgerBlue;
	text-align: center;
	

}

.menu {
	width: 110px;
	height: 60px;
	border: none;
	margin-top: 15px;
	font-size: 18px;
}
/* #customer_service{ */
/*  display: none; */
/*  }  */
#img_box {
	height: 85px;
	width: 100%;
	max-width: 200px;
	min-width: 150px;
	float: right;
}

li {
	list-style: none;
padding: 10px;

}

#user_icon:hover {
	cursor: pointer;
}

#memberMenu{
	  border: 0;
  background-color: transparent;
	display: block;
	text-decoration: none;
	color: black;
	height:100%;
	width:100%;
	position:absolut;
}

#footer_nav{
border-radius: 0px;
height: 150px;
background: #004080;
}
.q-menu-c{
font-size: 15px;
color: #666;


}
.q-menu-c > .btn{
border: none;
}
.q-menu-c > .btn:hover{
background: none;
}

.dropdown-menu{
	top:auto;
}
.member{
	margin: 0;
}
#logo:hover, #cartlist:hover{
	cursor: pointer;
}
.member-dropdown{
	text-align: center;
}
.member-li{
	padding:0;
}

</style>

<script type="text/javascript">
	$(function() {

		$(".sss-btn").click(function() {
			location="/reservation/list.do"
		});

	
	
		$(".ccc-btn").click(function() {
			location="/product/list.do"
		});
	
		$(".menu-Btn").mouseenter(function() {
		
			
			$('#customer_service').show().stop();
						  
			      			 	       
		});
			  
		$("#customer_service").mouseleave(function() {
		

			$('#customer_service').slideUp();
			  	  
			      			 	       
		});
		
		
		$(".fff-btn").click(function() {
			location="/image/list.do"
		});
		
		$(".logo").click(function() {
			location="/"
		});
		$(".service_info_btn").click(function() {
			location="/serviceInfo/list.do"
		});
		$("#flight_detail").click(function() {
			location="/craftInf/list.do"
		});
		$("#flight_list").click(function() {
			location="/flightInf/list.do"
		});
		$("#order").click(function() {
			location="/order/list.do"
		});
		
		// 회원관리 이미지 클릭
		$("#user_icon").click(function() {
			if(${login == null}){ // 로그인 안되어 있을 때 로그인 폼으로 이동
				location="/member/login.do";
			} else{ // 로그인 되어있을 떄 회원정보/로그아웃 팝오버 출력
				
			} // end of if else
		});
		
		$("#cartlist").click(function() {
			location="/cart/list.do"
		});
		
		
		

	});
		
</script>
<decorator:head />
</head>
<body>
	<header>


		<div class="nav navbar">
			<div id="first_nav">

				<div class="col-md-3 logo pull-left">
					<div id="img_box">
						<img alt="/upload/favicon/2.PNG" src="/upload/favicon/2.PNG" id="logo"
							style="width: 100%; height: 95%;">
					</div>
				</div>

				<div class="col-md-6 menu-Btn" style="height: 90px;">
					
					<div  style="float: left; width: 30%; text-align: center; margin-top: 30px; margin-left: 5%;">
						<span class="bbb-btn menu"   style="border: none; color: #333;">항공기정보</span>
					</div>
					<div style="float: left; width: 30%; text-align: center; margin-top: 30px;">
						<span class="ccc-btn menu"  style="border: none; color: #333;">쇼핑몰</span>
					</div>
					<div style="float: left; width: 30%; text-align: center; margin-top: 30px;">
						<span class="ddd-btn menu"  style="border: none; color: #333;">고객센터</span>
					</div>

				</div>

				<div class="col-md-3 menu_icon pull-right">
					<div id="menu_icon">
						
						<div id="user_icon" style="float: left; margin-left: 15px;">
							<button id="memberMenu" type="button" data-toggle="dropdown">
								<c:if test="${login == null }">
									<i class="fi fi-rr-user"></i>
								</c:if>

								<c:if test="${login != null }">
									<i class="fi fi-sr-user"></i>
								</c:if>

							</button>
							<c:if test="${login != null }">
								<ul class="dropdown-menu member-dropdown">
									<c:if test="${login != null && login.gradeNo == 9 }">
										<li class="member member-li"><a href="/member/list.do">회원리스트</a></li>
									</c:if>
									<li class="member member-li"><a href="/member/memberMenu.do">마이 페이지</a></li>
									<li class="member member-li"><a href="/member/logout.do">로그아웃</a></li>
									<li class="divider member-li"></li>
									<li class="member member-li"><a href="/mileage/view.do">마일리지</a></li>
     								<li class="member member-li">${login.mileage } 마일</li>
								</ul>
							</c:if>
						</div>
						

						<div style="float: left; margin-left: 35px;">
							<i class="fi fi-rr-tickets-airline"></i>
						</div>

						<div style="float: left; margin-left: 35px;">
							<i class="fi fi-rr-shopping-cart" id="cartlist"></i>
						</div>

						<div style="float: left; margin-left: 35px;">
							<i class="fi fi-rr-search"></i>
						</div>
					</div>
				</div>

			</div>


		</div>
		<div id="customer_service">

		<div id="SubMenu"class="col-md-6" style ="height: 100%;margin-left: 27.3%;">

	
			<div class="q-menu" style="border-left: 1px solid #aaa;">
			
			 		
			<div class="q-menu-c"><span class="btn btn-default service_info_btn" id="flight_list">항공편 현황</span></div>
			<div class="q-menu-c"><span class="btn btn-default service_info_btn"  id="flight_detail">비행기 현황</span></div>
		
			</div>

			
			<div class="q-menu" style="border-left: 1px solid #aaa;">
			
			<div class="q-menu-c"><span class="btn btn-default service_info_btn" id="order">주문정보</span></div>
			
				
			</div>

			
			<div class="q-menu" style="border-left: 1px solid #aaa; border-right: 1px solid #aaa;">
			
					
			<div class="q-menu-c"><span class="btn btn-default service_info_btn">서비스 정보</span></div>
			<div class="q-menu-c"><span class="btn btn-default service_info_btn"  id="flight_detail">자주묻는질문<br>(서비스 예정)</span></div>
			<div class="q-menu-c"><span class="btn btn-default service_info_btn">공지사항<br>(서비스 예정)</span></div>
			
	
				
			</div>

			
		</div>
			

		</div>


	</header>
	<article>
		<decorator:body />
	</article>
	<footer
		class="container-fluid text-center navbar" id="footer_nav">
<span>(주)&nbsp&nbspAir3.co &nbsp&nbsp&nbsp&nbsp대표:&nbsp 이영환&nbsp&nbsp&nbsp&nbsp|&nbsp&nbsp&nbsp&nbsp주소:&nbsp 경기 의정부시 신흥로258번길 25 해태프라자 2층&nbsp&nbsp&nbsp&nbsp|&nbsp&nbsp&nbsp&nbspTel:&nbsp 031-846-5888 </span><br><br>
<span>사업자등록번호:&nbsp&nbsp128-92-30306&nbsp&nbsp&nbsp&nbsp|&nbsp&nbsp&nbsp&nbsp통신판매업신고:&nbsp&nbsp경기 제 23-0307&nbsp&nbsp&nbsp&nbsp|&nbsp&nbsp&nbsp&nbsp개인정보보호책임자:&nbsp&nbsp 이영환 Air3 대표</span>
	</footer>
</body>
</html>