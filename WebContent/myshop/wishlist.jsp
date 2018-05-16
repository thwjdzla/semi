<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="semi.dao.OrderDao"%>
<%@page import="semi.vo.CartItem"%>
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
  
  
  <style type="text/css">

	.titleArea{
		margin:20px 0px 60px;	
	}
	
	.titleArea h2{
		font-family: 'Open Sans' , '맑은고딕'';
		letter-spacing:0.07em;
		font-weight:600;
		text-transform:uppercase;
		font-size:13px;
		color:#555;
		text-align:center;
		margin:10px auto 15px;
	}


}



.xans-myshop-wishlist .empty {
    font-size:15px;
    margin: 50px 0;
    text-align: center;
    font-weight: bold;
    color: #757575;

}

.xans-myshop-wishlist table {
    table-layout: fixed;
    border-top: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
    color: #555;
    line-height: 1.5;
    margin: 20px 0 0;
    font-size: 11px;
}





.xans-myshop-wishlistbutton {
    overflow: hidden;
    margin: 20px 0 0;
    text-align: right;
}
.xans-myshop-wishlist .empty {
    margin: 50px 0;
    text-align: center;
    font-weight: bold;
    color: #757575;
}
.xans-myshop-wishlistbutton span.left {
    float: left;
}

.xans-myshop-wishlistbutton strong.ctrlTxt {
    margin: 0 6px 0 0px;
    color: #555;
    line-height: 22px;
    font-size: 13px;
}
strong, b {
    font-weight: bold;
}
.xans-myshop-wishlist table {
    table-layout: fixed;
    border-top: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
    color: #555;
    line-height: 1.5;
    margin: 20px 0 0;
    font-size: 11px;
}

user agent stylesheet
a:-webkit-any-link {
    color: -webkit-link;
    cursor: pointer;
    text-decoration: underline;
}
.xans-myshop-wishlist .empty {
    margin: 50px 0;
    text-align: center;
    font-weight: bold;
    color: #757575;
}
.container {
    width: 1304px;
    min-height: 600px;
    margin: 0 auto;
}

.contents02 {
    width: 1000px;
    min-height: 500px;
    margin: 80px auto 80px;
}
p {
    display: block;
    -webkit-margin-before: 1em;
    -webkit-margin-after: 1em;
    -webkit-margin-start: 0px;
    -webkit-margin-end: 0px;
}


html, body, div, dl, dt, dd, ul, ol, li, 
h1, h2, h3, h4, h5, h6, pre, code, form, 
fieldset, legend, input, textarea, p, blockquote, th, td, img {
    margin: 0;
    padding: 0;
}


.xans-myshop-wishlist table {
    table-layout: fixed;
    border-top: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
    color: #555;
    line-height: 1.5;
    margin: 20px 0 0;
    font-size: 11px;
}

table {
    width: 100%;
    border: 0;
    border-spacing: 0;
    border-collapse: collapse;

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

.xans-myshop-wishlist table td {
    padding: 8px 0 5px;
    border-top: 1px solid #ccc;
    text-align: center;
    vertical-align: middle;
    word-wrap: break-word;
}

.titleArea {
    margin: 22px 0px 60px;
}

th, td {
    border: 0;
            text-align:center;
}

 input, select, textarea {
    font-size: 100%;
    font-family: "돋움",Dotum;
    color: #353535;
    vertical-align: middle;
}

html, body, div, dl, dt, dd, ul, ol, li, h1, h2, h3, h4, h5, h6, pre, code, form, fieldset, legend, input, textarea, p, blockquote, th, td, img {
    margin: 0;
    padding: 0;
}
.xans-myshop-wishlist table .thumb {
    width: 60px;
}

a {
    text-decoration: none;
    color: #000;
}
user agent stylesheet
a:-webkit-any-link {
    color: -webkit-link;
    cursor: pointer;
    text-decoration: underline;
}

.xans-myshop-wishlist table td.mileage, .xans-myshop-wishlist table td.delivery {
    color: #757575;
}
.xans-myshop-wishlist table .mileage {
    width: 85px;
}

.xans-myshop-wishlist table th {
    padding: 6px 0 4px;
    font-weight: normal;
}
.xans-myshop-wishlist table th:first-child {
    border-left: 0;
}
.xans-myshop-wishlist table .chk {
    width: 27px;
}

.xans-myshop-wishlist table .thumb {
    width: 60px;
}

.xans-myshop-wishlist table .product {
    width: auto;
}

.xans-myshop-wishlist table .price {
    width: 95px;
}

.xans-myshop-wishlist table .mileage {
    width: 85px;
}

.xans-myshop-wishlist table .delivery {
    width: 90px;
}

.xans-myshop-wishlist table .charge {
    width: 70px;
}
.xans-myshop-wishlist table .total {
    width: 90px;
}

.xans-myshop-wishlist table .button {
    width: 106px;
}

.xans-myshop-wishlist table .thumb {
    width: 60px;
}

.xans-myshop-wishlist table td.product {
    padding-left: 10px;
    text-align: left;
}

.xans-myshop-wishlist table .price {
    width: 95px;
}

.xans-myshop-wishlist table td.mileage, .xans-myshop-wishlist table td.delivery {
    color: #757575;
}
.xans-myshop-wishlist table td.mileage, .xans-myshop-wishlist table td.delivery {
    color: #757575;
}

.xans-myshop-wishlist table td {
    padding: 8px 0 5px;
    border-top: 1px solid #ccc;
    text-align: center;
    vertical-align: middle;
    word-wrap: break-word;
}

.xans-myshop-wishlist table .total {
    width: 90px;
}

.xans-myshop-wishlist table .button {
    width: 106px;
}
input, select, textarea {
    font-size: 100%;
    font-family: "돋움",Dotum;
    color: #353535;
    vertical-align: middle;
}

</style>



  
</head>
<body>
<%-- include file="/include/uppermost-nav.jsp" --%>
<div class="container">
	<div class="contents02">
		<div class="titleArea">
				<h2>WISH LIST</h2>
		</div>
		
		<%
				
				//OrderDao dao = OrderDao.getInstance();
				List<CartItem> items = new ArrayList<>();
				//items = dao.getCartlist(10);
				
				CartItem item1 = new CartItem();
				item1.setImg("image-1");
				item1.setName("비비드숄더백");
				item1.setColor("베이지");
				item1.setPrice(20000);
				item1.setQty(2);
				item1.setPoint(200);
				
				items.add(item1);
				
				
				CartItem item2 = new CartItem();
				item2.setImg("image-2");
				item2.setName("잭사파리 BBY");
				item2.setColor("카키");
				item2.setPrice(20000);
				item2.setQty(2);
				item2.setPoint(200);
				items.add(item2);
				
				
				CartItem item3 = new CartItem();
				item3.setImg("image-3");
				item3.setName("랩맨투맨 OPS");
				item3.setColor("노랑");
				item3.setPrice(20000);
				item3.setQty(2);
				item3.setPoint(200);
				items.add(item3);
				
				CartItem item4 = new CartItem();
				item4.setImg("image-4");
				item4.setName("스프링자수 NT");
				item4.setColor("검정");
				item4.setPrice(20000);
				item4.setQty(2);
				item4.setPoint(200);
				items.add(item4);
				
				CartItem item5 = new CartItem();
				item5.setImg("image-5");
				item5.setName("703짝꿍데님 SK");
				item5.setColor("파랑");
				item5.setPrice(20000);
				item5.setQty(2);
				item5.setPoint(200);
				
				items.add(item5);
				
				

		%>
		
		<div class="xans-element- xans-myshop xans-myshop-wishlist xans-record-">

			<%--if(장바구니가 안비었으면) --%>
			<%if(items != null){ %>
			<table border="1" summary class="displaynone">
				<caption>관심상품 목록</caption>
				<colgroup class="xans-element- xans-board xans-board-listheader-1002 xans-board-listheader xans-board-1002 ">
						<col style="width:10px">
						<col style="width:100px">
						<col style="width:500px">
						<col style="width:84px">
						<col style="width:80px">
						<col style="width:55px">
						<col style="width:50px">
					</colgroup>
				<thead>
					<tr>
						<th scope="col" class="chk">
							<input  class="checkbox-head group-list"id="groupCheckbox" type="checkbox" onchange="checkall();" >
						</th>
						<th scope="col" class="thumb">이미지</th>
						<th scope="col" class="product">상품정보</th>
						<th scope="col" class="price">판매가</th>
						<th scope="col" class="mileage">적립금</th>
						<th scope="col" class="delivery">배송구분</th>
						<th scope="col" class="change">배송비</th>
						<th scope="col" class="total">합계</th>
						<th scope="col" class="button">선택</th>
					</tr>
				</thead>
				
				<tbody class="xans-element- xans-myshop xans-myshop-wishlistitem">
					
					<%int t=0;
					for(CartItem item:items){ 
					t++;%>
					<tr class="xans-record-">
						<td>
							<input name="groupCheckbox" id="wish_idx_0"
							 enable-order="1" reserve-order="N" enable-purchase="1"
							 class is-set-product="F" value="196589" type="checkbox" class="checkbox-item group-list"/>
						</td>
						
						<td class="thumb">
						<%System.out.print("image-" + t); %>
							<a href=""><img src="../image/image-<%=t %>.gif<%--item.getImg() --%>" width="70px" height="70px"/></a>
						</td>
						<td class="product">
							<a href="" >
								<strong>상품명</strong>
							</a>
							<ul class="xans-element- xans-myshop xans-myshop-optionall option">
								<il class="xans-record-">
									<strong class="displaynone"><%=item.getName() %></strong>
									"옵션"
									<span class="displaynone"><%=item.getQty() %>개</span><br>
								</il>
							</ul>
						</td>
						<td class="price">
							<strong><%=item.getPrice() %>원</strong>
						</td>
						
						<td class="mileage">
							<img src="../image/적립.gif" class="icon_img" alt="적립금"/>
								<%=item.getPoint() %>원
						</td>
							
						<td class="delivery">
							기본배송
							<div class="displayone">(해외배송가능)</div>
						</td>
						<td>
							<span>2,500원<br></span>
							조건
						</td>
						<td class="total">22,500원</td>
						<td class="button">
							<a href="" onclick="">
								<img src="../image/주문하기.jpg" alt="주문하기"/>
							</a>
							<a href="" onclick="">
								<img src="../image/장바구니담기.jpg" alt="장바구니담기"/>
							</a>
							<a href="" onclick="">
								<img src="../image/관심삭제하기.jpg" alt="삭제"/>
							</a>
						</td>
					</tr>
						<%} %>
						
					
				</tbody>
			</table>
			<%} else { %>
			<p class="empty">관심상품 목록이 없습니다.</p>
			<%} %>
		</div>
		
		<div class="xans-element- xans-myshop xans-myshop-wishlistbutton xans-record-">
			<span class="left">
				<strong class="ctrlTxt">선택상품을</strong>
				<a href="" onclick=";'">
					<img src="../image/삭제하기.jpg" alt="삭제하기" >
				</a>
				
				<a href="" onclick=";'">
					<img src="../image/장바구니.jpg" alt="장바구니" >
				</a>
			</span>
			
			<a href="" onclick="();">
				<img src="../image/전체상품주문2.jpg" alt="상품주문" >
			</a>
			
			<a href="" onclick="();">
				<img src="../image/관심상품비우기2.jpg" alt="상품비우기" >
			</a>
			
			
			
			
		</div>
		
		
		
		
	</div>
</div>
</body>


<script type="text/javascript">
	function checkall(){
		var allck = document.getElementById("groupCheckbox");
		var ck = document.getElementsByName("groupCheckbox");
		
		if(allck.checked){
			for(var i = 0 ; i < ck.length;i++){
				ck[i].checked = true;
			} 
		} else {
			for(var i = 0 ; i < ck.length;i++){
				ck[i].checked = false;
			} 
		}
		
	}
</script>  
</html>
    