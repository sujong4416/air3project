<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
label {
		font-size: 16px;
		  display: inline-block;
		  width: 150px; /* label 너비 조절 */
		  text-align: left;
		  margin-right: 40px;
		  margin-top:10px;
}
input {
	  display: inline-block;
	  width: 200px; /* input 너비 조절 */
}
span{
	font-size: 20px;
		
}
.table{
margin-top:20px;
}
.deliver{
 background-color: rgb(240, 255, 240); 
    padding: 5px;
}
#orderBtn{
}
</style>
<script type="text/javascript">
function clickCheck(target) {
    document.querySelectorAll(`input[type=checkbox]`)
        .forEach(el => el.checked = false);

    target.checked = true;
};


	
		
</script>
</head>
<body>
<h1>주문하기</h1>
<div class="container">
<form action="write.do" method="post" name="orderForm">
 <div class="col-md-12 text-left">
	<label for="productno">상품번호</label>
<span>${list[0].productNo}</span>
  <input type="hidden" id="productno" name="productno" value="${list[0].productNo}"><br>
 
  
  <label for="product">상품명:</label>
  <span>${list[0].productName}</span>
  <input type="hidden" id="productName" name="productName" value="${list[0].productName}"><br>

  <label for="quantity">수량:</label>
  <span>${list[0].quantity}개</span>
  <input type="hidden" id="quantity" name="quantity" value="${list[0].quantity}"><br>

  <label for="totalPrice">총 주문금액:</label>
  <span>${list[0].totalPrice }원</span>
  <input type="hidden" id="totalPrice" name="totalPrice" value="${list[0].totalPrice }"><br>

	<div class="deliver">
  <div>
  <label for="mileage">마일리지</label><br>
	<label for="use" class="mileage-value" style="color:green;">(사용가능마일리지: ${list[2].mileage}원)</label>
	<input type="text" id="mileage" name="mileage">원<br></div>
	
  <label for="PAY">결제방법</label> <select id="PAY" name="PAY">
						<option value="">선택</option>
						<option value="카드결제">카드결제</option>
						<option value="무통장입금">무통장입금</option>
</select><br>
<label for="startcountry">받을곳</label> 
  <select id="orderstatus" name="orderstatus">
			<option value="">선택</option>
			<option value="출발지">출발지</option>
			<option value="도착지">도착지</option> </select><br>
  </div>
  </div>
  <div class="subdiv">
  <table class="table">
  <thead>
    <tr>
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
      
        <td >${vo.flightno}</td>
        <td>${vo.startDate}</td>
        <td>${vo.startStation}</td>
        <td>${vo.endDate}</td>
        <td>${vo.endStation}</td>
        <td>${vo.revNo}<input onclick="clickCheck(this)" name="revNo"type="checkbox" value="${vo.revNo}"></td>
      </tr>
      
    </c:forEach>
  </tbody>
</table>
</div>
<script type="text/javascript">
function orderCheck1() {
var total = parseInt(${list[0].totalPrice });
var mile = document.getElementById('mileage').value;
var totalPrice = total-mile;

	 if (confirm("최종결제금액 : " +totalPrice) == true){    //확인
		 document.getElementById('totalPrice').value = totalPrice;
	     document.orderForm.submit();

	 }else{   //취소

	     return false;

	 };

};
</script>
<button value="주문하기" onclick="orderCheck1()" class="btn btn-success btn-lg">주문</button>

</form>
</div>
</body>
</html>