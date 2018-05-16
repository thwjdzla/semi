<%@page import="semi.vo.Event"%>
<%@page import="java.util.List"%>
<%@page import="semi.dao.EventDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="ko">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<style>

</style>
<body>
<%@ include file="/include/uppermost-nav.jsp" %>
<%@ include file="/style/ywj/eventliststyle.jsp" %>
<%
	EventDao eventDao = EventDao.getInstance();
	List<Event> events = eventDao.getAllEvents();
%>
<div class="container col-xs-12" id="id-main-contents">
<div id="wrap">
	<div id="container">
		<div id="contents02">
			<div
				class="xans-element- xans-board xans-board-listpackage-8 xans-board-listpackage xans-board-8 ">
				<div
					class="xans-element- xans-board xans-board-title-8 xans-board-title xans-board-8 ">
					<div class="title">
						<h2>
							<font color="#333333">EVENT</font>
						</h2>
						<p>이벤트</p>
					</div>
					<p class="imgArea"></p>
				</div>
				<div class="boardSort"></div>
				<div class="notice"></div>
				<div class="xans-element- xans-board xans-board-list-8 xans-board-list xans-board-8">
					<ul>
					<%
						for (Event event : events) {
					%>
							<li class="xans-record-">
							<a href="detail.jsp?eno=<%=event.getNo() %>" class="imgLink">
								<img src="/semi/images/ywj/<%=event.getBanner() %>"
								onerror="this.src='/semi/images/ywj/Desert.jpg'"
								alt="">
							</a>
							<a href="detail.jsp?eno=<%=event.getNo() %>" class="imgLink"><%=event.getSubject() %></a>
							<span>
								<strong>name : <%=event.getAdminName() %></strong>
								<em>date : <%=event.getCreateDateSDF() %></em>
							</span>
							</li>
					<%
						}
					%>
					</ul>
				</div>
				<div
					class="xans-element- xans-board xans-board-empty-8 xans-board-empty xans-board-8 boardListEmpty displaynone ">
					<p></p>
				</div>
			</div>

			<div
				class="xans-element- xans-board xans-board-paging-8 xans-board-paging xans-board-8">
				<p>
					<a href="#"><img
						src="../images/ywj/left1.jpg" alt="이전 페이지"></a>
				</p>
				<ol>
					<li class="xans-record-"><a href="#"
						class="this">1</a></li>
				</ol>
				<p>
					<a href="#"><img
						src="../images/ywj/right1.jpg" alt="다음 페이지"></a>
				</p>
			</div>

			<form id="boardSearchForm" name="" action="/board/gallery/list.html"
				method="get" enctype="multipart/form-data">
				<input id="board_no" name="board_no" value="8" type="hidden">
				<input id="page" name="page" value="1" type="hidden"> <input
					id="board_sort" name="board_sort" value="" type="hidden">
				<div
					class="xans-element- xans-board xans-board-search-8 xans-board-search xans-board-8 ">
					<fieldset class="boardSearch">
						<legend>게시물 검색</legend>
						<p>
							<select id="search_date" name="search_date">
								<option value="week">일주일</option>
								<option value="month">한달</option>
								<option value="month3">세달</option>
								<option value="all">전체</option>
							</select> <select id="search_key" name="search_key">
								<option value="subject">제목</option>
								<option value="content">내용</option>
								<option value="writer_name">글쓴이</option>
								<option value="member_id">아이디</option>
								<option value="nick_name">별명</option>
							</select> <input style="height: 24px;" id="search" name="search" class="inputTypeText" placeholder="" value=""
								type="text"> <a href="#none"
								onclick="BOARD.form_submit('boardSearchForm');"
								class="boardsecrshbtn">search</a>
						</p>
					</fieldset>
				</div>
			</form>
		</div>
		<hr class="layout">
	</div>
	<hr class="layout">
</div>
</div>
<%@ include file="/include/lowermost-footer.jsp"%>
</body>
</html>