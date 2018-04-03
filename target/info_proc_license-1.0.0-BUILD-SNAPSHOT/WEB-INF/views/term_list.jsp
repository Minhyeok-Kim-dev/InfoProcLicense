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
			var gvTermList;
			var dpTermList;
			
			$(document).ready(function() {
				initGrid();
				selectTermList("");
				
				$("#searchData").bind("change", function(event, ui){
					selectTermList($("#searchData").val());
				});
				
				gvTermList.onCurrentRowChanged = function(grid, oldRow, newRow){
					if(newRow == -1) {
						return;
					}
					
			    	// 경비청구서 
			    	var current = gvTermList.getCurrent();
			    	var contents = dpTermList.getValue(current.dataRow, "contents");
			    	$("#contents").html(contents);
				};
			});
			
			function initGrid(){
				/* RealGrid */
				RealGridJS.setTrace(false);
			    RealGridJS.setRootContext("<c:url value='/resources/js'/>");
				
				dpTermList = new RealGridJS.LocalDataProvider();
				gvTermList = new RealGridJS.GridView("term_list");
				gvTermList.setDataSource(dpTermList);
				
				// field 설정
				var fields = [
					{
						fieldName : "sec",
						dataType : "number"
					},
					{
						fieldName : "seq",
						dataType : "number"
					},
					{
						fieldName : "shortNm"
					},
					{
						fieldName : "fullNm"
					},
					{
						fieldName : "korNm"
					},
					{
						fieldName : "contents"
					}
				];
				dpTermList.setFields(fields);
				
				// column 설정
				var columns = [
					{
						name : "sec",
						fieldName : "sec",
						header : {
							text : "구분"
						},
						styles : {
							textAlignment : "center"
						},
						labels : ["용어", "전영"],
						values : [1, 2],
						lookupDisplay: true,
						width : 5
					},
					{
						name : "shortNm",
						fieldName : "shortNm",
						header : {
							text : "약어명"
						},
						styles : {
							textAlignment : "center"
						},
						width : 10
					},
					{
						name : "fullNm",
						fieldName : "fullNm",
						header : {
							text : "전체명"
						},
						styles : {
							textAlignment : "center"
						},
						width : 20
					},
					{
						name : "korNm",
						fieldName : "korNm",
						header : {
							text : "한글명"
						},
						styles : {
							textAlignment : "center"
						},
						width : 15
					}
				];
				gvTermList.setColumns(columns);
				
				// Style 설정
				gvTermList.setSelectOptions({
				  style: 'singleRow'
				});
				  
				gvTermList.setStateBar({
			    	visible: false  
			    });
			    
				gvTermList.setCheckBar({
				  	visible: false  
				});
			    
				gvTermList.setEditOptions({
			    	readOnly : true,
			    	editable : false
			    });
			    
				gvTermList.setPanel({
			    	visible : false
			    });
			    
				gvTermList.setIndicator({
			    	headText : "NO",
			    	width : 25
			    });
				
				gvTermList.setHeader({
			    	height : 25,
			    	styles : {	// 선택된 Column Header 색상 -> 다른 헤더색상과 동일하게 설정 
			    		"selectedBackground" : "linear,#ffffffff,#ffcccccc,90",
			    		"selectedForeground" : "#ff000000"
			    	}
			    });
				
				gvTermList.setFooter({
					visible : false
				});
				
				gvTermList.setDisplayOptions({
					fitStyle : "even",	// 컬럼의 너비 width 속성에 맞춰 비례적 배분
					rowFocusVisible:false,
					focusVisible : false	// focus셀 테두리 안생기도록 설정
				});
			}
			
			function selectTermList(searchData) {
				$.ajax(getContextPath() + "/term/selectTermList", {
					type : "post",
					dataType : "json",
					data : {
						"searchData" : searchData
					}
				})
				.done(function(data) { // success 시
					dpTermList.fillJsonData(data.termList, {fillMode : "set"});		
				})
				.fail(function(data) {
					alert("loadLogs failed");
				});
			}
		</script>
	</head>
	<body>
		<div data-role="page" id="main_page" class="ui-page ui-page-theme-a ui-page-active">
			<%@ include file="/WEB-INF/views/include/header.jsp" %>
			
			<div data-role="main" class="ui-content" data-theme="a">
				<div>
					<input type="search" id="searchData" />
				</div>
				<div>
					<div id="term_list" style="width: 100%; height: 200px;"></div>
					<div>
						<h3>상세내용</h3>
						<div id="contents"></div>
					</div>
				</div>
			</div>
			
			<%@ include file="/WEB-INF/views/include/footer.jsp" %>
		</div>
	</body>
</html>