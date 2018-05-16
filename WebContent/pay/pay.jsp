<%@page import="semi.vo.CartItem"%>
<%@page import="semi.dao.ProductDao"%>
<%@page import="semi.vo.ShippingClass"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="semi.vo.PointDetail"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="semi.vo.ProductDetail"%>
<%@page import="semi.dao.CustomerDao"%>
<%@page import="semi.vo.Customer"%>
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
</head>
<style>
.main-title {
    text-align: center;
}
.container1 {
    width: 1000px;
    min-height: 500px;
    margin: 0px auto 100px;
    float: none;
    min-width: 1000px !important;
}
.title h2 {
	font-family: 'Open Sans','맑은 고딕';
    letter-spacing: 0.07em;
    font-weight: 600;
    text-transform: uppercase;
    font-size: 13px;
    color: #555;
    text-align: center;
    margin: 10px auto 15px;
}
.title p {
    margin: 0 0 0 0px;
    color: #777;
    font-family: "Malgun Gothic";
    text-align: center;
    font-size: 11px;
}
.bankBenefit h3 {
    position: absolute;
    left: 0;
    top: 0;
    width: 105px;
    height: 100%;
    color: #555;
    font-size: 11px;
    text-align: center;
    margin-top: 30px;
}
.bankBenefit {
    position: relative;
    margin: 20px 0;
    padding: 10px 5px 10px 105px;
    border: 1px solid #ccc;
    color: #555;
    line-height: 1.5;
    font-family: '맑은 고딕';
}
.bankBenefit-info {
    padding: 0 0 0 15px;
    border-left: 1px solid #ccc;
    font-size: 12px;
}
.info {
    padding: 0;
	font-size: 12px;
}
a {
	text-decoration: none;
	color: #000;
}
.bankBenefit .info .mileage {
    margin: 6px 0 0;
    padding: 6px 0 0;
    border-top: 1px solid #ccc;
    font-size: 11px;
}
.bankBenefit-info .mileage p {
    border-top: 1px solid #ccc;
    border-bottom: 0px solid #e9e9e9;
    padding: 9px 10px 2px 0;
    font-size: 11px;
}
.mi1 {
    margin: 0 0 0;
    padding: 0 0 0;
    font-size: 11px;
}
.controlInfo {
    padding: 10px 0 8px 0;
    color: #888;
    font-size: 11px;
    line-height: 1.5;
}
li {
    list-style: none;
}
.boardList {
    margin: 0 0 1px;
    color: #353535;
    line-height: 1.5;
    font-family: '맑은 고딕';
}

.thead boardList {
    display: table-header-group;
    vertical-align: middle;
    border-color: inherit;
}
.tr boardList {
    display: table-row;
    vertical-align: inherit;
    border-color: inherit;
}
.boardList .chk {
    width: 27px;
}
.boardList td {
    padding: 8px 0 5px;
    text-align: center;
    vertical-align: middle;
    font-size: 11px;
    color: #555;
}
.boardList td.thumb img {
    width: 80px;
}
.boardList td.mileage, .boardList td.delivery {
    color: #757575;
}
.boardList td.product {
    padding-left: 10px;
    text-align: left;
}
.boardList .product {
    width: auto;
}
.boardList .price {
    width: 95px;
}
.boardList .quantity {
    width: 40px;
}
.boardList .mileage {
    width: 85px;
}
.boardList .delivery {
    width: 90px;
}
.boardList .charge {
    width: 70px;
}
.boardList .total {
    width: 90px;
}
.boardList th {
    padding: 4px 0 5px;
    font-weight: normal;
    border-top: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
    font-size: 11px;
    color: #555;
    text-align: center;
}
th, td {
    border: 0;
}
table {
    width: 100%;
    border: 0;
    border-spacing: 0;
    border-collapse: collapse;
}
.table boardList, .table boardWrite, .table totalarea {
    display: table;
    border-spacing: 2px;
    border-color: grey;
}
.title h3 {
    color: #555;
    font-size: 11px;
    font-weight: bold;
    margin: 40px 0 10px 0;
    font-family: '맑은 고딕';
    
}
.boardList tfoot {
    display: table-footer-group;
    vertical-align: middle;
    border-color: inherit;
}
.boardList tfoot td {
    padding: 13px 10px 15px;
    text-align: right;
    border-top: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
    font-size: 11px;
    color: #555;
}
.boardList tfoot td .type {
    float: left;
    margin: 6px 0 0;
    font-weight: normal;
}
.strong total {
    font-weight: bold;
}
.boardList tfoot td .total span {
    font-size: 17px;
    letter-spacing: -1px;
}
.btnArea .ctrlTxt {
    margin: 0 6px 0 10px;
    color: #353535;
    line-height: 24px;
    font: 0.9em Verdana,Dotum,AppleGothic,sans-serif;
    font-weight: bold;
}
.btnArea {
    overflow: hidden;
}
.orderArea title, .totalarea title {
    margin-top: 30px;
    margin: 40px 0 0 0;
    font-family: '맑은 고딕';
    padding: 0;
}

.orderArea .required {
    margin: -30px 0 10px 0;
    color: #8C8C8C;
    text-align: right;
    font-size: 11px;
}
.boardWrite {
    border-top: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
    font-size: 11px;
}
.boardWrite th {
    width: 120px;
    padding: 17px 0 9px 19px;
    font-weight: normal;
    text-align: left;
    vertical-align: top;
}
.boardWrite td {
    padding: 8px 0 7px 19px;
}
.boardWrite input {
    height: 24px;
    padding: 0 0 0 9px;
    border: 1px solid #ccc;
    line-height: 22px;
    margin: 5px 4px 0;
    vertical-align: middle;
    
}
.boardWrite img {
    vertical-align: middle;
    opacity: 0.5;
}
.boardWrite .address label {
    padding: 0 30px 0 0;
    font-weight: 400 ;
}
#ophone1_1, #ophone2_1, #rphone1_1, #rphone2_1, #cashreceipt_user_mobile1 {
    width: 60px;
}
.boardWrite select {
    margin: 4px 4px 0 4px;
    height: 24px;
    border: 1px solid #d5d5d5;
    font-size: 100%;
    font-family: "돋움",Dotum;
    color: #353535;
    vertical-align: middle;
}
.ophone select {
    width: 60px;
}
.ozipcode1 img, .rzipcode1 img {
	margin: 5px 4px 0;
}
.omessage textarea {
    width: 550px;
    height: 60px;
    padding: 5px 6px;
    border: 1px solid #d5d5d5;
    line-height: 1.5;
    margin-left: 4px;
}
.totalArea .summary {
    border: 1px solid #ccc;
}
.totalArea .summary th {
    height: 39px;
    border-left: 1px solid #ccc;
    line-height: 39px;
    font-size: 11px;
    color: #555;
}
.total th, .total1 div {
	text-align: center;
}
.total img {
    margin: 0 0 0 0;
    vertical-align: middle;
}
.totalArea td {
    height: 58px;
    border-top: 1px solid #ccc;
    border-left: 1px solid #ccc;
    text-align: center;
    font-size: 14px;
}
.totalArea .detail {
    border: 1px solid #d7d5d5;
}
.totalArea .detail th {
    border-top: 1px solid #e9e9e9;
    text-align: left;
    width: 150px;
    padding: 11px 0 10px 20px;
    font-size: 12px !important;
    height:30px !important;
    vertical-align: top;
}
.totalArea .detail .total th, .totalArea .detail .total td {
    font-weight: bold;
    background: #f7f7f7;
}
.totalArea .detail .total th {
    font-weight: bold;
    background: #f7f7f7;
}
.totalArea .detail .total td {
    border-left: 1px solid #e9e9e9;
    height: 40px;
}
.totalArea .detail .option .total td {
    border-left: 1px solid #e9e9e9;
}
.totalArea .detail .option td {
    border-left: 0;
}

.totalArea .detail td {
    padding: 8px 0 8px 10px;
    border-left: 1px solid #e9e9e9;
    border-top: 1px solid #e9e9e9;
    vertical-align: middle;
    text-align: left;
}
.totalArea .summary th:first-child, .totalArea .summary td:first-child {
    border-left: 0;
}
.totalArea {
    color: #353535;
    line-height: 1.5;
}
.payArea .method {
    padding: 17px 20px 20px;
    font-weight: bold;
    url(http://img.echosting.cafe24.com/skin/base_ko_KR/order/bg_payment_method.gif) repeat-x 0 100%;
    background-image: url(http://img.echosting.cafe24.com/skin/base_ko_KR/order/bg_payment_method.gif);
    background-position-x: 0px;
    background-position-y: 100%;
    background-size: initial;
    background-repeat-x: repeat;
    background-repeat-y: no-repeat;
    background-attachment: initial;
    background-origin: initial;
    background-clip: initial;
    background-color: initial;
}
.ec-base-label {
    display: inline-block;
    margin-right: 5px;
    font-size: 12px;
}
.payArea {
    overflow: hidden;
    padding: 0 241px 0 0;
    border: 1px solid #ccc;
    color: #555;
    line-height: 1.5;
}
input[type=radio], input[type=checkbox] {
    width: 13px;
    height: 13px;
    margin: 0 5px 0 0;
    padding: 0;
    border: 0;
    vertical-align: middle;
}
.payArea .method label {
    padding: 0 30px 0 0;
}
.payArea .info {
    padding: 15px 20px;
    font-size: 11px;
}
.payArea .info .payHelp {
    margin: 0 0 0 130px;
}
.payArea .info .payHelp p {
    margin: 5px 0 0;
}
.payArea .total {
    float: right;
    width: 240px;
    margin: 0 -241px 0 0;
    text-align: right;
    border-left: 1px solid #ccc;
}
.payArea .total h4 {
    margin: 17px 10px 0 0;
    color: #353535;
    font-size: 12px;
}
.payArea .total h4 span {
    font-weight: normal;
}
.payArea .total .price {
    margin: 20px 10px 0 0;
    color: #555;
    font-size: 14px;
}
.payArea .total .price input {
    width: 200px;
    height: auto;
    padding: 0;
    border: 0;
    color: #555;
    font-size: 28px;
    font-weight: bold;
    font-family: verdana,sans-serif;
    letter-spacing: -1px;
    line-height: normal;
}
.payArea .total .button {
    margin: 16px 11px;
    text-align: center;
    opacity: 0.4;
}
.payArea .total .mileage {
    border-top: 1px solid #ccc;
    <%--border-bottom: 1px solid #ccc;--%>
}
.mileage p {
    overflow: hidden;
    padding: 11px 10px 10px 0;
    border-bottom: 1px solid #e9e9e9;
    font: 0.75em Verdana,Dotum,AppleGothic,sans-serif;
    font-size: 12px;
    margin-bottom: 0;
}

.payArea .total .mileage strong {
    float: left;
    width: 105px;
    text-align: right;
    word-spacing: -1px;
}
.payArea .total .mileage p span {
    color: #555;
    font-weight: bold;
}
.payArea .total .mileage span {
    float: right;
    width: 110px;
    word-wrap: break-word;
    word-break: break-all;
}
.payArea .total .mileage ul {
    padding: 10px 10px 9px 0;
    line-height: 25px !important;
    font: 0.75em Verdana,Dotum,AppleGothic,sans-serif;
    font-size: 12px;
    margin-bottom: 0;
}
.payArea .total .mileage li {
    overflow: hidden;
}
.payArea .total .mileage li strong {
    font-weight: normal;
}
#input_mile,  #either_input_mile, #input_deposit {
    width: 190px;
    padding: 0 9px 0 0;
    text-align: right;
    font-weight: bold;
}
.totalArea .detail .point {
    color: #ff8b55;
}
.totalArea .detail .info li {
    padding: 0 0 0 9px;
    background: url(http://img.echosting.cafe24.com/skin/base_ko_KR/order/ico_grid2.gif) no-repeat 0 7px;
}
.freeInfo {
    margin: 40px 0 -30px;
    padding: 17px 0 16px 0px;
    color: #555;
    line-height: 18px;
}
.freeInfo h3 {
    margin: 0 0 3px;
    color: #555;
    font-size: 12px;
    font-weight: 700 !important;
}
.freeInfo p {
    font-size: 13px;
}
.help {
    margin: 100px 0 0;
    line-height: 18px;
    font-family: "Malgun Gothic";
}
.help h3 {
    padding: 9px 0 6px 0;
    color: #555;
    font-size: 12px;
}
.help .content {
    padding: 0 0px 11px;
}
.help .content h4 {
    margin: 22px 0 -4px;
    color: #333;
    font-size: 12px;
    font-weight: bold;
}
.help .content ul {
    margin: 15px 0 0 0px;
    padding: 0px;
}
.help .content li {
    color: #777;
    font-size: 12px;
}

.boardWrite div.grid, .boardWrite p.grid {
    margin: 7px 0 0;
}
.totalDetail {
    display: none;
    position: absolute;
    z-index: 100;
    width: 300px;
    color: #757575;
}
.totalDetail h3 {
    height: 35px;
    padding: 0 35px 0 19px;
    color: #fff;
    font-size: 14px;
    line-height: 35px;
    background: #495164;
    font-family: Verdana,Dotum,AppleGothic,sans-serif;
    font-weight: 700;
}
.totalDetail .content {
    padding: 20px;
    border: 1px solid #757575;
    border-top: 0;
    background: #fff;
}
.totalDetail .content p {
    color: #555;
    font-size: 16px;
    font-weight: bold;
    text-align: right;
    font-family: Verdana, Dotum, AppleGothic, sans-serif;
}
.totalDetail .content ul {
    line-height: 25px;
}
.totalDetail .content li:first-child {
    margin: 8px 0 0;
    padding-top: 6px;
    border-top: 1px dotted #b0b1b3;
    background-position: 0 16px;
}
.totalDetail .content li {
    overflow: hidden;
    padding: 0 0 0 6px;
    background: url(http://img.echosting.cafe24.com/skin/base_ko_KR/common/ico_info2.gif) no-repeat 0 10px;
    font-family: Verdana,Dotum,AppleGothic,sans-serif;
    font-size: 12px;
}
.totalDetail .content li strong {
    float: left;
    font-weight: normal;
}
.totalDetail .content li span {
    float: right;
}
.totalDetail .close {
    position: absolute;
    right: 20px;
    top: 10px;
}
.totalDetail .close img {
    cursor: pointer;
}
.boardList td .discount strong {
    font-weight: normal;
    text-decoration: line-through;
}
#btn_product_delete, #btn_shipp_addr {
	margin: 0;
	padding: 0;
    text-align: center;
    border: 0;
    background-color: rgba(255,255,255,.15);
}
</style>
<body>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample6_address').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('sample6_address2').focus();
            }
        }).open();
    }
</script>
<%@ include file="/include/uppermost-nav.jsp" %>
<div class="container1" id="id-main-contents">
	<div class="title" align="center" style="margin-bottom: 60px;">
		<div align="center" style="height:200px;"></div>
		<h2 class="title" style="margin-top: 160px; ">Order</h2>
		<p> 주문서 작성</p>
	</div>
	<!-- 혜택정보 -->
	<div class="bankBenefit">
		<h3>
		<%
			if(loggedInUser == null){
				response.sendRedirect("/semi/index.jsp");
			}
			
			ProductDao productDao = ProductDao.getInstance();
			CustomerDao customerDao = CustomerDao.getInstance();
			
			List<CartItem> cartItems = customerDao.getCartItemsByCustomerNo(loggedInUser.getNo());
			PointDetail pointDetail = new PointDetail();
			DecimalFormat df = new DecimalFormat("#,###.###");
		%>
			<strong>
				<span>혜택정보</span>
			</strong>
		</h3>
		<div class="bankBenefit-info">
			<div class="member">
				<p>
					<strong><%=loggedInUser.getName() %></strong>
					님은, [<%=loggedInUser.getGrade() %>] 회원이십니다.
				</p>
			</div>
			<div class="mileage">
				<p class="mi1" style="height: 27px;">
					<a href="">가용적립금:  
						<strong><%=df.format(loggedInUser.getPoint()) %>원</strong>
					</a> 
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<!--  <a href="">쿠폰: 
						<strong>(ex.0)개</strong>
					</a>-->
				</p>
			</div>
		</div>
	</div>
	<div>
		<ul class="controlInfo">
			<li>- 상품의 옵션 및 수량 변경은 상품상세 또는 장바구니에서 가능합니다.</li>
			<!-- <li>할인 적용 금액은 주문서 작성의 결제예정금액에서 확인 가능합니다.</li> -->
		</ul>
	</div>
	
	<!-- 국내배송상품 주문내역 -->
	<div class="orderListArea">
		<div class="title">
			<h3>국내배송상품 주문내역</h3>
		</div>
		<!-- 기본배송 -->
		<div class="boardList">
			<form name="list-form" id="zzzz"  method="post" action="addorder.jsp">
			<input type="hidden" name="use-point" id="pointinput-use" >
			<input type="hidden" name="save-point" id="pointinput-save" >
			<table border="1" class="boardList" id="boardListTotal">
				<thead class="boardList">
					<tr class="boardList">
						<th scope="col" class="chk"><input id="allCheck" type="checkbox" onclick="goAllCheck();"></th>
						<th scope="col" class="thumb">이미지</th>
						<th scope="col" class="product">상품정보</th>
						<th scope="col" class="price">판매가</th>
						<th scope="col" class="quantity">수량</th>
						<th scope="col" class="mileage">적립금</th>
						<th scope="col" class="delivery">배송구분</th>
						<th scope="col" class="charge">배송비</th>
						<th scope="col" class="total">합계</th>
					</tr>
				</thead>
			
				<tbody class="xans-element- xans-order xans-order-normallist">
				<%
					int paymentPrice = 0;
					int paymentDiscount = 0;
					int paymentMileage = 0;
					
					//for(int i=0; i<proNos.length; i++) {
						//int proNo = Integer.parseInt(proNos[i]);
						//int qtyNo = Integer.parseInt(proQtys[i]);
						
					for(CartItem cartItem : cartItems) {
						//ProductDetail productDetail = productDao.getProductByNumber(proNo).get(0);
				%>
					<tr class="xans-record-" id="row_<%=cartItem.getNo() %>">
						<td class="chk"><input name="chk" value="<%=cartItem.getNo() %>" type="checkbox" onchange="carcul();" id="check-zzzz-<%=cartItem.getNo() %>"  /></td>
                        <td class="thumb"style="width: 100px;"><a href="/semi/product/detail.jsp?pro-no=<%=cartItem.getNo() %>"><img src="/semi/images/products/<%=cartItem.getImg() %>" alt=""/></a></td>
                        <td class="product">
                            <a href="/semi/product/detail.jsp?pro-no=<%=cartItem.getNo() %>"><strong><%=cartItem.getName() %></strong></a>
                            <div class="option ">[옵션: <%=cartItem.getColor() %>/<%=cartItem.getProSize() %>]</div>
                        </td>
                        <td class="price" style="padding-top: 17px;">
                            <div class="discount" id="originalPriceDiv-<%=cartItem.getNo() %>" style="display: inline;" >
								<strong><span class="prices"  id="originalPrice-<%=cartItem.getNo() %>"><%=df.format(cartItem.getPrice()) %></span></strong>원<p class="displaynone"></p>
							</div>
                            
                            <div class="displaynone" >
								<strong id="discountPrice-<%=cartItem.getNo() %>"><%=df.format(cartItem.getPrice()-cartItem.getPrice()*cartItem.getDiscount()/100) %></strong><strong>원</strong><p class="displaynone"></p>
							</div>
                        </td>
                        <td class="quantity" id="quantity-<%=cartItem.getNo() %>"><%=cartItem.getQty() %></td>
                        <td class="mileage"><input id='product_mileage_all_14082_000A' name='product_mileage_all' value='200' type="hidden" ><img src="//img.echosting.cafe24.com/design/common/icon_cash.gif" style="margin-right: 2px;"/><span id="mileage-<%=cartItem.getNo() %>"><%=cartItem.getPoint()*cartItem.getQty() %></span>원</td>
                        <td class="delivery">기본배송<!-- <div class="displaynone">(해외배송가능)</div> -->
						</td>
                        <td class="charge">[조건]</td>
                        <td class="total">
						<strong id="total-<%=cartItem.getNo() %>"><%=df.format((cartItem.getPrice()-cartItem.getPrice()*cartItem.getDiscount()/100)*cartItem.getQty()) %></strong><div class="displaynone"></div>
						</td>
					</tr>
				<%
					paymentPrice += cartItem.getPrice()*cartItem.getQty();
					paymentDiscount += cartItem.getPrice()*cartItem.getQty()*cartItem.getDiscount()/100;
					paymentMileage += cartItem.getPoint()*cartItem.getQty();
					}
				%>
				</tbody>
				<tfoot class="boardList">
					<tr class="boardList">
						<td colspan="9">
							<strong class="type">[기본배송]</strong>상품구매금액<strong><span id="boardListTotal-span"><%=df.format(paymentPrice) %></span></strong>&nbsp;+ 배송비&nbsp;2,500 -   상품할인금액 <span id="totaldiscount"><%=df.format(paymentDiscount) %></span>	= 합계 : 
							<strong class="total">
								<span id="domestic_ship_fee_sum">&nbsp;&nbsp;&nbsp;<%=df.format(paymentPrice-paymentDiscount+2500) %></span>원
							</strong>
						</td>							
					</tr>
				</tfoot>
			</table>
		</form>
		
		</div>
	</div>
	<ul class="controlInfo typeBtm">
		<li>- 상품의 옵션 및 수량 변경은 상품상세 또는 장바구니에서 가능합니다.</li>
	</ul>
	<!-- 선택상품 제어 버튼 -->
	<div class="btnArea">
		<span class="left">
			<strong class="ctrlTxt">선택상품을</strong>
			<button id="btn_product_delete">
				<img src="http://img.echosting.cafe24.com/skin/base_ko_KR/order/btn_delete2.gif" alt="삭제하기" onclick="deleteTd();" />
			</button>
		</span>
	</div>
	<form name="order_form">
	<!-- 주문자 정보 -->
	<div class="orderArea">
		<div class="title">
			<h3>주문자 정보</h3>
			<p class="required"><img src="http://img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif" alt="필수"/> 필수입력사항</p>
		</div>
		<div class="boardWrite">
			<table border="1" class="boardWrite">
				<tbody class="address_form">
					<tr>
						<th scope="row">주문하시는 분<img src="http://img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif" alt="필수"/></th>
						<td>
							<input id="oname" name="oname" class="inputTypeText" placeholder="" size="15" type="text" value="<%=loggedInUser.getName() %>" >
						</td>
					</tr>
					<tr>
						<th scope="row">주소<img src="http://img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif" alt="필수"/></th>
						<td class="ozipcode1">
	                        <input type="text" id="opcode" placeholder="우편번호" name="cust-post-code" value="<%=loggedInUser.getPostcode() %>">
							<br>
							<input type="text" id="oaddr1" placeholder="주소" style="width: 300px;" name="cust-post-first" value="<%=loggedInUser.getFirstAddress() %>"></br>
							<input type="text" id="oaddr2" placeholder="상세주소" style="width: 500px;" name="cust-post-second" value="<%=loggedInUser.getSecondAddress() %>">
	                    </td>
					</tr>
	                <tr>
						<th scope="row">휴대전화<img src="http://img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif" alt="필수"/></th>
	                    	<td class="ophone">
	                    		<select id="ophone2_1" name="ophone2_[]">
									<option value="010">010</option>
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="017">017</option>
									<option value="018">018</option>
									<option value="019">019</option>
								</select>-<input id="ophone2_2" name="ophone2_[]" maxlength="4" size="4" value="<%=loggedInUser.getTel().substring(4, 8) %>" type="text"  />-<input id="ophone2_3" name="ophone2_[]" maxlength="4" size="4" type="text" value="<%=loggedInUser.getTel().substring(9, 13) %>" />
							</td>
	                </tr>
	                <tr>
	                	<th scope="row">이메일 <img src="http://img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif" alt="필수"/></th>
	                    	<td>
	                    	<form name="form1" method="post">
		                        <input onchange="sameEmail();" id="oemail1" name="oemail1" value="<%=loggedInUser.getEmail().substring(0, loggedInUser.getEmail().indexOf("@")) %>" type="text"  />@<input id="oemail2" name="oemail2" readonly="readOnly" type="text" value="<%=loggedInUser.getEmail().substring(loggedInUser.getEmail().indexOf("@")+1) %>" />
		                        <select onchange="changeMails();" id="oemail3" name="oemail3" >
									<option value="" selected="selected">- 이메일 선택 -</option>
									<option value="naver.com">naver.com</option>
									<option value="daum.net">daum.net</option>
									<option value="nate.com">nate.com</option>
									<option value="hotmail.com">hotmail.com</option>
									<option value="yahoo.com">yahoo.com</option>
									<option value="empas.com">empas.com</option>
									<option value="korea.com">korea.com</option>
									<option value="dreamwiz.com">dreamwiz.com</option>
									<option value="gmail.com">gmail.com</option>
									<option value="etc">직접입력</option>
								</select>   
							</form>                     
							<p class="grid">이메일을 통해 주문처리과정을 보내드립니다.<br/>이메일 주소란에는 반드시 수신가능한 이메일주소를 입력해 주세요.</p>
	                    </td>
	                </tr>
				</tbody>
			</table>
		</div>
	</div>
	<!-- 국내 배송지 정보 -->
	<Form id="orderAreaForm">
		<div class="orderArea ">
		    <div class="title">
		         <h3>배송지 정보</h3>
		            <p class="required"><img src="http://img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif" alt="필수"/> 필수입력사항</p>
		    </div>
		    <div class="boardWrite">
		         <table border="1" summary="" class="boardWrite">
		            <tbody>
						<tr>
							<th scope="row">배송지 선택</th>
		                    	<td>
		                        	<div class="address">
		                           		<input id="sameaddr0" name="sameaddr" value="T" type="radio" onclick="same2m_info();" /><label for="sameaddr0" >주문자 정보와 동일</label>
										<input id="sameaddr1" name="sameaddr" value="F" type="radio" onclick="same3m_info();" /><label for="sameaddr1" >새로운 배송지</label>                            
										<button id="btn_shipp_addr" class=""><img src="http://img.echosting.cafe24.com/skin/base_ko_KR/order/btn_address.gif" alt="주소록 보기" onclick="goAddressList(event);" /></button>
		                       		</div>
		                    	</td>
		                </tr>
						<tr>
							<th scope="row">받으시는 분 <img src="http://img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif" alt="필수"/></th>
		                    <td>
		                    	<input id="rname" name="rname" class="inputTypeText" placeholder="" size="15" value="" type="text"  />
		                    </td>
		                </tr>
						<tr>
							<th scope="row">주소 <img src="http://img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif" alt="필수" /></th>
			                    <td class="rzipcode1">
			                <input type="text" id="sample6_postcode" placeholder="우편번호" name="rcv-post-code">
							<img src="/semi/images/ksj/btn_zipcode.gif" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
							<input type="text" id="sample6_address" placeholder="주소" style="width: 300px;" name="rcv-post-first"></br>
							<input type="text" id="sample6_address2" placeholder="상세주소" style="width: 500px;" name="rcv-post-second">
			                    </td>
		                </tr>
						<tr>
							<th scope="row">휴대전화<img src="http://img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif" alt="필수"/></th>
		                    	<td>
		                    		<select id="rphone2_1" name="rphone2_[]" >
										<option value="010">010</option>
										<option value="011">011</option>
										<option value="016">016</option>
										<option value="017">017</option>
										<option value="018">018</option>
										<option value="019">019</option>
									</select>-<input id="rphone2_2" name="rphone2_[]" maxlength="4" size="4" value="" type="text"  />-<input id="rphone2_3" name="rphone2_[]" maxlength="4" size="4" value="" type="text"  />
								</td>
		                </tr>
						<!-- <tr>
							<th scope="row">배송메시지</th>
		                   		<td class="omessage">
		                        	<textarea id="omessage" name="omessage" fw-filter="" fw-label="배송 메세지" fw-msg="" maxlength="255" cols="70" ></textarea>                        
		                    	</td>
		                </tr> -->
				</tbody>
			</table>
		</div>
    </div>
    </form>
    </Form>
    
    <!-- 결제 예정 금액 -->
    <div class="totalArea">
	    <div class="title">
	        <h3>결제 예정 금액</h3>
	    </div>
        <div class="summary">
            <table border="1" summary="" class="totalArea">
            	<thead>
            		<tr class="total">
						<th scope="col" >
							<span>총 주문 금액</span><img src="http://img.echosting.cafe24.com/skin/base_ko_KR/order/btn_list.gif" alt="내역보기" style="margin-left: 10px;" onclick="fn2(event)" />
						</th>
                    	<th scope="col" class="">
							<span>총 </span><span id="total_addsale_text" class="">할인</span><span id="plus_mark" class=""> + </span><span id="total_addpay_text" class="">부가결제</span><span> 금액</span>
						</th>
                	    <th scope="col">총 결제예정 금액</th>
                	</tr>
                </thead>
				<tbody>
					<tr class="total1">
						<td class="price">
							<div class="box">
								<strong id="total_order_price_view"><%=df.format(paymentPrice+2500) %></strong>원 
							</div>
						</td>
                   		<td class="option ">
                   			<div class="box">
								<strong>-</strong>
								<strong id="total_sale_price_view"><%=df.format(paymentDiscount) %></strong>원 
							</div>
						</td>
                    	<td class="total">
                    		<div class="box">
								<strong>=</strong>
								<strong id="total_order_sale_price_view"><%=df.format(paymentPrice-paymentDiscount+2500) %></strong>원
							</div>
						</td>
                	</tr>
               </tbody>
			</table>
		</div>
		<div class="detail">
             <div class="">
                <table border="1" summary="" class="discountarea">
	                <tbody>
						<tr class="total">
							<th scope="row">총 할인금액</th>
                        		<td><strong id="total_addsale_price_view"><%=df.format(paymentDiscount) %></strong>원</td>
                    	</tr>
                    </tbody>
                </table>
             </div>
             <div class="">
                <table border="1" summary="" class="option">
                	<tbody>
                		<tr class="total">
							<th scope="row">총 부가결제금액</th>
                       			<td><strong id="total_addpay_price_view" >0</strong>원</td>
                    	</tr>
                    </tbody>
	             <!-- 적립금 -->
	            	<tbody class="">
	            			<tr><th scope="row">적립금</th>
	                      			<td>
	                           			<p><input id="input_mile" name="input_mile" class="inputTypeText" size="10" value="0" type="text" onchange="changeMile();" /> 원 (총 사용가능 적립금 : <strong class="point" ><%=df.format(loggedInUser.getPoint()) %></strong>원)</p>
	                           				<ul class="info">
												<li>적립금은 최소 0 이상일 때 결제가 가능합니다.</li>
			                               	 	<li id="mileage_max_unlimit" class="">최대 사용금액은 제한이 없습니다.</li>
			                               		<li>적립금으로만 결제할 경우, 결제금액이 0으로 보여지는 것은 정상이며 [결제하기] 버튼을 누르면 주문이 완료됩니다.</li>
			                            	</ul>
									</td>
	                  		 </tr>
	               </tbody>
                </table>
             </div>
        </div>
     </div>
        <!-- 결제수단 -->
		<div class="title">
       		<h3>결제수단</h3>
    	</div>
		<div class="payArea">
        	<div class="payment">
	                 <!-- 최종결제금액 -->
	       	<div class="total">
	            <h4><strong id="current_pay_name">카드 결제</strong> <span>최종결제 금액</span></h4>
	            	<p class="price"><span></span><input id="total_price" name="total_price" class="inputTypeText" placeholder="" style="text-align:right;ime-mode:disabled;clear:none;border:0px;float:none;" size="10" readonly="1" value="<%=df.format(paymentPrice-paymentDiscount+2500) %>" type="text"  /><span style="width: 15px;padding-left: 4px;">원</span></p>
	           			<p class="paymentAgree" id="chk_purchase_agreement" style="display: none;"><input id="chk_purchase_agreement0" name="chk_purchase_agreement" value="T" type="checkbox"  /><label for="chk_purchase_agreement0" >결제정보를 확인하였으며, 구매진행에 동의합니다.</label></p>
	            			<div class="button"><a href="#"><img src="http://img.echosting.cafe24.com/skin/base_ko_KR/order/btn_payment.gif" id="btn_payment" alt="결제하기" onclick="gopayment(event);"/></a></div>
	            			<div class="mileage">
	                			<p><strong>총 적립예정금액</strong><span style="width: 16px;padding-right: 1px;padding-left: 0px;">원</span><span id="mAllMileageSum" style="width: 100px;"><%=df.format(paymentMileage) %></span></p>
			                		<%--<ul>
										<li>
											<strong>상품별 적립금</strong><span id="mProductMileage"><%=df.format(paymentMileage) %></span>
										</li>
										<li>
											<strong>회원 적립금</strong><span id="mMemberMileage">0</span>
										</li>
										<li>
											<strong>쿠폰 적립금</strong><span id="mCouponMileage">0</span>
										</li>
			                		</ul> --%>
							</div>
			</div>
           		<div class="method">
           			<span class="ec-base-label"><input id="addr_paymethod0" name="addr_paymethod" value="card" type="radio" checked="checked"  /><label for="addr_paymethod0" >카드 결제</label></span>
					<span class="ec-base-label"><input id="addr_paymethod1" name="addr_paymethod" value="cash" type="radio"  /><label for="addr_paymethod1" >무통장 입금</label></span>
					<span class="ec-base-label"><input id="addr_paymethod2" name="addr_paymethod" value="cell" type="radio"  /><label for="addr_paymethod2" >휴대폰 결제</label></span>
					<span class="ec-base-label"><input id="addr_paymethod3" name="addr_paymethod" value="tcash" type="radio"  /><label for="addr_paymethod3" >에스크로(실시간 계좌이체)</label></span>
				</div>
			<!-- 무통장입금, 카드결제, 휴대폰결제, 실시간계좌이체 -->
				<div class="info">
					<div id="pg_paymethod_info" class="payHelp">
	                    <p id="pg_paymethod_info_pg">소액 결제의 경우 PG사 정책에 따라 결제 금액 제한이 있을 수 있습니다.</p>
	                </div>
	            </div>
	        </div>
		</div>
		<!-- 무이자 할부 이용안내 -->
		<div class="freeInfo">
        	<h3>무이자 할부 이용안내</h3>
        		<p>무이자할부가 적용되지 않은 상품과 무이자할부가 가능한 상품을 동시에 구매할 경우 전체 주문 상품 금액에 대해 무이자할부가 적용되지 않습니다.<br/>무이자할부를 원하시는 경우 장바구니에서 무이자할부 상품만 선택하여 주문하여 주시기 바랍니다.</p>
   		 </div>
		<!-- 이용안내 -->
		<div class="help">
        	<h3>이용안내</h3>
        		<div class="content">
            		<h4>WindowXP 서비스팩2를 설치하신후 결제가 정상적인 단계로 처리되지 않는경우, 아래의 절차에 따라 해결하시기 바랍니다.</h4>
            			<ul>
							<li class="item1"><a href="javascript:;" onClick="window.open('http://service-api.echosting.cafe24.com/shop/notice_XP_ActiveX.html','','width=795,height=500,scrollbars=yes',resizable=1);">안심클릭 결제모듈이 설치되지 않은 경우 ActiveX 수동설치</a></li>
			                <li class="item2"><a href="http://www.microsoft.com/korea/windowsxp/sp2/default.asp" target="_blank">Service Pack 2에 대한 Microsoft사의 상세안내 </a></li>
			                <li class="item3"></li>
			            </ul>
		<!-- 크로스 브라우징 지원 -->
				<div class="displaynone">
	                <h4>아래의 쇼핑몰일 경우에는 모든 브라우저 사용이 가능합니다.</h4>
	                <ul>
						<li class="item1"><strong>KG이니시스, KCP, LG U+를 사용하는 쇼핑몰일 경우</strong></li>
	                    <li class="item2">결제가능브라우저 : 크롬,파이어폭스,사파리,오페라 브라우저에서 결제 가능<br/>(단, window os 사용자에 한하며 리눅스/mac os 사용자는 사용불가)</li>
	                    <li class="item3">최초 결제 시도시에는 플러그인을 추가 설치 후 반드시 브라우저 종료 후 재시작해야만 결제가 가능합니다.<br/>(무통장, 휴대폰결제 포함)</li>
	                </ul>
				</div>
        	</div>
    	</div>
    	<!-- 총 주문금액 상세내역 레이어 -->
		<div id="order_layer_detail" class="totalDetail" style="top: 1820px; left: 250px; display: none;">
			<h3 style="margin-top: 0px; margin-bottom: 0px; ">총 주문금액 상세내역</h3>
			<div class="content">
				<p id="total_order_price_id" style="margin-bottom: 0px;"><span id="total_order_price_span"><%=df.format(paymentPrice+2500) %></span>원</p>
				<ul style="padding-left: 0px;">
					<li>
						<strong>상품금액</strong>
						<span id="totalDetail-span1">원</span><span id="totalDetail-span"><%=df.format(paymentPrice) %></span>
					</li>
					<!-- 
					<li class="displaynone">
						<strong>부가세</strong>
						<span>원</span>
					</li>
					 -->
					<li>
						<strong>배송비</strong>
						<span id="total_ship_price_id">2,500원</span>
					</li>
					<li>
						<strong>지역별 배송비</strong>
						<span id="total_local_ship_price_id">0원</span>
					</li>
				</ul>
			</div>
			<div class="close" style="height: 16px;">
				<a href="#non3"  style="line-height: normal; font-size: 12px;">
					<img src="http://img.echosting.cafe24.com/skin/base_ko_KR/common/btn_close.png" alt="닫기" onclick="fn1()" style="margin-bottom: 15px; opacity: 100;">
				</a>
			</div>
		</div>
</div>
<%@ include file="/include/lowermost-footer.jsp" %>
</body>
<script>
<%-- 
	var ops = document.querySelectorAll('span[id^="originalPrice"]');
	var dps = document.querySelectorAll('strong[id^="discountPrice"]');
	
	for (var i=0; i<ops.length; i++) {
		
		var op = ops[i];
		var dp = dps[i];
		
		var no = op.id.replace("originalPrice-", "");
		
		if (op.innerHTML == dp.innerHTML) {
			document.getElementById("originalPriceDiv-"+no).style.display = "none";
		}
		
	}
--%>

	function carcul() {
			
		var form = document.getElementById("zzzz");
		var chkorders = document.querySelectorAll('input[name="chk"]');
		
		var sumtotal = 2500;
		var boardListTotal = 0;
		var totaldiscount = 0;
		var totalmileage = 0;
		
		for (var i=0; i<chkorders.length; i++) {
			
			var chkorder = chkorders[i];
			var no = chkorder.value;
			
			if (chkorder.checked == true) {
				
				var quantity = parseInt(document.getElementById("quantity-" + no).innerHTML);
				
				var total = parseInt(document.getElementById("total-" + no).innerHTML.replace(/,/g, ''));
				sumtotal += total;
				
				var originalPrice = parseInt(document.getElementById("originalPrice-" + no).innerHTML.replace(/,/g, ''));
				boardListTotal += originalPrice*quantity;
				
				var discountPrice = parseInt(document.getElementById("discountPrice-" + no).innerHTML.replace(/,/g, ''));
				totaldiscount += (originalPrice-discountPrice)*quantity;
				
				var mileage = parseInt(document.getElementById("mileage-" + no).innerHTML.replace(/,/g, ''));
				totalmileage += mileage;
				
			}
		}
		
		sumtotal = sumtotal.toLocaleString();
		document.getElementById("domestic_ship_fee_sum").innerHTML = sumtotal;
		
		boardListTotal1 = boardListTotal.toLocaleString();
		document.getElementById("boardListTotal-span").innerHTML = boardListTotal1;
		document.getElementById("totalDetail-span").innerHTML = boardListTotal1;
		
		totaldiscount = totaldiscount.toLocaleString();
		document.getElementById("totaldiscount").innerHTML = totaldiscount;
		document.getElementById("total_addsale_price_view").innerHTML = totaldiscount;
		
		bltsum = boardListTotal+2500
		
		bltsum = bltsum.toLocaleString();
		document.getElementById("total_order_price_view").innerHTML = bltsum;
		document.getElementById("total_order_price_span").innerHTML = bltsum;
		
		
		document.getElementById("mAllMileageSum").innerHTML = totalmileage;
		document.getElementById("mProductMileage").innerHTML = totalmileage + "원";
		
	}

	function goAllCheck() {
		var allChecked = document.getElementById("allCheck").checked;
		var chkorders = document.querySelectorAll('input[name="chk"]');
		
		for (var i=0; i<chkorders.length; i++) {
		
			var chkorder = chkorders[i];
			chkorder.checked = allChecked;
		}
	}

	function deleteTd() {
		
		var chkorders = document.querySelectorAll('input[name="chk"]');

		for (var i=0; i<chkorders.length; i++) {
			
			var chkorder = chkorders[i];

			var no = chkorder.value;
			
			if (chkorder.checked == true) {
				$("#row_" + no).remove()
			}
		}
	}
	
	function gopayment(event) {
		
		event.preventDefault();
		var rname = document.getElementById("rname");
		var sample6_postcode = document.getElementById("sample6_postcode");
		var raddress1 = document.getElementById("sample6_address");
		var raddress2 = document.getElementById("sample6_address2");
		var rtel2 = document.getElementById("rphone2_2");
		var rtel3 = document.getElementById("rphone2_3");
		
		var srname = rname.value;
		if (srname === "") {
			alert("받으시는 분을 입력하세요.");
			rname.focus();
			return;
		}
		
		var ssample6_postcode = sample6_postcode.value;
		if (ssample6_postcode === "") {
			alert("우편번호를 입력하세요");
			sample6_postcode.focus();
			return;
		}
		
		var sraddress1 = raddress1.value;
		if (sraddress1 === "") {
			alert("주소를 입력하세요");
			raddress1.focus();
			return;
		}
		
		var sraddress2 = raddress2.value;
		if (sraddress2 === "") {
			alert("상세주소를 입력하세요");
			raddress2.focus();
			return;
		}
		
		var srtel2 = rtel2.value;
		if (srtel2 === "") {
			alert("휴대전화번호를 입력하세요");
			rtel2.focus();
			return;
		}

		var srtel3 = rtel3.value;
		if (srtel3 === "") {
			alert("휴대전화번호를 입력하세요");
			rtel3.focus();
			return;
		}
		
		var form = document.getElementById("zzzz");
		var chkorders = document.querySelectorAll('input[name="chk"]');
		
		var isChecked  = false;
		for (var i=0; i<chkorders.length; i++) {
			
			var chkorder = chkorders[i];
			if (chkorder.checked) {
				isChecked = true;
			}
		}
		
		if (!isChecked) {
			alert("주문할 상품을 하나 이상 선택하세요");
			return;
		}
		
		for (var i=0; i<chkorders.length; i++) {
			
			var chkorder = chkorders[i];
			
			var no = chkorder.value;			
			if (chkorder.checked == false) {
				chkorder.disabled = true;
			}
		}
		
		
		document.getElementById("pointinput-use").value = document.getElementById("input_mile").value;
		document.getElementById("pointinput-save").value = document.getElementById("mAllMileageSum").innerHTML;
		
		form.submit();
	}
	
	function goAddressList(e) {
		e.preventDefault();
		window.open('/semi/pay/addressList.jsp',"주소목록창" , "width=800, height=470");
	}
	
	function fn1() {
		document.getElementById("order_layer_detail").style.display = 'none';
	}
	
	function fn2(event) {
		event.preventDefault();
		document.getElementById("order_layer_detail").style.display = 'block';
	}
	
	function changeMile() {
		
		var mile = document.getElementById("input_mile").value;
		
		if (mile == "") {
			document.getElementById("input_mile").value = "0";
			return ;
		}
		
		var salePrice = document.getElementById("total_sale_price_view");
		var addSalePrice = document.getElementById("total_addsale_price_view");
		
		var orderPrice = document.getElementById("total_order_sale_price_view");
		var totalPrice = document.getElementById("total_price");
		var totalOrderPrice = document.getElementById("total_order_price_view");
		
		if (mile > parseInt('<%=loggedInUser.getPoint() %>')) {
			alert('사용가능 적립금보다 많습니다. \n 적립금 사용금액을 다시 입력해 주세요.');
			document.getElementById("input_mile").value = "0";
			document.getElementById("total_addpay_price_view").innerHTML = "0";
			return;
		}
		document.getElementById("total_addpay_price_view").innerHTML = mile; // 총부가결제금액 변경
		
		var salePrice1 = parseInt(addSalePrice.innerHTML.replace(/,/g, '')) + parseInt(mile); // 총할인+부가결제금액
		var orderPrice1 = parseInt(totalOrderPrice.innerHTML.replace(/,/g, '')) - parseInt(salePrice1); // 총결제예정금액
		var totalPrice1 = parseInt(totalOrderPrice.innerHTML.replace(/,/g, '')) - parseInt(salePrice1); // 최종결제금액
		
		salePrice1 = salePrice1.toLocaleString();
		orderPrice1 = orderPrice1.toLocaleString();	
		totalPrice1 = totalPrice1.toLocaleString();	
		
		
		
		salePrice.innerHTML = salePrice1;	// 총할인+부가결제금액
		orderPrice.innerHTML = orderPrice1;	// 총결제예정금액
		totalPrice.value = totalPrice1;		// 최종결제금액
		
		
	}

	
	function changeMails() {
		
		var opt = document.getElementById("oemail3").value;
		
		if (opt == 'etc') {
			document.getElementById("oemail2").readOnly = false;
			document.getElementById("oemail2").value = "";	
			document.getElementById("oemail2").focus();
			
		} else {
			document.getElementById("oemail2").readOnly = true;
			document.getElementById("oemail2").value = document.getElementById("oemail3").value;	
			
		}
	}  

	function same2m_info() {
		
		document.getElementById("sameaddr0").value;
		
		document.getElementById("rname").value = document.getElementById("oname").value;
		document.getElementById("sample6_postcode").value = document.getElementById("opcode").value;
		document.getElementById("sample6_address").value = document.getElementById("oaddr1").value;
		document.getElementById("sample6_address2").value = document.getElementById("oaddr2").value;
		document.getElementById("rphone2_1").value = document.getElementById("ophone2_1").value;
		document.getElementById("rphone2_2").value = document.getElementById("ophone2_2").value;
		document.getElementById("rphone2_3").value = document.getElementById("ophone2_3").value;
		
	}
	function same3m_info() {
		
		document.getElementById("sameaddr1").value;
		
		document.getElementById("rname").value = "";
		document.getElementById("sample6_postcode").value = "";
		document.getElementById("sample6_address").value = "";
		document.getElementById("sample6_address2").value = "";
		document.getElementById("rphone2_1").value = "010";
		document.getElementById("rphone2_2").value = "";
		document.getElementById("rphone2_3").value = "";
	}
	


</script>
</html>