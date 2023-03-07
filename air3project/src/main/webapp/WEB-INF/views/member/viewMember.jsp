<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

fieldset.scheduler-border {
  border: 1px groove #ddd !important;
  padding: 1.4em 1.4em 1.4em 1.4em !important;
  margin: 0 0 1.5em 0 !important;
  -webkit-box-shadow: 0px 0px 0px 0px #000;
  box-shadow: 0px 0px 0px 0px #000;
  margin-top: 30px !important;
}

legend.scheduler-border {
  font-size: 1.2em !important;
  font-weight: bold !important;
  text-align: left !important;
  width: auto;
  padding: 0 10px;
  border-bottom: none;
  margin-top: -15px;
  background-color: white;
  color: black;
}

.text{
    font-size: 1.5rem;
    line-height: 1.56;
	border-bottom: 1px solid #d9dbe1;
/* 	font-weight: 600; */
	font-weight: bold;
}

p{
	margin-bottom: 2rem;
}

.field+.field {
    margin-top: 4rem;
}

.field{
	width:100%;
}
#chgPwBtn{
	margin: 0 10px ;
}

.title{
	margin-bottom: 1rem;
	font-size: 1.2rem;
	display: block;
	color: gray;
}
h1 {
  color: #004080; /* 글자색 */
  font-size: 32px; /* 폰트 크기 */
  font-weight: bold; /* 굵게 */
  text-align: center; /* 가운데 정렬 */
  margin-top: 50px; /* 위쪽 여백 */
}
h2 {
  color: #004080; /* 글자색 */
  font-size: 25px; /* 폰트 크기 */
  font-weight: bold; /* 굵게 */
  margin-left: 10px;
}
h3 {
  color: #666; /* 글자색 */
  font-size: 15px; /* 폰트 크기 */
  font-weight: bold; /* 굵게 */
  text-align: center; /* 가운데 정렬 */
}
.menu-btn {
  background-color: #004080; /* 버튼 배경색 */
  color: white; /* 버튼 글자색 */
  border: none; /* 버튼 테두리 없음 */
  padding: 12px 24px; /* 버튼 패딩 */
  text-align: center; /* 버튼 텍스트 가운데 정렬 */
  text-decoration: none; /* 버튼 텍스트에 밑줄 없음 */
  display: inline-block; /* 버튼을 inline 요소로 변경 */
  font-size: 16px; /* 버튼 글자 크기 */
  margin: 4px 0; /* 버튼 마진 */
  cursor: pointer; /* 커서 모양 변경 */
  border-radius: 4px; /* 버튼 모서리 둥글게 */
  flex-basis: calc((100% - 10px) / 2); /* 요소들의 너비를 계산하여 설정 */
  max-width: calc((100% - 10px) / 2); /* 요소들의 최대 너비를 계산하여 설정 */
  box-sizing: border-box; /* padding과 border를 포함한 크기로 지정 */
  transition: background-color 0.3s; /* 배경색 변경 시 부드럽게 */
  
  
}
.delete-Btn {
  background-color: #004080; /* 버튼 배경색 */
  color: white; /* 버튼 글자색 */
  border: none; /* 버튼 테두리 없음 */
  padding: 12px 24px; /* 버튼 패딩 */
  text-align: center; /* 버튼 텍스트 가운데 정렬 */
  text-decoration: none; /* 버튼 텍스트에 밑줄 없음 */
  display: inline-block; /* 버튼을 inline 요소로 변경 */
  font-size: 16px; /* 버튼 글자 크기 */
  margin: 4px 0; /* 버튼 마진 */
  cursor: pointer; /* 커서 모양 변경 */
  border-radius: 4px; /* 버튼 모서리 둥글게 */
  flex-basis: calc((100% - 10px) / 2); /* 요소들의 너비를 계산하여 설정 */
  box-sizing: border-box; /* padding과 border를 포함한 크기로 지정 */
  transition: background-color 0.3s; /* 배경색 변경 시 부드럽게 */
  
  
}
.menu-btn:hover {
  background-color: lightblue; /* 호버시 버튼 배경색 */
  color: black;
}
.delete-Btn:hover {
  background-color: lightblue; /* 호버시 버튼 배경색 */
  color: black;
}
.form{
	max-width: 850px;
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

	$("#deleteBtn").click(function(){
		
		if(confirm("해당 회원을 탈퇴시키겠습니까?"))
		location="deleteMember.do?page=${param.page }&perPageNum=${param.perPageNum }&id=${view.id}";
	});
	
});
</script>

</head>
<body>
<div class="container form">
	<div class="path">
	  <span>Home</span>
<!-- 	  <span>&gt;</span> -->
	  <span>회원관리</span>
<!-- 	  <span>&gt;</span> -->
	  <span>회원정보</span>
	</div>
	<h1>회원정보</h1>
			
		<fieldset class="scheduler-border">	
<!-- 		<legend class="scheduler-border">기본정보</legend> -->
			<div class="row">
				<div class="col-md-4">
					<h2>기본정보</h2>
				</div>
				
				<div class="box col-md-8">
					<div class="field">
						<span class="title">이름</span>
						<p class="text">${view.name } (${view.e_name }) </p>
					</div>
					
					<div class="field">
						<span class="title">아이디</span>
						<p class="text">${view.id }</p>
					</div>
					
					<div class="field">
						<span class="title">성별</span>
						<p class="text">${view.gender }</p>
					</div>
					
					<div class="field">
						<span class="title">생년월일</span>
						<p class="text">${view.birth }</p>
					</div>
					
					<div class="field">
						<span class="title">이메일</span>
						<p class="text">${view.email1 }@${view.email2 }</p>
					</div>
					
					<div class="field">
						<span class="title">휴대전화 번호</span>
						<p class="text">${view.tel }</p>
					</div>
					
					<div class="field">
						<span class="title">거주국가</span>
						<p class="text">${view.country }</p>
					</div>
				</div>
			</div>
		</fieldset>	
		
		<fieldset class="scheduler-border">	
<!-- 		<legend class="scheduler-border">여권정보</legend> -->
			<div class="row">
				<div class="col-md-4">
					<h2>여권정보</h2>
				</div>
				
				<div class="box col-md-8">
					<div class="field">
						<span class="title">국적</span>
						<p class="text">${view.p_nationality }</p>
					</div>
					
					<div class="field">
						<span class="title">발급국가</span>
						<p class="text">${view.p_country }</p>
					</div>
					
					<div class="field">
						<span class="title">여권번호</span>
						<p class="text">${view.p_no }</p>
					</div>
					
					<div class="field">
						<span class="title">만료일</span>
						<p class="text">${view.p_date }</p>
					</div>
				</div>
			</div>	
		</fieldset>
		
		<div>
				<a href="updateMember.do?id=${view.id }&page=${param.page }&perPageNum=${param.perPageNum }&key=${param.key }&word=${param.word }" class="btn menu-btn btn-default">정보수정</a>
				<a href="list.do?page=${param.page }&perPageNum=${param.perPageNum }&key=${param.key }&word=${param.word }" class="btn menu-btn btn-default">리스트</a>
			<div style="float:right; display: inline-block;">
				<button class="btn delete-Btn btn-default" id="deleteBtn">강제탈퇴</button>
			</div>
		</div>
	
</div>
</body>
</html>

<%
	session.removeAttribute("msg");
%>