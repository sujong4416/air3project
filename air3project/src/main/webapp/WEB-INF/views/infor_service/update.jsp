<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글수정</title>

<!-- 라이브러리 등록  : CDN 방식 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script type="text/javascript" src="/js/regEx.js"></script>

<script type="text/javascript">
	$(function() {
		$("#updateForm").submit(
				function() {
					// 제목, 내용, 작성자, 비밀번호, 비밀번호, 비밀번호=비밀번호 확인 유효성 검사.
					if (!checkData(reg_title, $("#title"), reg_title_error_msg,
							1))
						return false;
					if (!checkData(reg_contentsi, $("#content"),
							reg_contentsi_error_msg, 1))
						return false;

				});
		
		$("#updateBtn").click(function() {
			if(!confirm("수정 할까요?")) return false;
		});
		// 취소 이벤트
		$("#cancelBtn").click(function() {
			history.back();
		});
	});
</script>

</head>
<body>
	<div class="container">
		<h1>게시판 글수정</h1>
		<hr/>
		<form action="update.do" method="post" id="updateForm">
			<input type="hidden" name="Page" value="${param.page }"> 
			<input type="hidden" name="perPageNum" value="${param.perPageNum }">
			<div class="form-group">
				<label for="no">번호</label> <input name="no" id="no"
					class="form-control" readonly value="${vo.no }">
			</div>
			<div class="form-group">
				<label for="title">제목</label> <input name="title" id="title"
					class="form-control" value="${vo.title }">
			</div>
			<div class="form-group">
				<label for="content">내용</label>
				<textarea name="content" id="content" class="form-control" rows="10">${vo.content }</textarea>
			</div>
<hr>
<div style="text-align: right">
			<button class="btn btn-default" id="updateBtn">수정</button>
			<button class="btn btn-default" type="reset">새로입력</button>
			<button class="btn btn-default" type="button" id="cancelBtn">취소</button>
</div>
		</form>
	</div>
</body>
</html>