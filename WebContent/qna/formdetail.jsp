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
<body>
<%@ include file="/include/uppermost-nav.jsp"%>
<%@ include file="/style/ywj/formstyle.jsp"%>
<div class="container col-xs-12" id="id-main-contents">
<div id="wrap">
	<div id="container">
		<div id="contents02">
			<div
				class="xans-element- xans-board xans-board-writepackage-4 xans-board-writepackage xans-board-4 ">
				<div
					class="xans-element- xans-board xans-board-title-4 xans-board-title xans-board-4 ">
					<div class="title">
						<h2>
							<font color="#555555">Q&amp;A</font>
						</h2>
						<p>상품 Q&amp;A입니다.</p>
					</div>
				</div>
				<form id="boardWriteForm" name="" action="#" method="post" enctype="multipart/form-data">
					<input id="board_no" name="board_no" type="hidden">
					<input id="product_no" name="product_no" type="hidden">
					<input id="move_write_after" name="move_write_after" value="http://fromheadtotoe.kr/board/product/list.html?board_no=6" type="hidden">
					<input id="cate_no" name="cate_no" value="" type="hidden">
					<input id="bUsePassword" name="bUsePassword" value="" type="hidden">
					<input id="order_id" name="order_id" value="" type="hidden">
					<input id="is_post_checked" name="is_post_checked" value="" type="hidden">
					<input id="880d92d4136802ad003e" name="880d92d4136802ad003e" value="f2b5f38d5031087086a9f2c17c0e0547" type="hidden">
					<input id="fix_title_form_0" name="fix_title_form_0" value="배송문의" type="hidden">
					<input id="fix_title_form_1" name="fix_title_form_1" value="반품문의" type="hidden">
					<input id="fix_title_form_2" name="fix_title_form_2" value="교환문의" type="hidden">
					<input id="fix_title_form_3" name="fix_title_form_3" value="입고문의" type="hidden">
					<input id="fix_title_form_4" name="fix_title_form_4" value="상품문의" type="hidden">
					<input id="fix_title_form_5" name="fix_title_form_5" value="사이즈문의" type="hidden">
					<input id="fix_title_form_6" name="fix_title_form_6" value="급문의" type="hidden">
					<input id="fix_title_form_7" name="fix_title_form_7" value="발송전취소요청" type="hidden">
					<input id="bulletin_type" name="bulletin_type" value="title" type="hidden">
					<input id="fix_content_0" name="fix_content_0" value="- 비회원<br /> 주문번호 &amp; 주문자+휴대폰 번호 : " type="hidden">

					<div class="xans-element- xans-board xans-board-write-4 xans-board-write xans-board-4">
						<div class="boardWrite ">
							<table border="1" summary="">
								<caption>글쓰기 폼</caption>
								<tbody>
									<tr class="first">
										<th scope="row">제목</th>
										<td>
											<select id="subject" name="subject">
												<option value="배송문의">배송문의</option>
												<option value="반품문의">반품문의</option>
												<option value="교환문의">교환문의</option>
												<option value="입고문의">입고문의</option>
												<option value="상품문의">상품문의</option>
												<option value="사이즈문의">사이즈문의</option>
												<option value="급문의">급문의</option>
												<option value="발송전취소요청">발송전취소요청</option>
											</select>
										</td>
									</tr>
									<tr>
										<td colspan="2" class="write"><script
												type="text/javascript"
												src="//editor.cafe24.com/js/nneditor.js"></script>
											
													<script type="text/javascript"
													src="http://editor.cafe24.com/lang/ko.js?version=3.3.4.rev.u3.20170330.2"
													charset="UTF-8"></script> <script type="text/javascript"
													src="http://editor.cafe24.com/js/nneditorUtils.dev.js?version=3.3.4.rev.u3.20170330.2"
													charset="UTF-8"></script> <script type="text/javascript"
													src="http://editor.cafe24.com/js/nneditorRange.dev.js?version=3.3.4.rev.u3.20170330.2"
													charset="UTF-8"></script> <script type="text/javascript"
													src="http://editor.cafe24.com/js/nneditorCore.dev.js?version=3.3.4.rev.u3.20170330.2"
													charset="UTF-8"></script> <script type="text/javascript">
													NN.Config.instanceID = "content";
													NN.Config.value = "- 비회원<br />\n주문번호 & 주문자+휴대폰 번호 : <br>";
													NN.Config.toolbarType = "simple";

													//Editor Height
													NN.Config.height = 400;

													var oNN_content = new NNEditor();
													oNN_content.build();

													if (typeof $Editor != "object") {
														$Editor = {
															_obj : {},

															push : function(
																	obj, id) {
																this._obj[id] = obj;
															},

															get : function(
																	id) {
																return this._obj[id];
															},

															reset : function(
																	id) {
																this._obj[id]
																		.getText().value = "";
																this._obj[id]
																		.getIFDoc().body.innerHTML = this._obj[id].Config.START_HTML;
															},

															contents : function(
																	id,
																	context) {
																this._obj[id]
																		.getText().value = context;
																this._obj[id]
																		.getIFDoc().body.innerHTML = this._obj[id].view
																		.parsing(2);
															}
														};
													}

													$Editor.push(
															oNN_content,
															"content");
												</script>
											<div id="content_CONTAINER" class="nneditor-container"></div>
												<input type="hidden" id="content_hidden" value="oNN_content">
											</td>
										</tr>
									</tbody>
									<tbody class="">
										<tr>
											<th scope="row">첨부파일1</th>
											<td><input name="attach_file[]" type="file"></td>
										</tr>
									</tbody>
									<tbody>
										<tr>
											<th scope="row">비밀번호</th>
											<td>
												<input id="password" name="password" value="" type="password">
											</td>
										</tr>
										<tr class="agree ">
											<th scope="row">개인정보 수집 및 <br>이용 동의</th>
											<td>
												<textarea id="privacy_agreement"
													name="privacy_agreement">■ 개인정보의 수집·이용 목적

서비스 제공 및 계약의 이행, 구매 및 대금결제, 물품배송 또는 청구지 발송, 회원관리 등을 위한 목적

■ 수집하려는 개인정보의 항목

이름, 주소, 연락처, 이메일 등

■ 개인정보의 보유 및 이용 기간

회사는 개인정보 수집 및 이용목적이 달성된 후에는 예외없이 해당정보를 파기합니다.
												</textarea>
												<br>개인정보 수집 및 이용에 동의하십니까?
												<input id="privacy_agreement_radio0" name="privacy_agreement_radio" value="T" type="radio">
												<label for="privacy_agreement_radio0">동의함</label>
												<input id="privacy_agreement_radio1" name="privacy_agreement_radio" value="F" type="radio" checked="checked">
												<label for="privacy_agreement_radio1">동의안함</label>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="btnArea ">
								<span class="left"> 
									<a href="/semi/qna/list.jsp">
										<img src="/semi/images/ywj/listbutton.jpg" alt="목록">
									</a>
								</span>
								<a href="#none" onclick="BOARD_WRITE.form_submit('boardWriteForm');">
									<img src="/semi/images/ywj/submitbtn.jpg" alt="등록">
								</a>
								<a href="/semi/qna/list.jsp" onclick="cancle();">
								<script>
									function cancle() {
										alert("글 작성을 취소했습니다.")
										history.go(-1);
									}
								</script>
									<img src="/semi/images/ywj/canclebtn.jpg" alt="취소">
								</a>
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