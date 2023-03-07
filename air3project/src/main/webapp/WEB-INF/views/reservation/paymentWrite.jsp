<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>항공권 결제정보 입력</title>
<!-- 구현해야하는 조건들 쭉 선택해서 내려온 조건이 보일것. - 예약자 이름, 출발하는 나라, 도착하는 나라, 좌석, 사용가능한 마일리지  -->
<!-- 결제할때는 카드만 가능하며, 카드종류를 선택하고, 개월수 , 사용가능한 마일리지 안에서만 입력이 가능해야함. 그리고 결제할 금액에서 마일리지를 뺀 금액이 total로 들어감 -->
<style type="text/css">
.table {
	border: 2px solid #0059b3;
	border-radius: 8px;
	padding: 10px;
}

.path {
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

.moveNumber {
	text-align: center;
	width: 40px;
}

input {
	border: 0;
	outline: none;
}

#seat_btn {
	border: 2px solid #0059b3;
}

#ckBtn {
	margin-top: 5px;
	background-color: #0059b3;
	color: white; /* 버튼의 글자색도 바꿔주기 */
	border-color: transparent;
}

#finalBtn {
	margin-top: 5px;
	background-color: #0059b3;
	color: white; /* 버튼의 글자색도 바꿔주기 */
	border-color: transparent;
}

#reSet {
	margin-top: 5px;
	background-color: #0059b3;
	color: white; /* 버튼의 글자색도 바꿔주기 */
	border-color: transparent;
}

#cancelBtn {
	margin-top: 5px;
	background-color: #0059b3;
	color: white; /* 버튼의 글자색도 바꿔주기 */
	border-color: transparent;
}

#mealInfo {
	margin-top: 30px;
	border-bottom: 1px solid #0059b3;
}

#total {
	display: inline-block;
	border-bottom: 1px solid #0059b3;
}
</style>
<script type="text/javascript">
	$(function() {
		
	$("#seat_btn").click(function(){
  		let cNo = $("#cno").val();
  		//alert(cNo);
  		window.open('/seat/seat.do?cNo='+ cNo + '&People=' + ${param.people} + '&Flno=' + ${param.Flno}, 'seat','status=no, scrollbars=yes , resizable=no');
  		
  	});
		//결제하기 이벤트
		$("#pBtn").click(function(){
			$("#paymentWriteForm").submit();
			
		});


$('#finalBtn').click(function() {
  var cardNo = $("#cardNo").val();
  if (cardNo.length < 16 || cardNo.length > 19) {
    alert("16자리의 카드번호를 입력해 주셔야 합니다. 카드입력란을 다시한번 확인해주세요.");
    return false;
  }
});


$(document).ready(function() {
    $('#finalBtn').click(function() {
        if (!$('#iUseMil').val()) {
            alert('마일리지를 사용하지 않으실경우 0을 적어주세요!');
        }
    });
});
		//취소 이벤트
		$("#cancelBtn").click(function() {
			history.back();
		});
		
		
		$('#ckBtn').click(function(){
			
			let mileage = parseInt( $("#mileage").val());
			//alert(mileage);
			let use = parseInt($("#iUseMil").val());
			//alert(use);
			
				  let total = '${view.price}';
			if (mileage > use) {
				  $("#total").val(total - use);
				
				} else {
				  $("#iUseMil").val("0");
				  $("#total").val(total)
				  alert("현재 보유하신 마일리지는 ${login.mileage}원 입니다.");
				}

		});
		//기내식 이미지 넣기 - 실패
// 		$(document).ready(function() {
// 			  $('.mealNo').on('change', function() {
// 			    var imageUrl = $(this).find(':selected').data('image');
// 			    $('#mealImage').attr('src', imageUrl);
// 			  });
// 			});
		
// 		function showMealImage() {
// 		    var selectBox = document.getElementById("mealNo");
// 		    var selectedValue = selectBox.options[selectBox.selectedIndex].value;
// 		    var selectedImage = selectBox.options[selectBox.selectedIndex].getAttribute("data-image");
// 		    var mealImage = document.getElementById("mealImage");
// 		    mealImage.src = selectedImage;
// 		}
		
	});
	
</script>
</head>
<!-- 	<img src="/reservation/foodImage/비건.jpg" alt="비건"> -->
<!-- 	<img src="/reservation/foodImage/샐러드.jpg" alt="샐러드"> -->
<!-- 	<img src="/reservation/foodImage/알러지.jpg" alt="알러지"> -->
<!-- 	<img src="/reservation/foodImage/프로틴.jpg" alt="프로틴"> -->
<body>

	<div class="container">
		<div class="path">
			<span>main</span>
			<!-- 	  <span>&gt;</span> -->
			<span>목적지 선택</span>
			<!-- 	  <span>&gt;</span> -->
			<span>좌석선택 / 기내식선택 / 결제</span>
		</div>
		<br /> <br />

		<form action="" method="post" id="paymentWriteForm">
			<input type="hidden" value="${param.Flno }" name="flightNo">
			<div class="form-group">
				<div
					style="width: 100%; height: 100%; float: left; text-align: center;">
					<a type="button" class="btn btn-default" id="seat_btn"
						style="width: 100%; height: 100%;">좌석 등록을 위해 버튼을 눌러주세요</a>
				</div>
				<br />
			</div>
			<br />
			<h2>사용자 정보내역</h2>
			<table class="table">
				<tr class="dataRow">
					<th>이름</th>
					<td class="name">${login.name}</td>
				</tr>
				<tr>
					<th>출발하는 나라</th>
					<td>${view.startStation}</td>
				</tr>
				<tr>
					<th>도착하는 나라</th>
					<td>${view.endStation}</td>
				</tr>
				<tr>
					<th>출발하는 날짜</th>
					<td>${view.startDate}</td>
				</tr>
				<tr>
					<th>좌석</th>
					<td><input id="Seat_Num" name="seatInf" readonly="readonly"
						type="text" class="inputbox" placeholder="고객님의 좌석정보"></td>
				</tr>
				<tr>
					<th>결제금액</th>
					<td>${view.price}원</td>
				</tr>
				<tr>
					<th>사용가능한 마일리지</th>
					<td>${login.mileage}마일리지</td>
				</tr>
			</table>
			<input type="hidden" value="${login.mileage }" id="mileage">
			<div class="form-group mealChoice">
				<label for="mealNo" id="mealInfo">기내식을 선택해주세요<br /> 1:
					일반기내식 2: 샐러드 3:알러지 안전식단 4:프로틴식단
				</label> <select class="form-control" id="mealNo" name="mealNo" size="1">
					<option value="">선택하세요</option>
					<option value="1">1: 일반기내식</option>
					<option value="2">2: 샐러드</option>
					<option value="3">3: 알러지 안전식단</option>
					<option value="4">4: 프로틴식단</option>
				</select>
			</div>

			<!-- 			<div class="form-group"> -->
			<!--     <label for="mealNo">기내식<br /> 1: 일반기내식 2: 샐러드 3:알러지 안전식단 -->
			<!--         4:프로틴식단 -->
			<!--     </label> -->
			<!--     <select class="form-control mealNo" id="mealNo" name="mealNo" -->
			<!--         onchange="showMealImage()"> -->
			<!--         <option value=''>선택하세요</option> -->
			<!--         <option value="1" data-image='reservation/foodImage/비건.PNG' -->
			<%--             ${test == '1'? 'selected = " selected"' :'' }>1</option> --%>
			<!--         <option value="2" data-image='reservation/foodImage/샐러드.PNG' -->
			<%--             ${test == '2'? 'selected = " selected"' :'' }>2</option> --%>
			<!--         <option value="3" data-image='reservation/foodImage/알러지.PNG' -->
			<%--             ${test == '3'? 'selected = " selected"' :'' }>3</option> --%>
			<!--         <option value="4" data-image='reservation/foodImage/프로틴.PNG' -->
			<%--             ${test == '4'? 'selected = " selected"' :'' }>4</option> --%>
			<!--     </select> -->
			<!--     <div class="meal-image"> -->
			<!--         <img id="mealImage" src="" alt=""> -->
			<!--     </div> -->
			<!-- </div> -->

			<h2>항공권 결제정보 입력페이지</h2>

			<div class="form-group-4">
				<label for="cardSelect">카드회사선택</label> <select class="form-control"
					id="cardSelect" name="cardSelect">
					<option>BC</option>
					<option>롯데</option>
					<option>삼성</option>
					<option>국민</option>
					<option>카카오카드</option>
					<option>신한</option>
				</select>
				<!-- 카드종류 옆에 붙도록 작성해야함. 사이즈 체크하고 주석지우기-->
				<div class="form-group-2">
					<label for="mothSelect">카드개월수 선택</label> <select
						class="form-control" id="mothSelect" name="mothSelect">
						<option>2개월</option>
						<option>3개월</option>
						<option>4개월</option>
						<option>5개월</option>
						<option>6개월</option>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label for="cardNo">카드번호</label> <input type="text" name="cardNo"
					id="cardNo" class="form-control"
					placeholder="1234-1234-1234-1234 (-)를 제외한 16개의 숫자를 입력해주세요.">

				<div class="checkMil">
					사용가능한 마일리지:<span id="Use">마일리지</span> <label for="useMil">사용할
						마일리지</label> <input name="iUseMil" id="iUseMil" class="form-control"
						placeholder="사용하실 마일리지의 금액을 입력해주세요">
					<button type="button" id="ckBtn">확인</button>
				</div>
			</div>
			<c:set var="price" value="${view.price}" />
			<c:set var="iUseMil" value="${iUseMil}" />
			<label>최종결제금액 : </label> <input name="total"
				value="${view.price - iuseMil}" readonly="readonly" id="total">
			<br />
			<hr />
			<button type="button" class="btn btn-default" data-toggle="modal"
				data-target="#myModal" id="finalBtn">결제하기</button>
			<button class="btn btn-default" type="reset" id="reSet">새로입력</button>
			<button class="btn btn-default" type="button" id="cancelBtn">취소</button>
		</form>
	</div>

	<!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">air3 결제창</h4>
				</div>
				<div class="modal-body">
					<p>결제가 완료되었습니다. 확인을 누르시면 예약 상세내역으로 이동합니다.</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal"
						id="pBtn">확인</button>
				</div>
			</div>

		</div>
	</div>
	<input type="hidden" id="cno" name="cno" value="${view.cNo }">
</body>
</html>

