<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Shop Item - Start Bootstrap Template</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css" rel="stylesheet" />
<title>항공기 정보 수정</title>

<style type="text/css">
table {
	width: 80%;
}

th, td {
	text-align: center;
}

button {
	background: #003d99;
	color: white;
	border: none;
}

</style>
<script type="text/javascript">
	var bDisplay = true;
	function doDisplay() {
		var con = document.getElementById("myDIV");
		if (con.style.display == 'none') {
			con.style.display = 'block';
		} else {
			con.style.display = 'none';
		}
	}
</script>

</head>
<body>
	<div class="container">
		<h1>${vo.cName}</h1>
		<div>
			<div>
				<img src="${vo.cImg}" style="width: 100%">
				<div id="changeImageDiv">
					<form action="updateImage2.do" method="post" id="updateImage2Form"
						enctype="multipart/form-data">
						<input type="hidden" name="cno" value="${vo.cNo }"> 
						<input type="hidden" name="deleteFile2" value="${vo.cImg }">
						<c:if test="${login != null && login.gradeNo == 9}">
						<div class="form-group">
							<label for="img2">바꿀 이미지 선택</label> <input class="form-control"
								name="img2" id="img2" type="file">
						</div>
						<button>바꾸기</button>
						<button type="button" id="cancelBtn">취소</button>
						</c:if>

					</form>
					
				</div>
			</div>
			
			<div
				style="background: #003d99; margin-top: 10px; height: 40px; text-align: center">
				<p style="color: white; font-size: 20px; margin-top: 1px">${vo.cName}(${vo.cChairN }석)</p>
			</div>
		</div>
		<a href="javascript:doDisplay();">
			<button style="margin-top: 10px">좌석도 보기</button>
		</a><br />
		<br />
		<div id="myDIV" style="display: none">
			<div style="margin: auto">
				<section class="py-5" style="width: 80%">
					<div class="container px-4 px-lg-5 my-5" style="margin: auto">
						<div class="row gx-4 gx-lg-5 align-items-center" style="align:left; width:1500px">
							<div class="col-md-6" style="width: 40%; float: left">

								<img alt="main" src="${vo.cChairImg}"
									style=" width: 700px; float: left">
									
								<div>
								<c:if test="${login != null && login.gradeNo == 9}">
									
									
										<form action="updateImage.do" method="post" id="updateImageForm" enctype="multipart/form-data">
											<input type="hidden" name="cno" value="${vo.cNo }"> <input
												type="hidden" name="deleteFile" value="${vo.cChairImg }">
											<div class="form-group">
												<label for="img">바꿀 이미지 선택</label> <input
													class="form-control" name="img" id="img" type="file">
											</div>
											<button>바꾸기</button>
											<button type="button" id="cancelBtn">취소</button>

										
									</form>
									</c:if>
									</div>
								</div>
								
							</div>
							<div class="col-md-6" style="width: 40%; float: left">


								<div class="fs-5 mb-5" style="width:600px ;align:right">
									
								</div>

								<div class="d-flex"></div>
							</div>
						</div>
					</div>
				</section>
				
			</div>


		</div>
		<div class="container" style="align-text: center">
			<p style="font-size: 35px">
				<strong>좌석 상세 정보</strong>
			</p>
			<img alt="asd" src="/upload/craftInf/chairImg.jpg"> <img
				alt="asd" src="/upload/craftInf/ecochair.jpg" style="margin-right:200px">

		</div>
		<div class="container" style="margin-top: 20px">
			<p style="font-size: 35px">
				<strong>항공기 제원</strong>
			</p>
		</div>
		<div class="container" style=" margin-bottom: 50px; margin-top: 50px">
			<table style="width: 80%; text-align: center">
				<thead>
					<tr>
						<th><img alt="main" src="/upload/craftInf/cname.jpg"></th>
						<th><img alt="main" src="/upload/craftInf/cdistance.jpg"></th>

						<th><img alt="main" src="/upload/craftInf/speed.jpg"></th>

					</tr>
				</thead>
				<tbody>
					<tr>
						<td>기종<br />${vo.cName }</td>
						<td>주행거리<br />${vo.cDistance }km</td>

						<td>속도<br />${vo.cSpeed }km</td>

					</tr>
				</tbody>
			</table>

		</div>
		<a href="update.do?no=${vo.cNo }"><button>수정</button></a>
	    <a href="delete.do?no=${vo.cNo }&deleteFile1=${vo.cImg}&deleteFile2=${vo.cChairImg}"><button>삭제</button></a>
	</div>
</body>
</html>