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
		
		<script type="text/javascript" src="<c:url value="/resources/js/realgridjs-lic2.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/resources/js/realgridjs_eval.1.1.26.min.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/resources/js/realgridjs-api.1.1.26.js" />"></script>
		
		<title>Insert title here</title>
		
		<script>
			$(document).ready(function() {
				
				/*  */
				alert($("#termList").val());
				
				
				//var termList = ;
				//var obj =jQuery.parseJSON('{"name":"John"}');
				/* 
				alert($("#termList").val());
				
				$.getJSON($("#termList").val, function(data) {
					alert(data["term"]);
				});
				 */
			});
			
		</script>
	</head>
	<body>
		<input type="hidden" id="termList" value="${termList}" />
		
		<div data-role="page" id="main_page" class="ui-page ui-page-theme-a ui-page-active">
			<%@ include file="/WEB-INF/views/include/header.jsp" %>
			
			<div data-role="main" class="ui-content" data-theme="a">
				<div>
					<h3>Question</h3>
					<%-- 
					<c:forEach var="bbs" items="${bbsList}">
					<tr style="height:30px">
						<td>${bbs.bbsno}</td>
						<td style="text-align:left;padding-left:10px">
							<a href="<c:url value="/bbs/detail/${bbs.bbsno}"/>">${bbs.title}</a>
						</td>
						<td>
							<fmt:formatDate value="${bbs.regdate}" pattern="yyyy-MM-dd" />
						</td>
					</tr>
					</c:forEach>
					 --%>
					<div id="contents"></div>
				</div>
				<div>
					<input type="text" id="answer" data-clear-btn="true" />
				</div>
			</div>
			
			<%@ include file="/WEB-INF/views/include/footer.jsp" %>
		</div>
	</body>
</html>