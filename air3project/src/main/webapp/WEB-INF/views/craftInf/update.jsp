<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>항공기 수정</title>

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
	
	
	// 취소 이벤트
	$("#cancelBtn").click(function(){
		history.back();
	});
});


</script>
<script type="text/javascript">
$(function(){
	
	$("#updateForm").submit(function(){
		
		
		if(!checkData(reg_birth, $("#station"), reg_birth_error_msg, 0 )) return false;
		
		location="/craftInf/update.do";
		
	});
	
</script>
</head>
<body>
<div class="container">
	<h2>항공기 정보수정</h2>
	<form action="update.do" method="post" id="updateForm" enctype="multipart/form-data">
		<div class="form-group">
			<label for="cNo">항공기 넘버</label>
			<input name="cNo" id="cNo" class="form-control" value="${vo.cNo }" readonly="readonly">
		</div>
		<div class="form-group">
			<label for="cName">항공기 이름</label>
			<input name="cName" id="cName" class="form-control" value="${vo.cName }" pattern="[A-Z0-9]+" title="대문자와 숫자만 가능해요" required="required">
		</div>
		
		<div class="form-group">
			<label for="cDistance">항공기 거리</label>
			<input type="number" name="cDistance" id="cDistance" class="form-control" value="${vo.cDistance }" required="required">
		</div>
		<div class="form-group">
			<label for="cSpeed">항공기 스피드</label>
			<input type="number" name="cSpeed" id="cSpeed" class="form-control" value="${vo.cSpeed }" required="required">
		</div>
		<div class="form-group">
			<label for="cChairRowN">항공기 좌석 열</label>
			<input type="number" name="cChairRowN" id="cChairRowN" class="form-control" value="${vo.cChairRowN }" required="required">
		</div>
		<div class="form-group">
			<label for="cChairLineN">항공기 좌석 행</label>
			<input name="cChairLineN" id="cChairLineN" class="form-control" value="${vo.cChairLineN }" pattern="[A-Z]{1}" required="required">
		</div>
		<div class="form-group">
			<label for="cChairN">좌석수</label>
			<input type="number" name="cChairN" id="cChairN" class="form-control" value="${vo.cChairN }">
		</div>
		<div class="form-group">
			<label for="cDiv">분류(voing:1,airbus:2)</label>
			<input name="cDiv" id="cDiv" class="form-control" value="${vo.cDiv }" pattern="[12]+" title="분류에 있는 번호만 사용하시오">
		</div>
		<!-- 작성자는 로그인한 아이디를 사용한다. 로그인 필수. ImageController에서 아이디를 받낸다. -->
		<button type="submit" class="btn btn-default">등록</button>
		<button type="reset" class="btn btn-default">새로입력</button>
		<button type="button" id="cancelBtn" class="btn btn-default">취소</button>
	</form>
	
</div>
</body>
</html>