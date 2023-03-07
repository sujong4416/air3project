<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니 리스트 </title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<style type="text/css">

.subject_table {
	font-size: 15px;
	line-height: 20px;
	width: 100%;
	text-align: center;
}

 table{
	 	border-collapse: collapse;
	 	width: 100%;
	 	text-align: center;
	 }
.content_total_section{
		    background-color: rgb(240, 245, 245);
	}
.th1{

	width:50%;
}	
	.total_wrap{
			font-size:20px;
			width: 50%;
		    margin: auto;
		    padding: 10px 0 10px 0;	
		}
   .total_wrap td{
				width : 60%;
			}
</style>

<script type="text/javascript">
$(function() {
	  $('.update-quantity').click(function() {
	    var cartNo = $(this).data('cartno');
	    var newQuantity = prompt("변경할 수량을 입력하세요.", "");

	    if (newQuantity != null) {
	      $.ajax({
	        url: '/cart/update.do',
	        type: 'POST',
	        data: {cartNo: cartNo, quantity: newQuantity},
	        success: function(result) {
	          /* 수량 변경이 성공했을 때 처리 */
	          location.reload();
	        },
	        error: function(xhr, status, error) {
	          /* 에러 처리 */
	          alert('수량 변경에 실패하였습니다.');
	        }
	      });
	    }
	  });
	});//

</script>
<script type="text/javascript">
$(document).ready(function(){
	  // 전체 선택 체크박스 클릭 이벤트
	  $('.all_check').click(function() {
	    // 전체 선택 체크박스의 상태에 따라 모든 개별 체크박스 선택/해제
	    $('.checkbox').prop('checked', $(this).prop('checked'));
	    /* 체크여부에따른 종합 정보 변화 */
	    setTotalInfo($(".cart_info_td"));
	  });

	  // 개별 체크박스 클릭 이벤트
	  $('.checkbox').click(function() {
	    // 개별 체크박스의 상태에 따라 전체 선택 체크박스 선택/해제
	    if ($('.checkbox:checked').length === $('.checkbox').length) {
	      $('.all_check').prop('checked', true);
	    } else {
	      $('.all_check').prop('checked', false);
	    }
	    /* 체크여부에따른 종합 정보 변화 */
	    setTotalInfo($(".cart_info_td"));
	  });
	  
	  function setTotalInfo(cartInfoTd) {  
	//체크박스 전체 갯수
	  let totalCnt = $('.checkbox:checked').length;
	  $('#total_cnt_span').text(totalCnt);
	//  alert(totalCnt);
	
	  //체크박스 선택 총 금액 
	  let totalPrice = 0;
		$('.checkbox:checked').each(function() {
		  var cartNo = $(this).val();
		  var price = parseInt($(this).closest('.dataRow').find('.td_total_price').text().replace(/[^0-9]/g, ''));
		  totalPrice += price;
		});


		//총 가격 
		$('#total_price_span').text(totalPrice);
	//  alert(totalPrice);
	  }
	
		
	  
});// end of function
</script>


</head>
<body>
<div class="container">
<h1>장바구니</h1>
<div class="all_check_input_div">
			<input type="checkbox" class="all_check"
				checked="checked"><span class="all_check_span">전체선택</span>
				</div>
				
<table class="subject_table">
    <tbody>
        <tr>
            <th></th>
            <th></th>
            <th class="th1" style="text-align: center;">상품명</th>
            <th class="th2">가격</th>
            <th>수량</th>
            <th style="text-align: left;">합계</th>
            
            <th></th>
        </tr>
    </tbody>
</table>
	
		<form action="cartOrder.do" method="post" id="cartOrderForm">
	<table>
	<tbody>
		<!-- 데이터 있는 만큼 반복문 처리 -->
		<c:forEach items="${list }" var="vo">
			<tr class="dataRow">
			
				<td class="cart_info_td"><input type="checkbox" name ="cartNo[]" type="checkbox" checked="checked" value="${vo.cartNo }" readonly
				class="checkbox"></td>
			
				<td><img style="width:40px; height:40px" src="${vo.img }"></td>
				<td>${vo.name }</td>
				<td>판매가:<span>${(vo.price)}원</span></td>
				<td>${vo.quantity}개</td>
				<td>
				  <a href="#" data-cartno="${vo.cartNo}" class="update-quantity">수량변경</a>
				</td>


				<td class="td_total_price">${vo.price*vo.quantity}원</td>
				<td><a href="delete.do?cartNo=${vo.cartNo }" class="btn btn-default deleteBtn">삭제</a></td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<!-- 	
		
		<!--   아래 가격 정보 보는 표 -->
  <div class="content_total_section">
		<div class="total_wrap">
			<table>
				<tr>
					<td>
						<table>
							<tr>
								<td>총 주문 상품수</td>
								<td><span id="total_cnt_span"></span> 개</td>
							</tr>
							<tr>
								<td><strong>총 주문 가격</strong></td>
								<td><span id="total_price_span"></span> 원</td>
							</tr>
						</table>
						
					</td>
				</tr>
			</table>
		</div>
	</div>	
		<div class="col-md-12" style="margin-left:10px;">
            <button type="submit" class="btn btn-success btn-lg" id="selectCart" class="selectCart">선택한 상품 주문하기</button>
	        </div>
	        </form>
		</div>	
</body>
</html>