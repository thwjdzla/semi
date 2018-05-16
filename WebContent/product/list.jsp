<%@page import="semi.utils.NumberUtil"%>
<%@page import="semi.utils.DateUtil"%>
<%@page import="org.apache.commons.lang3.time.DateUtils"%>
<%@page import="java.util.Date"%>
<%@page import="semi.service.enums.OrderWay"%>
<%@page import="semi.service.enums.OrderBy"%>
<%@page import="semi.utils.StringUtil"%>
<%@page import="java.util.Map"%>
<%@page import="java.math.BigDecimal"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="ko">
<head>
  <title>product/list.jsp</title>
  <title>3조 세미 - '/semi/product/list.jsp'</title>
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

	.sorting-selector {
		height: 25px;
		color: rgb(120,120,120);
	}

	#remoCon {
		font-size: medium;
		position: fixed;
		width: 60px;
		height: 40px;
		right: 80px;
		bottom: 80px;
		display: none;
		border-style: double;
		border-color: rgb(150,150,150);
		color: rgb(50,50,50);
		font-weight: bold;
		padding-top: 7px;
		background-color: rgb(120,120,120);
 	} 
</style>
<body>
<%@ include file="/include/uppermost-nav.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	String categoryNoStr = request.getParameter("category-no");
	String pageNoStr = request.getParameter("page-no");
	
	int categoryNo = 1;
	int pageNo = 1;
	
	if(pageNoStr != null){
		pageNo = Integer.parseInt(pageNoStr);
	}
	if(categoryNoStr != null){
		categoryNo = Integer.parseInt(categoryNoStr);
	}
	
	int lastPage = productService.getLastPageOfProductList(categoryNo);
	Category currentCategory = productService.getCategoryByNo(categoryNo);
	List<Category> subCategories = productService.getSubCategoriesByNo(categoryNo);
	List<Map<String,Object>> products = productService.getProductsToDisplayProductsTable(pageNo, categoryNo, 0, 0);
	List<OrderBy> orderByList = productService.getOrderByList();
	List<OrderWay> orderWayList = productService.getOrderWayList();
	
	int lenOfShortDetail = 15;
	int cntOfComma = 3;
	
	int index = 0;
	int rows = 0;
	int cols = 0;
%>

<div class="container col-xs-12" id="id-main-contents" align="center">
	<span id="current-page-no" style="display: none;"><%=pageNo %></span>
	<span id="current-category-no" style="display: none;"><%=categoryNo %></span>
	
	<span id="remoCon">
      	TOP
 	</span> 

	<div class="row">
		<div class="parallax">
			<p><span class="mid-logo">FROM HEAD TOTOE</span></p>
		</div>
	</div>
	<div class="row margin-bottom-div">
		<label class="mini-label"><%=currentCategory.getName() %></label>
	</div>
	<%
		if(!subCategories.isEmpty()){
	%>
	<div class="row product-categories">
		<ul class="list-inline">
		<%
			for(Category c : subCategories){
		%>		
			<li class="list-inline-list"><a href="" onclick="getProductsBySubCategory(<%=c.getNo() %>); return false;"><%=c.getName() %></a></li>
		<%	
			}
		%>
		</ul>
	</div>
	<%	
		}
	%>
	<div style="margin-bottom: 10px;">
	<%
		rows = ProductService.PRODUCT_ROWS;
		cols = ProductService.PRODUCT_COLS;
		index = 0;
	%>
		<table class="product-list" id="products-table">
			<tbody>
			<%
				for(int i=0; i<rows; i++){
			%>
				<tr>
			<%
					for(int j=0; j<cols; j++){
						if(products.size() > index){
			%>				
						<td style="vertical-align: top;">
							<a href="/semi/product/detail.jsp?pro-no=<%=products.get(index).get("productNo") %>"><img style="display: block;" src="/semi/images/products/<%=products.get(index).get("imgBig") %>" width="320"></a>
							<div>
								<p><span class="product-title"><%=products.get(index).get("name") %></span></p>
								<%	
									String detail = (String)products.get(index).get("detail");
									detail = StringUtil.getShortString(detail, lenOfShortDetail, cntOfComma);
									BigDecimal discount = (BigDecimal)products.get(index).get("discount");
									String realPrice = NumberUtil.numberToString(products.get(index).get("realPrice"));
									Date createDate = (Date)products.get(index).get("createDate");
									String createDateStr = DateUtil.dateToString(createDate);
									BigDecimal orderQty = (BigDecimal)products.get(index).get("orderQty");
									BigDecimal stockQty = (BigDecimal)products.get(index).get("stockQty");
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
	<div id="page-nav" style="text-align: center;">
		<ul class="pagination">
		<%		
			for(int i=1; i<=lastPage; i++){		
		%>	
				<li><a href="" onclick="getProductsByPage(<%=i %>); return false;" ><%=i %></a></li>
		<%			
			}
		%>
		</ul>
	</div>
	<div class="row" style="margin-bottom: 100px; font-style: oblique;">
		<select class="sorting-selector" onchange="getProductsBySorting(); return false;" id="order-by">
		<%
			for(OrderBy orderBy : orderByList){
		%>		
			<option value="<%=orderBy.no %>"><%=orderBy.label %></option>
		<%		
			}
		%>
		</select>
		<select class="sorting-selector" onchange="getProductsBySorting(); return false;" id="order-way">
		<%
			for(OrderWay orderWay : orderWayList){
		%>	
			<option value="<%=orderWay.no %>"><%=orderWay.label %></option>
		<%		
			}
		%>
		</select>
	</div>
	<div class="row">
		<div class="parallax">
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

	function getProductsByPage(pageNo){
		var orderByEl = document.getElementById("order-by");
		var orderWayEl = document.getElementById("order-way");
		var orderByNo = orderByEl.options[orderByEl.selectedIndex].value;
		var orderWayNo = orderWayEl.options[orderWayEl.selectedIndex].value;
		var categoryNo = document.getElementById("current-category-no").innerHTML;
		
		var xhr = new XMLHttpRequest();
		xhr.open("GET","/semi/product/product-data.jsp?category-no=" + categoryNo + "&page-no=" + pageNo + "&order-by=" + orderByNo + "&order-way=" + orderWayNo);
		xhr.send();
		
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200) {
				document.getElementById("current-page-no").innerHTML = pageNo;
				var jsonData = JSON.parse(xhr.responseText);
				changeTable(jsonData);
			}
		}
	}
	
	
	function getProductsBySubCategory(categoryNo) {
		var orderByEl = document.getElementById("order-by");
		var orderWayEl = document.getElementById("order-way");
		var orderByNo = orderByEl.options[orderByEl.selectedIndex].value;
		var orderWayNo = orderWayEl.options[orderWayEl.selectedIndex].value;
		var pageNo = 1;

		var xhr = new XMLHttpRequest();
		xhr.open("GET","/semi/product/product-data.jsp?category-no=" + categoryNo + "&page-no=" + pageNo + "&order-by=" + orderByNo + "&order-way=" + orderWayNo);
		xhr.send();
	
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200) {
				document.getElementById("current-page-no").innerHTML = 1;
				document.getElementById("current-category-no").innerHTML = categoryNo;
				var jsonData = JSON.parse(xhr.responseText);
				changeTable(jsonData);
			}
		}
	}
	
	function getProductsBySorting(){
		var orderByEl = document.getElementById("order-by");
		var orderWayEl = document.getElementById("order-way");
		var orderByNo = orderByEl.options[orderByEl.selectedIndex].value;
		var orderWayNo = orderWayEl.options[orderWayEl.selectedIndex].value;
		var categoryNo = document.getElementById("current-category-no").innerHTML;
		var pageNo = 1;
		
		var xhr = new XMLHttpRequest();
		xhr.open("GET","/semi/product/product-data.jsp?category-no=" + categoryNo + "&page-no=" + pageNo + "&order-by=" + orderByNo + "&order-way=" + orderWayNo);
		xhr.send();
		
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200) {
				document.getElementById("current-page-no").innerHTML = 1;
				var jsonData = JSON.parse(xhr.responseText);
				changeTable(jsonData);
			}
		}
	}
	
	function changeTable(jsonData){
		var productsTable = document.getElementById("products-table");
		var pageNav = document.getElementById("page-nav");
		var rows = jsonData.productsTableSize.rows;
		var cols = jsonData.productsTableSize.cols;
		var products = jsonData.products;
		var index = 0;
		var html = "";
		
		html += "<tbody>";
		for(var row=0; row<rows; row++){
			
			html +="<tr>";
			for(var col=0; col<cols; col++){
				
				html += "<td style='vertical-align: top;'>";
				if(products.length > index){

					html += "<a href='/semi/product/detail.jsp?pro-no=" + products[index].productNo + "'><img style='display: block;' src='/semi/images/products/" + products[index].imgBig + "' width='320'></a>";
					html += "<div>";
					html +=	"<p><span class='product-title'>" + products[index].name + "</span></p>";

					var shortDetail = getShortString(products[index].detail, lenOfShortDetail, cntOfComma);
					var discount = products[index].discount;
					var realPrice = products[index].realPrice;
					var createDate = formatDate(products[index].createDate);
					var orderQty = products[index].orderQty;
					var stockQty = products[index].stockQty;

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
		productsTable.innerHTML = html;
		
		var lastPage = jsonData.productsTableSize.lastPage;
		html = "<ul class='pagination'>";
		for(var i=1; i<=lastPage; i++){
			html += "<li><a href='#' onclick='getProductsByPage(" + i +  "); return false;' >" + i + "</a></li>";
		}
		html += "</ul>";
		html += "</div>";
		pageNav.innerHTML = html;
	}
	
	$(document).scroll(function(){
		var con = $("#remoCon");
		var position = $(window).scrollTop();

		if(position > 250){ 
			con.fadeIn(500); 
		}
		else if(position < 250){ 
			con.fadeOut(500); 
		}
	});

	$("#remoCon").click(function(){
		$("html, body").animate({scrollTop: 0}, 1000);
	});
</script>
</html>