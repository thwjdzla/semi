<%@page import="semi.vo.Notice"%>
<%@page import="semi.dao.NoticeDao"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="semi.utils.DateUtil"%>
<%@page import="semi.dao.CustomerDao"%>
<%@page import="semi.vo.AdminComment"%>
<%@page import="semi.dao.ReviewDao"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="semi.dao.OrderDao"%>
<%@page import="semi.vo.ProductReviews"%>
<%@page import="semi.vo.ProductQuestions"%>
<%@page import="java.util.List"%>
<%@page import="semi.vo.ProductDetail"%>
<%@page import="semi.dao.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>Bootstrap Template</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<%
	request.setCharacterEncoding("utf-8");
	Customer loginedUser = (Customer)session.getAttribute("logged-in-user");
	int proNo = Integer.parseInt(request.getParameter("pro-no"));
	
	
	int qnaPno = 1;
	String qnaPnoStr = request.getParameter("qna-pno");
	if (qnaPnoStr != null) {
		qnaPno = Integer.parseInt(qnaPnoStr);
	}
	int reviewPno = 1;
	String reviewPnoStr = request.getParameter("review-pno");
	if (reviewPnoStr != null) {
		reviewPno = Integer.parseInt(reviewPnoStr);
	}
	String orderBy = request.getParameter("orderBy"); 
	if (request.getParameter("orderBy") == null) {
		orderBy = "createDate";
	}
	String isPhoto = request.getParameter("isPhoto");
	if (request.getParameter("isPhoto") == null) {
		isPhoto = "no";
	}
	ProductDao productDao = ProductDao.getInstance();
	OrderDao orderDao = OrderDao.getInstance();	
	ReviewDao reviewDao = ReviewDao.getInstance();	
	CustomerDao customerDao = CustomerDao.getInstance();
	NoticeDao noticeDao = NoticeDao.getInstance();
	
	List<ProductDetail> productWithOptions = productDao.getProductByNumber(proNo);
	List<String> colors = productDao.getProductColorByProNo(proNo);
	List<String> sizes = productDao.getProductSizeByProNo(proNo);
	List<String> reviewSixImages = productDao.getSixReviewImagesByProNo(proNo);
	List<String> reviewFourImages = productDao.getFourReviewImagesByProNo(proNo);
	
	ProductDetail productWithoutOptions = null;
	if (productWithOptions.isEmpty()) {
		response.sendRedirect("/semi/index.jsp");
		return;
	} else if (!productWithOptions.isEmpty()) {
		productWithoutOptions = productWithOptions.get(0);
	}
	List<Notice> notices = noticeDao.getAllNoticeWithAllCols();
	
	double avg = 0;
	
	List<ProductQuestions> questions = productDao.getProductQuestionsByProNo(proNo);
	List<ProductReviews> reviews = productDao.getProductReviewsByProNoOrderByNew(proNo);
	List<ProductReviews> reviewsOrderbyGrade = productDao.getProductReviewsByProNoOrderbyGrade(proNo);
	if (!reviews.isEmpty()) {
		avg = productDao.getProductScoreByProNo(proNo);
	}
	List<Integer> topThree = productDao.getSoldCountTopThreeProductNo();
	
	final int rows = 5;
	
	int currentQnaPage = qnaPno;
	int qnaRecords = questions.size();
	int qnaPages = (int)Math.ceil((double)qnaRecords/rows);
	int qnaBeginIndex = (currentQnaPage-1) * rows + 1;
	int qnaEndIndex = currentQnaPage*rows;
	
	int currentReviewPage = reviewPno;
	int reviewRecords = reviews.size();
	int reviewPages = (int)Math.ceil((double)reviewRecords/rows);
	int reviewBeginIndex = (currentReviewPage-1) * rows + 1;
	int reviewEndIndex = currentReviewPage*rows;
	
	Map<String, Object> questionMap = new HashMap<>();
	questionMap.put("proNo", proNo);
	questionMap.put("beginIndex", qnaBeginIndex);
	questionMap.put("endIndex", qnaEndIndex);
	List<ProductQuestions> questionsWithRange = productDao.getProductQuestionsByProNoAndRange(questionMap);
	
	List<ProductReviews> reviewsWithRange = null;
	
	if ("createDate".equals(orderBy)) {
		Map<String, Object> reviewMap = new HashMap<>();
		reviewMap.put("proNo", proNo);
		reviewMap.put("beginIndex", reviewBeginIndex);
		reviewMap.put("endIndex", reviewEndIndex);
		reviewsWithRange = productDao.getProductReviewsByProNoOrderByNewAndRange(reviewMap);
		if ("yes".equals(isPhoto)) {
			reviewsWithRange = productDao.getProductReviewsByProNoOrderByNewAndRangeAndWithPhoto(reviewMap);
		}
	} else if ("grade".equals(orderBy)) {
		Map<String, Object> reviewMap = new HashMap<>();
		reviewMap.put("proNo", proNo);
		reviewMap.put("beginIndex", reviewBeginIndex);
		reviewMap.put("endIndex", reviewEndIndex);
		reviewsWithRange = productDao.getProductReviewsByProNoOrderByGradeAndRange(reviewMap);
		if ("yes".equals(isPhoto)) {
			reviewsWithRange = productDao.getProductReviewsByProNoOrderByGradeAndRangeAndWithPhoto(reviewMap);
		}
	}
%>
<style>
	.first-left-side {
		padding: 50px;
	}
	.first-right-side div {
		padding: 50px 0px 0px 0px;
	}
	.main-image {
		width: 50%;
		height: 50%;
		padding: 30px;
	}
	.mini-pics img {
		opacity: 0.2;
	}
	.mini-photo-review img {
		width: 100%;
		height: 100%;
		padding: 5px 0px 5px 0px;
		opacity: 0.4;
	}
	.bottom-of-review {
		background-color: white; 
		border-color: black;
		height: 45px;
	}
	.bottom-of-review-black {
		background-color: black;
		color: white;
	}
	.search-standard {
		font-size: x-large;
	}
	.search-standard-gray {
		color: gray;
	}
	.reviews div{
		padding: 10px;
	}
	.given-stars {
		color: purple;
	}
	.written-comment {
		color: green;
	}
	.writer-and-date {
		color: gray;
	}
	.isHelpful-score {
		background-color: black;
		font-size: 15px;
		color: white;
	}
	.personal-option {
		font-weight: bold;
	}
	.search-type-class {
		width: 150px;
		height: 30px; 
		margin: 0px 10px 0px 0px;
	}
	.review-list {
		display: block;
	}
	.Q-and-A {
		margin-top: 150px;
	}
	#Administrator-comment-area {
		display: none;
	}
	.cancle-botton {
		background-color: black;
		font-size: 4px;
		color: white;
	}
	.filebox label { 
		display: inline-block; 
		padding: .5em .75em; 
		color: #9900cc; 
		font-size: 20px; 
		line-height: normal; 
		vertical-align: middle; 
		background-color: #ffffff; 
		cursor: pointer;
		border: 1px solid #000000; 
		border-bottom-color: #000000; 
		border-radius: .25em; 
		width: 300px;
		text-align: center;
		height: 45px;
	} 
	.filebox input[type="file"] { /* 파일 필드 숨기기 */ 
		position: absolute; 
		width: 1px; 
		height: 1px;
		padding: 0; 
		margin: -1px; 
		overflow: hidden; 
		clip:rect(0,0,0,0); 
		border: 0; 
	}
	.order-detail div {
		margin: 0px 0px 20px 0px;
		padding: 0px;
	}
	.point {
		border: thin;
		background-color: purple;
		color: white;
	}
	.cloth-name {
		font-size: medium;
		font-weight: bold;
		width: auto;
		border: none;	
	}
	.selected-color {
		width: auto;
		border: none;
		width: 75px;
	}
	.selected-size {
		width: auto;
		border: none;
		width: 75px;
	}
	#review-customer-detail {
		display: none;
	}
	.star-rating { width:205px; }
	.star-rating,.star-rating span { display:inline-block; height:39px; overflow:hidden; background:url(/semi/images/sjh/star.png)no-repeat; }
	.star-rating span{ background-position:left bottom; line-height:0; vertical-align:top; }

</style>
<body>
<%@ include file="../include/uppermost-nav.jsp" %>
<div class="container detail-body" id="id-main-contents">
	<div class="row">
		<div class="col-md-8 first-left-side">
			<img src="/semi/images/products/<%=productWithoutOptions.getImgBig()==null? "product_ready_big.png":productWithoutOptions.getImgBig() %>" width="100%" height="80%" />
			<p class="text-center">PHOTO REVIEW</p>
			<div class="row mini-pics" style="height: 100px;">
			<%
				int imgCnt = 1;
				for (String reviewImage : reviewSixImages)	{
			%>
				<div class="col-md-2">
					<a onclick="goToThatReview(<%=imgCnt%>)">
					<img src="/semi/images/products/<%=reviewImage==null? "product_ready_big.png":reviewImage %>" width="100%" height="100%" onmouseover="visibility(<%=imgCnt %>);" onmouseout="transparency(<%=imgCnt %>)"  id="pic-<%=imgCnt %>"/>
					</a>
				</div>
			<%
					imgCnt++;
				}
			%>
			</div>
		</div>
		<div class="col-md-4 first-right-side">
			<div class="row">
				<p>
					<strong style="font-size: large;" id="product-name"><%=productWithoutOptions.getName()==null? "준비중":productWithoutOptions.getName() %></strong>
					<%
						for (int topProNo : topThree) {
							if (topProNo == productWithoutOptions.getNo()) {
					%>
						<span class="label label-danger">HOT</span>
					<%			
							}
						}
					%>
				</p>
				<span style="display: none;" id="product-no"><%=productWithoutOptions.getNo() %></span>
			</div>
			<div class="row">
				<div class="col-md-4">
					<p><strong>판매가</strong></p>
					<p>적립금</p>
					<%
						if (colors.get(0)!=null) {
					%>
					<p>색상</p>
					<%
						}
						if (sizes.get(0)!=null) {
					%>
					<p>사이즈</p>
					<%
						}
						if (colors.get(0)==null && sizes.get(0)==null) {
					%>
					<p>수량<p>
					<%		
						}
					%>
				</div>
				<div class="col-md-8 product-detail-view">
					<p><strong id="org-price"><%=productWithoutOptions.getPrice() %></strong></p>
					<p><span id="org-point"><%=productWithoutOptions.getPoint()%></span>원</p>
					<%
						if (colors.get(0)!=null) {
					%>
					<p>
						<select class="btn-block color-select" onchange="addNewOption(event);" id="choose-color">
						<option value="not-selected">==== 색상을 선택하세요 ====</option>
						<%
							for (String color : colors) {
						%>
							<option value="product-color"><%=color %></option>
						<%
							}
						%>
						</select>
					</p>
					<%
						} else {
					%>
					<p style="display: none;">
						<select class="btn-block color-select" onchange="addNewOption(event);" id="choose-color">
							<option value="not">not</option>
						</select>
					</p>
					<%		
						}
						if (sizes.get(0)!=null) {
					%>
					<p>
						<select class="btn-block size-select" onchange="addNewOption(event);" id="choose-size">
						<option value="not-selected">==== 사이즈를 선택하세요 ====</option>
						<%
							for (String size : sizes) {
						%>
							<option value="product-size"><%=size %></option>
						<%
							}
						%>
						</select>
					</p>
					<%
						} else {
					%>
					<p style="display: none;">
						<select class="btn-block size-select" onchange="addNewOption(event);" id="choose-size">
							<option value="not">not</option>
						</select>
					</p>
					<%		
						}
						if (colors.get(0)==null && sizes.get(0)==null) {
					%>
						<input type="number" name="product_qty" value='1' min="1" style='width:40px;' id="product_qty" /><button class="btn" onclick="addNewQty();">확인</button>
					<%		
						}
					%>
				</div>
			</div>
			<form method="post" action="buyNow.jsp" id="choose-block-form">
				<div id="selected-option-box">
					<input type="hidden" name="counter" id="counter" value="0" />
					<input type="hidden" name="custNo" value="<%=loginedUser==null ? null:loginedUser.getNo()%>"/>
					<input type="hidden" name="proNo" value="<%=productWithoutOptions.getNo()%>"/>
					<div id="non-option-box">
					
					</div>
				</div>
				<div class="row">
					<p><input type="submit" onclick="buyNow(event)" class="btn btn-lg btn-block" style="background-color: gray; color: white;" value="BUY NOW"/></a></p>
					<p><a onclick="addToCart(event);" class="btn btn-default btn-md btn-block">ADD TO CART</a></p>
				</div>
			</form>
		</div>
	</div>
	<div class="row" style="text-align: center;">
		<img src="/semi/images/products/<%=productWithoutOptions.getImgPortrait1() %>" class="main-image"/>
		<img src="/semi/images/products/<%=productWithoutOptions.getImgPortrait2() %>" class="main-image"/>
		
		<p><%=productWithoutOptions.getDetail() %></p>
		
		<img src="/semi/images/products/<%=productWithoutOptions.getImgBig() %>" class="main-image"/>

		<img src="/semi/images/sjh/pleaseCheck.png" class="main-image"/>
	</div>
	
	<h3 class="text-center">review</h3>
	<div>
		<form method="POST" action="addReview.jsp" class="well" enctype="multipart/form-data" id="review-sumbit-form">
			<p>
				<strong>REVIEW</strong> |문의글 혹은 악의적인 비방글은 무통보 삭제된다는 점 유의해주세요^^
				<a href="/semi/review/list.jsp" class="btn btn-xs pull-right bottom-of-review-black">후기게시판</a>
			</p>
			<div class="form-group">
				<textarea rows="8" class="form-control" id="review-textarea-box" name="review-textarea" onclick="textareaChecker();" onblur="pleaseLeaveReview();">리뷰를 남겨주세요</textarea>
				<table class="table table-hover" id="review-customer-detail">
					<tbody>
						<tr>
							<td>
								사이즈 어때요? 
								<select class="form-control" name="review-size" id="review-size">
									<option value="not">==선택해주세요==</option>
									<option value="tooSmall">많이 작아요</option>
									<option value="bitSmall">조금 작아요</option>
									<option value="justFit">잘 맞아요</option>
									<option value="bitBig">조금 커요</option>
									<option value="tooBig">많이 커요</option>
								</select>
							</td>
						</tr>
						<tr>
							<td>
								키 (cm, 소수점 이하는 생략)
								<input type="text" name="review-tall" class="form-control" id="review-hight"/>
							</td>
						</tr>
						<tr>
							<td>
								몸무게 (kg, 소수점 이하는 생략)
								<input type="text" name="review-weight" class="form-control" id="review-weight"/>
							</td>
						</tr>
						<tr>
							<td>
								평소 사이즈
								<select class="form-control" name="review-usual-size" id="review-usual-size">
									<option value="not">==선택해주세요==</option>
									<option value="XS">XS</option>
									<option value="S">S</option>
									<option value="M">M</option>
									<option value="L">L</option>
									<option value="XL">XL</option>
								</select>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="row">
				<div class="col-md-3">
					<div class="form-group filebox">
						<div class="filebox"> 
							<label for="ex_file"><span class="glyphicon glyphicon-camera"></span> 사진 추가하기</label>
							<input type="file" id="ex_file" name="picture" /> 
						</div>
					</div>
				</div>
				<div class="col-md-5">
					<div class="form-group">
						<select class="btn btn-lg btn-block bottom-of-review" name="grade">
							<option value="5">★★★★★ 아주 좋아요</option>
							<option value="4">★★★★ 맘에 들어요</option>
							<option value="3">★★★ 보통이에요</option>
							<option value="2">★★ 그냥 그래요</option>
							<option value="1">★ 쓰레기같아요</option>
						</select>
					</div>
				</div>
				<div class="col-md-4">
					<input type="hidden" name="review-product-no" value="<%=productWithoutOptions.getNo()%>"/>
					<%
						if(loginedUser != null) {
					%>
						<input type="hidden" name="review-customer-no" value="<%=loginedUser.getNo() %>" id="review-customer-no"/>
					<%
						}
					%>
					<input type="submit" class="btn btn-lg btn-block bottom-of-review-black" value="리뷰 등록하기" onclick="checkBeforeSubmit(event);" id="submit-button"/>
				</div>
			</div>
		</form>
	</div>
	
	<div class="row score-viewer well" style="text-align: center; ">
		<div class="col-md-4">
			<div class="row">
				<strong style="background-color: black; font-size: 70px; color: white;"><%=avg %></strong>
				<p><%=reviews.size() %>개 리뷰 평점</p>
			</div>
		</div>
		<div class="col-md-4">
			<div class="progress">
  				<div class="progress-bar" role="progressbar" aria-valuenow="2" 
  				aria-valuemin="0" aria-valuemax="100" style="min-width: 2em; width:<%=avg*20 %>%; background-color: purple; ">
    			<%=avg %>
  				</div>
			</div>
			<div class="lead">
				<p>이 상품의 평점은 <strong><%=avg %></strong> 입니다.</p>
				<p>총 (<%=reviews.size() %>)개의 리뷰가 있습니다.</p>
			</div>
		</div>
		<div class="col-md-4 mini-photo-review">
			<div class="row">
			<%
				int lowerCnt = 1;
				for (String reviewImage : reviewFourImages) {
			%>
				<div class="col-xs-3" style="height: 100px;">
					<a onclick="goToThatReview(<%=lowerCnt%>)">
						<img src="/semi/images/products/<%=reviewImage %>" onmouseover="mvisibility(<%=lowerCnt %>);" onmouseout="mtransparency(<%=lowerCnt %>)"  id="mpic-<%=lowerCnt %>">
					</a>
				</div>
			<%
					lowerCnt++;
				}
			%>
			</div>
			<%
				if ("yes".equals(isPhoto)) {
			%>
			<p><a onclick="paging('<%=orderBy %>', '<%=qnaPno %>', '<%=reviewPno %>', 'no');" style="font-size: 25px; color: black;" id="only-photo-box">이 상품의 포토리뷰 모아보기★</a></p>
			<%
				} else if ("no".equals(isPhoto)) {
			%>
			<p><a onclick="paging('<%=orderBy %>', '<%=qnaPno %>', '<%=reviewPno %>', 'yes');" style="font-size: 25px; color: black;" id="only-photo-box">이 상품의 포토리뷰 모아보기</a></p>
			<%		
				}
			%> 
		</div>
	</div>
	
	<div class="row search-standard">
		<span>
		<%
			if ("createDate".equals(orderBy)) {
		%>
			<strong id="order-by">최신순</strong>
		<%
			} else if ("grade".equals(orderBy)) {
		%>
			<strong id="order-by">평점순</strong>
		<%		
			}
		%>
			<span class="search-standard-gray">리뷰 (<%=reviews.size() %>)</span>
		</span>

		<a onclick="paging('createDate', '<%=qnaPno %>', '<%=reviewPno %>', '<%=isPhoto %>');" class="search-standard-gray">최신순</a>

		<a onclick="paging('grade', '<%=qnaPno %>', '<%=reviewPno %>', '<%=isPhoto %>');" class="search-standard-gray">평점순</a>
		<a class="pull-right search-standard-gray" onclick="searchByOption();">
			<span class="glyphicon glyphicon-search search-standard-gray"></span> 옵션별 검색하기
		</a>
	</div>
	
	<div class="row text-right ">
		<div id="search-type-id">
			<select class="search-type-class" onchange="changeOption();" id="tallbox">
				<option value="키">키</option>
				<option value="1">135 - 139 cm</option>
				<option value="2">140 - 144 cm</option>
				<option value="3">145 - 149 cm</option>
				<option value="4">150 - 154 cm</option>
				<option value="5">155 - 159 cm</option>
				<option value="6">160 - 164 cm</option>
				<option value="7">165 - 169 cm</option>
				<option value="8">170 - 174 cm</option>
				<option value="9">175 - 179 cm</option>
				<option value="10">180 - 184 cm</option>
				<option value="11">185 - 189 cm</option>
				<option value="12">190 - 195 cm</option>
			</select>
			<select class="search-type-class" onchange="changeOption();" id="weightbox">
				<option value="몸무게">몸무게</option>
				<option value="1">35~39</option>
				<option value="2">40~44</option>
				<option value="3">45~49</option>
				<option value="4">50~54</option>
				<option value="5">55~59</option>
				<option value="6">60~64</option>
				<option value="7">65~69</option>
				<option value="8">70~74</option>
				<option value="9">75~79</option>
				<option value="10">80~84</option>
				<option value="11">85~89</option>
				<option value="12">90~95</option>
				<option value="13">95~99</option>
			</select>
			<select class="search-type-class" onchange="changeOption();" id="usualsizebox">
				<option value="평소사이즈">평소사이즈</option>
				<option value="XS">XS</option>
				<option value="S">S</option>
				<option value="M">M</option>
				<option value="L">L</option>
				<option value="XL">XL</option>
			</select>
		</div>
	</div>
	
	<ul class="list-group reviews" id="list-orderby">
	<%
		int reviewCnt = 1;
		for(ProductReviews review : reviewsWithRange) {
			Customer cust = new Customer();
			cust = customerDao.getCustomerByReviewNo(review.getReviewNo());
	%>
		<li class="list-group-item review-list" id="user-review-no<%=reviewCnt%>">
			<div class="row">
				<div class="col-md-9">
					<div class="given-stars">		
						<span class="star-rating">
							<span style="width: <%=review.getGrade()*20%>%"></span>				
						</span>
						<span><%=review.getGrade()%>점</span>	
					</div>
					<div>
						<table class="table table-condensed" style="width: 300px;">
							<tbody>
								<tr>
									<td class="personal-option">키</td>
									<td class="text-right"><span id="tall"><%=review.getCustheight() %></span> cm</td>
								</tr>
								<tr>
									<td class="personal-option">몸무게</td>
									<td class="text-right"><span id="weight"><%=review.getCustWeight() %></span></td>
								</tr>
								<tr>
									<td class="personal-option">평소사이즈</td>
									<td class="text-right"><span id="usualsize"><%=review.getCustSize() %></span></td>
								</tr>
								
							</tbody>
						</table>
					</div>
					<div>
						<%=review.getContents() %>
					</div>
					<div>
						<%
							if (review.getImg() != null) {
						%>
							<img src="/semi/images/products/<%=review.getImg() %>" width="200px;" height="200px;"/>
						<%
							} else {
						%>
							<p class="text-primary">등록된 이미지가 없습니다.</p>
						<%		
							}
						%>
					</div>
					<div>
						<a onclick="showComment(<%=reviewCnt %>);" class="written-comment" id="show-comment-button-no<%=reviewCnt %>">댓글 펼치기</a>
						<span> | </span>
						<span> 
							이 리뷰가 도움이 되었나요? 
							<button class="btn btn-info" onclick="plusLike(<%=reviewCnt %>);" id="help-pluslike<%=reviewCnt %>">네</button> 
							<button class="btn btn-info" onclick="minusLike(<%=reviewCnt %>);" id="help-minuslike<%=reviewCnt %>">아니요</button>
							<span class="btn isHelpful-score" id="isHelpful-score<%=reviewCnt %>"><%=review.getRecommendCnt() %></span>
						</span>
					</div>
					<div id="Administrator-comment-area">
						<div class="row well" id="admin-comment-box<%=reviewCnt%>">
							
							
						</div>

					</div>
				</div>
				<div class="col-md-3">
					<ul>
						<li>
							<div class="writer-and-date">작성자</div>
							<div id="customer-name<%=reviewCnt%>"><%=cust.getName() %></div>
							<div style="display: none;" id="customer-no<%=reviewCnt%>"><%=review.getCustNo() %></div>
							<div style="display: none;" id="review-no<%=reviewCnt%>"><%=review.getReviewNo() %></div>
						</li>
						<li>
							<div class="writer-and-date">작성일</div>
							<div id="review-create-date<%=reviewCnt %>"><%=review.getCreateDateSDF() %></div>
						</li>
					</ul>
				</div>
			</div>
		</li>
	<%
		reviewCnt++;
		}
	%>
	</ul>
	
	<div class="text-center">
		<ul class="pagination pagination-sm" id="review-pagination">
			<%
				for(int index=1; index<=reviewPages; index++) {
			%>
				<li class=""><a onclick='pagingReviewPno(<%=index%>)'><%=index %></a></li>
			<%
				}
			%>
		</ul>
	</div>
	
	<div class="row Q-and-A">
		<h3 class="text-center">Q & A</h3>
		<div class="row text-right" style="margin-right: 140px;">
			
			<a href="/semi/qna/list.jsp" class="btn btn-sm btn-info">MORE</a>
		</div>
		<div class="row">	
			<table class="table table-condensed" style="width: 1000px; margin: auto;">
				<colgroup>
					<col width="20%"/>
					<col width="60%"/>
					<col width="10%"/>
					<col width="10%"/>
				</colgroup>
				<thead>
					<tr class="text-center well">
						<td>no</td>
						<td>subject</td>
						<td>name</td>
						<td>date</td>
					</tr>
				</thead>
				<tbody>
				<%
					int questionCnt = 1;
					int noticeCnt = 1;
					for (Notice notice : notices) {
				%>
					<tr class="text-center" style="font: bold; background-color: #efeff5;">
						<td>공지</td>
						<td><a onclick="seeDetailNotice(<%=noticeCnt%>)"><%=notice.getSubject() %></a></td>
						<td><%=notice.getAdminId() %></td>
						<td><%=notice.getCreateDateSDF() %></td>
					</tr>
					<tr id="detail-of-notice<%=noticeCnt %>" style="display: none;">					
						<td class="qna-detail" colspan="4" style="text-align: center;">
							<%=notice.getContents() %>
						</td>
					</tr>
				<%		
					noticeCnt++;
					}
				
					for (ProductQuestions productQuestion : questionsWithRange) {
				%>
					<tr class="text-center">
						<td><%=questionCnt %></td>
						<td><a onclick="seeDetailQna(<%=questionCnt%>);"><%=productQuestion.getSubject() %></a></td>
						<td><%=customerDao.getCustomerById(productQuestion.getCustNo()).getName() %></td>
						<td><%=DateUtil.dateToString(productQuestion.getCreateDate()) %></td>
					</tr>
					<tr id="detail-of-qna<%=questionCnt %>" style="display: none;">					
						<td class="qna-detail" colspan="4" style="text-align: center;">
							<%=productQuestion.getContents() %>
						</td>
					</tr>
				<%
					questionCnt ++;
					}
				%>

				</tbody>
			</table>
		</div>
	</div>
	<div class="text-center" style="margin-bottom: 100px;">
		<ul class="pagination" id="qna-pagination">
		<%
			for(int qnaIndex=1; qnaIndex<=qnaPages; qnaIndex++) {
		%>
			<li class=""><a onclick='pagingQnaPno(<%=qnaIndex %>)'"><%=qnaIndex %></a></li>
		<%
			}
		%>
		</ul>
	</div>
	<form action="paging.jsp" method="get" id="paging">
		<input type="hidden" name="orderBy" id="paging-orderBy" value="<%=orderBy != null ? orderBy:"new" %>"/>
		<input type="hidden" name="qnaPno" id="paging-qnaPno" value="<%=qnaPno != 1 ? qnaPno:1 %>"/>
		<input type="hidden" name="reviewPno" id="paging-reviewPno" value="<%=reviewPno != 1 ? reviewPno:1 %>"/>
		<input type="hidden" name="isPhoto" id="paging-isPhoto" value="<%=isPhoto != "no" ? isPhoto:"no" %>" />
		<input type="hidden" name="proNo" id="paging-proNo" value=<%=productWithoutOptions.getNo() %> />
	</form>
</div>
<%@ include file="../include/lowermost-footer.jsp" %>
</body>
<script type="text/javascript">
	var orgPrice = parseInt(document.getElementById("org-price").innerHTML);
	var orgPoint = parseInt(document.getElementById("org-point").innerHTML);
	var orgProName = document.getElementById("product-name").innerHTML;
	var orgProNo = document.getElementById("product-no").innerHTML;

	function visibility(no) {
		var img = document.getElementById("pic-" + no);
		img.style.opacity=1;
	};
	function transparency(no) {
		var img = document.getElementById("pic-" + no);
		img.style.opacity=0.2;
	};
	function mvisibility(no) {
		var img = document.getElementById("mpic-" + no);
		img.style.opacity=1;
	};
	function mtransparency(no) {
		var img = document.getElementById("mpic-" + no);
		img.style.opacity=0.4;
	};
	function plusLike(no) {
		var custNo = document.getElementById("customer-no"+no).innerHTML;
		var reviewNo = document.getElementById("review-no"+no).innerHTML;
				
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function() {
			if(xhr.readyState == 4 && xhr.status == 200) {
				var jsonText = xhr.responseText;
				var message = JSON.parse(jsonText);
				
				if (message == null) {
					alert("로그인이 필요한 기능입니다.");
					return;
				} else {
					var subxhr = new XMLHttpRequest();
					var loginedUserNo = document.getElementById("review-customer-no").value;
					
					subxhr.onreadystatechange = function() {
						if(subxhr.readyState == 4 && subxhr.status == 200) {
							var jsonText = subxhr.responseText;
							var like = JSON.parse(jsonText);
					
							var el = document.getElementById("isHelpful-score"+no);
							el.innerHTML = like;
						};
					};	
					subxhr.open("GET", "helplike.jsp?proNo="+orgProNo+"&custNo="+custNo+"&plusOrMinus=plus&reviewNo="+reviewNo+"&loginedUser="+loginedUserNo);
					subxhr.send();
				}
			}
		}
		xhr.open("GET","reviewCheck.jsp?check=login");
		xhr.send();
	};
	
	function minusLike(no) {
		var custNo = document.getElementById("customer-no"+no).innerHTML;
		var reviewNo = document.getElementById("review-no"+no).innerHTML;
				
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function() {
			if(xhr.readyState == 4 && xhr.status == 200) {
				var jsonText = xhr.responseText;
				var message = JSON.parse(jsonText);
				
				if (message == null) {
					alert("로그인이 필요한 기능입니다.");
					return;
				} else {
					var subxhr = new XMLHttpRequest();
					var loginedUserNo = document.getElementById("review-customer-no").value;
					
					subxhr.onreadystatechange = function() {
						if(subxhr.readyState == 4 && subxhr.status == 200) {
							var jsonText = subxhr.responseText;
							var like = JSON.parse(jsonText);
					
							var el = document.getElementById("isHelpful-score"+no);
							el.innerHTML = like;
						};
					};	
					subxhr.open("GET", "helplike.jsp?proNo="+orgProNo+"&custNo="+custNo+"&plusOrMinus=minus&reviewNo="+reviewNo+"&loginedUser="+loginedUserNo);
					subxhr.send();
				}
			}
		}
		xhr.open("GET","reviewCheck.jsp?check=login");
		xhr.send();
	};

	function searchByOption() {
		
		var el = document.getElementById("search-type-id");
		if(el.style.display === "none"){
			el.style.display = "block";
		} else {
			el.style.display = "none";
		};
	};
	function changeOption() {
		var tallbox = document.getElementById("tallbox");
		var weightbox = document.getElementById("weightbox");
		var usualsizebox = document.getElementById("usualsizebox");
		
		var seeAllAboutTall = false;
		var seeAllAboutWeight = false;
		var seeAllAboutUsualsize = false;
		
		var tallboxtext = tallbox.options[tallbox.selectedIndex].text;
		if (tallboxtext == document.getElementById("tallbox").value) {
			seeAllAboutTall = true;
		};
		var tall = tallboxtext.replace(/[^0-9]/g,'');
		var mintall = parseInt(tall.substring(0,3));
		var maxtall = parseInt(tall.substring(3));
		
		var weightboxtext = weightbox.options[weightbox.selectedIndex].text;
		if (weightboxtext == document.getElementById("weightbox").value) {
			seeAllAboutWeight = true;
		};
		var weight = weightboxtext.replace(/[^0-9]/g,'');
		var minweight = parseInt(weight.substring(0,2)); 
		var maxweight = parseInt(weight.substring(2));
		
		var usualsizeboxtext = usualsizebox.options[usualsizebox.selectedIndex].text;
		if (usualsizeboxtext == "평소사이즈") {
			seeAllAboutUsualsize = true;
		};

		var list = document.getElementsByClassName("review-list");
		
		for (var i=0; i<list.length; i++) {
			var el = list[i];
			var userTall = parseInt(el.querySelector("#tall").innerHTML);
			var userWeight = parseInt(el.querySelector("#weight").innerHTML);
			var userUsualsize = el.querySelector("#usualsize").innerHTML;

			if (seeAllAboutTall || seeAllAboutWeight || seeAllAboutUsualsize) {
				if(seeAllAboutTall) {
					mintall = 1;
					maxtall = 999;
				}; 
				if (seeAllAboutWeight) {
					minweight = 1;
					maxweight = 999;
				};
				if (seeAllAboutUsualsize) {
					usualsizeboxtext = userUsualsize;

				};
			};
			if (userTall >= mintall && userTall <= maxtall) {
				
				if (userWeight >= minweight && userWeight <= maxweight) {
					el.style.display = "block";
					
					if (userUsualsize != usualsizeboxtext) {
						el.style.display = "none";
					};
				} else {
					el.style.display = "none";
				};
				
			} else if (userWeight >= minweight && userWeight <= maxweight) {
				
				if (userTall >= mintall && userTall <= maxtall) {
					el.style.display = "block";
					if (userUsualsize != usualsizeboxtext) {
						el.style.display = "none";
					};
				} else {
					el.style.display = "none";
				};
			} else if (userUsualsize == usualsizeboxtext) {
				
				if (userTall >= mintall && userTall <= maxtall) {
					if (userWeight >= minweight && userWeight <= maxweight) {
						el.style.display = "block";
					}
				};
			} else {
				el.style.display = "none";
			};	
		};
	};
	function showComment(reviewNo) {
		
		var administratorCommentList = document.querySelectorAll("#user-review-no"+reviewNo+" #Administrator-comment-area");
		for (var n=0; n<administratorCommentList.length; n++) {
			var administratorComment = administratorCommentList[n];
			
			if (administratorComment.style.display === "block") {
				administratorComment.style.display = "";
				document.getElementById("show-comment-button-no"+reviewNo).innerHTML = "댓글 펼치기";
			} else if (administratorComment.style.display === "") {
				administratorComment.style.display = "block";
				document.getElementById("show-comment-button-no"+reviewNo).innerHTML = "댓글 접기";
				
				var xhr = new XMLHttpRequest();
				var number = document.getElementById("review-no"+reviewNo).innerHTML;
				
				xhr.onreadystatechange = function() {
					if(xhr.readyState == 4 && xhr.status == 200) {
						var jsonText = xhr.responseText;
						var adminComments = JSON.parse(jsonText);
						var row = "";
						
							for (i=0; i<adminComments.length; i++) {
								var con =adminComments[i].commentContents;
								var adid = adminComments[i].adid;

								var adcnt = adminComments[i].adcnt;
								
								row += "<div class='col-md-3'>";
								row += "<p id='admin-id"+reviewNo+"'>"+adid+"</p>";
								row += "</div>";
								row += "<div class='col-md-9'>";
								row += "<p id'admin-contents"+reviewNo+"'>"+con+"</p>";
								row += "</div>";

							};
							if (adminComments.length == 0) {
								row = "<div><p>아직 작성된 댓글이 없습니다.</p></div>"
							};
							document.getElementById("admin-comment-box"+reviewNo).innerHTML = row;
					};
				};	
				xhr.open("GET", "showAdminComment.jsp?reviewNo="+number);
				xhr.send();
				
			};			
		};
	};
	var count = 1;
	function addNewOption(event) {
		
		var sizebox = document.getElementById("choose-size");
		var size = sizebox.options[sizebox.selectedIndex].text;
		var colorbox = document.getElementById("choose-color");
		var color = colorbox.options[colorbox.selectedIndex].text;
		var sizeboxvalue = sizebox.value;
		var colorboxvalue = colorbox.value;
		
		if (sizeboxvalue == "not") {
			sizeboxvalue = "free";
			size = "선택불가";
		}
		if (colorboxvalue == "not") {
			colorboxvalue = "free";
			color = "선택불가";
		}	
		if (sizeboxvalue == "not-selected" || colorboxvalue == "not-selected") {
			return;
		}
		
		var existArray = document.getElementsByClassName("order-detail");
		
		
		for (var i=0; i<existArray.length; i++) {
			var existColor = existArray[i].querySelector(".selected-color").value;
			var existSize = existArray[i].querySelector(".selected-size").value;
			if (size == existSize && color == existColor) {
				alert("해당 옵션은 이미 선택되어 있습니다..");
				return;
			};
		};
		
		var element = event.target;
		var selectedOption = element.options[element.selectedIndex].text;
		
		var row = "";	
		if (element.value == "product-color") {
			color = selectedOption;
		} else if (element.value == "product-size") {
			size = selectedOption;
		};		
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function() {
			if(xhr.readyState == 4 && xhr.status == 200) {
				var jsonText = xhr.responseText;
				var obj = JSON.parse(jsonText);
				var thisColor = obj.color;
				var thisSize = obj.size;
				var thisName = obj.name;
				
				row += "<div class='row order-detail' id='choose-block"+count+"'>";
				row += "<div class='col-md-5'>"			
				row += "<p> <input type='text' name='selected-cloth"+count+"' class='cloth-name' value="+thisName+" readonly='readonly'/></p>";			
				row += "<p>- <input type='text' class='selected-color' name='selected-color"+count+"' value="+thisColor+" readonly='readonly'/>/&nbsp;<input type='text' class='selected-size' name='selected-size"+count+"' value="+thisSize+" readonly='readonly'/></p>";				
				row += "</div>";
				row += "<div class='col-md-4'>";
				row += "<div class='form-group'>"
				row += "<input type='number' class='selected-qty' name='qty"+count+"' value='1' min='1' style='width:40px;' id='qty-box"+count+"' onchange='changeQty("+count+");'/> <button onclick='removeChooseblock("+count+");' type='reset' class='cancle-botton'>X</button>";
				row += "</div>";
				row += "</div>";
				row += "<div class='col-md-3'>";
				row += "<p id='selected-price"+count+"'>"+orgPrice+"원</p>";
				row += "<span class='point'>적</span><p id='selected-point"+count+"'>"+orgPoint+"원</p>";
				row += "</div>";
				row += "</div>";
				count++;
				document.getElementById("selected-option-box").innerHTML += row;
				document.getElementById("counter").value++; 
			};
		};
		
		xhr.open("GET","newoption.jsp?color="+color+"&size="+size+"&name="+orgProName+"&op=withop");
		xhr.send();
	};
	function removeChooseblock(no) {
		var selectedOptionBox = document.querySelector("#selected-option-box");
		var chooseBlock = document.querySelector("#choose-block"+no);
		
		selectedOptionBox.removeChild(chooseBlock);
	};
	function removeChooseblocktwo(no) {
		var selectedOptionBox = document.querySelector("#non-option-box");
		var chooseBlock = document.querySelector("#choose-block"+no);
		
		selectedOptionBox.removeChild(chooseBlock);
	};
	function textareaChecker() {
		document.getElementById("review-textarea-box").value = "";
		document.getElementById("review-customer-detail").style.display = "block";
		
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function() {
			if(xhr.readyState == 4 && xhr.status == 200) {
				var jsonText = xhr.responseText;
				var message = JSON.parse(jsonText);
				
				if (message == null) {
					alert("로그인이 필요한 기능입니다.");
					document.getElementById("review-customer-detail").style.display = "";
					return;
				}
			}
		}
		xhr.open("GET","reviewCheck.jsp?check=login");
		xhr.send();
	};
	function pleaseLeaveReview() {
		var txt = document.getElementById("review-textarea-box").value;
		if (txt.length <= 1) {
			document.getElementById("review-textarea-box").value = "리뷰를 남겨주세요";
		};
	};
	function seeDetailQna(no) {
		var el = document.getElementById("detail-of-qna"+no);
		
		if(el.style.display === "none"){
			el.style.display = "";
		} else {
			el.style.display = "none";
		};
	};
	function seeDetailNotice(no) {
		var el = document.getElementById("detail-of-notice"+no);
		
		if(el.style.display === "none"){
			el.style.display = "";
		} else {
			el.style.display = "none";
		};
	}
	function changeQty(no) {
		var qty = parseInt(document.getElementById("qty-box"+no).value);
		
		document.getElementById("selected-price"+no).innerHTML = (orgPrice*qty) + "원";
		document.getElementById("selected-point"+no).innerHTML = (orgPoint*qty) + "원";
	};
	function checkBeforeSubmit(event) {
		event.preventDefault();	
		var regEx = /^[0-9]{2,3}$/;
		
		var insertedHeight = document.getElementById('review-hight').value;
		var insertedWeight = document.getElementById('review-weight').value;
		var insertedSize = document.getElementById('review-size').value;
		var insertedUsualSize = document.getElementById('review-usual-size').value;
		var insertedFile = document.getElementById('ex_file');
		
		if (insertedFile.files.length > 1) {
			alert("사진은 한 개만 등록 가능합니다. 새로고침 하세요.");
			return;
		};
		if (insertedFile.files.item.size > 1024*1024*10) {
			alert("파일이 너무 큽니다...");
			return;
		};
		if (!regEx.test(insertedHeight)) {
			alert("키를 정확히 입력해주세요. (정수만 입력됩니다.)");
			return;
		};
		if (!regEx.test(insertedWeight)) {
			alert("몸무게를 정확히 입력해주세요. (정수만 입력됩니다.)");
			return;
		};
		if (insertedSize=="not" || insertedUsualSize=="not") {
			alert("사이즈 평가와 평소 사이즈를 입력해주세요~~^@@^");
			return;
		}
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function() {
			if(xhr.readyState == 4 && xhr.status == 200) {
				var jsonText = xhr.responseText;
				var message = JSON.parse(jsonText);
				if (message != null) {
					alert("이미 등록하신 글이 있습니다.");
					return;
				}
			}
		}
		xhr.open("GET","reviewCheck.jsp?check=already&proNo="+orgProNo+"&custNo="+document.getElementById("review-customer-no").value);	
		xhr.send();
		
		document.getElementById("review-sumbit-form").submit();
	};
	
	function addToCart(event) {
		event.preventDefault();
		
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function() {
			if(xhr.readyState == 4 && xhr.status == 200) {
				var jsonText = xhr.responseText;
				var message = JSON.parse(jsonText);
				
				if (message == null) {
					alert("로그인이 필요한 기능입니다.");
					return;
				} else {
					var existArray = document.getElementsByClassName("order-detail");
					var colorArray = '';
					var sizeArray = '';
					var qtyArray = '';
					var loginedUserNo = document.getElementById("review-customer-no").value;
					var whichBox = event.target.innerHTML;
					
					for (var i=0; i<existArray.length; i++) {
						var color = existArray[i].querySelector(".selected-color").value;
						colorArray += color+",";
						var size = existArray[i].querySelector(".selected-size").value;
						sizeArray += size+",";
						var qty = existArray[i].querySelector(".selected-qty").value;
						qtyArray += qty+",";
					};
						
					if(colorArray[0] == ',') {
						colorArray += null;
					}
					if(sizeArray[0] == ',') {
						sizeArray += null;
					}
					var subxhr = new XMLHttpRequest();
					subxhr.onreadystatechange = function() {
						if(subxhr.readyState == 4 && subxhr.status == 200) {
								alert("장바구니에 담았습니다. ^^");
						}
					}
					subxhr.open("GET","addCart.jsp?color="+colorArray+"&size="+sizeArray+"&qty="+qtyArray+"&length="+existArray.length+"&custNo="+loginedUserNo+"&proNo="+orgProNo+"&whichBox="+whichBox);	
					subxhr.send();
				}
			}
		}
		xhr.open("GET","reviewCheck.jsp?check=login");
		xhr.send();
	};
	function paging(orderBy, qnaPno, reviewPno, isPhoto) {		
		document.getElementById("paging-orderBy").value = orderBy;
		document.getElementById("paging-qnaPno").value = qnaPno;
		document.getElementById("paging-reviewPno").value = reviewPno;
		document.getElementById("paging-isPhoto").value = isPhoto;

		var orderBy = document.getElementById("paging-orderBy").value;
		var qnaPno = document.getElementById("paging-qnaPno").value;
		var reviewPno = document.getElementById("paging-reviewPno").value;
		var isPhoto = document.getElementById("paging-isPhoto").value;
		var proNo = document.getElementById("paging-proNo").value;
		
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function() {
			if(xhr.readyState == 4 && xhr.status == 200) {
				var jsonText = xhr.responseText;
				var map = JSON.parse(jsonText);
				var row = "";
				var qnaRow = "";
				var reviewRow = "";
				var custName = map.customer.name;
				var qnaPages = map.qnaPages;
				var reviewPages = map.reviewPages;
				var orderByStr = map.orderByStr;
				var photoStr = map.photoStr;
				
				for(var i=0; i<map.reviewsWithRange.length; i++) {
					var reviewNo = map.reviewsWithRange[i].reviewNo;
					var proNo = map.reviewsWithRange[i].proNo;
					var custNo = map.reviewsWithRange[i].custNo;
					var contents = map.reviewsWithRange[i].contents;
					var recommendCnt = map.reviewsWithRange[i].recommendCnt;
					var grade = map.reviewsWithRange[i].grade.toFixed(1);
					var status = map.reviewsWithRange[i].status;
					var createDate = map.reviewsWithRange[i].createDate;
					var img = map.reviewsWithRange[i].img;
					var custWeight = map.reviewsWithRange[i].custWeight;
					var custheight = map.reviewsWithRange[i].custheight;
					var custSize = map.reviewsWithRange[i].custSize;
					
					createDate = formatDate(createDate);
					
					row += 	"<li class='list-group-item review-list' id='user-review-no"+(i+1)+"'>";
					row += 	"<div class='row'>";
					row += 	"<div class='col-md-9'>";
					row += 	"<div class='given-stars'>";		
					row +=	"<span class='star-rating'>";
					row +=	"<span style='width: "+(grade*20)+"%'></span>";				
					row +=	"</span>";
					row +=	"<span>"+grade+"점</span>";
					row +=	"</div>";
					row +=	"<div>";
					row +=	"<table class='table table-condensed' style='width: 300px;'>";
					row +=	"<tbody>";
					row +=	"<tr>";
					row +=	"<td class='personal-option'>키</td>";
					row +=	"<td class='text-right'><span id='tall'>"+custheight+"</span> cm</td>";
					row +=	"</tr>";
					row +=	"<tr>";
					row +=	"<td class='personal-option'>몸무게</td>";
					row +=	"<td class='text-right'><span id='weight'>"+custWeight+"</span></td>";
					row +=	"</tr>";
					row +=	"<tr>";
					row +=	"<td class='personal-option'>평소사이즈</td>";
					row +=	"<td class='text-right'><span id='usualsize'>"+custSize+"</span></td>";
					row +=	"</tr>";		
					row +=	"</tbody>";
					row +=	"</table>";
					row +=	"</div>";
					row +=	"<div>";
					row +=	contents;
					row +=	"</div>";
					row +=	"<div>";				
							if (img != null) {
								
							row +="<img src='/semi/images/products/"+img+"' width='200px;' height='200px;'/>";
								
							} else {
								
							row +="<p class='text-primary'>등록된 이미지가 없습니다.</p>";
								
							}	
					row +=	"</div>";
					row +=	"<div>";
					row +=	"<a onclick='showComment("+(i+1)+");' class='written-comment' id='show-comment-button-no"+(i+1)+"'>댓글 펼치기</a>";
					row +=	"<span> | </span>";
					row +=	"<span> ";
					row +=	"이 리뷰가 도움이 되었나요? ";
					row +=	"<button class='btn btn-info' onclick='plusLike("+(i+1)+");' id='help-pluslike"+(i+1)+"'>네</button>";
					row +=	"<button class='btn btn-info' onclick='minusLike("+(i+1)+");' id='help-minuslike"+(i+1)+"'>아니요</button>";			   
					row +=	"<span class='btn isHelpful-score' id='isHelpful-score"+(i+1)+"'>"+recommendCnt+"</span>";
					row +=	"</span>";
					row +=	"</div>";
					row +=	"<div id='Administrator-comment-area'>";
					row +=	"<div class='row well' id='admin-comment-box"+(i+1)+"'>";						
					row +=	"</div>";
					row +=	"</div>";
					row +=	"</div>";
					row +=	"<div class='col-md-3'>";
					row +=	"<ul>";
					row +=	"<li>";
					row +=	"<div class='writer-and-date'>작성자</div>";
					row +=	"<div id='customer-name"+(i+1)+"'>"+custName+"</div>";
					row +=	"<div style='display: none;' id='customer-no"+(i+1)+"'>"+custNo+"</div>";
					row +=	"<div style='display: none;' id='review-no"+(i+1)+"'>"+reviewNo+"</div>";
					row +=	"</li>";
					row +=	"<li>";
					row +=	"<div class='writer-and-date'>작성일</div>";
					row +=	"<div id='review-create-date"+(i+1)+"'>"+createDate+"</div>";
					row +=	"</li>";
					row +=	"</ul>";
					row +=	"</div>";
					row +=	"</div>";
					row +=	"</li>";
				};
				
				for (var s=1; s<=qnaPages; s++) {
					qnaRow += "<li class=''><a onclick='pagingQnaPno("+(s)+")'>"+(s)+"</a></li>"
				}
				for (var q=1; q<=reviewPages; q++) {
					reviewRow += "<li class=''><a onclick='pagingReviewPno("+(q)+")'>"+(q)+"</a></li>";
				}
				document.getElementById("list-orderby").innerHTML = row;
				document.getElementById("review-pagination").innerHTML = reviewRow;
				document.getElementById("qna-pagination").innerHTML = qnaRow;
				document.getElementById("order-by").innerHTML = orderByStr;
				document.getElementById("only-photo-box").innerHTML = photoStr;
				if (isPhoto == 'yes') {
					document.getElementById("order-by").innerHTML = "포토";
				}
			};
		};
		xhr.open("GET","paging.jsp?orderBy="+orderBy+"&qnaPno="+qnaPno+"&reviewPno="+reviewPno+"&isPhoto="+isPhoto+"&proNo="+proNo);
		xhr.send();
		//document.querySelector("#paging").submit();
	};
	function pagingQnaPno(pageNo) {
		document.querySelector("input[name='qnaPno']").value = pageNo;
		
		var orderBy = document.getElementById("paging-orderBy").value;
		var qnaPno = document.getElementById("paging-qnaPno").value;
		var reviewPno = document.getElementById("paging-reviewPno").value;
		var isPhoto = document.getElementById("paging-isPhoto").value;
		var proNo = document.getElementById("paging-proNo").value;
		
		paging(orderBy, qnaPno, reviewPno, isPhoto);
		//document.querySelector("#paging").submit();
	};
	function pagingReviewPno(pageNo) {
		document.querySelector("input[name='reviewPno']").value = pageNo;
		
		var orderBy = document.getElementById("paging-orderBy").value;
		var qnaPno = document.getElementById("paging-qnaPno").value;
		var reviewPno = document.getElementById("paging-reviewPno").value;
		var isPhoto = document.getElementById("paging-isPhoto").value;
		var proNo = document.getElementById("paging-proNo").value;
		
		paging(orderBy, qnaPno, reviewPno, isPhoto);
		//document.querySelector("#paging").submit();
	};
	function goToThatReview(no) {
		document.getElementById("user-review-no"+no).scrollIntoView();
	}
	function buyNow(e) {
		e.preventDefault();
		
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function() {
			if(xhr.readyState == 4 && xhr.status == 200) {
				var jsonText = xhr.responseText;
				var message = JSON.parse(jsonText);
				
				if (message == null) {
					alert("로그인이 필요한 기능입니다.");
					return;
					
				} else {
					document.getElementById("choose-block-form").submit();
				}
			}
		}
		xhr.open("GET","reviewCheck.jsp?check=login");
		xhr.send();
	}
	function formatDate(date) {
	    var d = new Date(date),
	        month = '' + (d.getMonth() + 1),
	        day = '' + d.getDate(),
	        year = d.getFullYear();

	    if (month.length < 2) month = '0' + month;
	    if (day.length < 2) day = '0' + day;

	    return [year, month, day].join('-');
	}
	
	function addNewQty() {
		var qty = document.getElementById("product_qty").value;
		var row = "";
		var count = 1;
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function() {
			if(xhr.readyState == 4 && xhr.status == 200) {
				var jsonText = xhr.responseText;
				var message = JSON.parse(jsonText);
				
				row += "<div class='row order-detail' id='choose-block"+count+"'>";
				row += "<div class='col-md-5'>"			
				row += "<p> <input type='text' name='selected-cloth"+count+"' class='cloth-name' value="+orgProName+" readonly='readonly'/></p>";			
				row += "<p><input type='text' class='selected-color' name='selected-color"+count+"' value='' readonly='readonly'/><input type='text' class='selected-size' name='selected-size"+count+"' value='' readonly='readonly'/></p>";				
				row += "</div>";
				row += "<div class='col-md-4'>";
				row += "<div class='form-group'>"
				row += "<input type='number' class='selected-qty' name='qty"+count+"' value='"+message+"' min='1' style='width:40px;' id='qty-box"+count+"' onchange='changeQty("+count+");' readonly='readonly'/> <button onclick='removeChooseblocktwo("+count+");' type='reset' class='cancle-botton'>X</button>";
				row += "</div>";
				row += "</div>";
				row += "<div class='col-md-3'>";
				row += "<p id='selected-price"+count+"'>"+(orgPrice*qty)+"원</p>";
				row += "<span class='point'>적</span><p id='selected-point"+count+"'>"+(orgPoint*qty)+"원</p>";
				row += "</div>";
				row += "</div>";
				document.getElementById("non-option-box").innerHTML = row;
				document.getElementById("counter").value++;
			}
		}
		xhr.open("GET","addNewQty.jsp?qty="+qty);
		xhr.send();
	}
</script>
</html>