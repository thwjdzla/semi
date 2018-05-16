<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="semi.vo.Qna"%>
<%@page import="semi.dao.QnaDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="ko">
<head>
<title>Bootstrap Template</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<style>
	th {
  	text-align: center;
  	}
  	#serach-box {
  	width: 43px;
  	height: 24px;
  	}
</style>
<body>
	<%@ include file="/include/uppermost-nav.jsp"%>
	<%@ include file="/style/ywj/liststyle.jsp"%>
	<%
		request.setCharacterEncoding("utf-8");
	
		QnaDao qnaDao = QnaDao.getInstance();
		List<Qna> qnas = new ArrayList<>();
		
		final int rows = 5;
		String current = request.getParameter("pageno");
		if (current == null) {
			current = "1";
		}
		int currentPage = Integer.parseInt(current);
		int records;
		int pages = 0;
		int beginIndex = (currentPage -1) * rows + 1;
		int endIndex = currentPage * rows;
		
		Map<String, Object> indexRange = new HashMap<>();
		indexRange.put("begin", beginIndex);
		indexRange.put("end", endIndex);
		
		String keyword = request.getParameter("keyword");
				
		if (keyword == null || "null".equals(keyword)) {
			records = qnaDao.getQnaCounts();
			pages = (int)Math.ceil((double)records/rows);
			
			qnas = qnaDao.getQnaByRange(indexRange);
			
		} else if ("subject".equals(request.getParameter("search_key"))) {
			keyword = keyword.trim();
			records = qnaDao.getSearchQnaCountsBySubject(keyword);
			pages = (int)Math.ceil((double)records/rows);
			
			indexRange.put("keyword", keyword);
			
			qnas = qnaDao.getSearchQnaBySubject(indexRange);
			
		} else if ("writer_name".equals(request.getParameter("search_key"))) {
			keyword = keyword.trim();
			records = qnaDao.getSearchQnaCountsByName(keyword);
			pages = (int)Math.ceil((double)records/rows);
			
			indexRange.put("keyword", keyword);
			
			qnas = qnaDao.getSearchQnaByName(indexRange);
		}
	%>
	<div class="container col-xs-12" id="id-main-contents">
		<div id="wrap">
			<div id="container">
				<div id="contents02">
					<div
						class="xans-element- xans-board xans-board-listpackage-4 xans-board-listpackage xans-board-4 ">
						<div
							class="xans-element- xans-board xans-board-title-4 xans-board-title xans-board-4 ">
							<div class="title">
								<h2>
									<font color="#555555">Q&amp;A</font>
								</h2>
								<p>상품 Q&amp;A입니다.</p>
							</div>
						</div>
						
						<div class="boardSort crema-hide">
							<span
								class="xans-element- xans-board xans-board-replysort-4 xans-board-replysort xans-board-4 "></span>
						</div>
						<div class="boardList crema-hide">
							<table border="1" summary="">
								<caption>상품 게시판 목록</caption>
								<colgroup
									class="xans-element- xans-board xans-board-listheader-4 xans-board-listheader xans-board-4 ">
									<col style="width: 70px;">
									<col style="width: 134px;">
									<col style="width: 135px;" class="displaynone">
									<col style="width: auto;">
									<col style="width: 84px;">
									<col style="width: 80px;" class="">
									<col style="width: 55px;" class="">
									<col style="width: 55px;" class="displaynone">
									<col style="width: 80px;" class="displaynone">
								</colgroup>
								<thead 
									class="xans-element- xans-board xans-board-listheader-4 xans-board-listheader xans-board-4 ">
									<tr style="">
										<th scope="col">no</th>
										<th scope="col" class="thumb">product</th>
										<th scope="col" class="displaynone">카테고리</th>
										<th scope="col">subject</th>
										<th scope="col">name</th>
										<th scope="col" class="">date</th>
										<th scope="col" class="">hit</th>
									</tr>
								</thead>
								<tbody
									class="xans-element- xans-board xans-board-notice-4 xans-board-notice xans-board-4 notice">
									<tr style="background-color: #FFFFFF; color: #555555;"
										class="xans-record-">
										<td>공지</td>
										<td class="thumb"><a href="#"><span></span></a></td>
										<td class="displaynone"></td>
										<td class="subject"><span class="displaynone"> <a
												href="#none" onclick="BOARD.viewTarget('220567','6',this);"><img
													src="#"
													alt="내용 보기"></a>
										</span> <a href="#"
											style="color: #555555;"><font color="red">★카카오톡
													알림톡 서비스 안내★</font></a> <span class="comment"></span></td>
										<td>프롬헤드투토</td>
										<td class="txtLess ">2018-01-04</td>
										<td class="txtLess ">549</td>
										<td class="txtLess displaynone">0</td>
									</tr>
								</tbody>
								<tbody
									class="xans-element- xans-board xans-board-list-4 xans-board-list xans-board-4">
									<%
										for (Qna question : qnas) {
											Qna answer = qnaDao.getThisAnswer(question.getQuesNo());
									%>
									<tr style="background-color: #FFFFFF; color: #555555;"
										class="xans-record-">
										<td><%=question.getQuesNo() %></td>
										<td class="thumb"><a href="/semi/product/detail.jsp?pro-no=<%=question.getProNo() %>&qna-pno=1&review-pno=1"><img src="/semi/images/products/<%=question.getProImg() %>"></a></td>
										<td class="displaynone"></td>
										<td class="subject">
											<p style="color: #999; padding: 0 0 3px 0;"></p>
											<span class="displaynone">
												<a href="#none" onclick="BOARD.viewTarget('229775','6',this);">
													<img src="#" alt="내용 보기">
												</a>
											</span>
											<a href="/semi/qna/quesneed.jsp?qno=<%=question.getQuesNo() %>" style="color: #555555;"><%=question.getQuSubject() %>
											<img src="/semi/images/ywj/lock.gif" alt="비밀글">
											<img src="/semi/images/ywj/new.gif" alt="NEW">
											</a>
											<span class="comment"></span>
										</td>
										<td><img src="/semi/images/ywj/<%=question.getCustomerGrade() %>.jpg"><%=question.getCustName() %></td>
										<td class="txtLess "><%=question.getQuCreateDateSDF() %></td>
										<td class="txtLess "><%=question.getQuViewcount() %></td>
									</tr>
									<%
											if (answer != null) {
									%>
											<tr style="background-color: #FFFFFF; color: #555555;"
												class="xans-record-">
												<td>Answer(<%=question.getQuesNo() %>)</td>
												<td class="thumb"><a href="#"></a></td>
												<td class="displaynone"></td>
												<td class="subject">
													<p style="color: #999; padding: 0 0 3px 0;"></p>
													<span class="displaynone">
														<a href="#none" onclick="BOARD.viewTarget('229775','6',this);">
															<img src="#" alt="내용 보기">
														</a>
													</span>
													<a href="/semi/qna/ansneed.jsp?ano=<%=question.getQuesNo() %>" style="color: #555555;">&nbsp;&nbsp;<img src="/semi/images/ywj/icon_re.gif"><%=answer.getAwSubject() %>
													<img src="/semi/images/ywj/lock.gif" alt="비밀글">
													<img src="/semi/images/ywj/new.gif" alt="NEW">
													</a>
													<span class="comment"></span>
												</td>
												<td><%=answer.getAdminId() %></td>
												<td class="txtLess "><%=answer.getAwCreateDataSDF() %></td>
												<td class="txtLess "><%=answer.getAwViewcount() %></td>
											</tr>
									<%
											}
										}
									%>
								</tbody>
							</table>
						</div>
						<div
							class="xans-element- xans-board xans-board-empty-4 xans-board-empty xans-board-4 boardListEmpty displaynone crema-hide ">
							<p></p>
						</div>
					</div>

					<div
						class="xans-element- xans-board xans-board-paging-4 xans-board-paging xans-board-4 crema-hide">
						<p>
						<a href="/semi/qna/list.jsp?pageno=<%=currentPage-1 %>">
							<img src="/semi/images/ywj/left1.jpg" alt="이전 페이지">
						</a>
					</p>
					<ol>
					<%
						for (int index=1; index<=pages; index++) {
					%>
						<li class="xans-record-">
							<a href="/semi/qna/list.jsp?pageno=<%=index %>" class="this"><%=index %></a>
						</li>
					<%
						}
					%>
					</ol>
					<p>
						<a href="/semi/qna/list.jsp?pageno=<%=currentPage+1 %>">
							<img src="/semi/images/ywj/right1.jpg" alt="다음 페이지">
						</a>
					</p>
					</div>

					<form id="boardSearchForm" name="" action="/semi/qna/list.jsp?pageno=1" method="post">
						<input id="board_no" name="board_no" value="1" type="hidden">
						<input id="page" name="page" value="1" type="hidden"> <input
							id="board_sort" name="board_sort" value="" type="hidden">
						<div
							class="xans-element- xans-board xans-board-search-1002 xans-board-search xans-board-1002 ">
							<fieldset class="boardSearch">
								<legend>게시물 검색</legend>
								<p>
									<select id="search_date" name="search_date">
										<option value="week">일주일</option>
										<option value="month">한달</option>
										<option value="month3">세달</option>
										<option value="all">전체</option>
									</select>
									<select id="search_key" name="search_key">
										<option value="subject">제목</option>
										<option value="writer_name">글쓴이</option>
									</select>
									<input style="height: 24px;" id="search" name="keyword" class="inputTypeText" type="text">
									<input type="submit" value="search" class="boardsecrshbtn" id="serach-box">
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