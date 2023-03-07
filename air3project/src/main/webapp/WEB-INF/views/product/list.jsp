<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에어3 로고상품</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<style type="text/css">
</style>
<script type="text/javascript">
	$(function() {
		//이미지 보기로 보내는 이벤트 
		$(".dataRow").click(function() {
			let productno = $(this).data("no");
			//alert("productno" + productno);
			location = "/product/view.do?productno=" + productno;

		});
	});
</script>
</head>
<body>
	<div class="container">
		<h1>에어3 로고상품</h1>
		<div class="col-md-12">
		<form class="form-inline">
		<input name="perPageNum" value="${param.perPageNum }" type="hidden">
		    <div class="form-group" >
		    	<select class="form-control" id="key" name="key">
				    <option value="t">상품명</option>
				    <option value="c">상품정보</option>
		 		 </select>
		    </div>
		    <div class="form-group">
		    <input type="text" class="form-control" placeholder="Search" name="word" value="${param.word }">
		    </div>
		      <button class="btn btn-default" type="submit">
		        <i class="glyphicon glyphicon-search"></i>
		      </button>
	</form>
	</div>
				<div class="col-md-12">
<div id="myCarousel" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1"></li>
    <li data-target="#myCarousel" data-slide-to="2"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner">
    <div class="item active">
      <img src="/upload/product/슬라이드1.jpg" alt="슬라이드1">
    </div>

    <div class="item">
      <img src="/upload/product/슬라이드2.jpg" alt="슬라이드2">
    </div>
    <div class="item">
      <img src="/upload/product/슬라이드3.jpg" alt="슬라이드3">
    </div>
  </div>

  <!-- Left and right controls -->
  <a class="left carousel-control" href="#myCarousel" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#myCarousel" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
</div>
	
		<div class="row">
			<c:forEach items="${list }" var="vo" varStatus="vs">
				<c:if test="${vs.index != 0 && vs.index % 4 == 0}">
				${"</div>"}
				${"<div class=\"row\">"}
				</c:if>
				<div class="col-md-3 dataRow" data-no="${vo.productno }">
					<div class="thumbnail">
						<img src="${vo.img }" alt="${vo.img }" style="width: 100%">
						</div>	
						<div class="caption">
							<p><strong>${vo.name }</strong></p>
							<div class="text-left" style="margin-bottom:10px;">${vo.price }원</div>
						</div>
				
				</div>
			</c:forEach>
			
		</div>
		</div>
 <div class="row">
 <c:if test="${login != null && login.gradeNo == 9}">
    <div class="col-md-12 text-center">
       <p>
          <a href="write.do" class="btn btn-info btn-lg">
          <span class="glyphicon glyphicon-edit"></span> 상품등록
        </a>
      </p> 
      </div>
      </c:if>
  </div>
</body>
</html>