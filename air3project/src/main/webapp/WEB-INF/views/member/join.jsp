<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style type="text/css">
h1.h11 {
  color: #004080; /* 글자색 */
  font-size: 32px; /* 폰트 크기 */
  font-weight: bold; /* 굵게 */
  text-align: center; /* 가운데 정렬 */
  margin-top: 50px; /* 위쪽 여백 */
}
h3.h33 {
  color: #333; /* 글자색 */
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

.cancel-btn{
	  background-color: white; /* 버튼 배경색 */
	  color: black; /* 버튼 글자색 */
	  border: 1px solid black;
	
}
.menu-btn:hover {
  background-color: lightblue; /* 호버시 버튼 배경색 */
  color: black;
}



dialog__contents {
    width: 88rem;
    height: auto;
    max-height: 99%;
}
.dialog__contents, .dialog__contents.-datepicker {
    padding: 4.6rem 4rem 0;
}
.dialog__aligner {
    margin: 2rem 0 0;
    padding-bottom: 4rem;
}
.ts__h1.-bold {
    font-weight: 700;
}
.ts__h2 {
    margin: 2.4rem 0 1.6rem;
    font-size: 1.8rem;
}
.ts__h3.-colored {
    color: #00256c;
}
.ts__h3 {
    margin: 1.6rem 0 0.8rem;
    font-size: 1.4rem;
}
.ts__p {
    font-size: 1.4rem;
    line-height: 1.58;
    display: block;
    margin: 0.8rem 0;
    color: #555;
    font-weight: 400;
    font-size: 1.2rem;
}
.ts__list {
    margin: 0.8rem 0;
}
.ts__item {
    font-size: 1.4rem;
    line-height: 1.58;
    color: #555;
    font-weight: 400;
    font-size: 1.2rem;
}
.ts__list.-number {
    list-style: decimal;
    padding-left: 2.2rem;
}

.ts__p {
    font-size: 1.4rem;
    line-height: 1.58;
    display: block;
    margin: 0.8rem 0;
    color: #555;
    font-weight: 400;
    font-size: 1.2rem;
}
li{
	text-align: left;
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

-bold{
	    font-weight: 700;
}
.checkbox-menu{
	color: inherit;
}
.checkbox-label{
	font-weight: normal;
}

.icon-style:hover{
	cursor: pointer;
}
.icon-style{
	color: #838383;
}

</style>

<script type="text/javascript">
$(function(){
	
//     $(".alert").hide(); // div를 숨겨놓음
	
	$('[id^=collapseIcon]').click(function(){
	    var idx = $(this).attr('id').replace('collapseIcon', '');
	    $('#collapseLink' + idx).click();
	});
	
	$("#submitBtn").click(function(){
	    var checkboxes = document.querySelectorAll('#checkbox1, #checkbox2, #checkbox3');
	    var isChecked = true; // 기본적으로 모두 선택되어 있는 것으로 가정

	    checkboxes.forEach(function(checkbox) {
	        if (!checkbox.checked) {
	            isChecked = false; // 하나라도 선택되어 있지 않으면 isChecked를 false로 변경
	        }
	    });

	    if (!isChecked) {
	        $(".alert").show(); // div를 보이게 함
	        return false;
	    } else {
	        location="/member/write.do";
	    }
	});
	
	 $(".confirm").click(function(){
	        $(".collapse").collapse("hide");
	 });
	
	 
	// 체크박스의 상태가 변경될 때 실행될 함수
	 function toggleCheckboxes() {
	     var checkboxes = document.querySelectorAll('#checkbox1, #checkbox2, #checkbox3, #checkbox4');
	     var allChecked = true;

	     checkboxes.forEach(function(checkbox) {
	         if (document.querySelector('#checkbox-all').checked) {
	             checkbox.checked = true;
	         } 

	         if (!checkbox.checked) {
	             allChecked = false;
	         }
	     });

	     document.querySelector('#checkbox-all').checked = allChecked;
	 }

	// 체크박스 전체를 선택할 때와 해제할 때 모두 toggleCheckboxes 함수를 실행
	 document.querySelector('#checkbox-all').addEventListener('change', function() {
	     var checkboxes = document.querySelectorAll('#checkbox1, #checkbox2, #checkbox3, #checkbox4');
	     checkboxes.forEach(function(checkbox) {
	         checkbox.checked = document.querySelector('#checkbox-all').checked;
	     });
	 });

	 // 각각의 체크박스가 선택될 때 toggleCheckboxAll 함수와 toggleCheckboxes 함수를 실행
	 document.querySelectorAll('#checkbox1, #checkbox2, #checkbox3, #checkbox4').forEach(function(checkbox) {
	     checkbox.addEventListener('change', function() {
	         toggleCheckboxAll();
	         toggleCheckboxes();
	     });
	 });

	 // 체크박스의 상태가 변경될 때 실행될 함수
	 function toggleCheckboxAll() {
	     var checkboxAll = document.querySelector('#checkbox-all');
	     var checkboxes = document.querySelectorAll('#checkbox1, #checkbox2, #checkbox3, #checkbox4');
	     var allChecked = true;

	     checkboxes.forEach(function(checkbox) {
	         if (!checkbox.checked) {
	             allChecked = false;
	         }
	     });

	     checkboxAll.checked = allChecked;
	 }
	 
	 
	 $("#cancelBtn").click(function(){
		 if(confirm("회원가입을 취소하시겠습니까?")) history.back();
	 });
	 
	 
});

</script>

</head>
<body>
<div class="container">
	<div class="path">
	  <span>Home</span>
	  <span>회원가입</span>
	  <span>약관동의</span>
	</div>
	<h1 class="h11">약관동의</h1>
	<h3 class="h33">약관 및 개인정보 수집 이용에 동의 해주세요.</h3>
	 
  <div class="panel-group" id="accordion">
  <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
        	<input id="checkbox-all" role="checkbox" type="checkbox" aria-checked="false" 
        	aria-controls="checkbox1 checkbox2 checkbox3 checkbox4" class="checkbox-all">
          <label for="checkbox-all" class="-bold">
	          <span>필수 및 선택 약관에 모두 동의합니다.</span>
          </label>
        </h4>
      </div>
    </div>
  
  
  
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
        	<input id="checkbox1" role="checkbox" type="checkbox" aria-checked="false">
        	<label for="checkbox1" class="checkbox-label">
	          <a data-toggle="collapse" data-parent="#accordion" href="#collapse1" class="checkbox-menu" id="collapseLink1">[필수] 이용약관</a>
        	</label>
        	 <span style="float: right;">
	        	<i class='fas fa-caret-down icon-style' style="font-size: 1.5em;" id="collapseIcon1"></i>
        	</span>
        </h4>
      </div>
      <div id="collapse1" class="panel-collapse collapse">
      
        <div class="panel-body"><div class="dialog__contents" role="document" tabindex="-1" data-focus="true"><h2 class="h1" data-focus="true" id="terms-detail01-title" tabindex="-1">약관 상세</h2><div class="dialog__aligner"><div>

     <div class="cmp-text">
          <div class="ts"><h2 class="ts__h1 -bold">온라인 회원 약관</h2>
<h3 class="ts__h2 -bold">제 1 장 총칙</h3>
<h4 class="ts__h3 -bold -colored">제1조 (목적)</h4>
<p class="ts__p">이 약관은 ㈜대한항공(이하 "대한항공"이라 합니다)이 운영하는 대한항공 온라인 플랫폼에서 제공하는 온라인 서비스(이하 "서비스"라 합니다)를 이용함에 있어 대한항공과 이용자의 권리<span aria-hidden="true">·</span><span class="_hidden">&nbsp;및&nbsp;</span>의무 및 책임사항을 규정함을 목적으로 합니다.</p>
<h4 class="ts__h3 -bold -colored">제2조 (용어의 정의)</h4>
<ol class="ts__list -number">
<li class="ts__item">“대한항공 온라인 플랫폼”이란 대한항공이 정보 또는 서비스를 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비와 정보통신망을 이용하여 정보 및 서비스를 이용자에게 제공하고 재화 또는 용역을 거래할 수 있도록 설정한 가상의 영업장(PC/모바일웹, 모바일 어플리케이션)을 말합니다.</li>
<li class="ts__item">“이용자”란 대한항공 온라인 플랫폼에 접속하여 이 약관에 따라 대한항공이 제공하는 서비스를 받는 회원 및 비회원을 말합니다.</li>
<li class="ts__item">"SKYPASS(스카이패스) 회원"이란 대한항공의 탑승 및 제휴사를 이용할 때마다 보너스 마일리지를 적립하고 적립된 마일리지를 사용하고자 스카이패스 회원 약관에 동의하고 회원이 된 자를 말합니다.</li>
<li class="ts__item">“회원”이라 함은 스카이패스 회원 중 대한항공 온라인 플랫폼에 개인정보를 제공하여 회원등록을 한 자로서, 대한항공의 정보를 지속적으로 제공받으며, 대한항공이 제공하는 서비스를 계속적으로 이용할 수 있는 자를 말합니다.</li>
<li class="ts__item">"비회원"이라 함은 회원으로 가입하지 않고 대한항공이 제공하는 정보 및 서비스를 이용하는 자를 말합니다.</li>
<li class="ts__item">"입점 제휴사"라 함은 대한항공과 제휴되어 온라인플랫폼에 입점 및 연결된 사이트의 제휴사를 말합니다.</li>
<li class="ts__item">"개인정보" 라 함은 당해 정보에 포함되어 있는 성명, 전자우편 등의 사항에 의하여 특정 개인을 식별할 수 있는 정보 (당해 정보만으로는 특정 개인을 인식할 수 없더라도 다른 정보 용이하게 결합하여 식별할 수 있는 것을 포함한다)을 말합니다.</li>
</ol>
<h4 class="ts__h3 -bold -colored">제3조 (약관의 명시와 개정)</h4>
<ol class="ts__list -number">
<li class="ts__item">대한항공은 이 약관의 내용과 상호, 연락처(전자우편주소, 전화번호, 팩스번호 등), 통신판매업신고번호 등을 이용자가 알 수 있도록 초기 서비스화면(전면)에 게시합니다.</li>
<li class="ts__item">대한항공은 약관의규제에관한법률, 전자거래기본법, 전자서명법, 정보통신망이용촉진및정보보호등에관한법률, 소비자기본법, 전자상거래등에서의소비자보호에관한법률 등 관련법령을 위반하지 않는 범위에서 이 약관을 개정할 수 있습니다.</li>
<li class="ts__item">약관을 개정할 경우에는 개정사유 및 적용일자를 명시하여 현행약관과 함께 초기화면에 그 적용일자 7일 이전부터 적용일자 전일까지 공지합니다.</li>
<li class="ts__item">개정약관은 개정된 내용이 관계 법령에 위배되지 않는 한 개정 이전에 회원으로 가입한 이용자에게도 적용됩니다. 다만 개정약관의 적용을 거절하는 뜻을 약관의 공시기간 내에 대한항공에 명시적으로 통지한 이용자에 대해서는 개정전의 약관조항이 적용됩니다.</li>
<li class="ts__item">이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 전자상거래등에서의소비자보호에관한법률, 약관의규제에관한법률, 공정거래위원회가 정하는 전자상거래등에서의소비자보호지침, 관계법령 또는 상관례에 따릅니다.</li>
</ol>
<h3 class="ts__h2 -bold">제 2 장 서비스 이용</h3>
<h4 class="ts__h3 -bold -colored">제4조 (서비스의 제공)</h4>
<p class="ts__p">대한항공이 온라인 플랫폼을 통하여 제공하는 서비스는 아래와 같습니다.</p>
<ol class="ts__list -number-circle">
<li class="ts__item">항공권 예약 및 구매에 관련된 정보, 서비스 제공</li>
<li class="ts__item">스카이패스 관련 서비스</li>
<li class="ts__item">에어텔, 호텔, 렌터카 등 여행 관련 정보, 서비스 제공</li>
<li class="ts__item">기타 대한항공이 정하는 업무</li>
</ol>
<h4 class="ts__h3 -bold -colored">제5조 (서비스의 중단)</h4>
<ol class="ts__list -number">
<li class="ts__item">대한항공은 컴퓨터 등 정보통신설비의 점검<span aria-hidden="true">·</span><span class="_hidden">&nbsp;및&nbsp;</span>보수<span aria-hidden="true">·</span><span class="_hidden">&nbsp;및&nbsp;</span>교체<span aria-hidden="true">·</span><span class="_hidden">&nbsp;및&nbsp;</span>고장<span aria-hidden="true">·</span><span class="_hidden">&nbsp;및&nbsp;</span>통신두절 등의 경우에는 온라인 플랫폼 상의 서비스 제공을 일시적으로 중단할 수 있습니다.</li>
<li class="ts__item">제1항에 의한 서비스 중단의 경우 대한항공은 제8조에 정한 방법으로 이용자에게 통지합니다.</li>
<li class="ts__item">대한항공은 제1항의 사유로 서비스의 제공이 일시적으로 중단됨으로 이용자 또는 제 3자가 입은 손해를 배상하지 아니합니다. 단, 대한항공에 고의 또는 중대한 과실이 있는 경우에는 그러하지 아니합니다.</li>
<li class="ts__item">대한항공은 이용자가 다음 각 호의 1에 해당하는 행위 또는 행위를 할 우려가 있는 경우 사전통지 없이 서비스 이용을 중단할 수 있습니다.<ol class="ts__list -number-circle">
<li class="ts__item">공공질서 또는 미풍양속에 반하는 행위</li>
<li class="ts__item">범죄와 관련되었다고 추정되는 일체의 행위</li>
<li class="ts__item">공공의 이익을 저해할 목적으로 서비스 이용을 계획 또는 실행하는 행위</li>
<li class="ts__item">서비스의 제공을 방해하는 등 서비스의 건전한 이용을 저해하는 행위</li>
</ol>
</li>
<li class="ts__item">제4항에 의한 서비스 중단의 경우 대한항공은 이용자 또는 제3자가 입은 손해를 배상하지 아니합니다.</li>
</ol>
<h4 class="ts__h3 -bold -colored">제6조 (회원가입)</h4>
<ol class="ts__list -number">
<li class="ts__item">이용자는 정해진 가입양식에 따라 회원정보를 기입한 후 이 약관에 동의한다는 의사표시를 하는 방법으로 회원가입을 신청합니다. 단, 14세 미만의 미성년자의 경우에는 법정 대리인의 동의를 받아 본 약관에 동의하고 가입신청을 할 수 있습니다.</li>
<li class="ts__item">회원이 되고자 하는 자는 반드시 실명으로 회원가입을 하여야 하며, 대한항공이 요청하는 개인정보를 제공해야 합니다.</li>
<li class="ts__item">대한항공은 이용자가 다음 각호에 해당하지 않는 한 회원으로 등록합니다.<ol class="ts__list -number-circle">
<li class="ts__item">가입신청자가 이 약관 제7조제4항에 의하여 회원자격을 상실한 경우. 다만 회원자격 상실 후 3년이 경과한 자로서 대한항공의 회원 재가입 승낙을 얻은 경우는 예외로 합니다.</li>
<li class="ts__item">등록 내용에 허위, 기재누락, 오기가 있는 경우</li>
<li class="ts__item">기타 회원으로 등록하는 것이 기술적으로 현저히 지장이 있다고 판단되는 경우</li>
</ol>
</li>
<li class="ts__item">회원가입계약의 성립시기는 대한항공의 승낙이 회원에게 도달한 시점으로 합니다.</li>
<li class="ts__item">회원은 등록사항에 변경이 있는 경우, 즉시 전자우편 기타 이에 준하는 방법으로 그 변경사항을 수정, 등록함으로써 최신의 정보를 유지해야 합니다.</li>
</ol>
<h4 class="ts__h3 -bold -colored">제7조 (회원탈퇴 및 자격상실 등)</h4>
<ol class="ts__list -number">
<li class="ts__item">회원은 언제든지 탈퇴신청을 할 수 있으며, 이 경우 대한항공은 즉시 회원탈퇴를 처리합니다.</li>
<li class="ts__item">회원이 다음 각 호의 사유에 해당하는 경우 대한항공은 서비스 이용을 제한 또는 해지시킬 수 있습니다.<ol class="ts__list -number-circle">
<li class="ts__item">회원 사망 시</li>
<li class="ts__item">가입 신청 시 허위 내용을 기재하거나 2개 이상의 I.D.로 이중 등록한 경우</li>
<li class="ts__item">대한항공 온라인 플랫폼에서 구매한 항공권 등의 대금지급채무 및 기타 사이트 이용과 관련하여 회원이 부담하는 채무를 불이행하는 경우</li>
<li class="ts__item">타인의 대한항공 온라인 플랫폼 이용을 방해하거나 타인의 개인정보를 도용하는 등 전자거래질서를 침해<span aria-hidden="true">·</span><span class="_hidden">&nbsp;및&nbsp;</span>위협하는 경우</li>
<li class="ts__item">대한항공 온라인 플랫폼을 이용하여 이 약관이 금지하는 행위 또는 법령, 공서양속 등에 반하는 행위를 하는 경우</li>
<li class="ts__item">회원가입 후, 연속하여 1년 동안 대한항공 온라인 플랫폼을 이용하기 위해 로그인한 기록이 없는 경우</li>
</ol>
</li>
<li class="ts__item">대한항공이 서비스 이용을 제한<span aria-hidden="true">·</span><span class="_hidden">&nbsp;및&nbsp;</span>정지하고자 할 때에는 미리 그 사유, 일시, 기간을 전자우편, 전화, 서면 등으로 이용자에게 통지합니다. 다만 긴급을 요할 경우에는 조치 후에 통지할 수 있습니다.</li>
<li class="ts__item">대한항공이 서비스이용을 제한<span aria-hidden="true">·</span><span class="_hidden">&nbsp;및&nbsp;</span>정지시킨 후 그 제재사유가 된 행위가 반복되거나 30일 이내에 그 사유가 시정되지 아니하는 경우 대한항공은 회원자격을 상실시킬 수 있습니다.</li>
<li class="ts__item">대한항공이 회원자격을 상실시키는 경우에는 회원등록을 말소하며, 이 경우 말소 전에 회원에게 이를 통지합니다. 단, 상기 2항의 6에 의하여 이용자의 회원자격을 상실시킬 경우에는 자격 상실 30일 전까지 동 내용에 대한 안내문을 제 8조에 의거 통지하며, 자격이 상실된 회원의 개인정보는 인터넷 개인정보취급방침 사항에 따라 파기합니다.</li>
<li class="ts__item">서비스이용의 제한, 정지, 회원자격의 상실로 인한 손해에 대해서 대한항공은 책임을 지지 않습니다.</li>
</ol>
<h4 class="ts__h3 -bold -colored">제8조 (회원에 대한 통지)</h4>
<ol class="ts__list -number">
<li class="ts__item">대한항공이 회원에 대한 통지를 하는 경우 회원이 제출한 전자우편주소로 할 수 있습니다.</li>
<li class="ts__item">대한항공은 불특정다수의 회원에게 통지하는 경우, 홈페이지에 7일이상 공시함으로써 개별통지에 갈음 할 수 있습니다. 다만, 회원 본인의 거래와 관련하여 중대한 영향을 미치는 사항에 대하여는 개별통지를 합니다.</li>
<li class="ts__item">제2항의 사유로 통지하는 경우, 부득이한 사정에 의해 사전 공시기간이 감축되거나 생략될 수 있습니다.</li>
</ol>
<h4 class="ts__h3 -bold -colored">제9조 (구매신청)</h4>
<p class="ts__p">이용자는 대한항공이 정한 아래 방법에 의하여 항공권 등의 구매신청을 할 수 있습니다.</p>
<ol class="ts__list -number-circle">
<li class="ts__item">성명, 성별, 연락처 등 입력</li>
<li class="ts__item">개인 정보 수집 및 규정, 법적 고지문, 약관 등에 동의한다는 표시(예: 마우스 클릭)</li>
<li class="ts__item">결제수단 선택</li>
</ol>
<h4 class="ts__h3 -bold -colored">제10조 (구매계약의 성립)</h4>
<ol class="ts__list -number">
<li class="ts__item">대한항공은 제9조에 정한 방법에 의한 구매신청에 대하여 다음 각 호에 해당하는 경우 승낙하지 않을 수 있습니다.<ul class="ts__list -dash">
<li class="ts__item">신청 내용에 허위, 기재누락, 오기가 있는 경우</li>
<li class="ts__item">구매신청에 대한 승낙이 영업상 또는 기술상 현저히 지장이 있다고 판단되는 경우</li>
</ul>
</li>
<li class="ts__item">대한항공의 승낙이 제12조제1항의 수신확인통지형태로 이용자에게 도달한 시점에 계약이 성립한 것으로 봅니다.</li>
</ol>
<h4 class="ts__h3 -bold -colored">제11조 (결제방법)</h4>
<p class="ts__p">대한항공 온라인 플랫폼에서 구매한 재화<span aria-hidden="true">·</span><span class="_hidden">&nbsp;및&nbsp;</span>용역에 대한 대금지급방법은 다음 각 호의 하나로 할 수 있습니다.</p>
<ol class="ts__list -number-circle">
<li class="ts__item">온라인 계좌이체</li>
<li class="ts__item">신용카드 결제</li>
<li class="ts__item">SKYPASS 마일리지에 의한 항공권 구입</li>
<li class="ts__item">기타 대한항공이 정한 결제방식</li>
</ol>
<h4 class="ts__h3 -bold -colored">제12조 (수신확인통지<span aria-hidden="true">·</span><span class="_hidden">&nbsp;및&nbsp;</span>구매신청 변경 및 취소)</h4>
<ol class="ts__list -number">
<li class="ts__item">대한항공은 이용자의 구매신청이 있는 경우 이용자에게 수신확인통지를 합니다.</li>
<li class="ts__item">수신확인통지를 받은 이용자는 의사표시의 불일치 등이 있는 경우에는 수신확인통지를 받은 후 즉시 구매신청 변경 및 취소를 요청할 수 있고, 대한항공은 그 요청에 따라 처리하여야 합니다.</li>
</ol>
<h3 class="ts__h2 -bold">제 3 장 책임과 의무</h3>
<h4 class="ts__h3 -bold -colored">제13조 (개인정보보호)</h4>
<ol class="ts__list -number">
<li class="ts__item">대한항공은 이용자로부터 정보를 수집할 경우 서비스의 제공 및 계약이행에 필요한 최소한의 정보만을 수집합니다.</li>
<li class="ts__item">이용자의 개인정보 보호에 대한 상세한 내용은 대한항공 온라인 플랫폼(www.koreanair.com)상의 개인정보취급방침에서 규정한 바에 따릅니다.</li>
</ol>
<h4 class="ts__h3 -bold -colored">제14조 (대한항공의 의무)</h4>
<ol class="ts__list -number">
<li class="ts__item">대한항공은 법령과 이 약관이 금지하거나 공서양속에 반하는 행위를 하지 않으며 이 약관이 정하는 바에 따라 지속적이고 안정적인 서비스 제공 및 재화<span aria-hidden="true">·</span><span class="_hidden">&nbsp;및&nbsp;</span>용역의 공급에 노력합니다.</li>
<li class="ts__item">대한항공은 이용자가 안전하게 서비스를 이용할 수 있도록 이용자의 개인정보(신용정보 포함)보호를 위한 보안 시스템을 갖추겠습니다.</li>
<li class="ts__item">대한항공이 상품이나 용역에 관하여 「표시<span aria-hidden="true">·</span><span class="_hidden">&nbsp;및&nbsp;</span>광고의공정화에관한법률」 제3조 소정의 부당한 표시<span aria-hidden="true">·</span><span class="_hidden">&nbsp;및&nbsp;</span>광고행위를 함으로써 이용자가 손해를 입은 때에는 이를 배상할 책임을 집니다.</li>
<li class="ts__item">대한항공은 이용자가 원하지 않는 영리목적의 광고성 전자우편을 발송하지 않습니다.</li>
</ol>
<h4 class="ts__h3 -bold -colored">제15조 (회원의 I.D. 및 비밀번호에 대한 의무)</h4>
<ol class="ts__list -number">
<li class="ts__item">개인정보취급방침에 명시된 이용을 제외한 I.D.와 비밀번호에 대한 관리책임은 회원에게 있습니다.</li>
<li class="ts__item">대한항공 온라인 플랫폼 서비스를 이용하고자 하는 회원은 대한항공이 정하는 바에 따라 회원 ID 및 비밀번호를 대한항공 온라인 플랫폼에 등록해야 합니다.</li>
<li class="ts__item">회원은 제3자에게 자신의 I.D. 및 비밀번호를 이용하게 해서는 안됩니다.</li>
<li class="ts__item">회원이 자신의 I.D. 및 비밀번호를 도용 당하거나 제3자가 사용하고 있음을 인지한 경우에는 즉시 대한항공에 통보하여 그 안내에 따라야 합니다.</li>
</ol>
<h4 class="ts__h3 -bold -colored">제16조 (이용자의 의무)</h4>
<p class="ts__p">이용자는 이 약관 및 관계법령을 준수하여야 하며, 다음의 행위를 해서는 안됩니다.</p>
<ol class="ts__list -number-circle">
<li class="ts__item">신청 또는 변경 시 허위내용의 기재</li>
<li class="ts__item">대한항공 온라인 플랫폼에 게시된 정보의 임의변경</li>
<li class="ts__item">대한항공이 허용하고 있지 않은 정보나 컴퓨터 프로그램 등을 무단으로 송신 또는 게시하는 행위</li>
<li class="ts__item">대한항공 기타 제3자의 저작권 등 지적재산권 침해</li>
<li class="ts__item">대한항공 기타 제3자의 명예, 프라이버시를 침해하거나 업무를 방해하는 행위</li>
<li class="ts__item">외설적 또는 폭력적 메시지<span aria-hidden="true">·</span><span class="_hidden">&nbsp;및&nbsp;</span>화상<span aria-hidden="true">·</span><span class="_hidden">&nbsp;및&nbsp;</span>음성 기타 공서양속에 반하는 정보를 송신, 공개 또는 게시하는 행위</li>
</ol>
<h4 class="ts__h3 -bold -colored">제17조 (대한항공 온라인 플랫폼과 연결 사이트 간의 관계)</h4>
<p class="ts__p">대한항공 온라인 플랫폼과 연결 사이트가 하이퍼링크 (하이퍼링크의 대상에는 문자, 그림 및 동화상 등이 포함) 방식으로 연결 된 경우, 대한항공은 연결 사이트가 독자적으로 제공하는 재화<span aria-hidden="true">·</span><span class="_hidden">&nbsp;및&nbsp;</span>용역에 의하여 이용자와 행하는 거래에 대해서 보증책임을 지지 않습니다.</p>
<h4 class="ts__h3 -bold -colored">제18조 (저작권의 귀속 및 이용제한)</h4>
<ol class="ts__list -number">
<li class="ts__item">대한항공이 작성한 저작물에 대한 저작권 기타 지적재산권은 대한항공에 귀속합니다.</li>
<li class="ts__item">이용자는 대한항공 온라인 플랫폼을 이용함으로써 얻은 정보를 대한항공의 사전 승낙 없이 복제, 송신, 출판, 배포, 방송 기타 방법에 의하여 영리목적으로 이용하거나 제3자로 하여금 이용하게 해서는 안됩니다.</li>
</ol>
<h4 class="ts__h3 -bold -colored">제19조 (분쟁해결)</h4>
<ol class="ts__list -number">
<li class="ts__item">대한항공은 이용자가 제기하는 정당한 의견이나 불만을 반영하고 그 피해를 보상처리하기 위하여 피해보상처리기구를 설치<span aria-hidden="true">·</span><span class="_hidden">&nbsp;및&nbsp;</span>운영합니다.</li>
<li class="ts__item">대한항공은 이용자가 제기하는 불만사항 및 의견을 신속<span aria-hidden="true">·</span><span class="_hidden">&nbsp;및&nbsp;</span>적정하게 처리합니다. 다만 신속한 처리가 곤란한 경우에는 이용자에게 그 사유와 처리일정을 지체 없이 통보해 드립니다.</li>
<li class="ts__item">대한항공과 이용자간에 전자거래에 관한 분쟁 발생시 전자거래기본법 및 동법 시행령에 근거 하여 설치된 전자거래분쟁조정위원회의 조정에 따를 수 있습니다.</li>
</ol>
<h4 class="ts__h3 -bold -colored">제20조 (관할법원 및 준거법)</h4>
<ol class="ts__list -number">
<li class="ts__item">대한항공과 이용자간에 발생한 전자거래 분쟁에 관한 소는 서울중앙지방법원에 제기합니다.</li>
<li class="ts__item">대한항공과 이용자간에 제기된 전자거래 소송에는 대한민국 법을 적용합니다.</li>
</ol>
<h3 class="ts__h2 -bold">부칙</h3>
<h4 class="ts__h3 -bold -colored">제1조 (약관의 효력)</h4>
<p class="ts__p">이 약관은 2001년 3월 13일부터 시행하며, 이 약관이 개정되기 전에 가입한 회원에게도 적용됩니다.</p>
<h4 class="ts__h3 -bold -colored">제2조 (약관의 개정)</h4>
<p class="ts__p">대한항공은 대한민국의 "약관의 규제에 관한 법률", "전자거래기본법", "전자서명법", "정보통신망 이용촉진 및 정보보호 등에 관한 법률", "소비자기본법", "전자상거래 등에서의 소비자보호에 관한 법률", "개인정보보호법" 등 관련법규를 준수합니다. 따라서 대한항공의 회원 약관은 대한민국 관련법규개정 및 정부지침의 변경으로 인하여 그 내용이 변경될 수 있습니다. 회원 약관 개정 시에는 개정일자, 개정이유, 개정내용 등을 온라인 플랫폼에 공시하겠습니다.</p>
<ul class="ts__list -disc">
<li class="ts__item">이용약관 버전 번호 : v1.5</li>
<li class="ts__item">이용약관 시행 일자 : 2001-3-13</li>
<li class="ts__item">이용약관 개정 일자<ul class="ts__list -dash">
<li class="ts__item">2001-03-13 버전 번호 v1.0 시행</li>
<li class="ts__item">2008-10-08 (v1.1)<ul class="ts__list">
<li class="ts__item">변경사항 : 소비자보호법 개정에 따른 ‘소비자기본법’으로의 명칭 변경, 회원탈퇴 및 자격상실의 조건에 회원 사망 시 추가</li>
<li class="ts__item">추가사항 : 인터넷 회원 약관의 개정에 관한 사항 추가</li>
</ul>
</li>
<li class="ts__item">2011-09-27 추가사항 : 서비스 중단 사유 추가 (v1.2)</li>
<li class="ts__item">2011-11-01 추가사항 : 회원탈퇴 및 자격상실 조건 추가 (v1.3)</li>
<li class="ts__item">2012-08-20 변경사항 : '정보통신망 이용촉진 및 정보보호 등에 관한 법률' 개정에 따라 회원탈퇴 및 자격 상실의 조건, 통지 방법 변경 (v1.4)</li>
<li class="ts__item">2020-10-12 (v1.5)<ul class="ts__list">
<li class="ts__item">변경사항 : 약관 명칭을 ‘인터넷 회원 약관’에서 ‘이용약관’으로 변경, 기존 ‘웹사이트’의 ‘온라인 플랫폼’으로의 용어 변경</li>
<li class="ts__item">추가사항 : '용어의 정의'에 일부 용어 추가, 회원가입의 조건에 만 14세 미만의 경우 및 실명 가입 추가</li>
</ul>
</li>
</ul>
</li>
</ul>
<h2 class="ts__h1 -bold">스카이패스 회원 약관</h2>
<p class="ts__p">본 약관은 “약관의규제에관한법률”을 준수하고 있습니다. 스카이패스 회원님께서는 본 약관을 준수하셔야 합니다.</p>
<h3 class="ts__h3 -bold -colored">제1조</h3>
<p class="ts__p">회원 계좌는 각 개별회원에게 부여되며 1인 1계좌만 허용됩니다.</p>
<h3 class="ts__h3 -bold -colored">제2조</h3>
<p class="ts__p">스카이패스 회원카드는 회원 본인만 사용하실 수 있으며, 타인에게 양도 또는 대여하실 수 없습니다. 또한 회원카드의 분실ㆍ도난 등으로 인하여 부정사용되는 경우 대한항공은 책임을 지지 않습니다.</p>
<h3 class="ts__h3 -bold -colored">제3조</h3>
<p class="ts__p">마일리지 적립ㆍ보너스 사용 등 스카이패스 제도 혜택은 회원 가입일로부터 회원 본인에게만 제공되며, 항공 탑승 마일리지는 해당 항공편 탑승이 완료된 경우에만 적립됩니다. 즉, 기상조건, 천재지변, 불가항력, 파업, 폭동, 소요, 출입국 금지, 동란, 전쟁, 기재 고장 등의 사유로 항공편 탑승이 완료되지 않은 경우 마일리지는 적립되지 않습니다.</p>
<h3 class="ts__h3 -bold -colored">제4조</h3>
<p class="ts__p">2008년 7월 1일 이후에 적립한 마일리지는 적립일로부터 10년간 유효하며 유효기간 내에 사용되지 않은 마일리지는 소멸됩니다. 다만, 2008년 6월 30일 이전에 적립한 마일리지는 유효기간이 적용되지 않습니다. 대한항공 또는 제휴 항공사를 이용한 마일리지는 탑승일로부터, 제휴사를 이용한 마일리지는 회원 계좌에 적립된 날로부터 유효기간이 적용됩니다.</p>
<h3 class="ts__h3 -bold -colored">제5조</h3>
<p class="ts__p">대한항공은 5년 동안 마일리지 적립 및 보너스 사용 실적이 없는 회원을 휴면 회원으로 구분하여 별도 관리할 수 있습니다. 휴면 회원으로 전환된 회원은 본인확인 절차를 거쳐 기존과 동일하게 보너스 사용 등 스카이패스 제도 혜택을 이용하실 수 있습니다.</p>
<h3 class="ts__h3 -bold -colored">제6조</h3>
<p class="ts__p">항공권의 운임(클래스)에 따라 마일리지가 차등 적립되거나, 좌석승급 보너스가 제한될 수 있습니다.</p>
<h3 class="ts__h3 -bold -colored">제7조</h3>
<p class="ts__p">회원이 대한항공 혹은 제휴사 이용을 통해 적립한 마일리지는 보너스 사용에 있어 동일하게 취급되며, 대한항공이 제시하는 보너스로만 사용될 수 있습니다. 또한 적립한 마일리지는 금전적으로 환산하거나 타인에게 양도ㆍ판매될 수 없습니다.</p>
<h3 class="ts__h3 -bold -colored">제8조</h3>
<p class="ts__p">사망한 회원의 계좌 및 적립 마일리지는 상속될 수 없으며 자동 소멸됩니다.</p>
<h3 class="ts__h3 -bold -colored">제9조</h3>
<p class="ts__p">보너스 항공권 또는 좌석승급 보너스의 사용은 여유좌석 이용이 원칙이며, 보너스 예약 클래스는 별도로 지정되어 있습니다. 또한 보너스 좌석 수와 사용은 제한될 수 있습니다.</p>
<h3 class="ts__h3 -bold -colored">제10조</h3>
<p class="ts__p">보너스 사용시 발생되는 세금, 유류할증료, 수수료(보너스항공권 직접 발급 수수료 포함) 등은 보너스 사용인이 부담해야 합니다.</p>
<h3 class="ts__h3 -bold -colored">제11조</h3>
<p class="ts__p">대한항공은 시스템 오류에 의한 오적립, 부정한 방법에 의한 적립 등의 사유로 회원의 제반 실적에 오류가 발생한 경우 이를 정정하고 그 내용을 고객에게 지체 없이 통지합니다. 위 통지를 받은 회원은 본 약관 제13조에도 불구하고 통지 받은 날로부터 1년 내에 통지 내용에 대하여 이의를 제기할 수 있습니다.</p>
<h3 class="ts__h3 -bold -colored">제12조</h3>
<ol class="ts__list -number">
<li class="ts__item">스카이패스 회원 혹은 대리인이 각종 증빙서류 위•변조, 서류의 허위 기재, 회원 규정 위반 혹은 악용 시에는 회원자격 박탈, 회원 계좌 폐쇄, 부당한 방법에 의해 적립한 마일리지 삭제 혹은 발급된 보너스를 취소시킬 수 있으며, 해당 회원 및 대리인에 대해 (재)가입을 불허할 수 있습니다.</li>
<li class="ts__item">대한항공은 제1항에 의한 조치를 취할 경우 그 내용을 고객에게 지체 없이 통지하며, 위 통지를 받은 회원은 본 약관 제13조에도 불구하고 통지 받은 날로부터 1년 내에 통지 내용에 대하여 이의를 제기할 수 있습니다.</li>
<li class="ts__item">대한항공은 스카이패스 회원 혹은 대리인이 부당한 방법에 의해 보너스를 발급, 사용한 경우 대한항공은 유상 운임에 상응하는 현금 배상 청구 및 필요한 법적 조치를 취할 수 있습니다.</li>
</ol>
<h3 class="ts__h3 -bold -colored">제13조</h3>
<p class="ts__p">대한항공 이용실적 또는 보너스와 관련된 제반 이의는 해당 항공편 탑승일 또는 보너스 지급일로부터 1년 이내에 제기되어야 합니다.</p>
<h3 class="ts__h3 -bold -colored">제14조</h3>
<ol class="ts__list -number">
<li class="ts__item">스카이패스 회원과 제휴사 간의 개별적인 계약조건은 대한항공과는 무관합니다.</li>
<li class="ts__item">대한항공과 제휴사간에 체결된 프로그램은 제휴 계약조건 혹은 제휴사 사정에 따라 사전통보없이 변경되거나 중단될 수 있습니다. 그러한 경우 대한항공은 이를 사전에 홈페이지에 게시하거나 이메일 등의 방법을 통하여 개별적으로 고지합니다. 단, 제휴사의 기타 불가피한 사정 등으로 사전 고지가 불가능한 경우에는 지체 없이 고객에게 고지합니다.</li>
<li class="ts__item">회원이 스카이패스 혜택을 제공받기 위해 제휴사를 이용할 경우 해당 제휴사의 규정에 따라야 하며, 제휴사 이용과정에서 발생할 수 있는 회원의 피해에 대하여 대한항공은 책임이 없습니다. 다만, 대한항공의 귀책사유가 있는 경우에는 그렇지 않습니다.</li>
</ol>
<h3 class="ts__h3 -bold -colored">제15조</h3>
<p class="ts__p">보너스제도의 내용은 관련 법령이 개정 또는 폐지된 경우, 국가 경제의 심각한 악화, 국가 신인도의 급격한 하락, 기타 이에 준하는 경제사정의 중대한 변동으로 제도의 현상유지가 어려운 경우, 국제적 제휴를 위하여 Global Standard와의 격차 해소를 위해 불가피한 경우, 항공 수요의 급격한 변화 등 항공사의 영업 환경의 현저한 변화에 따라 보너스 제도 내용의 변경이 필요한 경우 등으로서 상당한 이유가 있는 경우 3개월 전에 사전 고지한 후 변경될 수 있습니다. 다만, 제도변경 발효일 이전까지 회원이 취득한 마일리지의 경우에는 마일리지 공제로 지급되는 보너스에 대하여 제도변경 발효일 이후 12개월까지는 변경전의 제도가 적용되고 그 이후에는 변경된 제도가 적용됩니다.</p>
<h3 class="ts__h3 -bold -colored">제16조</h3>
<p class="ts__p">회원으로 등록된 지역에 따라 혜택과 적용 규정이 다를 수 있습니다.</p>
<h3 class="ts__h3 -bold -colored">제17조</h3>
<p class="ts__p">회원은 본인의 개인정보가 변경된 경우 대한항공에 수정을 요청하여야 하며, 주소 미등록, 부정확한 개인정보 혹은 우편물의 분실로 인해 대한항공으로부터 연락을 받지 못해 손해가 발생한 경우, 대한항공은 이에 대해 책임을 지지 않습니다.</p>
<h3 class="ts__h2 -bold">부칙</h3>
<p class="ts__p">(약관의 효력) 이 약관은 2022년 9월 1일부터 시행하며, 이 약관이 개정되기 전에 가입한 회원에게도 적용됩니다.</p>
</div>

     </div>
          
          <div>
          <div>
          </div>
        </div></div>
        <div class="confirms -center">
        	<button class="confirm btn btn-default menu-btn" type="button" data-toggle="collapse" data-parent="#accordion">확인</button>
        </div>
        </div>
        </div>
        </div>
      </div>
    </div>
    
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
        <input id="checkbox2" role="checkbox" type="checkbox" aria-checked="false">
        	<label for="checkbox2" class="checkbox-label">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse2" class="checkbox-menu" id="collapseLink2">[필수] 개인정보 수집 및 이용 동의</a>
        	</label>
        	<span style="float: right;">
	        	<i class='fas fa-caret-down icon-style' style="font-size: 1.5em;" id="collapseIcon2"></i>
        	</span>
        </h4>
      </div>
      <div id="collapse2" class="panel-collapse collapse">
        <div class="panel-body">
        <div class="dialog__contents" role="document" tabindex="-1" data-focus="true"><h2 class="h1" data-focus="true" id="terms-detail02-title">약관 상세</h2><div class="dialog__aligner"><div>
    


     <div class="cmp-text">
          <div class="ts"><h2 class="ts__h1 -bold">회원의 개인정보 수집 및 이용에 대한 동의 사항</h2>
<h3 class="ts__h2 -bold">1. 수집하는 개인정보의 항목</h3>
<ol class="ts__list -word">
<li class="ts__item -bold">회원가입<ol class="ts__list -number-circle">
<li class="ts__item">필수항목<p class="ts__p">아이디(ID), 비밀번호, 성명(한글 및 영어), 연계정보(CI), 생년월일, 성별, 연락처 (전화번호, 휴대전화번호, 이메일 주소)</p>
</li>
<li class="ts__item">선택항목<p class="ts__p">우편물 수령지(자택/직장), 직장정보(직장명, 부서명, 직위)</p>
</li>
<li class="ts__item">만 14세 미만의 회원가입<p class="ts__p">보호자의 성명, 가입자와의 관계, 연락처(전화번호, 휴대전화번호, 이메일 주소), 스카이패스번호(선택)</p>
</li>
</ol>
</li>
<li class="ts__item -bold">기타 홈페이지 이용<ol class="ts__list -number-circle">
<li class="ts__item">국내선 예약<p class="ts__p">탑승자 성명, 생년월일, 성별, 연락처, 이메일 주소, 국적, 마일리지 적립 항공사 및 회원번호(선택), 할인 선택 시 해당 인적사항(선택)</p>
</li>
<li class="ts__item">국제선 예약<p class="ts__p">탑승자 성명, 생년월일, 성별, 연락처, 이메일 주소, 마일리지 적립 항공사 및 회원번호(선택), 할인 선택 시 해당 인적사항(선택)</p>
</li>
<li class="ts__item">카드결제<p class="ts__p">카드번호, 유효기간, 승인번호 등</p>
</li>
<li class="ts__item">환불(한국)<p class="ts__p">계좌번호, 은행명, 승인번호&nbsp;</p>
</li>
<li class="ts__item">스카이패스 가족회원 등록<p class="ts__p">가족 회원 정보, 가족관계증빙서류 사본</p>
</li>
<li class="ts__item">고객지원센터를 통한 질의(비회원)<p class="ts__p">성명, 연락처(전화번호, 휴대전화번호, 이메일 주소), 스카이패스 번호(선택)</p>
</li>
<li class="ts__item">체크인 편의를 위한 정보 저장 서비스 이용(선택)<p class="ts__p">여권정보(국적, 발급국가, 여권번호), 영주권 번호(영주권 구분, 영주권 번호, 국적, 발급국가), KTN(Known Traveler Number)(선택)</p>
</li>
<li class="ts__item">결제 편의를 위한 정보 저장 서비스 이용(선택)<p class="ts__p">신용카드 정보(발급국가, 신용카드 번호, 카드 명의자 성/이름), 신용카드 청구지 정보(주소, 도시, 주, 우편번호)</p>
</li>
</ol>
</li>
<li class="ts__item -bold">자동으로 생성되는 개인정보<p class="ts__p">서비스 이용과정이나 정보처리 과정에서 아래와 같은 정보들이 생성되어 수집될 수 있습니다.</p>
<div class="ts__list -dash"><p class="ts__item">서비스 이용기록, 접속 로그, 쿠키, 접속 IP 정보, 결제기록 등</p>
</div>
</li>
</ol>
<h3 class="ts__h2 -bold -underline">2. 개인정보의 수집<span aria-hidden="true">·</span><span class="_hidden">&nbsp;및&nbsp;</span>이용목적</h3>
<ol class="ts__list -word">
<li class="ts__item -large -bold">서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산<p class="ts__p -large -colored">콘텐츠 제공, 항공권 예약 및 발권, 항공권 등 각종 물품배송 또는 청구서 발송, 금융거래 본인 인증 및 금융 서비스, 구매 및 요금결제, 요금추심</p>
</li>
<li class="ts__item -large -bold">회원관리<p class="ts__p -large -colored">회원제 서비스 이용에 따른 본인확인, 개인식별, 불량회원의 부정 이용 방지와 비인가 사용 방지, 가입 의사 확인, 가입 및 가입횟수 제한, 만 14세 미만 아동 개인 정보 수집 시 법정 대리인 동의여부 확인, 분쟁 조정을 위한 기록보존, 불만처리 등 민원처리, 고지사항 전달</p>
</li>
</ol>
<h3 class="ts__h2 -bold -underline">3. 개인정보의 보유 목적 및 이용 기간</h3>
<p class="ts__p">이용자의 동의 하에 수집된 개인정보는 이용자가 대한항공 인터넷 웹사이트상의 서비스를 이용하는 동안 보유<span aria-hidden="true">·</span><span class="_hidden">&nbsp;및&nbsp;</span>이용됩니다.</p>
<p class="ts__p">당사는 아래와 같이 개인정보의 수집 및 이용 목적이 달성된 때 수집된 개인정보를 지체 없이 파기하겠습니다.</p>
<ol class="ts__list -number-circle">
<li class="ts__item -colored">회원가입 정보의 경우<p class="ts__p">회원 탈퇴 요청이 있거나 회원 자격을 상실한 때</p>
</li>
<li class="ts__item -colored">설문조사, 이벤트 등 일시적 목적을 위하여 회원가입 시 수집하지 않았던 개인정보를 추가로 수집한 경우<p class="ts__p">당해 설문조사, 이벤트 등이 종료한 때</p>
</li>
<li class="ts__item -colored">사업을 폐지하는 경우</li>
<li class="ts__item -colored">기타 관련 법률에 의해 정해진 경우</li>
</ol>
<p class="ts__p">다만, 개인정보의 수집 및 이용 목적이 달성된 경우에도 상법, 전자상거래 등에서의 소비자 보호에 관한 법률 등 관계법령의 규정에 의하여 보존할 필요성이 있는 경우 및 사전에 보유기간을 이용자에게 고지하거나 명시한 경우 등은 그에 따라 개인정보를 보관할 수 있습니다.</p>
<ol class="ts__list -word">
<li class="ts__item -large -bold">계약 또는 청약철회 등에 관한 기록, 대금 결제 및 재화 등의 공급에 관한 기록<ol class="ts__list -number-circle">
<li class="ts__item -large -bold">보존 사유<p class="ts__p -large">전자상거래 등에서의 소비자 보호에 관한 법률</p>
</li>
<li class="ts__item -large -bold">보존 기간<p class="ts__p -large -colored">5년</p>
</li>
</ol>
</li>
<li class="ts__item -large -bold">소비자의 불만 또는 분쟁 처리 기록<ol class="ts__list -number-circle">
<li class="ts__item -large -bold">보존 사유<p class="ts__p -large">전자상거래 등에서의 소비자 보호에 관한 법률</p>
</li>
<li class="ts__item -large -bold">보존 기간<p class="ts__p -large -colored">3년</p>
</li>
</ol>
</li>
<li class="ts__item -large -bold">본인확인에 관한 기록<ol class="ts__list -number-circle">
<li class="ts__item -large -bold">보존 사유<p class="ts__p -large">정보통신망 이용촉진 및 정보보호 등에 관한 법률</p>
</li>
<li class="ts__item -large -bold">보존 기간<p class="ts__p -large -colored">6개월</p>
</li>
</ol>
</li>
<li class="ts__item -large -bold">홈페이지 방문에 관한 기록<ol class="ts__list -number-circle">
<li class="ts__item -large -bold">보존 사유<p class="ts__p -large">통신비밀보호법</p>
</li>
<li class="ts__item -large -bold">보존 기간<p class="ts__p -large -colored">3개월</p>
</li>
</ol>
</li>
</ol>
<h3 class="ts__h2 -bold">4. 개인정보의 수집 및 이용에 대한 동의 거부 관련간</h3>
<p class="ts__p">이용자는 개인정보의 수집 및 이용 동의에 거부하실 수 있으며, 필수항목의 수집 및 이용에 동의하지 않으시는 경우 회원가입이 제한됩니다.</p>
<h2 class="ts__h1 -bold">스카이패스 회원의 개인정보 수집<span aria-hidden="true">·</span><span class="_hidden">&nbsp;및&nbsp;</span>이용에 대한 동의 사항</h2>
<h3 class="ts__h2 -bold">1. 수집하는 개인정보의 항목</h3>
<ol class="ts__list -word">
<li class="ts__item -bold">회원가입<ol class="ts__list -number-circle">
<li class="ts__item">필수항목<p class="ts__p">성명(한글 및 영문), 생년월일, 성별, 연락처(전화번호, 휴대전화번호, 이메일 주소), 아이핀 정보(CI)</p>
</li>
<li class="ts__item">선택항목<p class="ts__p">우편물 수령지(자택/직장), 직장정보(직장명, 부서명, 직위)</p>
</li>
</ol>
</li>
<li class="ts__item -bold">만 14세 미만의 회원 가입<p class="ts__p">법정대리인의 성명, 관계, 연락처(전화번호, 휴대전화번호, 이메일 주소), 스카이패스번호(선택)</p>
</li>
<li class="ts__item -bold">보너스 항공권 구매 등 당사의 상품 및 서비스에 대한 대금결제<ol class="ts__list -number-circle">
<li class="ts__item">카드결제<p class="ts__p">카드번호, 유효기간, 승인번호 등</p>
</li>
<li class="ts__item">계좌이체<p class="ts__p">거래은행명, 계좌번호, 승인번호 등</p>
</li>
</ol>
</li>
<li class="ts__item -bold">기타<ol class="ts__list -number-circle">
<li class="ts__item">스카이패스 가족회원 등록<p class="ts__p">가족 회원의 성명 및 스카이패스 번호, 가족관계 증빙서류 사본</p>
</li>
<li class="ts__item">사후 마일리지 입력 신청<p class="ts__p">탑승 편명, 탑승구간, 탑승일자, 항공권 번호<br>
(홈페이지를 통한 신청 : 이메일 주소 주소, 전화번호 추가)</p>
</li>
<li class="ts__item">모바일 카드 또는 실물 카드 재발급 신청<p class="ts__p">핸드폰 번호, 우편물 접수 주소(자택 혹은 직장)</p>
</li>
</ol>
</li>
<li class="ts__item -bold">자동으로 생성되는 개인정보<p class="ts__p">서비스 이용기록</p>
</li>
</ol>
<h3 class="ts__h2 -bold -underline">2. 개인정보의 수집<span aria-hidden="true">·</span><span class="_hidden">&nbsp;및&nbsp;</span>이용목적</h3>
<ol class="ts__list -word">
<li class="ts__item -large -bold">서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산<p class="ts__p -large -colored">보너스 예약 및 발권, 회원카드 발급, 항공권<span aria-hidden="true">·</span><span class="_hidden">&nbsp;및&nbsp;</span>기념품 등 각종 물품 배송 또는 회원실적지 등 각종 안내메일 발송, 우수회원 자격 부여 및 심사, 고객 맞춤형 서비스 제공, 금융거래 본인 인증 및 금융 서비스, 구매 및 요금결제, 요금추심</p>
</li>
<li class="ts__item -large -bold">회원관리<p class="ts__p -large -colored">회원제 서비스 이용에 따른 본인확인, 개인식별, 불량회원의 부정 이용 방지와 비인가 사용 방지, 가입 의사 확인, 가입 및 가입횟수 제한, 만 14세 미만 아동 개인 정보 수집 시 법정 대리인 동의여부 확인, 분쟁 조정을 위한 기록보존, 불만처리 등 민원처리, 고지사항 전달</p>
</li>
</ol>
<h3 class="ts__h2 -bold -underline">3. 개인정보의 보유 목적 및 이용 기간</h3>
<p class="ts__p">이용자의 동의 하에 수집된 개인정보는 이용자가 대한항공 인터넷 웹사이트상의 서비스를 이용하는 동안 보유<span aria-hidden="true">·</span><span class="_hidden">&nbsp;및&nbsp;</span>이용됩니다.</p>
<p class="ts__p">당사는 아래와 같이 개인정보의 수집 및 이용 목적이 달성된 때 수집된 개인정보를 지체 없이 파기하겠습니다.</p>
<ol class="ts__list -number-circle">
<li class="ts__item -colored">회원가입 정보의 경우<p class="ts__p">회원 탈퇴 요청이 있거나 회원 자격을 상실한 때</p>
</li>
<li class="ts__item -colored">설문조사, 이벤트 등 일시적 목적을 위하여 회원가입 시 수집하지 않았던 개인정보를 추가로 수집한 경우<p class="ts__p">당해 설문조사, 이벤트 등이 종료한 때</p>
</li>
<li class="ts__item -colored">사업을 폐지하는 경우</li>
<li class="ts__item -colored">기타 관련 법률에 의해 정해진 경우</li>
</ol>
<p class="ts__p">다만, 개인정보의 수집 및 이용 목적이 달성된 경우에도 상법, 전자상거래 등에서의 소비자 보호에 관한 법률 등 관계법령의 규정에 의하여 보존할 필요성이 있는 경우 및 사전에 보유기간을 이용자에게 고지하거나 명시한 경우 등은 그에 따라 개인정보를 보관할 수 있습니다.</p>
<ol class="ts__list -word">
<li class="ts__item -large -bold">계약 또는 청약철회 등에 관한 기록, 대금 결제 및 재화 등의 공급에 관한 기록<ol class="ts__list -number-circle">
<li class="ts__item -large -bold">보존 사유<p class="ts__p -large">전자상거래 등에서의 소비자 보호에 관한 법률</p>
</li>
<li class="ts__item -large -bold">보존 기간<p class="ts__p -large -colored">5년</p>
</li>
</ol>
</li>
<li class="ts__item -large -bold">소비자의 불만 또는 분쟁 처리 기록<ol class="ts__list -number-circle">
<li class="ts__item -large -bold">보존 사유<p class="ts__p -large">전자상거래 등에서의 소비자 보호에 관한 법률</p>
</li>
<li class="ts__item -large -bold">보존 기간<p class="ts__p -large -colored">3년</p>
</li>
</ol>
</li>
<li class="ts__item -large -bold">본인확인에 관한 기록<ol class="ts__list -number-circle">
<li class="ts__item -large -bold">보존 사유<p class="ts__p -large">정보통신망 이용촉진 및 정보보호 등에 관한 법률</p>
</li>
<li class="ts__item -large -bold">보존 기간<p class="ts__p -large -colored">6개월</p>
</li>
</ol>
</li>
<li class="ts__item -large -bold">홈페이지 방문에 관한 기록<ol class="ts__list -number-circle">
<li class="ts__item -large -bold">보존 사유<p class="ts__p -large">통신비밀보호법</p>
</li>
<li class="ts__item -large -bold">보존 기간<p class="ts__p -large -colored">3개월</p>
</li>
</ol>
</li>
</ol>
<h3 class="ts__h2 -bold">4. 개인정보의 수집 및 이용에 대한 동의 거부 관련</h3>
<p class="ts__p">이용자는 개인정보의 수집 및 이용 동의에 거부하실 수 있으며, 필수항목의 수집 및 이용에 동의하지 않으시는 경우 회원가입이 제한됩니다.</p>
<hr class="divider -small">

<br>
</div>

     </div>


    


          
          <div>
          <div>
          </div>
        </div></div>
        <div class="confirms -center">
        	<button class="confirm btn btn-default menu-btn" type="button" data-toggle="collapse" data-parent="#accordion">확인</button>
        </div>
        </div>
        </div>
        </div>
      </div>
    </div>
    
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
        <input id="checkbox3" role="checkbox" type="checkbox" aria-checked="false">
        	<label for="checkbox3" class="checkbox-label">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse3" class="checkbox-menu" id="collapseLink3">[필수] 개인정보 국외 이전에 대한 동의</a>
        	</label>
        	 <span style="float: right;">
	        	<i class='fas fa-caret-down icon-style' style="font-size: 1.5em;" id="collapseIcon3"></i>
        	</span>
        </h4>
      </div>
      <div id="collapse3" class="panel-collapse collapse">
        <div class="panel-body"><div class="dialog__contents" role="document" tabindex="-1" data-focus="true"><h2 class="h1" data-focus="true" id="terms-detail03-title" tabindex="-1">약관 상세</h2><div class="dialog__aligner"><div>
    
        

     <div class="cmp-text">
          <div class="ts"><h2 class="ts__h1 -bold">개인정보의 국외 이전에 대한 동의 사항</h2>
<p class="ts__p">당사는 예약 및 운송 서비스 제공을 위한 시스템 운영을 항공여행정보시스템 제공 업체인 AMADEUS IT GROUP,S.A 사에 그리고 Social 채널(카카오톡,페이스북 등)을 통한 상담 서비스 제공을 위한 시스템 운영을 Salesforce 사에, 마케팅 메시지 발송을 위한 시스템 운영을 Adobe 사에 위탁 하고 있습니다.</p>
<p class="ts__p">이에 따른 개인정보 국외 이전 사항을 다음과 같이 안내드립니다.</p>
<ol class="ts__list -number">
<li class="ts__item -large -bold">이전 받는 자<p class="ts__p -large -colored">AMADEUS IT GROUP, S.A (dataprotection@amadeus.com)</p>
</li>
<li class="ts__item -large -bold">이전 항목<ol class="ts__list -word">
<li class="ts__item -bold">회원 정보<p class="ts__p">스카이패스 번호, 성명, 생년월일, 성별, 전화번호, 직장명, 직위, 보유 마일리지</p>
</li>
<li class="ts__item -bold">항공권 예약 정보<p class="ts__p">스카이패스 번호, 탑승자 성명, 생년월일, 성별, 연락처, 이메일 주소</p>
</li>
</ol>
</li>
<li class="ts__item -large -bold">이전되는 국가, 이전 일시, 이전 방법<ol class="ts__list -word">
<li class="ts__item -bold">회원 정보<p class="ts__p">독일, 회원 가입 완료 시, 전용 네트워크 이용 전송</p>
</li>
<li class="ts__item -bold">항공권 예약 정보<p class="ts__p">독일, 예약 완료 시, 전용 네트워크 이용 전송</p>
</li>
</ol>
</li>
<li class="ts__item -large -bold">이전받는 자의 개인정보 이용 목적, 보유<span aria-hidden="true">·</span><span class="_hidden">&nbsp;및&nbsp;</span>이용 기간<ol class="ts__list -word">
<li class="ts__item -large -bold">회원 정보<p class="ts__p -large -colored">당사의 상용우대고객 정보 유지, 회원 탈퇴 시 또는 위탁 종료 시까지</p>
</li>
<li class="ts__item -large -bold">예약 기록<p class="ts__p -large -colored">당사 예약 시스템 상의 예약 기록 유지, 이전 후 5년 간 (EU의 CRS 행동 규범 준수)</p>
</li>
</ol>
</li>
</ol>
<hr class="divider -small">

<ol class="ts__list -number">
<li class="ts__item -large -bold">이전 받는 자<p class="ts__p -large -colored">Salesforce.com, Inc (stevep@salesforce.com, seyoon.oh@salesforce.com)</p>
</li>
<li class="ts__item -large -bold">이전 항목<p class="ts__p">스카이패스 번호, 성명, 생년월일, 전화번호, 이메일 주소</p>
</li>
<li class="ts__item -large -bold">이전되는 국가, 이전 일시, 이전 방법<p class="ts__p">일본, 회원 가입 완료 시, 전용 네트워크 이용 전송</p>
</li>
<li class="ts__item -large -bold">이전받는 자의 개인정보 이용 목적, 보유<span aria-hidden="true">·</span><span class="_hidden">&nbsp;및&nbsp;</span>이용 기간<p class="ts__p -large -colored">항공권 예약<span aria-hidden="true">·</span><span class="_hidden">&nbsp;및&nbsp;</span>발권 등 관련 SNS 상담 서비스 제공, 당사 개인정보 처리 방침과 동일</p>
</li>
</ol>
<hr class="divider -small">

<ol class="ts__list -number">
<li class="ts__item -large -bold">이전 받는 자<p class="ts__p -large -colored">Adobe (askprivacy@adobe.com, clientcare@adobe.com)</p>
</li>
<li class="ts__item -large -bold">이전 항목<p class="ts__p">이메일 주소, 성명</p>
</li>
<li class="ts__item -large -bold">이전되는 국가, 이전 일시, 이전 방법<p class="ts__p">싱가폴, 회원가입 완료 시, 전용 네트워크 이용 전송</p>
</li>
<li class="ts__item -large -bold">이전받는 자의 개인정보 이용 목적, 보유<span aria-hidden="true">·</span><span class="_hidden">&nbsp;및&nbsp;</span>이용 기간<p class="ts__p -large -colored">마케팅 메시지 관련 이메일 발송, 당사 개인정보 처리 방침과 동일</p>
</li>
</ol>
<hr class="divider -small">

<ol class="ts__list -number">
<li class="ts__item -large -bold">이전 받는 자<p class="ts__p -large -colored">Dynatrace(privacy@dynatrace.com, security@dynatrace.com)</p>
</li>
<li class="ts__item -large -bold">이전 항목<p class="ts__p">IP Address, 사용자 ID, 접속 페이지 및 행동정보</p>
</li>
<li class="ts__item -large -bold">이전되는 국가, 이전 일시, 이전 방법<p class="ts__p">호주(시드니), 사용자 페이지 접속 시 실시간 전송</p>
</li>
<li class="ts__item -large -bold">이전받는 자의 개인정보 이용 목적, 보유<span aria-hidden="true">·</span><span class="_hidden">&nbsp;및&nbsp;</span>이용 기간<p class="ts__p -large -colored">고객 만족도 및 성능 관리, 35일</p>
</li>
</ol>
<hr class="divider -small">

<ol class="ts__list -number">
<li class="ts__item -large -bold">이전 받는 자<p class="ts__p -large -colored">AWS(aws-korea-privacy@amazon.com)</p>
</li>
<li class="ts__item -large -bold">이전 항목<ol class="ts__list -word">
<li class="ts__item -bold">회원 정보<p class="ts__p">스카이패스 번호, 성명, 생년월일, 성별, 전화번호, 직장명, 직위, 보유 마일리지</p>
</li>
<li class="ts__item -bold">항공권 예약 정보<p class="ts__p">스카이패스 번호, 탑승자 성명, 생년월일, 성별, 연락처, 이메일 주소</p>
</li>
</ol>
</li>
<li class="ts__item -large -bold">이전되는 국가, 이전 일시, 이전 방법<ol class="ts__list -word">
<li class="ts__item -bold">회원 정보<p class="ts__p">미국, 회원 가입 완료 시, 전용 네트워크 이용 전송</p>
</li>
<li class="ts__item -bold">항공권 예약 정보<p class="ts__p">미국, 예약 완료 시, 전용 네트워크 이용 전송</p>
</li>
</ol>
</li>
<li class="ts__item -large -bold">이전받는 자의 개인정보 이용 목적, 보유<span aria-hidden="true">·</span><span class="_hidden">&nbsp;및&nbsp;</span>이용 기간<p class="ts__p -large -colored">AWS 서울리전 이용불가 시 미국 동부 리전 데이터센터에서 재해복구시스템 가동, 당사 개인정보처리방침과 동일</p>
</li>
</ol>
<hr class="divider -small">

<ol class="ts__list -number">
<li class="ts__item -large -bold">이전 받는 자<p class="ts__p -large -colored">Google (cloudprivacy@google.com)</p>
</li>
<li class="ts__item -large -bold">이전 항목<p class="ts__p">회원 및 가족 회원의 성명, 생년월일, 가족관계, 가족 관계 증빙서류(사본)</p>
</li>
<li class="ts__item -large -bold">이전되는 국가, 이전 일시, 이전 방법<p class="ts__p">미국/유럽연합, 가족 회원 등록 처리 시 전용 네트워크를 이용 전송</p>
</li>
<li class="ts__item -large -bold">이전받는 자의 개인정보 이용 목적, 보유<span aria-hidden="true">·</span><span class="_hidden">&nbsp;및&nbsp;</span>이용 기간<p class="ts__p -large -colored">가족관계 확인 및 가족 마일리지 서비스 제공, 당사 개인정보 처리 방침과 동일</p>
</li>
</ol>
</div>

     </div>


    


          
          <div>
          <div>
          </div>
        </div></div>
        <div class="confirms -center">
         	<button class="confirm btn btn-default menu-btn" type="button" data-toggle="collapse" data-parent="#accordion">확인</button>
        </div></div>
        </div>
        
        </div>
      </div>
    </div>
    
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
         <input id="checkbox4" role="checkbox" type="checkbox" aria-checked="false">
        	<label for="checkbox4" class="checkbox-label">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse4" class="checkbox-menu" id="collapseLink4">[선택] 개인정보 제3자 제공 동의</a>
        	</label>
        	 <span style="float: right;">
	        	<i class='fas fa-caret-down icon-style' style="font-size: 1.5em;" id="collapseIcon4"></i>
        	</span>
        </h4>
      </div>
      <div id="collapse4" class="panel-collapse collapse">
        <div class="panel-body">
        <div class="dialog__contents" role="document" tabindex="-1" data-focus="true"><h2 class="h1" data-focus="true" id="terms-detail04-title" tabindex="-1">약관 상세</h2><div class="dialog__aligner"><div>
    

     <div class="cmp-text">
          <div class="ts"><h2 class="ts__h1 -bold">회원의 개인정보보호를 위한 이용자 동의 사항</h2>
<h3 class="ts__h2 -bold -underline">개인정보 제3자 제공 관련</h3>
<p class="ts__p">대한항공은 법령에 근거가 있는 등의 예외적인 경우를 제외하고 이용자의 동의 없이 개인정보를 제3자에게 제공하지 않습니다.</p>
<p class="ts__p">다만 회원인 경우 설문조사, 프로모션, 이벤트 등 이용자 개개인께 최적화된 양질의 서비스를 제공하기 위한 목적으로 제휴사, 후원사 등에 이용자의 개인정보 제공이 필요할 경우, 그 모든 경우에 제공받는 자, 제공받는 자의 이용 목적, 제공할 정보의 내용, 제공받는 자의 개인정보보유 및 이용기간을 전자우편이나 서면으로 개별 통지하거나, 또는 인터넷 사이트에 명시하여 이용자의 동의 (예:마우스 클릭)를 받아 진행됩니다.</p>
<h2 class="ts__h1 -bold">스카이패스 회원의 개인정보보호를 위한 이용자 동의 사항</h2>
<h3 class="ts__h2 -bold -underline">개인정보 제3자 제공 관련</h3>
<p class="ts__p">대한항공은 법령에 근거가 있는 등의 예외적인 경우를 제외하고는 회원의 동의없이 개인정보를 제3자에게 제공하지 않습니다. 다만, 아래의 제휴서비스를 이용하는 경우에는 다음과 같은 개인정보가 제공될 수 있습니다.</p>
<p class="ts__p">회원은 개인정보의 제3자 제공 동의에 거부하실 수 있으며, 거부하시더라도 회원 가입은 가능하나 제휴사를 통한 마일리지 적립<span aria-hidden="true">·</span><span class="_hidden">&nbsp;및&nbsp;</span>사용에 제한이 발생할 수 있습니다.</p>
<div class="table -xy"><table>
<caption>개인정보 제3자 제공 상세</caption>
<colgroup> <col> <col> <col> <col> </colgroup><thead class="table__thead"><tr class="thead__tr"><th class="thead__th -large -bold">제공 정보</th>
<th class="thead__th -large -bold">제공 대상 제휴사</th>
<th class="thead__th -large -bold">제공 정보 이용 목적</th>
<th class="thead__th -large -bold">제공 정보 보유/이용 기간</th>
</tr></thead><tbody class="table__tbody"><tr class="tbody__tr"><th class="tbody__td" headers="c1">성명, 스카이패스 회원번호, 회원등급, 잔여마일</th>
<th class="tbody__td -large -colored" headers="r1 c2">비씨카드, KB국민카드, 씨티은행, 롯데카드, 신한카드, 하나카드, 제주은행, 현대카드, 삼성카드, 수협은행, NH농협카드, American Express, US BANK, DC 카드, JCB 카드, MUFG/AMEX, Diners Club International, 신한베트남은행</th>
<td class="tbody__td -large -colored" headers="r1 r1-1 c3">제휴카드 이용 고객 대상 맞춤형 서비스 제공, 마일리지 적립 및 정산을 위한 데이터 확인</td>
<td class="tbody__td -large -colored" rowspan="20" headers="
            r1 r2 r3 r4 r5 r6 r7 r8 r9 r10 r11 r12 r13 r14 r15 r16 r17 r18 r19 r20 c4
            r1-1 r2-1 r3-1 r4-1 r5-1 r6-1 r7-1 r8-1 r9-1 r10-1 r11-1 r12-1 r13-1 r14-1 r15-1 r16-1 r17-1 r18-1 r19-1 r20-1
            ">제휴서비스 종결 시까지</td>
</tr><tr class="tbody__tr"><th class="tbody__td" headers="c1">스카이패스 회원번호, 회원등급, 이메일 주소, 적립마일, 사용마일, 제휴카드로 결제한 항공권 정보, 최근 24개월간 좌석 등급별 탑승횟수, 최근 24개월간 총 적립마일<br>
*임직원 해당 항목 : 대한항공 임직원 여부, 고용 형태</th>
<th class="tbody__td -large -colored" headers="r2 c2">현대카드</th>
<td class="tbody__td -large -colored" headers="r2 r2-1 c3">대한항공카드 발급 및 제휴서비스 제공, 대한항공카드 발급 우대 서비스 제공, 빠른 카드 신청을 위한 고객정보 자동입력 서비스 제공</td>
</tr><tr class="tbody__tr"><th class="tbody__td" headers="c1">성명, 스카이패스 회원번호, 적립 마일, 제휴사 서비스 이용 내역</th>
<th class="tbody__td -large -colored" headers="r3 c2">SK렌터카, 롯데렌터카, Hertz렌터카, Avis렌터카, Alamo &amp; National 렌터카, Rentalcars.com</th>
<td class="tbody__td -large -colored" headers="r3 r3-1 c3">마일리지 적립 서비스, 대금 정산을 위한 데이터 확인</td>
</tr><tr class="tbody__tr"><th class="tbody__td" headers="c1">성명, 스카이패스 회원번호, 적립 마일, 제휴사 서비스 이용 내역</th>
<th class="tbody__td -large -colored" headers="r4 c2">서귀포 KAL호텔, 롯데호텔, 부산롯데호텔, 서울신라호텔, 타이드스퀘어(현대카드 PRIVIA 여행, 투어비스), 파라다이스시티, 오쿠라닛코호텔, 샹그리라호텔, 하얏트호텔&amp;리조트, 인터컨티넨탈호텔그룹, 와이키키리조트호텔, 메리어트호텔, 아코르호텔, 두짓호텔&amp;리조트, Hotels.com, Booking.com, Trip.com, Agoda</th>
<td class="tbody__td -large -colored" headers="r4 r4-1 c3">마일리지 적립 서비스, 대금 정산을 위한 데이터 확인</td>
</tr><tr class="tbody__tr"><th class="tbody__td" headers="c1">CI, 성명, 스카이패스 회원번호, 생년월일, 적립 마일, 제휴사 서비스 이용 내역</th>
<th class="tbody__td -large -colored" headers="r5 c2">한진(택배, 글로벌), 한진관광, 싸이버스카이, SK플래닛 (OK캐시백), 롯데멤버스(L.POINT), 현대백화점그룹(H.Point), S-OIL, BMW Korea, 교보문고, 11번가, 현대백화점면세점, 이제너두, 삼성웰스토리, 이마트, JTB MyBus, Veltra, KLOOK, Value Retail, 네이버 파이낸셜</th>
<td class="tbody__td -large -colored" headers="r5 r5-1 c3">마일리지 적립 서비스, 대금 정산을 위한 데이터 확인</td>
</tr><tr class="tbody__tr"><th class="tbody__td" headers="c1">성명, 스카이패스 회원번호, 생년월일, 적립 마일, 제휴사 서비스 이용 내역</th>
<th class="tbody__td -large -colored" headers="r6 c2">NH농협은행, 한국씨티은행, 신한은행, KB국민은행, DB손해보험, SK엠앤서비스</th>
<td class="tbody__td -large -colored" headers="r6 r6-1 c3">마일리지 적립 서비스, 대금 정산을 위한 데이터 확인</td>
</tr><tr class="tbody__tr"><th class="tbody__td" headers="c1">성명, 스카이패스 번호, 휴대전화번호, 생년월일, 잔여 마일, 제휴 서비스 예약 사항, 제휴사 이용 마일, 대한항공카드 소지 여부</th>
<th class="tbody__td -large -colored" headers="r7 c2">한진관광</th>
<td class="tbody__td -large -colored" headers="r7 r7-1 c3">마일리지 소진 서비스, 대금 정산을 위한 데이터 확인</td>
</tr><tr class="tbody__tr"><th class="tbody__td" headers="c1">성명, 스카이패스 번호, 휴대전화번호, 생년월일, 잔여 마일, 제휴 서비스 예약 사항, 제휴사 이용 마일, 이메일 주소</th>
<th class="tbody__td -large -colored" headers="r8 c2">그랜드하얏트인천, 와이키키리조트호텔, 서귀포 KAL호텔, 인터컨티넨탈 로스앤젤레스 다운타운</th>
<td class="tbody__td -large -colored" headers="r8 r8-1 c3">마일리지 소진 서비스, 대금 정산을 위한 데이터 확인</td>
</tr><tr class="tbody__tr"><th class="tbody__td" headers="c1">성명, 스카이패스 번호, 휴대전화번호, 생년월일, 잔여 마일, 제휴 서비스 예약 사항, 제휴사 이용 마일</th>
<th class="tbody__td -large -colored" headers="r9 c2">제주민속촌,아쿠아플라넷 제주,키자니아</th>
<td class="tbody__td -large -colored" headers="r9 r9-1 c2">마일리지 소진, 서비스 제공, 대금 정산을 위한 데이터 확인</td>
</tr><tr class="tbody__tr"><th class="tbody__td" headers="c1">네이버 ID, 이용권 번호, 이용권 지급일시, 개시일시, (취소시) 이용권 취소 일지, 서비스 이용 내역, 이름, 스카이패스 번호</th>
<th class="tbody__td -large -colored" headers="r10 c2">네이버</th>
<td class="tbody__td -large -colored" headers="r10 r10-1 c3">네이버 ID 유효성 확인, 마일리지 소진, 이용권 지급, 서비스 제공, 대금 정산을 위한 데이터 확인</td>
</tr><tr class="tbody__tr"><th class="tbody__td" headers="c1">성명, 메리어트 본보이 회원번호, 제휴사 이용 마일</th>
<th class="tbody__td -large -colored" headers="r11 c2">메리어트</th>
<td class="tbody__td -large -colored" headers="r11 r11-1 c3">마일리지 전환 서비스, 대금 정산을 위한 데이터 확인</td>
</tr><tr class="tbody__tr"><th class="tbody__td" headers="c1">이용권 번호, 서비스 이용 내역</th>
<th class="tbody__td -large -colored" headers="r12 c2">이마트</th>
<td class="tbody__td -large -colored" headers="r12 r12-1 c3">이용권 유효성 확인, 마일리지 소진, 서비스 제공, 대금 정산을 위한 데이터 확인</td>
</tr><tr class="tbody__tr"><th class="tbody__td" headers="c1">성명, 스카이패스 회원번호, 회원등급, 적립 신청 구간에 대한 탑승 정보(편명, 탑승일, 예약등급, 탑승노선), 소진 신청 구간에 대한 탑승 정보(편명, 탑승일, 예약등급, 탑승노선)</th>
<th class="tbody__td -large -colored" headers="r13 c2">가루다인도네시아항공, 골항공, 델타항공, 미들이스트항공, 베트남항공, 사우디아항공, 샤먼항공, 아르헨티나항공, 아메리칸항공, 아에로멕시코, 아에로플로트, 알래스카항공, ITA 항공, 에미레이트항공, 에어유로파, 에어프랑스, 에티하드항공, 일본항공, 중국남방항공, 중국동방항공, 중화항공, 체코항공, 케냐항공, 타롬항공, 하와이안항공, KLM 네덜란드항공</th>
<td class="tbody__td -large -colored" headers="r13 r13-1 c3">마일리지 적립, 마일리지 소진, 우수회원 혜택 제공, 대금 정산을 위한 데이터 확인</td>
</tr><tr class="tbody__tr"><th class="tbody__td" headers="c1">CI, 성명, 스카이패스 회원번호, 회원 등급 정보, 마일리지 적립/사용내역, 잔여 마일, 국내선 예약 내역, 국내선 항공권 구매내역, 휴대전화 번호</th>
<th class="tbody__td -large -colored" headers="r14 c2">시럽, 엠콤</th>
<td class="tbody__td -large -colored" headers="r14 r14-1 c3">모바일 멤버십 서비스 제공</td>
</tr><tr class="tbody__tr"><th class="tbody__td" headers="c1">CI, 성명, 스카이패스 회원번호, 회원 등급 정보, 마일리지 적립/사용내역, 잔여 마일, 휴대전화 번호, 이메일 주소</th>
<th class="tbody__td -large -colored" headers="r15 c2">삼성전자(삼성페이), LG U+ (U+멤버스), 네이버 페이, 페이코</th>
<td class="tbody__td -large -colored" headers="r15 r15-1 c3">모바일 멤버십 서비스 제공</td>
</tr><tr class="tbody__tr"><th class="tbody__td" headers="c1">CI, 성명, 스카이패스 회원번호, 회원 등급 정보, 마일리지 적립/사용내역, 잔여 마일, 휴대전화 번호, 이메일 주소</th>
<th class="tbody__td -large -colored" headers="r16 c2">델타항공, 스카이팀</th>
<td class="tbody__td -large -colored" headers="r16 r16-1 c3">공동운항편 수속</td>
</tr><tr class="tbody__tr"><th class="tbody__td" headers="c1">성명, 아이디, 전화번호, 이메일, 생년월일</th>
<th class="tbody__td -large -colored" headers="r17 c2">싸이버스카이샵</th>
<td class="tbody__td -large -colored" headers="r17 r17-1 c3">온라인 계정연동</td>
</tr><tr class="tbody__tr"><th class="tbody__td" headers="c1">탑승권 정보 (성명, 편명, 탑승일, 탑승여정, 탑승시각, 터미널, 좌석번호, 탑승구, 우선/특별탑승, 회원정보, 체크인순서, 탑승 클래스, 항공권번호, 예약번호, 이용 라운지, 수하물허용량)</th>
<th class="tbody__td -large -colored" headers="r18 c2">삼성전자(삼성페이)</th>
<td class="tbody__td -large -colored" headers="r18 r18-1 c3">탑승권 서비스 제공</td>
</tr><tr class="tbody__tr"><th class="tbody__td" headers="c1">성명, 스카이패스 회원번호, 회원등급, 적립 신청 구간에 대한 탑승 정보(편명, 탑승일, 예약등급, 탑승노선), 소진 신청 구간에 대한 탑승 정보(편명, 탑승일, 예약등급, 탑승노선)</th>
<th class="tbody__td -large -colored" headers="r19 c2">가루다인도네시아항공 (ID), 골항공 (BR), 델타항공 (US), 미들이스트항공 (LB), 베트남항공 (VN), 사우디아항공 (SA), 샤먼항공 (CN), 아르헨티나항공 (AR), 아메리칸항공 (US), 아에로멕시코 (MX), 아에로플로트 (RU), 알래스카항공 (US), ITA항공 (IT), 에미레이트항공 (AE), 에어유로파 (ES), 에어프랑스 (FR), 에티하드항공 (AE), 일본항공 (JP), 중국남방항공 (CN), 중국동방항공 (CN), 중화항공 (TW), 체코항공 (CZ), 케냐항공 (KE), 타롬항공 (RO), 하와이안항공 (US) ,KLM 네덜란드항공 (NL)</th>
<td class="tbody__td -large -colored" headers="r19 r19-1 c3">타항공사 연결편 수속</td>
</tr><tr class="tbody__tr"><th class="tbody__td" headers="c1">여권정보</th>
<th class="tbody__td -large -colored" headers="r20 c2">대한민국, 대만, 캐나다, 영국, 호주, 아랍에미리트, 사우디아라비아, 태국, 미얀마, 미국, 일본, 중국, 몽골, 뉴질랜드, 프랑스, 네덜란드, 체코, 스페인, 이탈리아, 러시아, 인도네시아, 스리랑카, 베트남, 인도, 브라질, 튀르키예, 독일, 스위스, 오스트리아</th>
<td class="tbody__td -large -colored" headers="r20 r20-1 c3">사전출입국심사</td>
</tr><tr class="tbody__tr"><th class="tbody__td" headers="c1">성명, 편명</th>
<th class="tbody__td -large -colored" headers="r21 c2">한국공항공사, 인천국제공항공사</th>
<td class="tbody__td -large -colored" headers="r21 r21-1 c3">서비스 제공에 대한 요금정산</td>
<td class="tbody__td -large -colored" headers="r21 r21-1 c4">5년</td>
</tr><tr class="tbody__tr"><th class="tbody__td" headers="c1">국내선 예약 필수 항목(탑승자 성명, 성별, 생년월일) 및 국적</th>
<th class="tbody__td -large -colored" headers="r22 c2">한국공항공사</th>
<td class="tbody__td -large -colored" headers="r22 r22-1 c3">국내선 탑승객 신원 확인</td>
<td class="tbody__td -large -colored" headers="r22 r22-1 c4">서비스 제공 및 관계법령에 따른 보존기간(탑승수속 시 제공되며, 개인정보는 항공기 출발 즉시 폐기)</td>
</tr></tbody></table>
</div>
</div>

     </div>


    


          
          <div>
          <div>
          </div>
        </div></div><div class="confirms -center">
                	<button class="confirm btn btn-default menu-btn" type="button" data-toggle="collapse" data-parent="#accordion">확인</button>
        </div></div>
        </div>
        </div>
      </div>
    </div>
    
  </div> 
  
	<div class="alert alert-danger" style="display: none;">
		<i class="fa fa-warning" style="color:#a94442;"></i> 필수 약관에 대하여 모두 동의 해주시기 바랍니다.
	</div>
	
	
	<div style="text-align: center;">
		<button type="button" class="btn btn-default menu-btn" id="submitBtn">확인</button>
		<button type="button" class="btn btn-default menu-btn cancel-btn" id="cancelBtn">취소</button>
	</div>
</div>
</body>
</html>