<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 이미지 수정</title>

<script type="text/javascript">
$(function(){
	$("#updateForm").submit(function(){
	}
});
</script>
<script type="text/javascript">
$(function(){
	$("#cancelBtn").click(function(){
		alert("상품 수정을 취소합니다");
		history.back();
	});
});

</script>

</head>
<body>
<div class="container">
	<h1>상품 수정</h1>
</div>
<form action="update.do" id="updateForm" method="post" >
<input type="hidden" name="productno" value="${vo.productno }">
	<div class="form-group">
		<label for="name">상품명</label>
		<input name="name" id="name" class="form-control" value="${vo.name }" >
	</div>
	<div class="form-group">
		<label for="description">상품 정보</label>
		<textarea name="description" id="description" class="form-control" rows="3">${vo.description }</textarea>
	</div>
	<div class="form-group">
		<label for="price">가격</label>
		<input name="price" id="price" class="form-control" value="${vo.price }" >
	</div>
	<div class="form-group">
		<label for="stock">재고</label>
		<input name="stock" id="stock" class="form-control" value="${vo.stock }" >
	</div>
	<button class="btn btn-default">글수정</button>
	<button type="reset" class="btn btn-default">새로입력</button>
	<button type="button" id="cancelBtn" class="btn btn-default">취소</button>
</form>

</body>
</html>