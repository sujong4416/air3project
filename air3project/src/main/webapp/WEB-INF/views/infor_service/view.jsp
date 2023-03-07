<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서비스 정보 보기</title>

<!-- 라이브러리 등록  : CDN 방식 -->


<style type="text/css">
.D-btn{
font-size: 10px;
}
#image_change > button{
width: 90px;
height: 28px;
text-align: center;
}

.img-thumbnail{
width: 100%;
}

#changeImageDiv{
display: none;
}
#view_title{

height: 60px;
/* border: 1px solid #eee; */
}
.container{
/* border: 1px solid #eee; */
}
</style>

<script type="text/javascript">
$(function(){
	// 삭제 버튼 이벤트 처리 - a tag
	$("#changeImageBtn").click(function(){
		
		$("#changeImageDiv").toggle();
		
	});
	
	$("#deleteBtn").click(function(){

		if(!confirm("정말 삭제 할까요?")) return false;
	});

});
</script>

</head>
<body>
<div class="container">
<div id="view_title" style="margin-top: 40px;">
<div class="col-md-10 pull-left">
	<h2>${vo.title }</h2>
</div>
		<div class="col-md-2 pull-right" style="margin-top: 33px; text-align: right;">${vo.updateDate }</div>
</div>
	<hr/>	
	

	  <div>
	 
	  	<div class="row">
	  		
	  		<div>
	  			<img src="${vo.fileName }" class="img-thumbnail"/>

	  			<div id="image_change">
	  				<c:if test="${login != null && vo.id == login.id }">
	  					<button class="btn btn-danger D-btn" id="changeImageBtn">이미지 바꾸기</button>
	  					<div id="changeImageDiv">
	  						<form action="updateImage.do" method="post" id="updateImageForm"
	  						 enctype="multipart/form-data">
	  							<input type="hidden" name="no" value="${vo.no }">
	  							<input type="hidden" name="deleteFile" value="${vo.fileName }">
	  							<br/>
	  							<div class="form-group">
	  								<label for="imageFile">바꿀 이미지 선택</label>
	  								<input class="form-control" name="imageFile" 
	  								id="imageFile" type="file">
	  							</div>
	  							<button>바꾸기</button>
	  							<button type="button" id="cancelBtn">취소</button>
	  						</form>
	  					</div>
	  				</c:if>
	  			</div>
	  		</div>
	  	</div>
	
	  	<hr/>
	  	
	  	<div class="row">

	  		<div>${vo.content }</div>
	  	</div>
	  	
	  </div>
	<hr/>
	  	<c:if test="${login != null && login.gradeNo == 9 }">
	  	<div id="update-btn">
				<div class="alert alert-info" style="padding: 20px;">수정은 이미지를 제외한 나머지 정보(제목, 내용)를 수정할 수 있습니다. 이미지는 이미지 바꾸기를 통해 변경해 주세요.
	  	 <a	href="delete.do?no=${vo.no }&deleteFile=${vo.fileName}&perPageNum=${param.perPageNum}&key=${param.key }&word=${param.word}"
						class="btn btn-default pull-right" id="deleteBtn" style="font-size: 15px;" >삭제</a>
		  	<a href="update.do?no=${vo.no }&page=${param.page}&perPageNum=${param.perPageNum}&key=${param.key }&word=${param.word}" class="btn btn-default pull-right" style="margin-right: 10px; font-size: 15px;">수정</a>
				</div>
				
	  	
	  	</div>
	  	</c:if>
	  	
	  	
	  	<div id="list-btn" style="text-align: center;">
	  	<a href="list.do?page=${param.page }&perPageNum=${param.perPageNum}&key=${param.key }&word=${param.word}" class="btn btn-default" style="font-size: 2em; margin-top: 35px;background: gray; color: white;">목록으로</a>
	  	</div>
	  	
	  	
	  </div>
	
	
	
	
	

</body>
</html>