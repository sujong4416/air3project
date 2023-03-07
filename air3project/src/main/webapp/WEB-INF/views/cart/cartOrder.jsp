<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문준비</title>
<script type="text/javascript">
	
</script>
<style>
input{
	border:none;
}
.subject_table {
	font-size: 14px;
	line-height: 20px;
	width: 100%;
	text-align: center;
}
.deliver{
 background-color: rgb(240, 245, 245); 
    padding: 5px;
}
.total_div{
	font-size: 20px;
	line-height: 50px;
	width: 100%;
	text-align: left;
	padding: 5px;
}
</style>
<script>
    // 하나 입력 시 동시에 입력되게 한다.
    $("a").change(function(){
        $('b').val($(this).val());
    });
    
</script>
<script>
script type="text/javascript">
function clickCheck(target) {
    document.querySelectorAll(`input[type=checkbox]`)
        .forEach(el => el.checked = false);

    target.checked = true;
};
	
</script>
<script type="text/javascript">
//cartNo와 totalPrice의 값을 가져와서 합계를 계산하는 함수
function calculateTotalPrice() {
  var totalPrice = 0;
  $('input[name="totalPrice[]"]').each(function() {
    totalPrice += parseInt($(this).val());
  });
  return totalPrice;
}

// 페이지 로드 시 합계를 계산하여 출력
$(document).ready(function() {
  var totalPrice = calculateTotalPrice();
  $('#total_price_span').text(totalPrice + '원');
});

// cartNo나 totalPrice의 값이 변경될 때마다 합계를 다시 계산하여 출력
$('input[name="cartNo[]"], input[name="totalPrice[]"]').change(function() {
  var totalPrice = calculateTotalPrice();
  $('#total_price_span').text(totalPrice + '원');
});

</script>
<script type="text/javascript">

	  function orderCheck() {
	    // 총 주문 금액 가져오기
	   var total = parseInt($('#total_price_span').text());
	   
	    // 마일리지 가져오기
	    var mileage = parseInt(document.getElementById('mileage').value);
	    var totalPrice = total-mileage;
	   
	    if (confirm("최종결제금액 : " + totalPrice) == true) {
	      // 확인 버튼을 클릭한 경우
	      document.getElementById('totalPrice').value = totalPrice;
	      document.buyAllForm.submit();
	     	      
	    } else {
	      return false;
	    };
	
	  }
	

</script>

</head>
<body>
	<h1>주문하기</h1>
	<form action="buyAll.do" method="post" id="buyAllForm">
		
	<table class="table">
		<tbody>
			<tr>
				<th></th>
				<th></th>
				<th></th>
				<th>상품명</th>
				<th>수량</th>
				<th>가격</th>
				<th>합계</th>

			</tr>
		</tbody>
</table>
		<table class="subject_table">
		<tbody>
			<!-- 데이터 있는 만큼 반복문 처리 -->
				<c:forEach items="${list[0] }" var="vo">
					<tr class="dataRow">

						<td><input type="hidden" name="cartNo[]" value="${vo.cartNo }" readonly></td>
						<td><input type="hidden" name="productNo[]" value="${vo.productNo }" readonly></td>
						
						<td><img style="width: 40px; height: 40px" src="${vo.img }"></td>
						<td><input name="name[]" value="${vo.name }" readonly></td>
						<td><input type="hidden" name="quantity[]" value="${vo.quantity }" readonly>
						 <span>${vo.quantity}개</span>
						</td>
						<td><input type="hidden" name="price[]" value="${vo.price }" readonly>
						<td>판매가:<span>${(vo.price)}원</span>
						</td>
						<td><input type="hidden" name="totalPrice[]" value="${vo.totalPrice}" readonly>
						<td><span>${(vo.totalPrice)}원</span>
						

						</td>
					</tr>
				</c:forEach>
		</tbody>
	
	</table>
			<div class="total_div">
				<strong>총 주문 가격 :</strong>
 				<input type="number" id="totalPrice" name="totalPrice" value=${vo.totalPrice }><br>
				<span id="total_price_span"></span>
			</div>
	
	<div class="deliver">
  <div>
  <label for="mileage">마일리지</label><br>
	<label for="use" class="mileage-value" style="color:green;">
	(사용가능마일리지: ${login.mileage}원)</label>
	<input type="text" id="mileage" name="mileage">원<br></div>
	
				  <label for="PAY">결제방법</label> 
				  <select id="PAY" name="PAY">
						<option value="">선택</option>
						<option value="카드결제">카드결제</option>
						<option value="무통장입금">무통장입금</option>
				</select><br>
	
				<label for="orderstatus">받을곳</label> 
		 			 <select id="orderstatus" name="orderstatus">
					<option value="">선택</option>
					<option value="출발지">출발지</option>
					<option value="도착지">도착지</option> </select><br>
 				 </div>
	
	<button value="주문하기" onclick="orderCheck()" class="btn btn-success btn-lg">주문하자</button>
	<table class="table">
  <thead>
    <tr  class="success">
      <th>항공편번호</th>
      <th>시작일</th>
      <th>시작공항</th>
      <th>도착일</th>
      <th>도착공항</th>
      <th>예약번호</th>
    </tr>
  </thead>
  <tbody>
    <c:forEach items="${list[1]}" var="vo">
      <tr class="dataRow">
      
        <td >${vo.flightNo}</td>
        <td>${vo.startDate}</td>
        <td>${vo.startStation}</td>
        <td>${vo.endDate}</td>
        <td>${vo.endStation}</td>
        <td>${vo.revNo}<input onclick="clickCheck(this)" type="radio" value="${vo.revNo}" name="revNo"></td>
      </tr>
      
    </c:forEach> 
  </tbody>

</table>

</body>
</html>