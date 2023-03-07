<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록</title>
<script type="text/javascript">
$(function(){
	$("#writeForm").submit(function(){
// 		//제목,내용,작성자,비밀번호,비밀번호확인 유효성 검사
// 		if(!checkData(reg_title, $("#title"),reg_title_error_msg,1)) return false;
// 		if(!checkData(reg_content, $("#content"),reg_content_error_msg,1)) return false;
		
// 		파일이 있는지 없는지 확인해보고 싶다
		if($("#img").val()==""){
		alert("이미지 파일을 반드시 입력하셔야 합니다.");
		return false;
	}
	});
	
	//취소 이벤트
	$("#cancelBtn").click(function(){
		history.back();
	});
});
</script>
</head>
<body>
<h1>글쓰기</h1>
	<div class="container">
		<h2>상품 등록</h2>
<!-- 		작성자는 id - controller에서 session 에서 id 받아서 쓰는것 -->
<!-- 		즉 write 부분을 사용하려면 로그인 처리가 되어있어야한다. 로그인 필수!!! 등록 버튼도 마찬가지 -->
		<form action="write.do" method="post" id="writeForm" enctype="multipart/form-data">
			<div class="form-group">
				<label for="name">상품명</label> 
				<input name="name" id="name" class="form-control">
			</div>
			<div class="form-group">
				<label for="description">상품 정보</label>
				<textarea name="description" id="description" class="form-control" rows="3"></textarea>
			</div>
			<div class="form-group">
				<label for="price">상품 가격</label>
				<input name="price" id="price" class="form-control">
			</div>
			<div class="form-group">
				<label for="stock">재고</label>
				<input name="stock" id="stock" class="form-control">
			</div>
			<div class="form-group">
				<label for="img">상품 이미지</label> <input name="img" id="img"
					class="form-control" type="file">
			</div>

			<button class="btn btn-default">글등록</button>
			<button type="reset" class="btn btn-default">새로입력</button>
			<button type="button" id="cancelBtn" class="btn btn-default">취소</button>
		</form>
	</div>
</body>
</html>