<%@page import="semi.dao.CustomerDao"%>
<%@page import="semi.vo.Customer"%>
<%@page import="semi.vo.PointDetail"%>
<%@page import="semi.dao.OrderDao"%>
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
	
	.xans-myshop xans-myshop-bankbook{
		overflow:hidden;
		padding:15px 0 15px 10px;
		background:#f6f6f6;
		width:500px;
		margin:0 auto;
		margin-top:35px;
		font-family: '맑은 고딕';
	}
	
.xans-myshop-bankbook ul {
    display: table;
    width: 100%;
    min-width: 756px;
    font-size: 0;
    line-height: 0;
}

ul, menu, dir {
    display: block;
    list-style-type: disc;
    -webkit-margin-before: 1em;
    -webkit-margin-after: 1em;
    -webkit-margin-start: 0px;
    -webkit-margin-end: 0px;
    -webkit-padding-start: 40px;
}

.xans-myshop-bankbook {
    overflow: hidden;
    padding: 15px 0 15px 10px;
    /* background: #fff; */
    background: #f6f6f6;
    width: 500px;
    margin: 0 auto;
    margin-top: 35px;
    font-family: '맑은 고딕';
}

.xans-myshop-benefit {
    margin: 0 0 20px;
    padding: 100px 100px 100px 100px;
}

.xans-myshop-benefit .infoWrap {
    overflow: hidden;
    padding: 10px 10px 10px 90px;
    border: 1px solid #d9d9d9;
    color: #353535;
}

.xans-myshop-benefit .myThumb {
    float: left;
    margin: 0 0 0 -80px;
}

.xans-myshop-benefit .myThumb img {
    max-width: 70px;
}
.xans-myshop-bankbook li {
    position: relative;
    overflow: hidden;
    width: 60%;
    margin: 1px 0 2px;
    font-size: 11px;
    color: #444;
    line-height: 24px;
    vertical-align: top;
}

li {
    list-style: none;
}

li {
    display: list-item;
    text-align: -webkit-match-parent;
}

.xans-myshop-bankbook li .title {
    float: left;
    width: 30%;
    padding: 0 0 0 49px;
    font-weight: normal;
}

.xans-myshop-bankbook li .use {
    color: #444;
}
.xans-myshop-bankbook li .data {
    float: right;
    width: 35%;
    padding: 0 72px 0 0;
    text-align: right;
    font-weight: normal;
}

.xans-myshop-bankbook li a {
    position: absolute;
    right: 25px;
    top: 3px;
    background: #fff;
    text-align: center;
    line-height: 18px;
    border: 1px solid #aaa;
    width: 38px;
    height: 18px;
    color: #444;
}

.xans-myshop-benefit .myThumb {
    float: left;
    margin: 0 0 0 -80px;
}

.xans-myshop-benefit .infoWrap {
    overflow: hidden;
    padding: 10px 10px 10px 90px;
    border: 1px solid #d9d9d9;
    color: #353535;
}


.xans-myshop-benefit .myInfo {
    padding: 8px 0 8px 20px;
    border-left: 1px solid #e8e8e8;
    font-size: 15px;
    font-family: 'Open Sans','맑은 고딕';
    text-align:center;
}

p {
    display: block;
    -webkit-margin-before: 1em;
    -webkit-margin-after: 1em;
    -webkit-margin-start: 0px;
    -webkit-margin-end: 0px;
}

.xans-myshop-benefit .myInfo p {
    line-height: 18px;
}
.xans-myshop-benefit .myInfo .name {
    color: #008bcc;
}

.xans-myshop-benefit .myInfo strong {
    color: #008bcc;
}

.xans-myshop-benefit .myInfo p {
    line-height: 18px;
}




ul, menu, dir {
    display: block;
    list-style-type: disc;
    -webkit-margin-before: 1em;
    -webkit-margin-after: 1em;
    -webkit-margin-start: 0px;
    -webkit-margin-end: 0px;
    -webkit-padding-start: 40px;
}


#myshopMain {
    margin: 50px auto 10px;
    overflow: hidden;
    width: 528px;
}




#myshopMain li {
    float: left;
    height: 70px;
    width: 110px;
    text-align: center;
    line-height: 70px;
    
    border: 1px solid #dedede;
    margin: 5px 10px;
    background: #fff;
}

#myshopMain li a {
    color: #555;
    display: block;
    font-size: 10px;
    font-family: 'Open Sans','맑은 고딕';
    letter-spacing: 0.1em;
    text-transform: uppercase;
    font-weight: 600;
}




html, body, div, dl, dt, dd, ul, ol, li, h1, h2, h3,
 h4, h5, h6, pre, code, form, fieldset, legend, input, 
 textarea, p, blockquote, th, td, img {
    margin: 0;
    padding: 0;
}

body, code {
    font: 0.75em Verdana,Dotum,AppleGothic,sans-serif;
    color: #353535;
    background: #fff;
}
#myshopMain ul {
    overflow: hidden;
}

a {
    text-decoration: none;
    color: #000;
}

user agent stylesheet
a:-webkit-any-link {
    cursor: pointer;
}


</style>

  
</head>
<body>
<%@ include file="/include/uppermost-nav.jsp" %>
<div class="titleArea" id="id-main-contents">
	<div style="height: 200px;">
		
	</div>
		<h2  style="margin-top: 100px;">MY PAGE</h2>

	<%
		Customer customer = (Customer) session.getAttribute("logged-in-user");
		OrderDao orderDao = OrderDao.getInstance();
		PointDetail pointdetail = orderDao.getchargeconsumePoint(customer.getNo());//사용/적립포인트
		
		CustomerDao customerDao = CustomerDao.getInstance();
		Customer cust =customerDao.getCustomerById(customer.getNo()); 
		
		System.out.println(customer);
		System.out.println(cust);
		System.out.println(pointdetail);
		
		
	%>
	<%//if(customer != null){ %>
	<div class="xans-element- xans-myshop xans-myshop-benefit">
		<div class="infoWrap">
			<p class="myThumb">
				<img src="../images/mypage/PEOPLE.jpg" alt="FROMPEOPLE" >
			</p>
			<div class="myInfo">
				<p>
					저희 쇼핑몰을 이용해 주셔서 감사합니다.
					<strong class="name"><span><%=cust.getName() %></span></strong>
					님은
					<strong class="group"><span><%=cust.getGrade() %></span></strong>
					회원이십니다.
				</p>
			</div>	
		</div>
	</div>
	<%//} %>
	
	
	<div class="xans-element- xans-myshop xans-myshop-bankbook">
		<ul>
			<li>
				<strong class="title">가용적립금</strong>
				<strong class="data use"><%=(pointdetail == null ? 0 : pointdetail.getProductPoint()) %>원</strong>
				<a href="" >조회</a>
			</li>
			
			<li>
				<strong class="title">총적립금</strong>
				<strong class="data use"><%=(pointdetail == null ? 0 : cust.getPoint() + pointdetail.getProductPoint() - pointdetail.getUsedPoint()) %>원</strong>
			</li>
			
			<li>
				<strong class="title">사용적립금</strong>
				<strong class="data use"><%=(pointdetail == null ? 0 : pointdetail.getUsedPoint()) %>원</strong>
			</li>
			<li>
				<strong class="title">총주문</strong>
				<strong class="data use">0회</strong>
			</li>
			
			<li>
				<strong class="title">쿠폰</strong>
				<strong class="data use">0개</strong>
				<a href="">조회</a>
			</li>
		</ul>
	</div>
	
	
	<div id="myshopMain">
		<ul>
			<li>
				<a href="orderlist.jsp">
					
					<span class="hover">주문내역</span>
				</a>
			</li>
			
			<li>
				<a href="/semi/member/modifyform.jsp">
					
					<span class="hover">나의 정보</span>
				</a>
			</li>
			
			<li>
				<a href="../pay/pay.jsp">
					
					<span class="hover">장바구니</span>
				</a>
			</li>
			
			<li>
				<a href="point.jsp">
					
					<span class="hover">적립금</span>
				</a>
			</li>

		</ul>
		
		
		<ul>
			<li>
				<a href="coupon.jsp">
					
					<span class="hover">쿠폰</span>
				</a>
			</li>
			
			<li>
				<a href="deposits.jsp">
					
					<span class="hover">예치금</span>
				</a>
			</li>
			
			<li>
				<a href="myboard.jsp">
					<span class="hover">나의 게시물</span>
				</a>
			</li>
			
			<li>
				<a href="address.jsp">
					
					<span class="hover">주소록</span>
				</a>
			</li>

		</ul>
	</div>
</div>
	
	
	
	
	
	
	
	
</body>
</html>
    