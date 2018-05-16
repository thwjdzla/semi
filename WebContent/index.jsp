<%@page import="semi.utils.DateUtil"%>
<%@page import="java.util.Date"%>
<%@page import="semi.utils.NumberUtil"%>
<%@page import="semi.service.enums.OrderWay"%>
<%@page import="semi.service.enums.OrderBy"%>
<%@page import="semi.utils.StringUtil"%>
<%@page import="semi.vo.Category"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="semi.service.ProductService"%>
<%@page import="java.util.ArrayList"%>
<%@page import="semi.vo.ProductDetail"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="ko">
<head>
<title>index.jsp</title>
<title>3조 세미 - '/semi/index.jsp'</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<style>
	.container {
		min-width: 1280px;
	}

	.parallax {
	    /* The image used */
	    background-image: url("/semi/images/kyh/img_parallax.jpg");
	
	    /* Set a specific height */
	    min-height: 500px; 
	
	    /* Create the parallax scrolling effect */
	    background-attachment: fixed;
	    background-position: center;
	    background-repeat: no-repeat;
	    background-size: cover;
	    margin-bottom: 60px;
	}

	.mini-label {
		padding: 6px 14px 6px 14px;
		border: 3px double rgb(220,220,220);
		font-size: 10px;
		font-weight: lighter;
		color: rgb(170,170,170);
		border-radius: 20px 2px;
	}

	.mid-logo {
		font-size: 60px;
		line-height: 500px;
		color: rgb(250,250,250);
	}
	
	.product-list {
		text-align: center;
	}
	
	.product-list td {
		padding: 5px 5px 65px 5px;
	}
	
	.product-list tr {
		border-top: 1px solid rgb(200,200,200);
		border-bottom: 1px solid rgb(200,200,200);
	}
	
	.product-list div {
		margin-top: 15px;
	}
	
	.product-title {
		font-size: 11px;
		font-weight: bold;
		color: rgb(50,50,50);
	}
	
	.product-price {
		font-size: 11px;
		color: rgb(50,50,150);
	}
	
	.product-short-detail {
		font-size: 11px;
		color: rgb(100,100,100);
	}

	.product-order-qty {
		font-size: 11px;
		color: rgb(50,50,150);
	}
	
	.product-create-date {
		font-size: 11px;
		color: rgb(50,50,150);
	}
	
	.product-stock-qty {
		font-size: 11px;
		color: rgb(50,50,150);
	}
	
	.margin-bottom-div {
		margin-bottom: 90px;
	}	

	.mid-banner-table td {
		padding: 5px 5px 5px 5px;
	}
	
	.mid-banner-img {
		border: 1px solid rgb(200,200,200);
	}
	
	.product-categories ul {
		border-top: 1px solid rgb(200,200,200);
		padding: 15px 0px 15px 0px;
		width: 1200px;
	}
	
	.product-categories ul li {
		height: 30px;
		width: 50px;
		margin-left: 40px;
		margin-right: 40px;
		color: rgb(200,200,200);
		font-size: 10px;
	}
	
	.product-categories ul li a {
		padding-top: 10px;
		height: 30px;
		width: 80px;
		display: inline-block;
	}
	
	.hidden-span {
		visibility: hidden;
	}
	
</style>
<body>
<%@ include file="/include/uppermost-nav.jsp" %>
<% 
	request.setCharacterEncoding("utf-8");
	request.setAttribute("tab", "main"); 

	List<Category> categories = productService.getCategoriesByLevel(1);

	String categoryNoStr = request.getParameter("category-no");
	int categoryNo = 1;
	if(categoryNoStr != null){
		categoryNo = Integer.parseInt(categoryNoStr);
	}
	
	List<Map<String,Object>> weeklyBestProducts = productService.getProductsToDisplayWeeklyBestTable(categoryNo, OrderBy.ORDER_QTY.no, OrderWay.DESC.no);
	List<Map<String,Object>> bestProducts = productService.getProdutsToDisplayBestTable(categoryNo, OrderBy.ORDER_QTY.no, OrderWay.DESC.no);
	List<Map<String,Object>> newArrivalsProducts = productService.getProductsToDisplayNewArrivalTable(categoryNo, OrderBy.CREATE_DATE.no, OrderWay.DESC.no);
	
	int lenOfShortDetail = 15;
	int cntOfComma = 3;
	
	int index = 0;
	int rows = 0;
	int cols = 0;
%>
<div class="container col-xs-12" id="id-main-contents" align="center">
	<div class="row">
		<div class="parallax" style="cursor:pointer;" onclick="location.href='/semi/index.jsp'">
			<p><span class="mid-logo">FROM HEAD TOTOE</span></p>
		</div>
	</div>
	<div class="row margin-bottom-div">
		<table style="text-align: center;">
			<tbody>
				<tr>
					<td><a href=""><img src="/semi/images/kyh/main-product-01.png"></a></td>
					<td><a href=""><img src="/semi/images/kyh/main-product-02.png"></a></td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="row margin-bottom-div">
		<table class="mid-banner-table">
			<tbody>
				<tr>
					<td><a href=""><img class="mid-banner-img" src="/semi/images/kyh/mid-banner-01.png"></a></td>
					<td><a href=""><img class="mid-banner-img" src="/semi/images/kyh/mid-banner-02.png"></a></td>
					<td><a href=""><img class="mid-banner-img" src="/semi/images/kyh/mid-banner-03.png"></a></td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="row margin-bottom-div">
		<table style="text-align: center; width:100%;">
			<tbody>
				<tr>
					<td style="text-align: left;"><img src="/semi/images/kyh/pattern-left.png"></td>
					<td><label class="mini-label">WEEKLY BEST PRODUCT</label></td>
					<td style="text-align: right;"><img src="/semi/images/kyh/pattern-right.png"></td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="row product-categories">
		<ul class="list-inline">
		<%
			for(Category c : categories){
		%>		
			<li class="list-inline-list"><a href="#" onclick="getWeeklyBestProductsByCategory('<%=c.getNo() %>');return false;"><%=c.getName() %></a></li>	
		<%	
			}
		%>
		</ul>
	</div>
	<div class="row margin-bottom-div">
	<%
		rows = ProductService.WEEKLY_BEST_ROWS;
		cols = ProductService.WEEKLY_BEST_COLS;
		index = 0;
	%>
		<table class="product-list" id="weekly-best-table">
			<tbody>
			<%
				for(int i=0; i<rows; i++){
			%>
				<tr>
			<%
					for(int j=0; j<cols; j++){
						if(weeklyBestProducts.size() > index){
			%>				
						<td style="vertical-align: top;">
							<a href="/semi/product/detail.jsp?pro-no=<%=weeklyBestProducts.get(index).get("productNo") %>"><img style="display: block;" src='/semi/images/products/<%=weeklyBestProducts.get(index).get("imgBig") %>' width="320"></a>
							<div>
								<p><span class="product-title"><%=weeklyBestProducts.get(index).get("name") %></span></p>
								<%	
									String detail = (String)weeklyBestProducts.get(index).get("detail");
									detail = StringUtil.getShortString(detail, lenOfShortDetail, cntOfComma);
									BigDecimal discount = (BigDecimal)weeklyBestProducts.get(index).get("discount");
									String realPrice = NumberUtil.numberToString(weeklyBestProducts.get(index).get("realPrice"));
									Date createDate = (Date)weeklyBestProducts.get(index).get("createDate");
									String createDateStr = DateUtil.dateToString(createDate);
									BigDecimal orderQty = (BigDecimal)weeklyBestProducts.get(index).get("orderQty");
									BigDecimal stockQty = (BigDecimal)weeklyBestProducts.get(index).get("stockQty");
								%>
								<p><span class="product-price">판매가 : <%=realPrice %>원 <span style="color: red;">( <%=discount %>% sale )</span></span></p>	
								<p><span class="product-short-detail"><%=detail %></span></p>
								<p><span class="product-create-date">등록일<span style="color: rgb(200,70,50);">  <%=createDateStr %></span></span></p>
								<p><span class="product-order-qty">주문<span style="color: rgb(200,70,50);">  <%=orderQty.intValue() %></span></span></p>
								<p><span class="product-stock-qty">수량<span style="color: rgb(200,70,50);">  <%=stockQty.intValue() %></span></span></p>
							</div>
						</td>
			<%				
						} else {
			%>	
						<td valign="bottom">
							<img style="display: block;" src="/semi/images/products/product_ready_big.png" width="320">
							<div>
								<p><span class="product-title hidden-span"> 없음 </span></p>
								<p><span class="product-price">해당 상품이 존재하지 않습니다</span></p>
								<p><span class="product-short-detail hidden-span"> 없음 </span></p>
								<p><span class="product-create-date hidden-span"> 없음 </span></p>
								<p><span class="product-order-qty hidden-span"> 없음 </span></p>
								<p><span class="product-stock-qty hidden-span"> 없음 </span></p>
							</div>
						</td>
			<%			
						}
						index++;
					}
			%>		
				</tr>
			<%
				}
			%>
			</tbody>
		</table>
	</div>
	<div class="row margin-bottom-div">
		<table style="text-align: center; width:100%;">
			<tbody>
				<tr>
					<td style="text-align: left;"><img src="/semi/images/kyh/pattern-left.png"></td>
					<td><label class="mini-label">NEW ARRIVALS ITEM</label></td>
					<td style="text-align: right;"><img src="/semi/images/kyh/pattern-right.png"></td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="row product-categories">
		<ul class="list-inline">
		<%
			for(Category c : categories){
		%>		
			<li class="list-inline-list"><a href="#" onclick="getNewArrivalProductsByCategory('<%=c.getNo() %>');return false;"><%=c.getName() %></a></li>	
		<%	
			}
		%>
		</ul>
	</div>	
	<div class="row margin-bottom-div">
		<%
			rows = ProductService.NEW_ARRIVAL_ROWS;
			cols = ProductService.NEW_ARRIVAL_COLS;
			index = 0;
		%>
		<table class="product-list" id="new-arrival-table">
			<tbody>
			<%
				for(int i=0; i<rows; i++){
			%>
				<tr>	
			<%
					for(int j=0; j<cols; j++){
			%>
					<td style="vertical-align: top;">
			<%
						if(newArrivalsProducts.size() > index){
			%>
							<a href="/semi/product/detail.jsp?pro-no="<%=newArrivalsProducts.get(index).get("productNo") %>><img src='/semi/images/products/<%=newArrivalsProducts.get(index).get("imgPortrait1") %>' width="250"></a>
							<div>
								<p><span class="product-title"><%=newArrivalsProducts.get(index).get("name") %></span></p>
								<%	
									String detail = (String)newArrivalsProducts.get(index).get("detail");
									detail = StringUtil.getShortString(detail, lenOfShortDetail, cntOfComma);
									BigDecimal discount = (BigDecimal)newArrivalsProducts.get(index).get("discount");
									String realPrice = NumberUtil.numberToString(newArrivalsProducts.get(index).get("realPrice"));
									Date createDate = (Date)newArrivalsProducts.get(index).get("createDate");
									String createDateStr = DateUtil.dateToString(createDate);
									BigDecimal orderQty = (BigDecimal)newArrivalsProducts.get(index).get("orderQty");
									BigDecimal stockQty = (BigDecimal)newArrivalsProducts.get(index).get("stockQty");
								%>
								<p><span class="product-price">판매가 : <%=realPrice %>원 <span style="color: rgb(200,70,50);">( <%=discount %>% sale )</span></span></p>	
								<p><span class="product-short-detail"><%=detail %></span></p>
								<p><span class="product-create-date">등록일<span style="color: rgb(200,70,50);">  <%=createDateStr %></span></span></p>
								<p><span class="product-order-qty">주문<span style="color: rgb(200,70,50);">  <%=orderQty.intValue() %></span></span></p>
								<p><span class="product-stock-qty">수량<span style="color: rgb(200,70,50);">  <%=stockQty.intValue() %></span></span></p>
							</div>	
			<%				
						} else {
			%>
							<img style="display: block;" src="/semi/images/products/product_ready_por.png" width="250">
							<div>
								<p><span class="product-title hidden-span"> 없음 </span></p>
								<p><span class="product-price">해당 상품이 존재하지 않습니다</span></p>
								<p><span class="product-short-detail hidden-span"> 없음 </span></p>
								<p><span class="product-create-date hidden-span"> 없음 </span></p>
								<p><span class="product-order-qty hidden-span"> 없음 </span></p>
								<p><span class="product-stock-qty hidden-span"> 없음 </span></p>
							</div>			
			<%			
						}
						index++;
			%>
					</td>
			<%		
					}
			%>
				</tr>
			<%
				}
			%>
			</tbody>	
		</table>
	</div>
	<div class="row margin-bottom-div">
		<table style="text-align: center; width:100%;">
			<tbody>
				<tr>
					<td style="text-align: left;"><img src="/semi/images/kyh/pattern-left.png"></td>
					<td><label class="mini-label">BEST PRODUCT</label></td>
					<td style="text-align: right;"><img src="/semi/images/kyh/pattern-right.png"></td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="row product-categories">
		<ul class="list-inline">
		<%
			for(Category category : categories){
		%>		
			<li class="list-inline-list"><a href="" onclick="getBestProductsByCategory('<%=category.getNo() %>');return false;"><%=category.getName() %></a></li>	
		<%	
			}
		%>
		</ul>
	</div>	
	<div class="row margin-bottom-div">
	<%
		rows = ProductService.BEST_PRODUCT_ROWS;
		cols = ProductService.BEST_PRODUCT_COLS;
		index = 0;
	%>
		<table class="product-list" id="best-table">
			<tbody>
			<%
				for(int i=0; i<rows; i++){
			%>
				<tr>
			<%
					for(int j=0; j<cols; j++){
						if(bestProducts.size() > index){
			%>				
						<td style="vertical-align: top;">
							<a href="/semi/product/detail.jsp?pro-no=<%=bestProducts.get(index).get("productNo") %>"><img style="display: block;" src='/semi/images/products/<%=bestProducts.get(index).get("imgPortrait1") %>' width="250"></a>
							<div>
								<p><span class="product-title"><%=bestProducts.get(index).get("name") %></span></p>
								<%	
									String detail = (String)bestProducts.get(index).get("detail");
									detail = StringUtil.getShortString(detail, lenOfShortDetail, cntOfComma);
									BigDecimal discount = (BigDecimal)bestProducts.get(index).get("discount");
									String realPrice = NumberUtil.numberToString(bestProducts.get(index).get("realPrice"));
									Date createDate = (Date)bestProducts.get(index).get("createDate");
									String createDateStr = DateUtil.dateToString(createDate);
									BigDecimal orderQty = (BigDecimal)bestProducts.get(index).get("orderQty");
									BigDecimal stockQty = (BigDecimal)bestProducts.get(index).get("stockQty");
								%>
								<p><span class="product-price">판매가 : <%=realPrice %>원 <span style="color: rgb(200,70,50);">( <%=discount %>% sale )</span></span></p>	
								<p><span class="product-short-detail"><%=detail %></span></p>
								<p><span class="product-create-date">등록일<span style="color: rgb(200,70,50);">  <%=createDateStr %></span></span></p>
								<p><span class="product-order-qty">주문<span style="color: rgb(200,70,50);">  <%=orderQty.intValue() %></span></span></p>
								<p><span class="product-stock-qty">수량<span style="color: rgb(200,70,50);">  <%=stockQty.intValue() %></span></span></p>
							</div>
						</td>
			<%				
						} else {
			%>	
						<td valign="bottom">
							<img style="display: block;" src="/semi/images/products/product_ready_por.png" width="250">
							<div>
								<p><span class="product-title hidden-span"> 없음 </span></p>
								<p><span class="product-price">해당 상품이 존재하지 않습니다</span></p>
								<p><span class="product-short-detail hidden-span"> 없음 </span></p>
								<p><span class="product-create-date hidden-span"> 없음 </span></p>
								<p><span class="product-order-qty hidden-span"> 없음 </span></p>
								<p><span class="product-stock-qty hidden-span"> 없음 </span></p>
							</div>
						</td>
			<%			
						}
						index++;
					}
			%>		
				</tr>
			<%
				}
			%>
			</tbody>
		</table>
	</div>
	<div class="row">
		<div class="parallax" style="cursor:pointer;" onclick="location.href='/semi/index.jsp'">
			<p><span class="mid-logo">FROM HEAD TOTOE</span></p>
		</div>
	</div>
</div>
<%@ include file="/include/lowermost-footer.jsp" %>
</body>
<script>
	var lenOfShortDetail = 15;
	var cntOfComma = 3;
	
	function formatDate(date) {
	    var d = new Date(date),
	        month = '' + (d.getMonth() + 1),
	        day = '' + d.getDate(),
	        year = d.getFullYear();

	    if (month.length < 2) month = '0' + month;
	    if (day.length < 2) day = '0' + day;

	    return [year, month, day].join('-');
	}
	
	function getShortString(str , cutLine , commaCount) {
		if(str.length < cutLine)
			return str;
		
		var result = str.substring(0, cutLine);
		for(var i=0; i<commaCount; i++) {
			result += ".";
		}
		return result;
	}
	
	function getWeeklyBestProductsByCategory(categoryNo) {
		
		var xhr = new XMLHttpRequest();
		xhr.open("GET","/semi/index-weekly-best-data.jsp?category-no=" + categoryNo);
		xhr.send();
	
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200) {
				var jsonText = JSON.parse(xhr.responseText);
				
				var weeklyBestTableEl = document.getElementById("weekly-best-table");
				var rows = jsonText.weeklyBestTableSize.rows;
				var cols = jsonText.weeklyBestTableSize.cols;
				var weeklyBestProducts = jsonText.weeklyBestProducts;
				var index = 0;
				var html = "";
				
				html += "<tbody>";
				for(var row=0; row<rows; row++){
					
					html +="<tr>";
					for(var col=0; col<cols; col++){
						
						html += "<td style='vertical-align: top;'>";
						if(weeklyBestProducts.length > index){
							
							html += "<a href='/semi/product/detail.jsp?pro-no=" + weeklyBestProducts[index].productNo + "'><img style='display: block;' src='/semi/images/products/" + weeklyBestProducts[index].imgBig + "' width='320'></a>";
							html += "<div>";
							html +=	"<p><span class='product-title'>" + weeklyBestProducts[index].name + "</span></p>";
							
							var shortDetail = getShortString(weeklyBestProducts[index].detail, lenOfShortDetail, cntOfComma);
							var discount = weeklyBestProducts[index].discount;
							var realPrice = weeklyBestProducts[index].realPrice;
							var createDate = formatDate(weeklyBestProducts[index].createDate);
							var orderQty = weeklyBestProducts[index].orderQty;
							var stockQty = weeklyBestProducts[index].stockQty;
							
							html += "<p><span class='product-price'> 판매가 : " + realPrice + "원" + "<span style='color: red;'>" + " ( " + discount + "% sale )</span></span></p>";
							html += "<p><span class='product-short-detail'>" + shortDetail + "</span></p>";
							html += "<p><span class='product-create-date'>등록일  " + createDate + "</span></p>";
							html += "<p><span class='product-order-qty'>주문  " + orderQty + "</span></p>";
							html += "<p><span class='product-stock-qty'>수량  " + stockQty + "</span></p>";
							html += "</div>";
							
						} else {
							
							html += "<img style='display: block;' src='/semi/images/products/product_ready_big.png' width='320'>";
							html += "<div>";
							html += "<p><span class='product-title hidden-span'> 없음 </span></p>";
							html += "<p><span class='product-price'>해당 상품이 존재하지 않습니다</span></p>";
							html += "<p><span class='product-short-detail hidden-span'> 없음 </span></p>";
							html += "<p><span class='product-create-date hidden-span'> 없음 </span></p>";
							html += "<p><span class='product-order-qty hidden-span'> 없음 </span></p>";
							html += "<p><span class='product-stock-qty hidden-span'> 없음 </span></p>";
							html += "</div>";
							
						}
						html += "</td>";
						index++;
					}
				}
				html += "</tbody>";
				weeklyBestTableEl.innerHTML = html;
			}
		}
	}
	
	function getNewArrivalProductsByCategory(categoryNo) {
		
		var xhr = new XMLHttpRequest();
		xhr.open("GET","/semi/index-new-arrival-data.jsp?category-no=" + categoryNo);
		xhr.send();
	
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200) {
				var jsonText = JSON.parse(xhr.responseText);
				
				var newArrivalTable = document.getElementById("new-arrival-table");
				var rows = jsonText.newArrivalTableSize.rows;
				var cols = jsonText.newArrivalTableSize.cols;
				var newArrivalProducts = jsonText.newArrivalProducts;
				var index = 0;
				var html = "";
				
				html += "<tbody>";
				for(var row=0; row<rows; row++){
					
					html +="<tr>";
					for(var col=0; col<cols; col++){
						
						html += "<td style='vertical-align: top;'>";
						if(newArrivalProducts.length > index){
							
							html += "<a href='/semi/product/detail.jsp?pro-no=" + newArrivalProducts[index].productNo + "'><img style='display: block;' src='/semi/images/products/" + newArrivalProducts[index].imgPortrait1 + "' width='250'></a>";
							html += "<div>";
							html +=	"<p><span class='product-title'>" + newArrivalProducts[index].name + "</span></p>";
							
							var shortDetail = getShortString(newArrivalProducts[index].detail, lenOfShortDetail, cntOfComma);
							var discount = newArrivalProducts[index].discount;
							var realPrice = newArrivalProducts[index].realPrice;
							var createDate = formatDate(newArrivalProducts[index].createDate);
							var orderQty = newArrivalProducts[index].orderQty;
							var stockQty = newArrivalProducts[index].stockQty;
							
							html += "<p><span class='product-price'> 판매가 : " + realPrice + "원" + "<span style='color: red;'>" + " ( " + discount + "% sale )</span></span></p>";
							html += "<p><span class='product-short-detail'>" + shortDetail + "</span></p>";
							html += "<p><span class='product-create-date'>등록일  " + createDate + "</span></p>";
							html += "<p><span class='product-order-qty'>주문  " + orderQty + "</span></p>";
							html += "<p><span class='product-stock-qty'>수량  " + stockQty + "</span></p>";
							html += "</div>";
							
						} else {
							
							html += "<img style='display: block;' src='/semi/images/products/product_ready_big.png' width='320'>";
							html += "<div>";
							html += "<p><span class='product-title hidden-span'> 없음 </span></p>";
							html += "<p><span class='product-price'>해당 상품이 존재하지 않습니다</span></p>";
							html += "<p><span class='product-short-detail hidden-span'> 없음 </span></p>";
							html += "<p><span class='product-create-date hidden-span'> 없음 </span></p>";
							html += "<p><span class='product-order-qty hidden-span'> 없음 </span></p>";
							html += "<p><span class='product-stock-qty hidden-span'> 없음 </span></p>";
							html += "</div>";
							
						}
						html += "</td>";
						index++;
					}
				}
				html += "</tbody>";
				newArrivalTable.innerHTML = html;
			}
		}
	}

	function getBestProductsByCategory(categoryNo) {
		
		var xhr = new XMLHttpRequest();
		xhr.open("GET","/semi/index-best-product-data.jsp?category-no=" + categoryNo);
		xhr.send();
	
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200) {
				var jsonText = JSON.parse(xhr.responseText);
				
				var bestProductsTable = document.getElementById("best-table");
				var rows = jsonText.bestTableSize.rows;
				var cols = jsonText.bestTableSize.cols;
				var bestProducts = jsonText.bestProducts;
				var index = 0;
				var html = "";
				
				html += "<tbody>";
				for(var row=0; row<rows; row++){
					
					html +="<tr>";
					for(var col=0; col<cols; col++){
						
						html += "<td style='vertical-align: top;'>";
						if(bestProducts.length > index){
							
							html += "<a href='/semi/product/detail.jsp?pro-no=" + bestProducts[index].productNo + "'><img style='display: block;' src='/semi/images/products/" + bestProducts[index].imgPortrait1 + "' width='250'></a>";
							html += "<div>";
							html +=	"<p><span class='product-title'>" + bestProducts[index].name + "</span></p>";
							
							var shortDetail = getShortString(bestProducts[index].detail, lenOfShortDetail, cntOfComma);
							var discount = bestProducts[index].discount;
							var realPrice = bestProducts[index].realPrice;
							var createDate = formatDate(newArrivalProducts[index].createDate);
							var orderQty = bestProducts[index].orderQty;
							var stockQty = bestProducts[index].stockQty;
							
							html += "<p><span class='product-price'> 판매가 : " + realPrice + "원" + "<span style='color: red;'>" + " ( " + discount + "% sale )</span></span></p>";
							html += "<p><span class='product-short-detail'>" + shortDetail + "</span></p>";
							html += "<p><span class='product-create-date'>등록일  " + createDate + "</span></p>";
							html += "<p><span class='product-order-qty'>주문  " + orderQty + "</span></p>";
							html += "<p><span class='product-stock-qty'>수량  " + stockQty + "</span></p>";
							html += "</div>";
							
						} else {
							
							html += "<img style='display: block;' src='/semi/images/products/product_ready_big.png' width='320'>";
							html += "<div>";
							html += "<p><span class='product-title hidden-span'> 없음 </span></p>";
							html += "<p><span class='product-price'>해당 상품이 존재하지 않습니다</span></p>";
							html += "<p><span class='product-short-detail hidden-span'> 없음 </span></p>";
							html += "<p><span class='product-create-date hidden-span'> 없음 </span></p>";
							html += "<p><span class='product-order-qty hidden-span'> 없음 </span></p>";
							html += "<p><span class='product-stock-qty hidden-span'> 없음 </span></p>";
							html += "</div>";
							
						}
						html += "</td>";
						index++;
					}
				}
				html += "</tbody>";
				bestProductsTable.innerHTML = html;
			}
		}
	}
	
//	$(window).scroll(function() {
	
	//var scrollTop = $(this).scrollTop();
	//var scrollHeight = $('body').prop("scrollHeight");
	//var diff = Math.abs(1240 - scrollTop);
	
	//if(diff > 300){
	//	diff = 300;
	//}
	
	//var opacity = 1 - (0.8*(diff / 300));

	//var decos = document.getElementsByClassName("");
	//for(var i=0; i<decos.length; i++){
	//	decos[i].style.opacity = opacity;
	//}
//});

</script>
</html>