<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!doctype html>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta charset="utf-8">
			
		<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/mink.css"/>" />
		<link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css" />
		<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
		<script src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
		<script type="text/javascript" src="<c:url value="/resources/js/mink.js" />"></script>
		
		<title>Write Form</title>
		
		<script type="text/javascript">
			$(document).ready(function() {
				// 초기 포커스
				$("#sec").focus();
				
				
				$("#btn_submit").on("click", function(){
					var writeForm = $("#write_form").serialize();
					
					$.ajax(getContextPath() + "/term/insert", {
						type : "post",
						dataType : "json",
						data : writeForm
					})
					.done(function(data) { // success 시
						alert("저장되었습니다.");
						
						// 내용 초기화
						$("#short_nm").val("");
						$("#full_nm").val("");
						$("#kor_nm").val("");
						$("#contents").val("");
						
						// 포커스 처리
						$("#short_nm").focus();
					})
					.fail(function(data) {
						alert("loadLogs failed");					});
				});
				
				$("#btn_cancel").on("click", function(){
					alert("cancel");
				});
			});
		</script>
	</head>
	<body>
		<div data-role="page" id="main_page" class="page">
			<%@ include file="/WEB-INF/views/include/header.jsp" %>
			
			<div data-role="content" class="content-wrapper" data-theme="a">
				<form:form id="write_form" modelAttribute="writeForm">
					<table style="width:100%;">
						<tr>
							<td><label for="sec">구&nbsp;&nbsp;&nbsp;분</label></td>
							<td>
								<form:select id="sec" path="term.sec" data-native-menu="false">
									<option value="1">기술용어</option>
									<option value="2">전산영어</option>
								</form:select>
							</td>
						</tr>
						<tr>
							<td><label for="short_nm">약어명</label></td>
							<td><form:input id="short_nm" path="term.shortNm" /></td>
						</tr>
						<tr>
							<td><label for="full_nm">전체명</label></td>
							<td><form:input id="full_nm" path="term.fullNm" /></td>
						</tr>
						<tr>
							<td><label for="kor_nm">한글명</label></td>
							<td><form:input id="kor_nm" path="term.korNm" /></td>
						</tr>
						<tr>
							<td><label for="contents">내&nbsp;&nbsp;&nbsp;용</label></td>
							<td><form:textarea rows="5" cols="30" id="contents" path="term.contents" /></td>
						</tr>
					</table>
				</form:form>
				
				<div class="btn-wrapper">
					<button id="btn_submit" class="ui-btn ui-btn-inline">저장</button>
					<button id="btn_cancel" class="ui-btn ui-btn-inline">취소</button>
				</div>
				
			</div>
			
			<%@ include file="/WEB-INF/views/include/footer.jsp" %>
		</div>
	</body>
</html>
