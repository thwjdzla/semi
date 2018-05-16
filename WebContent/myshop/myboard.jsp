<%@page import="java.util.List"%>
<%@page import="semi.dao.QnaDao"%>
<%@page import="semi.vo.Customer"%>
<%@page import="semi.vo.Qna"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
  html, body, div, dl, dt, dd, ul, ol, li, h1, h2, h3, h4, h5, h6, pre, code, form, fieldset, legend, input, textarea, p, blockquote, th, td, img {
    margin: 0;
    padding: 0;
}
  #container {
    width: 1304px;
    min-height: 600px;
    margin: 0 auto;
}
  
  #contents02 {
    width: 1000px;
    min-height: 500px;
    margin: 80px auto 80px;
}
  .titleArea {
    margin: 22px 0px 60px;
}
  .titleArea h2 {
    font-family: 'Open Sans','맑은 고딕';
    letter-spacing: 0.07em;
    font-weight: 600;
    text-transform: uppercase;
    font-size: 13px;
    color: #555;
    text-align: center;
    margin: 10px auto 15px;
}
.xans-myshop-boardlisthead {
    margin: 15px 0 10px 0px;
    font-size: 11px;
    color: #333;
}
select {
    height: 24px;
    border: 1px solid #d5d5d5;
}

input, select, textarea {
    font-size: 100%;
    font-family: "돋움",Dotum;
    color: #353535;
    vertical-align: middle;
}
option {
    font-weight: normal;
    display: block;
    white-space: pre;
    min-height: 1.2em;
    padding: 0px 2px 1px;
}







table {
    width: 100%;
    border: 0;
    border-spacing: 0;
    border-collapse: collapse;
}
.xans-myshop-boardlist {
    font-family: '맑은 고딕';
}

.xans-myshop-boardlist table {
    border-top: 1px solid #aaa;
    border-bottom: 1px solid #aaa;
    color: #333;
    font-size: 11px;
    line-height: 140%;
}



caption {
    display: none;
}
colgroup {
    display: table-column-group;
}
col {
    display: table-column;
}
thead {
    display: table-header-group;
    vertical-align: middle;
    border-color: inherit;
}
tr {
    display: table-row;
    vertical-align: inherit;
    border-color: inherit;
}
.xans-myshop-boardlist table th {
    padding: 4px 0 5px;
    border-bottom: 1px solid #aaa;
    font-weight: normal;
}
tbody {
    display: table-row-group;
    vertical-align: middle;
    border-color: inherit;
}
.xans-myshop-boardlist table td {
    padding: 4px 3px 2px;
    height: 32px;
    text-align: center;
    vertical-align: middle;
}
.xans-myshop-boardlist table td:last-child {
    border-right: none;
}

form {
    display: block;
    margin-top: 0em;
}
input, select, textarea {
    font-size: 100%;
    font-family: "돋움",Dotum;
    color: #353535;
    vertical-align: middle;
}
.xans-myshop-boardlistsearch {
    padding: 15px 0 20px;
    color: #2e2e2e;
    font-size: 11px;
    text-align: center;
}

iframe[Attributes Style] {
    height: 100%;
    width: 100%;
    border-top-width: 0px;
    border-right-width: 0px;
    border-bottom-width: 0px;
    border-left-width: 0px;
}

iframe {
    border-width: 2px;
    border-style: inset;
    border-color: initial;
    border-image: initial;
}
.widget_reviews:first-child, .widget_reviews.first {
    padding-top: 0;
}
.widget_reviews {
    padding: 44px 0;
}
.widget_reviews__heading {
    padding-bottom: 10px;
    margin-bottom: 10px;
    border-bottom: 1px solid #dadada;
    font-family: "나눔고딕", "NanumGothic", "맑은 고딕", "Malgun Gothic", "돋움", "Dotum", "굴림", "Helvetica Neue", Helvetica, Arial, sans-serif;
}
.widget_reviews__title {
    font-size: 12px;
    float: left;
}
.widget_reviews__title strong, .widget_reviews__title .strong {
    font-weight: bold;
}
strong {
    color: #333333;
}
.widget_reviews__title .divider {
    margin: 0 8px;
    color: #7d7d7d;
}
.widget_reviews--no_data .widget_reviews__body {
    border: 0;
    min-height: 260px;
}

.panel-default{
	width: 100%;
}

  </style>
  
  
</head>
<body>
<%@ include file="/include/uppermost-nav.jsp" %>
	<div class="container">
		<div class="contents02">
			<div class="titleArea">
				<h2 style="margin-top: 100px">MY Board</h2>
			</div>
			
			<%
				Customer customer = (Customer) session.getAttribute("logged-in-user");
				QnaDao dao = QnaDao.getInstance();
				List<Qna> qna = null;
				if(customer != null){
					qna = dao.getQuestionByNo(customer.getNo()); 
					System.out.println(qna);
				}
			%>
			
			<div class="xans-element- xans-myshop xans-myshop-boardpackage ">
				<div class="xans-element- xans-myshop xans-myshop-boardlisthead ">
					<p>
					분류선택
					<select id="board_sort" name="board_sort"">
						<option value="D">작성 일자별</option>
						<option value="C">분류별</option>
					</select>
					</p>
				</div>
			</div>
		
			<div class="xans-element- xans-myshop xans-myshop-boardlist boardList">
				<table border="0">
					<caption>게시물 관리 목록</caption>
					<colgroup class="xans-element- xans-board xans-board-listheader-1002 xans-board-listheader xans-board-1002 ">
						<col style="width:70px">
						<col style="width:135px">
						<col style="width:auto">
						<col style="width:84px">
						<col style="width:80px">
						<col style="width:55px">
					</colgroup>
					
					<thead>
						<tr>
							<th style="text-align:center">번호</th>
							<th style="text-align:center">분류</th>
							<th style="text-align:center">제목</th>
							<th style="text-align:center">작성자</th>
							<th style="text-align:center">작성일</th>
							<th style="text-align:center">조회</th>
						</tr>
					</thead>
					
					<%if(qna != null){// && customer == null){
					for(Qna question:qna){%>
					
					<tbody>
						<tr class="xans-record-">
							<td class="number"><%=question.getQuesNo() %></td>
							<td class="category">
								<a href=""><%=question.getQuSubject() %></a> 
							</td>
							<td class="subject">
								<img src="비밀글이미지" alt="">
								<a href=""></a>
							<b>[1]</b>
							</td>
							<td class="writer"><%=question.getCustName() %></td>
							<td class="date"><%=question.getQuCreateDateSDF() %></td>
							<td class="hit"><%=question.getAwViewcount() %></td>
							
						</tr>
					</tbody>
					<%}
					} else { %>
					<tbody>
						<tr>
							<td colspan="6" class="noData">게시물이 없습니다.</td>
						</tr>
					</tbody>
					<%} %>
					
				</table>
			
			</div>
		
			<form id="boardSearchForm" action="" method="get" enctype="multipart/form-data">
				<input id="board_no" name="board_no" type="hidden">
				<input id="page" name="page" value="1" type="hidden">
				<input id="board_sort" name="board_sort" type="hidden">
				
				<div class="xans-element- xans-myshop xans-myshop-boardlistsearch ">
					<fieldset class="boardSearch">
						<p>
							<select id="searck_key" name="search_key">
								<option value="subject">제목</option>
								<option value="content">내용</option>
								<option value="writer_name">글쓴이</option>
								<option value="member_id">아이디</option>
								<option value="nick_name">별명</option>
							</select>
							<input id="search" name="search" class="inputTypeText" type="text"/>
							<a href="" onclick="" class="boardsecrshbtn">search</a>
						</p>
					</fieldset>
				</div>
			</form>
			
			<div class="widget_reviews js-pagination-list widget_reviews--no_data">
				<div class="widget_reviews__heading">
					<div class="widget_reviews__title">
						<strong>REVIEW</strong>
						<span class="divider">|</span>
							내가 작성한 리뷰
					</div>
					&nbsp;
				</div>
			</div>
			
			
		<div class="row">
			<div class="col-sm-12">
				<div class="panel panel-default">
					<div class="panel-body">		
						<table>
							<colgroup>
								<col style="width:auto">
								<col style="width:15%">
								<col style="width:15%">
								<col style="width:15%">
							</colgroup>
							<thead>
								<tr>
									<th>0개의 리뷰를 작성하셨습니다.</th>
									<th>
										<div class="dropdown bnt-group">
										  <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
										    	최신순
										    <span class="caret"></span>
										  </button>
										  	
										  
										  <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
										    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">최신순</a></li>
										    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">추천순</a></li>
										    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">댓글 최신순</a></li>
										  </ul>
										</div>
									</th>
									<th style="font-size: 12px"><a>포토리뷰 모아보기</a></th>
									<th><span class="glyphicon glyphicon-search"></span>검색어입력</th>
								</tr>
							</thead>
						</table>
					</div>
				</div>
			</div>
			
			
			
			
		
		
	</div>
</body>
</html>
    