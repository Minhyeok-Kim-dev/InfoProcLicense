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
			let mode;	// 1:연습, 2:시험
			let termList = [];
			let termIndex = 0;
			let wrongList = [];
			let wrongIndex = 0;
			
			$(document).ready(function() {

				termList = ${termList};
				mode = ${mode};
				
				getTerm(termIndex);
				
				$("#answer").on("keyup", function(e){
					if(e.keyCode == 13) {
						if(termIndex == termList.length) {
							return;
						}
						
						// 정답비교 - 오답인 경우 정답 다이얼로그 표시
						if(compareAnswer(termIndex, $("#answer").val())) {
						} else {
							if(mode == 1) {
								showAnswerDlg(termIndex);	
							} else {
								// 오답리스트에 추가
								 wrongList.push(termIndex);								
							}
						}
						
						$("#answer").val("");
						
						// 다음문제 가져옴
						getTerm(++termIndex);
					}
				});
				
				$("#result_page_btn_wrong").on("click", function(e) {
					e.preventDefault();
					
					// 오답리스트 있는경우 오답리스트 출력
					if(wrongList.length > 0) {
						showAnswerDlg(wrongList[wrongIndex]);
					}
				});
				
				$("#dlg_answer_btn_next").on("click", function(e) {
					e.preventDefault();
					
					wrongIndex++;
					
					if(wrongIndex >= wrongList.length) {
						wrongIndex = 0;
					}
					
					showAnswerDlg(wrongList[wrongIndex]);
				});
				
				$("#dlg_answer_btn_prev").on("click", function(e) {
					e.preventDefault();
					
					wrongIndex--;

					if(wrongIndex < 0) {
						wrongIndex = wrongList.length - 1;
					}
					
					showAnswerDlg(wrongList[wrongIndex]);
				});
			});
			
			function getTerm(termIndex) {
				$("#contents").html("");
				
				if(termIndex == termList.length) {
					
					// 시험모드인 경우 종료된경우 결과페이지로 이동
					if(mode == 2) {
						showResultPage();
					}
					return;
				}
				
				$("#contents").html(${termList}[termIndex].contents);
			};
			
			function compareAnswer(termIndex, answer){
				answer = answer.toLowerCase();
				
				if(termIndex >= ${termList}.length) {
					return true;
				} 
				
				let shortNm = ${termList}[termIndex].shortNm.toLowerCase();
				let fullNm = ${termList}[termIndex].fullNm.toLowerCase();
				let korNm = ${termList}[termIndex].korNm.toLowerCase();
				
				if( shortNm == answer || fullNm == answer || korNm == answer) {
					return true;
				}
				 
				return false;
			}
			
			function showAnswerDlg(termIndex){
				let shortNm = ${termList}[termIndex].shortNm;
				let fullNm = ${termList}[termIndex].fullNm;
				let korNm = ${termList}[termIndex].korNm;
				let contents = ${termList}[termIndex].contents;
				
				$("#dlg_answer_short_nm").val(shortNm);
				$("#dlg_answer_full_nm").val(fullNm);
				$("#dlg_answer_kor_nm").val(korNm);
				$("#dlg_answer_contents").html(contents);
				
				$.mobile.changePage('#dlg_answer', 'pop', true, true);
			}
			
			function showResultPage() {
				let rightCnt = termList.length - wrongList.length;
				
				let score = Math.floor((rightCnt / termList.length) * 100.0);
				
				$("#result_page_score").html(score);
				$.mobile.changePage('#result_page');				
			}
		</script>
	</head>
	<body>
		<input type="hidden" id="termList" value="${termList}" />
		
		<div data-role="page" id="main_page" class="page">
			<%@ include file="/WEB-INF/views/include/header.jsp" %>
			<div data-role="content" class="ui-content" data-theme="a">
				<div>
					<h3>Question</h3>
					<div id="contents"></div>
				</div>
				<div>
					<input type="text" id="answer" data-clear-btn="true" />
				</div>
			</div>
			<%@ include file="/WEB-INF/views/include/footer.jsp" %>
		</div>
		
		<div data-role="page" id="result_page" class="page">
			<%@ include file="/WEB-INF/views/include/header.jsp" %>
			<div data-role="content" class="ui-content" data-theme="a">
				<div>
					<h3>시험 결과</h3>
					<div>
						<table>
							<tr>
								<td>
									<h4>Score :</h4> 
								</td>
								<td>
									<h4><label id="result_page_score"></label></h4>
								</td>
							</tr>
						</table>
					</div>
				</div>
				<a id="result_page_btn_wrong" data-ajax="false" class="ui-btn ui-shadow ui-corner-all ui-btn-b">오답보기</a>
				<a href="<c:url value="/examMode"/>" data-ajax="false" class="ui-btn ui-shadow ui-corner-all ui-btn-b">다시보기</a>
			</div>
			<%@ include file="/WEB-INF/views/include/footer.jsp" %>
		</div>
				
		<!-- 정답 dialog -->
		<div id="dlg_answer" data-role="dialog" data-transition="pop" data-close-btn="none">
			<div data-role="header" data-theme="b">
				<c:choose>
					<c:when test="${mode == 2}">
						<a href="#" id="dlg_answer_btn_prev" data-ajax="false" class="ui-nodisc-icon ui-alt-icon ui-btn-left ui-btn ui-icon-carat-l ui-btn-icon-notext ui-corner-all"></a>
						<h1>정답내용</h1>
						<a href="#" id="dlg_answer_btn_next" data-ajax="false" class="ui-nodisc-icon ui-alt-icon ui-btn-right ui-btn ui-icon-carat-r ui-btn-icon-notext ui-corner-all"></a>
					</c:when>
					<c:otherwise>
						<h1>정답내용</h1>
					</c:otherwise>
				</c:choose>
			</div>
			
			<table style="width:100%;">
				<tr>
					<td><label for="dlg_answer_short_nm">약어명</label></td>
					<td><input type="text" id="dlg_answer_short_nm" readonly="readonly" /></td>
				</tr>
				<tr>
					<td><label for="dlg_answer_full_nm">전체명</label></td>
					<td><input type="text" id="dlg_answer_full_nm" readonly="readonly" /></td>
				</tr>
				<tr>
					<td><label for="dlg_answer_kor_nm">한글명</label></td>
					<td><input type="text" id="dlg_answer_kor_nm" readonly="readonly" /></td>
				</tr>
				<tr>
					<td><label for="contents">내&nbsp;&nbsp;&nbsp;용</label></td>
					<td>
						<div id="dlg_answer_contents"></div>
					</td>
				</tr>
			</table>
			
			<a data-rel="back" class="ui-btn ui-shadow ui-corner-all ui-btn-b">확인</a>
		</div>
		<!-- 정답 dialog -->
		
		
	</body>
</html>