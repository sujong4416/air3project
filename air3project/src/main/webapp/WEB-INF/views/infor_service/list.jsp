<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서비스 정보</title>

<style type="text/css">
.media {
	padding: 15px;
	height: 45px;
	cursor: pointer;
}




#content {
	margin-top: 10px;
	height: 150px;
	float: right;
	color: #999;
}

.no {
	display: none;
}

#title{
/* border: 1px solid #eee; */
height: 80px;
font-size: 18px;
color: #666;

}

#page_condition{
/* border: 1px solid #eee; */
text-align:left;
height: 80px;
}
.page_default{
/* border: 1px solid #eee; */
height: 70px;
}
#searcher > input{
/* border: 1px solid #eee; */
position:absolute;
z-index: 1;
}
.row{
width: 100%;
/* border: 1px solid #eee; */
height: 70px;
}

</style>

<script type="text/javascript">
	$(function() {

		// 키를 세팅해 보자. 
		if ("${param.key}")
			$("#key").val("${param.key}")
			// perPageNum을  세팅해 보자. 
		if ("${param.perPageNum}")
			$("#perPageNum").val("${param.perPageNum}")
			// 게시판 한줄을 클릭 이벤트

		$(".media")
				.click(
						function() {
							// alert("글보기 이동");
							let no = $(this).find(".no").text(); // 클릭한 태그 속성 - data-no
							// alert("번호:" + no);
						
							location = "view.do?no="
									+ no
									+ "&page=${param.page}&perPageNum=${param.perPageNum}"
									+ "&key=${param.key}&word=${param.word}";
						});
		$("#perPageNum").change(function() {
			$("#changePerPageNumForm").submit();
		});

	});
</script>
</head>
<body>
	<div class="container">
<div class="page_default">
		<div class="col-md-8 pull-left" id="title" style="margin-top: 50px;">
			<h2>서비스 정보</h2>
		</div>
</div>


		

		<div class="row" style="margin-top: 100px; width: 100%;">

<div style="width: 100%; float: left;">
			<form class="form-inline" id="search_bar" style="margin-left: 90px;">
				<input name="perPageNum" value="${param.perPageNum }" type="hidden">
					<div class="input-group" style="width: 100%;">
						<select class="form-control" id="key" name="key" style="width: 10%; height: 50px;">
							<option value="t">제목</option>
							<option value="c">내용</option>
							<option value="tc">전체</option>
						</select>
						<input type="text" class="form-control" placeholder="Search"
							name="word" style="height: 50px; width: 90%">
						<div class="input-group-btn">
							<button class="btn btn-default" type="submit" style="height: 50px;">
								<i class="glyphicon glyphicon-search"></i>
							</button>
						</div>
					</div>
	     		</form>
		</div>



		</div>
		<hr />

		<!-- c:forEach의 속성 - 반복회수가 저장되어 있는 vs-->
		<c:forEach items="${list }" var="vo">



			<div class="media">
				<div class="no">${vo.no }</div>
				<div class="media-body">
					<div class="title col-md-9">
						<span class="media-heading" id="title">${vo.title }</span>
					</div>
					<div class="content col-md-3">
						<p class="media-heading" id="content">${vo.updateDate }</p>
					</div>
				</div>
			</div>
			<hr>


		</c:forEach>
		<div class="row">
			
		
			
			
				<div id="page_condition" class="col-md-3 pull-left" style="padding: 20px;">
			<form class="form-inline" id="changePerPageNumForm">
				<div class="form-group">
					<label>데이터 개수</label> <select name="perPageNum" id="perPageNum"
						class="form-control">
						<option>10</option>
						<option>15</option>
						<option>20</option>
					</select>
				</div>
			</form>

		</div>

			<div class="col-md-6 text-center">
				<pageNav:pageNav listURI="list.do" pageObject="${pageObject }" />
			</div>
	<c:if test="${login != null && login.gradeNo == 9 }">
				<div class="col-md-3 pull-right" style="padding: 20px; text-align: right;">
					<a href="write.do?perPageNum=${pageObject.perPageNum}"
						class="btn btn-default">등록</a>
				</div>
				</c:if>
		</div>
		
		
		
	</div>
</body>
</html>