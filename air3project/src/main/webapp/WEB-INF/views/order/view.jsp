<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문내역</title>
<style type="text/css">
#deleteDiv{
	display: none;
}
</style>
<script type="text/javascript">
$(function() {
  $('.update-orderStatus').click(function() {
    var orderNo = $(this).data('orderno');
    var newStatus = prompt("도착지,출발지 선택하세요.", "");

    if (newStatus != null) {
      $.ajax({
        url: '/order/update.do',
        type: 'POST',
        data: {orderNo: orderNo, orderStatus: newStatus},
        success: function(result) {
          /* 상태 변경이 성공했을 때 처리 */
          location.reload();
        },
        error: function(xhr, status, error) {
          /* 에러 처리 */
          alert('상태 변경에 실패하였습니다.');
        }
      });
    }
  });
});
</script>

</head>
<body>
<div class="container">
	<h1>주문 내역</h1>
<!-- 	<form action="update.do" method="post" id="updateForm"> -->
	<table class="table">
		<tbody>
			<tr>
				<th>주문번호</th>
				<td>${vo.orderNo }</td>
			</tr>
			<tr>
				<th>이미지</th>
				<td><img alt="상품이미지" src="${vo.img }"></td>
			</tr>
			
			<tr>
				<th>상품명</th>
				<td>${vo.name }</td>
			</tr>
			<tr>
				<th>주문날짜</th>
				<td>${vo.orderDate }</td>
			</tr>
			
			<tr>
				<th>총결제금액</th>
				<td>${vo.totalPrice }</td>
			</tr>
			<tr>
				<th>결제방법</th>
				<td>${vo.pay }</td>
			</tr>
			<tr>
		  <th>받는곳</th>
		  <td>${vo.orderStatus} <a href="#" data-orderno="${vo.orderNo}" class="update-orderStatus">받을곳 변경</a></td>
	
		</tr>
			<tr>
				<th>예약정보</th>
				
			</tr>
			
			<tr>
				<th>출발시간</th>
				<td>${vo.startDate }</td>
			</tr>
			
			<tr>
				<th>출발지</th>
				<td>${vo.startStation }</td>
			</tr>
			<tr>
		

		</tr>

		</tbody>
	</table>

	<a href="delete.do?orderNo=${vo.orderNo }&mileage=${vo.usemileage }" class="btn btn-default" id="deleteBtn">주문취소</a>
	
	
<!-- </form> -->
</div>
</body>
</html>