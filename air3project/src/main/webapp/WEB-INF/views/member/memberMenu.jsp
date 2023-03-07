<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

.menuBtn {
  display: flex; /* 가로 정렬 */
  justify-content: space-between; /* 좌우 간격을 균등하게 */
  align-items: center; /* 세로 가운데 정렬 */
  margin-top: 30px; /* 위쪽 여백 */
/*   background-color: #f5f5f5; /* 배경색 */ */
  padding: 20px; /* 안쪽 여백 */
}

.menuBtn-1 {
  flex: auto; /* 버튼 너비를 균등하게 */
  height: 3em; /* 버튼 높이 */
  border: none; /* 테두리 없음 */
  background-color: #004080; /* 배경색 */
  color: white; /* 글자색 */
  font-size: 24px; /* 폰트 크기 */
  font-weight: bold; /* 글자 굵기 */
  letter-spacing: 2px; /* 글자 간격 */
  cursor: pointer; /* 포인터 모양으로 */
  transition: background-color 0.3s; /* 배경색 변경 시 부드럽게 */
  vertical-align: middle;
}
.menuBtn-2 {
  flex: auto; /* 버튼 너비를 균등하게 */
  height: 3em; /* 버튼 높이 */
  border: none; /* 테두리 없음 */
  background-color: #1d80e2; /* 배경색 */
  color: white; /* 글자색 */
  font-size: 24px; /* 폰트 크기 */
  font-weight: bold; /* 글자 굵기 */
  letter-spacing: 2px; /* 글자 간격 */
  cursor: pointer; /* 포인터 모양으로 */
  transition: background-color 0.3s; /* 배경색 변경 시 부드럽게 */
  vertical-align: middle;
}

h1 {
  color: #004080; /* 글자색 */
  font-size: 32px; /* 폰트 크기 */
  font-weight: bold; /* 굵게 */
  text-align: center; /* 가운데 정렬 */
  margin-top: 50px; /* 위쪽 여백 */
}
h3 {
  color: black; /* 글자색 */
  font-size: 16px; /* 폰트 크기 */
  font-weight: bold; /* 굵게 */
  text-align: center; /* 가운데 정렬 */
  margin-top: 50px; /* 위쪽 여백 */
}
.button-wrapper {
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
  gap: 10px;
}

.button-wrapper button {
  flex: 1 0 calc(33.33% - 10px);
/*   background-color: #004080; */
  color: #fff;
  padding: 10px;
  border: none;
  font-size: 16px;
  cursor: pointer;
}
.menuBtn-1:hover{
	background: lightblue;
}
.menuBtn-2:hover{
	background: lightblue;
}
.path {
 margin-top:15px;

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

$(function(){
	
	$("#memberBtn").click(function(){
		location="/member/view.do";
	});
	
	$("#reservationBtn").click(function(){
		location="/reservation/list.do";
	});
	
	$("#orderBtn").click(function(){
		location="/order/list.do";
	});
	
	$("#cartBtn").click(function(){
		location="/cart/list.do";
	});
	
// 	$("#mileageBtn").click(function(){
// 		location="/mileage/info.do";
// 	});
	
	$("#logoutBtn").click(function(){
		location="/member/logout.do";
	});
	
	$("#mileageSave").click(function(){
		location="/mileage/info.do";
	});
	
	$("#mileageView").click(function(){
		location="/mileage/view.do";
	});
	
	$("#mileageDetail").click(function(){
		location="/mileage/viewDetail.do";
	});
	
});

</script>

</head>
<body>
<div class="container">
	<div class="path">
	  <span>Home</span>
	  <span>마이 페이지</span>
	</div>
	<h1>마이 페이지</h1>
	<h3>${login.name} 회원님 환영합니다!</h3>
	<div class="menuBtn button-wrapper">
		<button class="btn menuBtn-1" id="memberBtn">회원정보</button>
		<button class="btn menuBtn-1" id="reservationBtn">예약정보</button>
		<button class="btn menuBtn-1" id="orderBtn">주문정보</button>
		<button class="btn menuBtn-1" id="cartBtn">장바구니</button>
		<button onclick="showButtons();" class="btn menuBtn-1" id="mileageBtn">마일리지</button>
		<button class="btn menuBtn-1" id="logoutBtn">로그아웃</button>
		<button class="btn menuBtn-2 hiddenBtn" style="display: none;" id="mileageSave">마일리지 적립신청</button>
		<button class="btn menuBtn-2 hiddenBtn" style="display: none;" id="mileageView">마일리지 현황</button>
		<button class="btn menuBtn-2 hiddenBtn" style="display: none;" id="mileageDetail">마일리지 상세조회</button>
	</div>
    </div>
        <script>

      function showButtons() {
        var buttons = document.getElementsByClassName("hiddenBtn");
        
        for (var i = 0; i < buttons.length; i++) {
           
        	if (buttons[i].style.display === "none") {
        		
                buttons[i].style.display = "block";
                
              } else {
            	  
                buttons[i].style.display = "none";
             }
        }
      }
    </script>
</body>
</html>