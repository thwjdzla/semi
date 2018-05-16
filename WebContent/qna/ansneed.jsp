<%@page import="semi.vo.Qna"%>
<%@page import="semi.dao.QnaDao"%>
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
	#pt-h3 {
    display: block;
    font-size: 1.17em;
    -webkit-margin-before: 1em;
    -webkit-margin-after: 1em;
    -webkit-margin-start: 0px;
    -webkit-margin-end: 0px;
    font-weight: bold;
	}
</style>
<body>
	<%@ include file="/include/uppermost-nav.jsp"%>
	<%@ include file="/style/ywj/needpass.jsp"%>
	<%
		int ano = Integer.parseInt(request.getParameter("ano")); 
	%>
	<div class="container col-xs-12" id="id-main-contents">
	<div id="wrap">
		<div id="container">
			<div id="contents02">
				<div
					class="xans-element- xans-board xans-board-securepackage-4 xans-board-securepackage xans-board-4 ">
					<div
						class="xans-element- xans-board xans-board-title-4 xans-board-title xans-board-4 ">
						<div class="title">
							<h2>
								<font color="#555555">Q&amp;A</font>
							</h2>
							<p>상품 Q&amp;A입니다.</p>
						</div>
					</div>
					<form id="boardSecureForm" name=""
						action="/semi/qna/anspass.jsp" method="post">
						<input name="ano" value="<%=ano %>" style="display: none;">
						
						<div class="xans-element- xans-board xans-board-secure-4 xans-board-secure xans-board-4 ">
							<div class="secret">

								<fieldset>
									<h3 id="pt-h3">비밀글보기</h3>
									<p class="info">
										이 글은 비밀글입니다. <strong>비밀번호를 입력하여 주세요.</strong><br>관리자는
										확인버튼만 누르시면 됩니다.
									</p>
									<p class="password">
										<label for="secure_password">비밀번호</label>
										<input id="secure_password" name="ans-password" value="" type="password">
									</p>
									<p class="button">
										<a href="/semi/qna/list.jsp" style="margin: 0px"><img
											src="/semi/images/ywj/listbutton.jpg" alt="목록">
										<input type="image" src="/semi/images/ywj/submitbtn.jpg" name="Submit" value="확인">
										</a>
									</p>
								</fieldset>
							</div>
						</div>
					</form>
				</div>

			</div>
			<hr class="layout">
		</div>
		<hr class="layout">
	</div>
	</div>
	<%@ include file="/include/lowermost-footer.jsp"%>
</body>
</html>