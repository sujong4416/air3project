<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>항공기 정보 등록</title>

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
$(function(){
	$("#writeForm").submit(function(){
		// alert("submit 이벤트")
		// 제목, 내용, 작성자, 비밀번호, 비밀번호, 비밀번호=비밀번호 확인 유효성 검사.
		if(!checkData(reg_title, $("#title"), reg_title_error_msg, 1)) return false;
		if(!checkData(reg_content, $("#content"), reg_content_error_msg, 1)) return false;
		// alert($("#imageFile").val());
		if($("#imageFile").val() == ""){
			alert("이미지 파일은 반드시 입력하셔야 합니다.");
			return false;
		}
	});
	
	// 취소 이벤트
	$("#cancelBtn").click(function(){
		history.back();
	});
});
</script>
<script type="text/javascript"></script>
</head>
<body>
<div class="container">
	<h2>항공기 정보 등록</h2>
	<form action="write.do" method="post" id="writeForm" enctype="multipart/form-data">
		<div class="form-group">
			<label for="cName">항공기 이름</label>
			<input name="cName" id="cName" class="form-control" pattern="[A-Z0-9]+" title="대문자와 숫자만 가능해요">
		</div>
		<div class="form-group">
			<label for="cImg">항공기 이미지</label>
			<input name="cImg" id="cImg" class="form-control" type="file" required="required">
		</div>
		<div class="form-group">
			<label for="cChairImg">좌석도</label>
			<input name="cChairImg" id="cChairImg" class="form-control" type="file" required="required">
		</div>
		<div class="form-group">
			<label for="cDistance">항공기 거리</label>
			<input type="number" name="cDistance" id="cDistance" class="form-control">
		</div>
		<div class="form-group">
			<label for="cSpeed">항공기 스피드</label>
			<input type="number" name="cSpeed" id="cSpeed" class="form-control">
		</div>
		<div class="form-group">
			<label for="cChairRowN">항공기 좌석 열</label>
			<input type="number" name="cChairRowN" id="cChairRowN" class="form-control">
		</div>
		<div class="form-group">
			<label for="cChairLineN">항공기 좌석 행</label>
			<input name="cChairLineN" id="cChairLineN" class="form-control" pattern="[A-Z]{1}" required="required">
		</div>
		<div class="form-group">
			<label for="cChairN">좌석수</label>
			<input type="number" name="cChairN" id="cChairN" class="form-control" >
		</div>
		<div class="form-group">
			<label for="cDiv">분류(voing:1,airbus:2)</label>
			<input type="number" name="cDiv" id="cDiv" class="form-control" type="number" pattern="[12]+" title="분류에 맞는 번호를 입력하세요">
		</div>
		<!-- 작성자는 로그인한 아이디를 사용한다. 로그인 필수. ImageController에서 아이디를 받낸다. -->
		<button class="btn btn-default">등록</button>
		<button type="reset" class="btn btn-default">새로입력</button>
		<button type="button" id="cancelBtn" class="btn btn-default">취소</button>
	</form>
	
</div>
</body>
</html>