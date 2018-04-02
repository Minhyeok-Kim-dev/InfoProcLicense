<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta charset="utf-8">
		
		<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/mink.css"/>" />
		<link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css" />
		<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
		<script src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
		<script type="text/javascript" src="<c:url value="/resources/js/mink.js" />"></script>
		
		<script type="text/javascript" src="<c:url value="/resources/js/realgridjs-lic.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/resources/js/realgridjs_eval.1.1.26.min.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/resources/js/realgridjs-api.1.1.26.js" />"></script>
		
		<title>Insert title here</title>
		
		<script>
			$(document).ready(function() {
				$("#btnExamStart").on("click", function(e){
					e.preventDefault();
					
					var name = $("#name").val();
					var questCnt = $("#questCnt").val();
					
					if(name === "") name="noname";
					if(questCnt === "") questCnt = 20;
					
					var url = getContextPath() + "/examForm?mode=2&name=" 
							+ name + "&questCnt=" + questCnt;
					
					location.href = url;
				});
			});
		</script>
	</head>
	<body>
		<!-- 시험모드 선택 page -->
		<div data-role="page" id="main_page" class="ui-page ui-page-theme-a ui-page-active">
			<%@ include file="/WEB-INF/views/include/header.jsp" %>
			
			<div data-role="main" class="ui-content" data-theme="a">
				<div>
					<h3>모드설정</h3>
				</div>
				<div>
					<div class="btn-wrapper">
						<a href="<c:url value="examForm?mode=1"/>" data-ajax="false" data-role="button" 
							class="ui-btn ui-btn-inline ui-corner-all" data-shadow="false" data-theme="none">
							<img src="<c:url value="/resources/image/question.png"/>" border="0" />연습
						</a>
						<a href="#sub_page" data-role="button" class="ui-btn ui-btn-inline ui-corner-all" data-transition="slide" data-shadow="false" data-theme="none">
							<img src="<c:url value="/resources/image/exclamation.png"/>" border="0" />시험
						</a>
					</div>
				</div>
			</div>
			
			<%@ include file="/WEB-INF/views/include/footer.jsp" %>
		</div>
		<!-- 시험모드 선택 page -->
		<!-- 시험 상세정보 입력 page -->
		<div data-role="page" id="sub_page" class="page">
			<%@ include file="/WEB-INF/views/include/header.jsp" %>
			
			<div data-role="content" class="content-wrapper" data-theme="a">
				<table style="width:100%;">
					<tr>
						<td><label for="name">이름</label></td>
						<td><input type="text" id="name" placeholder="김민혁"/></td>
					</tr>
					<tr>
						<td><label for="questCnt">문항</label></td>
						<td><input type="text" id="questCnt" placeholder="20"/></td>
					</tr>
				</table>
				
				<div class="btn-wrapper">
					<a id="btnExamStart" href="#" data-ajax="false" data-role="button" class="ui-btn" data-shadow="false" data-theme="none">
						<img src="<c:url value="/resources/image/check.png"/>" border="0" />시작
					</a>
				</div>
				
			</div>
			
			<%@ include file="/WEB-INF/views/include/footer.jsp" %>
		</div>
		<!-- 시험 상세정보 입력 page -->
	</body>
</html>