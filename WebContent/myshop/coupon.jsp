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
  	
  <style class="text/css">
	#container{
		width:1304px;
		min-height:600px;
		margin:0 auto;
	}
	
	.contents02 {
	    width: 1000px;
	    min-height: 500px;
	    margin: 100px auto 100px;
	}
	
	.titleArea {
    margin: 22px 0px 60px;
	}
	
	.titleArea h2{
		font-family:'Open sans', '맑은고딕';
		letter-spacing:0.07em;
		font-weight: 600;
		text-transform: uppercase;
		font-size: 13px;
	    color: #555;
	    text-align: center;
	    margin: 10px auto 15px;
	}
	
	.titleArea ul{
		padding: 5px 0;
	    color: #888;
	    line-height: 18px;
	}
	
	.titleArea ul li{
		text-align:center;
		padding: 3px 0 0;
    	font-size: 11px;
    	font-family: "Malgun Gothic";
	}
	
	li {
    	list-style: none;
	}
	form{
		display:0;
	}
	
	#frmSerialCoupon .title{
		    margin: 20px 0 10px 0px;
	}
	
	#frmSerialCoupon h3{
		color: #333;
    	font-size: 11px;
    	font-family: '맑은 고딕';
	}
	
	#frmSerialCoupon .title{
		color: #333;
    	font-size: 11px;
    	font-family: '맑은 고딕';
	}
	
	.couponSerial {
    padding: 20px;
    border: 1px solid #aaa;
    text-align: center;
	}
	
	legend {
	    visibility: hidden;
	    position: absolute;
	    left: -9999px;
	    top: -9999px;
	    width: 0;
	    height: 0;
	    line-height: 0;
	}
	
	#frmSerialCoupon .couponSerial .coupon_code input{
		padding: 0 6px;
	    height: 22px;
	    width: 340px;
	    font-size: 15px;
	    text-align: center;
	}
	
	#frmSerialCoupon .couponSerial p {
    padding: 10px 0 0;
    color: #555;
    font-size: 11px;
}

	#frmSerialCoupon .couponSerial{
        text-align: center;
}

input, select, textarea {
    font-size: 100%;
    font-family: "돋움",Dotum;
    color: #353535;
    vertical-align: middle;
}


.mypage-couponlist .title{
	overflow: hidden;
    margin: 40px 0 10px 3px;
    font-family: '맑은 고딕';
}

p {
    display: block;
    -webkit-margin-before: 1em;
    -webkit-margin-after: 1em;
    -webkit-margin-start: 0px;
    -webkit-margin-end: 0px;
}

.mypage-couponlist .titie p:first-child{
	float: left;
    color: #555;
    font-size: 11px;
    font-weight: bold;
}

 .mypage-couponlist .titie p:last-child{
    float: right;
    color: #555;
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



tr, th{
	border : 0;
	font-family: '맑은 고딕';
}

tr {
    display: table-row;
    vertical-align: inherit;
    border-color: inherit;
}
.mypage-couponlist .couponList table {
    table-layout: fixed;
    color: #555;
    line-height: 1.5;
}
.mypage-couponlist .couponlist {
    border-top: 1px solid #aaa;
    border-bottom: 1px solid #aaa;
    font-family: '맑은 고딕';
}
.mypage-couponlist .couponlist th {
    padding: 8px 0 6px;
    font-weight: normal;
    font-size: 11px;
}
.mypage-couponlist .couponlist .no{
	width : 45px;
}
.mypage-couponlist .couponlist .coupon{
	width : auto;
}
.mypage-couponlist .couponlist .product{
	width : 85px;
}
.mypage-couponlist .couponlist .price{
	width : 75px;
}
.mypage-couponlist .couponlist .payment{
	width : 150px;
}
.mypage-couponlist .couponlist .benefit{
	width : 100px;
}
.mypage-couponlist .couponlist .period{
	width : 150px;
}
.mypage-couponlist .couponlist td.empty {
    padding: 50px 0;
    text-align: center;
    font-weight: bold;
    color: #757575;
}

.mypage-couponlist .couponlist td {
    padding: 7px 0 4px;
    border-top: 1px solid #aaa;
    text-align: center;
    vertical-align: middle;
    font-size: 11px;
    border : 0;
}

html, body, div, dl, dt, dd, ul, ol, li, h1, h2, h3, h4, h5, h6, pre, code, form, fieldset, legend, input, textarea, p, blockquote, th, td, img {
    margin: 0;
    padding: 0;
}

a {
    text-decoration: none;
    color: #000;
}
a:-webkit-any-link {
    color: -webkit-link;
    cursor: pointer;
    text-decoration: underline;
}

.myshop-couponlistlaging img {
    vertical-align: top;
}


.myshop-couponlistlaging {
    margin: 30px 0;
    text-align: center;
}
.myshop-couponlistlaging img {
    vertical-align: top;
}

p {
    display: block;
    -webkit-margin-before: 1em;
    -webkit-margin-after: 1em;
    -webkit-margin-start: 0px;
    -webkit-margin-end: 0px;

}
.col-xs-6 p {
    display: inline-block;
    vertical-align: top;
}
  </style>
  
</head>
<body>
<%@ include file="/include/uppermost-nav.jsp" %>
	<div id="container">
		<div class="contents02">
			<div class="titleArea">
			<div style="height: 200px;"></div>
				<h2 style="margin-top: 100px;">MY COUPON</h2>
				<ul>
					<li>쿠폰인증번호 등록하기에서 쇼핑몰에서 발행한 종이쿠폰/시리얼쿠폰/모바일쿠폰 등의 인증번호를 등록하시면 온라인쿠폰으로 발급되어 사용이 가능합니다.</li>
					<li>쿠폰은 주문 시 1회에 한해 적용되며, 1회 사용 시 재 사용이 불가능합니다.</li>
					<li>특정한 종이쿠폰/시리얼쿠폰/모바일쿠폰의 경우 단 1회만 사용이 가능할 수 있습니다.</li>
				</ul>
			</div>
			
			<form id="frmSerialCoupon" action="" method="POST" enctype="multipart/form-data">
				<div>
					<div class="title">
						<h3>쿠폰인증번호 등록하기</h3>
					</div>
					<div class="couponSerial">
						<fieldset>
							<legend>쿠폰번호 등록</legend>
							<input id="coupon_code" name="coupon_code"  class="inputTyoeText"/>
							<a href="" ><img src="../images/mypage/쿠폰번호인증.jpg" alt="쿠폰번호 인증"></a>
							<p>반드시 쇼핑몰에서 발행한 쿠폰번호만 입력해주세요. (10~35자 일련번호 "-" 제외)</p>
							
						</fieldset>
					</div>
				</div>
			</form>
			
			
			<form id="frmCouponlist" name="frmCouponlist" action="" method="post" enctype="multipart/form-data">
				<div class="mypage-couponlist">
					<div class="title">
						<p>MY COUPON LIST</p>
						<p>사용가능 쿠폰 : 0장</p>
					</div>
					
					<div class="couponlist">
						<table border="1">
							<thead>
								<tr>
									<th class="no">번호</th>
									<th class="coupon">쿠폰명</th>
									<th class="product">쿠폰적용 상품</th>
									<th class="price">구매금액</th>
									<th class="payment">결제수단</th>
									<th class="benefit">쿠폰 혜택</th>
									<th class="period">사용가능 기간</th>
								</tr>
							</thead>
							<!--
							<tbody class="displayone">
							<tr>
								<td></td>
								<td class="coupon"><strong></strong></td>
								<td></td>
								<td></td>
								<td class="payment"></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td></td>
								<td class="coupon"><strong></strong></td>
								<td></td>
								<td></td>
								<td class="payment"></td>
								<td></td>
								<td></td>
							</tr>
							</tbody>
							-->
							<tbody>
								<td colspan="7" class="empty">보유하고 계신 쿠폰 내역이 없습니다</td>
							</tbody>
						</table>
					</div>
				</div>
			</form>
			
			<div class="row">
				<div class="col-xs-3"></div>
				<div class="col-xs-6" style="margin: 30px 0 ; text-align:center;display:">
					<p class="first"  width="16px" style="margin: 0 -4px 0 0;">
						<a href="">
							<img src="../images/mypage/첫페이지.jpg" alt="첫페이지">
						</a>
					</p>
					<p>
						<a href="">
							<img src="../images/mypage/이전페이지.jpg" alt="이전페이지">
						</a>
					</p>
					

							<a href="" class="this">1</a>

					
					<p>
						<a href="">
							<img src="../images/mypage/다음페이지.jpg" alt="다음페이지">
						</a>
					</p>
					<p class="last" style="display: inline-block;vertical-align: top;">
						<a href="">
							<img src="../images/mypage/마지막페이지.jpg" alt="첫마지막페이지">
						</a>
					</p>
				</div>
				<div class="col-xs-3"></div>
			</div>			
		</div>
	</div>
</body>
</html>
    