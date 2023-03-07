<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

<style type="text/css">

.table {
	background: #eee;
}

#changeImageDiv {
	display: none;
}
</style>

<script type="text/javascript">
$(function(){
			$("#deleteBtn").click(function() {
			if (!confirm("정말 삭제하시겠습니까?"))
				return false;
		});	
	
		$("#changeImageBtn").click(function() {
			$("#changeImageDiv").slideDown();

		});
		$("#cancelBtn").click(function() {
			$("#changeImageDiv").slideUp();

		});
		$("#updateImageForm").submit(function() {
			if (!$("#img").val()) {
				alert("이미지 파일을 선택하셔야합니다.");
				return false;
			}
		});
});
</script>
<script type="text/javascript">

let no =$(this).find("#cart").text();
location="/cart/addcart.do?cartno="+no";

</script>
<script type="text/javascript">
    $(function(){
    	$(".prBtn").click(function(){
			let quantity = $("#prQuantity").val();
			
			location="/order/write.do?productno="+${vo.productno}+"&quantity="+quantity+"&price="+${vo.price}+"&name="+'${vo.name}';
    	});
			
    	
			
    });
    </script>
   <script type="text/javascript">
   $(document).ready(function(){
	    $(".prQuantity").change(function(){
	        var price = $(this).closest("tr").find("#price").text().replace("원","");
	        var quantity = $(this).val();
	        var total = price * quantity;
	        $(this).closest("tr").find(".total").text(total + "원");
	        
	        var sum = 0;
	        $(".total").each(function(){
	            sum += parseInt($(this).text().replace("원",""));
	        });
	        $("#total").text(sum + "원");
	       
	    });
	});

   </script>
</head>
<body>
	<div class="container">
		<h1>상품보기</h1>
		<div class="row">
			<div class="col-md-4">
				<img src="${vo.img }" class="thumbnail" style="width: 100%">
			</div>

			<div class="col-md-8">
				<div class="d-flex justify-content-between">
					<h3 style="font-size: 18px;">${vo.name}</h3>
					<dl>
						<dt style="font-size: 18px;">판매가격:</dt>
						<dd id="price" style="font-size: 18px;" class="text-right">${vo.price}원</dd>
					</dl>
				</div>
				<form action="/cart/addcart.do" id="cartForm">

				<table class="table" style="padding: 50px">
					<tr>
						<td>${vo.name }</td>
						<td><input type="number" id="prQuantity"class="prQuantity" name="prQuantity" value="1"></td>
						<td id="price" class="price" style="display: none;">${vo.price }원</td>
						 <td class="total" style="display: none;"></td>
					</tr>
				</table>
				
					<div class="row">
						<div class="col-md-6 text-center">
							<h3>총 합계 금액:</h3>
							<div class="sum"></div>
						</div>
						<div class="col-md-6 text-right">
							<h3>
								<span id="total" style="color: green"></span>
							</h3>
						</div>
					</div>	
     		<form action="cartadd.do" method="post" id="writeForm">
			<div class="col-md-8 text-right">
				<input type="hidden" value="${vo.productno }" name="productno">
				<input type="hidden" value="${vo.price }" name="price">
				<input type="hidden" value="${vo.img }" name="img">
				<input type="hidden" value="${vo.name }" name="name">
				<input type="hidden" name="quantity" value="1">
				<button class="btn btn-success btn-lg prBtn">장바구니</button>
			</form>
				

				</div>
				</form>	
			<div class="col-md-4 text-center">	
			<button id="prBtn" class="btn btn-success btn-lg prBtn" >바로구매</button>
			</div>
			</div>
		</div>
	

		<c:if test="${login != null && login.gradeNo == 9}">
		<div>
		<a href="update.do?productno=${vo.productno }" class="btn btn-default">상품수정</a>
				<a href="delete.do?productno=${vo.productno }&deleteFile=${vo.img}"
					class="btn btn-default" id="deleteBtn">삭제</a>
			<button class="btn btn-default" id="changeImageBtn">이미지바꾸기</button>
			<div id="changeImageDiv">
				<form action="updateImage.do" method="post" id="updateImageForm"
					enctype="multipart/form-data">
					<input type="hidden" name="productno" value="${vo.productno }">
					<input type="hidden" name="deleteFile" value="${vo.img }">
					<div class="form-group">
						<label for="img">바꿀 이미지 선택</label> <input class="form-control"
							name="img" id="img" type="file">
					</div>
					<button>바꾸기</button>
					<button type="button" id="cancelBtn">취소</button>

				</form>
			</div>
		</div></c:if>
	</div>
</body>
</html>