<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div data-role="header" data-position="fixed" data-theme="b">
	<a href="#" data-rel="back" data-ajax="false" class="ui-nodisc-icon ui-alt-icon ui-btn-left ui-btn ui-icon-carat-l ui-btn-icon-notext ui-corner-all"></a>
	<h3>기사 전산용어</h3>
	<a href="#links" class="ui-nodisc-icon ui-alt-icon ui-btn-right ui-btn ui-icon-bars ui-btn-icon-notext ui-corner-all"></a>
</div>

<div data-role="panel" id="links" data-position="right" data-display="overlay" data-theme="b">
	<ul data-role="listview">
		<li><a href="<c:url value="/examMode"/>" data-ajax="false">Exam</a></li>
		<li><a href="<c:url value="/termList"/>" data-ajax="false">Term List</a></li>
		<%-- 
		<li><a href="<c:url value="/writeForm"/>" data-ajax="false">Write</a></li>
		 --%>
	</ul>
</div>