<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags"%>




		<c:forEach items="${Infolist }" var="vo">
			<div class="media" style="width: 80%; margin: auto;">

				<div class="media-body">
					<div class="title col-md-9">
						<span class="media-heading" id="title">${vo.title }</span>
					</div>
					<div class="content col-md-3">
						<p class="media-heading" id="writeDate">${vo.updateDate }</p>
					</div>
				</div>
			</div>
		</c:forEach>

		
		
		

