<%@page import="java.util.ArrayList"%>
<%@page import="semi.vo.Review"%>
<%@page import="java.util.List"%>
<%@page import="semi.dao.ReviewDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="ko">
<style>

</style>
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
<%@ include file="/style/ywj/reviewstyle.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	ReviewDao reviewDao = ReviewDao.getInstance();
	List<Review> reviews = new ArrayList<>();
	
	String categoryStr = request.getParameter("cgno");
	String lineupStr = request.getParameter("lu");
	
	if(categoryStr == null){
		categoryStr = "0";
	}
	
	if(lineupStr == null){
		lineupStr = "0";
	}
	
	int category = Integer.parseInt(categoryStr);
	int lineup = Integer.parseInt(lineupStr);
	
	if (category == 0 && lineup == 0) {
		reviews = reviewDao.getAllReviews();
		
	} else if (lineup == 1) {
		reviews = reviewDao.getReviewsByProName();
		
	} else if (lineup == 2) {
		reviews = reviewDao.getReviewsByLowPrice();
		
	} else if (lineup == 3) {
		reviews = reviewDao.getReviewsByHighPrice();
		
	} else if (lineup == 4) {
		reviews = reviewDao.getReviewsByHighSale();
		
	} else if (lineup == 5) {
		reviews = reviewDao.getReviewsByHighGrade();
		
	} else if (lineup == 6) {
		reviews = reviewDao.getReviewsByManys();
		
	} else if (lineup == 7) {
		reviews = reviewDao.getReviewsByBestSell();
		
	} else {
		reviews = reviewDao.getReviewsByCategory(category);
		
	}
	String cateName = request.getParameter("cna");
	String lineName = request.getParameter("lna");
	
	if (cateName == null) {
		cateName = "CATEGORY";
	}
	
	if (lineName == null) {
		lineName = "LINE UP";
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
									<font color="#555555">review</font>
								</h2>
								<p>상품 사용후기입니다.</p>
							</div>
						</div>
						<div style="margin: 0 auto; text-align: center;">
							<img src="/semi/images/ywj/reviewevent.jpg">
						</div>
						<div>
							<div class="row">
								<div class="col-sm-4">
									<ul>
										<li style="margin: 44px;"><a href="/semi/product/detail.jsp?pro-no=10&qna-pno=1&review-pno=1"><img src="/semi/images/products/product_10_por1.png" width="215" height="237"></a></li>
									</ul>
								</div>
								<div class="col-sm-4">
									<ul>
										<li style="margin: 44px;"><a href="/semi/product/detail.jsp?pro-no=11&qna-pno=1&review-pno=1"><img src="/semi/images/products/product_11_por1.png" width="215" height="237"></a></li>
									</ul>
								</div>
								<div class="col-sm-4">
									<ul>
										<li style="margin: 44px;"><a href="/semi/product/detail.jsp?pro-no=16&qna-pno=1&review-pno=1"><img src="/semi/images/products/product_16_por2.png" width="215" height="237"></a></li>
									</ul>
								</div>
								<div class="col-sm-4">
									<ul>
										<li style="margin: 44px;"><a href="/semi/product/detail.jsp?pro-no=21&qna-pno=1&review-pno=1"><img src="/semi/images/products/product_21_por1.png" width="215" height="237"></a></li>
									</ul>
								</div>
								<div class="col-sm-4">
									<ul>
										<li style="margin: 44px;"><a href="/semi/product/detail.jsp?pro-no=5&qna-pno=1&review-pno=1"><img src="/semi/images/products/product_05_por1.png" width="215" height="237"></a></li>
									</ul>
								</div>
								<div class="col-sm-4" id="goscroll">
									<ul>
										<li style="margin: 44px;"><a href="/semi/product/detail.jsp?pro-no=6&qna-pno=1&review-pno=1"><img src="/semi/images/products/product_06_por1.png" width="215" height="237"></a></li>
									</ul>
								</div>
							</div>
						</div>
					<div id="content">
						<div class="products_index_gallery">
							<div class="btn-group">
							  <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false" style="width: 115px; height: 36px;">
							    <%=cateName %> <span class="caret"></span>
							  </button>
							  <ul class="dropdown-menu" role="menu">
							    <li><a href="/semi/review/list.jsp?cgno=0&lu=0&cna=All#goscroll">ALL</a></li>
							    <li class="divider"></li>
							    <li><a href="/semi/review/list.jsp?cgno=1&cna=TOP#goscroll">TOP</a></li>
							    <li><a href="/semi/review/list.jsp?cgno=5&cna=OUTER#goscroll">OUTER</a></li>
							    <li><a href="/semi/review/list.jsp?cgno=6&cna=DRESS#goscroll">DRESS</a></li>
							    <li><a href="/semi/review/list.jsp?cgno=7&cna=BOTTOM#goscroll">BOTTOM</a></li>
							    <li><a href="/semi/review/list.jsp?cgno=12&cna=SKIRT#goscroll">SKIRT</a></li>
							    <li><a href="/semi/review/list.jsp?cgno=13&cna=SHOES#goscroll">SHOES</a></li>
							    <li><a href="/semi/review/list.jsp?cgno=14&cna=BAG#goscroll">BAG</a></li>
							    <li><a href="/semi/review/list.jsp?cgno=15&cna=ACC#goscroll">ACC</a></li>
							  </ul>
							</div>
							<div class="btn-group pull-right">
							  <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false" style="width: 125px; height: 36px;">
							    <%=lineName %> <span class="caret"></span>
							  </button>
							  <ul class="dropdown-menu" role="menu">
							    <li><a href="/semi/review/list.jsp?cgno=0&lu=0&lna=ALL#goscroll">ALL</a></li>
							    <li class="divider"></li>
							    <li><a href="/semi/review/list.jsp?lu=1&lna=이름순#goscroll">이름순</a></li>
							    <li><a href="/semi/review/list.jsp?lu=2&lna=낮은 가격순#goscroll">낮은 가격순</a></li>
							    <li><a href="/semi/review/list.jsp?lu=3&lna=높은 가격순#goscroll">높은 가격순</a></li>
							    <li><a href="/semi/review/list.jsp?lu=4&lna=최고 세일순#goscroll">최고 세일순</a></li>
							    <li><a href="/semi/review/list.jsp?lu=5&lna=높은 평점순#goscroll">높은 평점순</a></li>
							    <li><a href="/semi/review/list.jsp?lu=6&lna=최다 리뷰순#goscroll">최다 리뷰순</a></li>
							    <li><a href="/semi/review/list.jsp?lu=7&lna=최고 판매량순#goscroll">최고 판매량순</a></li>
							    
							  </ul>
							</div>
							<div class="products_index_gallery__body row">
								<%		
										for (Review review : reviews) {
											Review grade = reviewDao.getThisGrade(review.getProNo());
											List<Review> contents = reviewDao.getThisReviews(review.getProNo());
											
											if (grade.getReviewCount() != 0) {
								%>
								<div class="product products_index_gallery_product products_index_gallery_product--visible col-sm-3" id="product_15665" style="margin: 8px; width: 238px; height: 420px;">
									<div class="products_index_gallery_product__image_box">
										<a href="/semi/product/detail.jsp?pro-no=<%=review.getProNo() %>&qna-pno=1&review-pno=1" data-link-target="window">
											<img src="/semi/images/products/<%=review.getProImg() %>" class="products_index_gallery_product__image smooth--loaded">
										</a>
									</div>
									<div class="products_index_gallery_product__sections">
										<div class="products_index_gallery_product__section products_index_gallery_product__section--detail">
											<a class="products_index_gallery_product__section_link" data-link-target="window" href="/semi/product/detail.jsp?pro-no=<%=review.getProNo() %>&qna-pno=1&review-pno=1">
												<div class="products_index_gallery_product__detail_name">
													<%=review.getProName() %>
												</div>
												<div class="products_index_gallery_product__detail_price">
													<%=review.getPriceDF() %>원
												</div>
											</a>
										</div>
										<div class="products_index_gallery_product__section products_index_gallery_product__section--review_summary">
											<a class="products_index_gallery_product__section_link" href="/semi/product/detail.jsp?pro-no=<%=review.getProNo() %>&qna-pno=1&review-pno=1" data-link-target="window">
												<div class="products_index_gallery_product__review_summary_average_score_title">
													평점
												</div>
												<div class="products_index_gallery_product__review_summary_average_score">
													<%=grade.getGrade() %>
												</div>
												<div class="products_index_gallery_product__review_summary_reviews_count">
													<%=grade.getReviewCount() %>개의 리뷰
												</div>
											</a>
										</div>
										<%
											for (Review content : contents) {
												String con = content.getReviewContent();
												int conlen = con.length();
												if (conlen >= 20) {
													con = con.substring(0, 20) + "...";
												}
										%>
										<div class="products_index_gallery_product__section" style="min-height: 60px;">
											<a class="js-link-fullscreen-popup" href="/semi/product/detail.jsp?pro-no=<%=review.getProNo() %>&qna-pno=1&review-pno=1#order-by">
												<div class="products_index_gallery_product__review_inner">
													<%
														if (content.getReviewImg() != null) {
													%>
													<div class="products_index_gallery_product__review_image_box">
														<img src="/semi/images/products/<%=content.getReviewImg() %>" style="width: 36px; height: 36px;" class="products_index_gallery_product__review_image js-review-image smooth--loaded">
													</div>
													<%
														} else {
													%>
													<div class="products_index_gallery_product__review_image_box">
														<img src="/semi/images/products/product_ready_big.png" style="width: 36px; height: 36px;" class="products_index_gallery_product__review_image js-review-image smooth--loaded">
													</div>
													<%
														}
													%>
													<div class="products_index_gallery_product__review_message">
														<%=con %>
													</div>
												</div>
											</a>
										</div>
										<%
											}
										%>
										<div class="products_index_gallery_product__section products_index_gallery_product__section--category">
											<a class="products_index_gallery_product__section_link" data-link-target="window" href="/semi/product/list.jsp?category-no=<%=review.getCategoryNo() %>">
												<div class="products_index_gallery_product__category_name">
													<%=review.getCategory().toUpperCase() %>
												</div>
												<div class="products_index_gallery_product__category_description">
													카테고리의 상품입니다.
												</div>
											</a>
										</div>
									</div>
								</div>
									<%
										}
									}
									%>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<hr class="layout">
	</div>
	<hr class="layout">
</div>
	<%@ include file="/include/lowermost-footer.jsp"%>
</body>
</html>