<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>웹짱:게시판 글등록</title>


<script type="text/javascript" src="/js/regEx.js"></script>

<script type="text/javascript">
$(function(){
	
	

		$("#writeForm").submit(function(){
	
		// 제목, 내용, 작성자, 비밀번호, 비밀번호 = 비밀번호 확인  유효성 검사.
	if(!checkData(reg_title, $("#title"), reg_title_error_msg, 1)) return false;
	if(!checkData(reg_contentsi, $("#content"), reg_contentsi_error_msg, 1)) return false;
	if($("#imageFile").val() == ""){
		alert("이미지 파일은 반드시 입력하셔야 합니다.");

		return false;
		}
	});
	
	$("#cancelBtn").click(function(){
		history.back();
	});
});
</script>
<style type="text/css">
hr{
border: 2px solid #eee;
}

</style>
</head>
<body>

<div class="container">
<div style="margin-top: 60px;">
	<h1>서비스 정보 등록</h1>
</div>
	<hr/>
	<div style="margin-top: 15px;">
	<form action="write.do" method="post"  id="writeForm" enctype="multipart/form-data">
	<input type="hidden" name="perPageNum" value="${param.perPageNum }">
		<div class="form-group" style="margin-top: 60px;">
		<label for="title">제목 :</label>
		<input name="title" id="title" class="form-control" placeholder="제목을 입력하세요">
		</div>
		<div class="form-group"style="margin-top: 30px;">
		<label for="content">내용 :</label>
		<textarea name="content" id="content" class="form-control" rows="15" placeholder="내용을 입력하세요"></textarea>
		</div>
		<div class="form-group"style="margin-top:30px;">
		<label for="imageFile">이미지 파일 :</label>
		<input name="imageFile" id="imageFile" class="form-control" type="file">
		</div>
		
	<div class="pull-right" style="margin-top: 15px;">
		<button class="btn btn-default">등록</button>
		<button class="btn btn-default" type="reset">새로입력</button>
		<button class="btn btn-default" type="button" id="cancelBtn">취소</button>
	</div>
		
	</form>
	</div>
</div>

</body>
</html>