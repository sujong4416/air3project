<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원리스트</title>

<style type="text/css">
.dataRow:hover{
	cursor: pointer;
	background : #eee;
}

.gradeSelect{
    height: 34px;
    padding: 6px 12px;
    font-size: 14px;
    line-height: 1.42857143;
    color: #555;
    background-color: #fff;
    background-image: none;
    border: 1px solid #ccc;
    border-radius: 4px;
    -webkit-box-shadow: inset 0 1px 1px rgb(0 0 0 / 8%);
    box-shadow: inset 0 1px 1px rgb(0 0 0 / 8%);
    -webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
    -o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
    transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
}

.gradeMenu {
    left:auto;
}

.dropdown-button{
	border: none;
	background: none;
}

.gradeChange:hover{
	background: #eee;
}

#gradeChange{
	position: absolute;
}

.gradeBtn{
	background: none;
}

.gradeDiv:hover{
	background: #eee;
}
h1 {
  color: #004080; /* 글자색 */
  font-size: 32px; /* 폰트 크기 */
  font-weight: bold; /* 굵게 */
  text-align: center; /* 가운데 정렬 */
  margin-top: 50px; /* 위쪽 여백 */
}
.path {
 margin-top:15px;

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





</style>

<script type="text/javascript">

$(function(){
	
	if('${msg }' != '') alert('${msg}');

	
	if("${param.key}") $("#key").val("${param.key}");
	
	if("${param.perPageNum}") $("#perPageNum").val("${param.perPageNum}");
	
	// 한 페이지에 보여줄 개수 변경
	$("#perPageNum").change(function(){
		$("#changePerPageNumForm").submit();
	});
	
	$(".view").click(function(){
		let id = $(this).parent().find(".id").text();
		location = "viewMember.do?id="+id+"&page=${param.page}&perPageNum=${param.perPageNum}&key=${param.key }&word=${param.word }";
	});
	
	
	$(".changeGradeBtn").click(function(){
		
		let id = $(this).closest(".dataRow").find(".id").text();
		
		$("#id").val(id);
		
		let grade = $(this).closest(".dataRow").find(".gradeNo").text();
		
		$(".formGradeNo").val([grade]);
		
	});
	
	$("#changeBtn").click(function(){
		$("#changeGrade").submit();
	});
	
});

</script>

</head>
<body>
<div class="container">
	<div class="path">
	  <span>Home</span>
<!-- 	  <span>&gt;</span> -->
	  <span>회원관리</span>
<!-- 	  <span>&gt;</span> -->
	  <span>회원리스트</span>
	</div>

	<h1>회원리스트</h1>
	
	<div class="row">

		<div class="col-md-10">
			<form class="form-inline pull-left">
				<input type="hidden" name="perPageNum" value="${param.perPageNum }">
				<div class="form-group">
					<select class="form-control" id="key" name="key">
						<option value="i">아이디</option>
						<option value="n">이름</option>
						<option value="t">휴대전화 번호</option>
					</select>
				</div>
		   		<div class="form-group">
					<input type="text" class="form-control" placeholder="검색" id="word" name="word" value="${param.word }">
				</div>
				<button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button>
			</form>
		</div>
		
		<div class="col-md-2">
			<form class="from-inline" id="changePerPageNumForm">
				<div class="form-group pull-right">
					<select name="perPageNum" id="perPageNum" class="form-control" style="width: 100px;">
						<option value="10">10개씩</option>
						<option value="15">15개씩</option>
						<option value="20">20개씩</option>
					</select>
				</div>
			</form>
		</div>
	</div>

<!-- <form action="/member/updateGrade.do" id="changeGradeForm"> -->
	
	<table class="table">
		<thead>
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>생년월일</th>
				<th>성별</th>
				<th>연락처</th>
				<th>상태</th>
				<th>회원등급</th>
				<th style="display: none;"></th>
			</tr>
		</thead>
		<tbody>
			
			<!-- 데이터 있는 만큼 반복문 처리 -->
			<!-- var="vo" : PageContext 객체 -->
			<c:forEach items="${list }" var="vo">
			
				<tr class="dataRow">
					<!-- vo.no : no의 getter 호출 -->
					<td class="id view">${vo.id }</td>
					<td class="view">${vo.name }</td>
					<td class="view">${vo.birth }</td>
					<td class="view">${vo.gender }</td>
					<td class="view">${vo.tel }</td>
					<td class="view">${vo.status }</td>
					<td class="grade">${vo.gradeName }
						<c:if test="${login.id != vo.id }">
						<button class="btn btn-default btn-xs changeGradeBtn" data-toggle="modal" data-target="#myModal">변경</button>
						</c:if>
<!-- 						<button type="button" class="btn btn-xs btn-default dropdown-toggle" data-toggle="dropdown"> -->
<!-- 					    	<span class="caret"></span> -->
<!-- 					    </button> -->
<!-- 					    <ul class="dropdown-menu gradeMenu" role="menu"> -->
<!-- 					    	<li class="member gradeChange"><button class="dropdown-button" id="grade9" name="grade" value="9">관리자</button></li> -->
<!-- 					    	<li class="member gradeChange"><button class="dropdown-button" id="grade1" name="grade" value="1">일반회원</button></li> -->
<!-- 				    	</ul> -->
<%-- 				   <c:if test="${vo.gradeName == '관리자' }"> --%>
<!-- 				    <select name="grade" id="grade" class="gradeSelect"> -->
<!-- 						<option value="9" selected="selected">관리자</option> -->
<!-- 						<option value="1">일반회원</option> -->
<!-- 					</select> -->
<%-- 				    </c:if>	 --%>
<%-- 				   <c:if test="${vo.gradeName == '일반회원' }"> --%>
<!-- 				    <select name="grade" id="grade" class="gradeSelect"> -->
<!-- 						<option value="9">관리자</option> -->
<!-- 						<option value="1" selected="selected">일반회원</option> -->
<!-- 					</select> -->
<%-- 				    </c:if> --%>
					</td>
					<td class="gradeNo" style="display: none;">${vo.gradeNo }</td>
				</tr>
				
			</c:forEach>
		</tbody>
		
	</table>

<!-- </form> -->

<div class="modal fade in" id="myModal" role="dialog" style="display: none;">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">×</button>
          <h4 class="modal-title">회원등급 변경</h4>
        </div>
        <div class="modal-body">
          <!-- 이동할 페이지는 movePage 변수로 정해 주세요. -->
          <form method="post" id="changeGrade" action="/member/updateGrade.do">
          	<!-- 글번호 정보를 숨겨서 넘긴다. -->
          	<div class="form-group">
	          	<div class="form-block"><label>아이디</label>
	          	</div>
	          	<input name="id" id="id" class="form-control form-size" readonly="readonly">
          	</div>
          	<div class="form-group">
	          	<div class="form-block"><label>등급</label>
	          	</div>
	          	<label class="radio-inline">
	          		<input type="radio" name="grade" value="1" class="formGradeNo">일반회원
	          	</label>
	          	<label class="radio-inline">
	          		<input type="radio" name="grade" value="9" class="formGradeNo">관리자
	          	</label>
          	</div>
          	
          </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" id="changeBtn">변경</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
        </div>
      </div>
      
    </div>
  </div>



	<div class="row">
		<div class="text-right">
			<pageNav:pageNav listURI="list.do" pageObject="${pageObject }" />
		</div>
	</div>
	
</div>
</body>
</html>

<%
	session.removeAttribute("msg");
%>
