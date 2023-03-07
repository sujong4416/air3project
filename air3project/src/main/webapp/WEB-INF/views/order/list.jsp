<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 내역</title>
<script type="text/javascript">
$(function(){
	
	
	// 게시판 한줄을 클릭 이벤트
	$(".dataRow").click(function(){
		let orderNo = $(this).find(".orderNo").text();
		location = "view.do?orderNo=" + orderNo ;
				
	});
	
	
	
});
</script>
</head>
<body>
<h1>주문 내역</h1>
<div class="container">
  <h1>주문 내역</h1>
  <div class="col-md-9 text-right">
  <table class="table">
  <thead>
    <tr  class="success">
      <th>주문번호</th>
      <th>상품명</th>
      <th>주문일자</th>
      <th>총 주문금액</th>
    </tr>
  </thead>
  <tbody>
    <c:forEach items="${list}" var="vo">
      <tr class="dataRow">
      
        <td class="orderNo">${vo.orderNo}</td>
        <td>${vo.orderName}</td>
        <td>${vo.orderDate}</td>
        <td>${vo.totalPrice}</td>
      </tr>
      
    </c:forEach>
  </tbody>
</table></div>
  <div class="row">
<div class="col-md-9 text-right">
		<pageNav:pageNav listURI="list.do" pageObject="${pageObject }" />
	</div>
		
		
	
</div>
</div>
</body>
</html>