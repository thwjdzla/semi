<%@page import="semi.dao.CustomerDao"%>
<%@page import="semi.vo.Customer"%>
<%@page import="java.util.ArrayList"%>
<%@page import="semi.vo.ShippingClass"%>
<%@page import="java.util.List"%>
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

html {
    width: 100%;
    height: 100%;
}
#id-main-contents9 {
	margin: 0;
	padding: 0;
	width: 800px;
}
body#popup {
    min-width: 0;
}
#popup {
    width: 800px;
}
.header9 h1 {
    height: 45px;
    padding: 0 0 0 20px;
    color: #fff;
    font-size: 14px;
    font-family: Verdana, Dotum, AppleGothic, sans-serif;
    line-height: 45px;
    background: #495164;
    margin: 0;
}
.content9 {
    padding: 20px 20px 60px;
}
.info9 {
    margin: 0 0 20px;
    padding: 12px 15px;
    border: 5px solid #e8e8e8;
    font-family: Verdana, Dotum, AppleGothic, sans-serif;
}
.info9 h2 {
    margin: 0 0 6px;
    padding: 0 0 8px;
    border-bottom: 1px solid #e8e8e8;
    color: #353535;
    font-size: 12px;
    font-weight: bold;
}
.info9 ul {
	margin: 0;
	padding: 0;
}
.info9 li {
    padding: 0 0 0 9px;
    color: #757575;
    line-height: 1.5;
    background: url(http://img.echosting.cafe24.com/skin/base_ko_KR/order/ico_grid.gif) no-repeat 0 7px;
    font-size: 12px;
}
.boardList9 {
    border: 1px solid #d7d5d5;
}
.boardList9 table {
    color: #353535;
    line-height: 1.5;
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
td {
	border: 0;
}
li {
    list-style: none;
}
.boardList9 .chk {
    width: 27px;
}
.boardList9 th {
    padding: 11px 0 9px;
    border-left: 1px solid #e9e9e9;
    font-weight: normal;
    background: #fbfafa;
    text-align: center;
    font-size: 12px;
}
.boardList9 td {
    padding: 8px 0 5px;
    border-top: 1px solid #e9e9e9;
    text-align: center;
    vertical-align: middle;
    word-wrap: break-word;
    font-size: 12px;
    font-family: Verdana, Dotum, AppleGothic, sans-serif;
    
}
input, select, textarea {
    font-size: 100%;
    font-family: "돋움",Dotum;
    color: #353535;
    vertical-align: middle;
}
.boardList9 th:first-child {
    border-left: 0;
}
.boardList9 .chk {
    width: 27px;
}
.boardList9 .button {
    width: 80px;
}
.boardList9 .delivery {
    width: 85px;
}
.boardList9 .recipient {
    width: 85px;
}
.boardList9 .phone {
    width: 110px;
}
.boardList9 .mobile {
    width: 110px;
}
.boardList9 .address {
    width: auto;
}
.boardList9 .set {
    width: 116px;
}
a {
    text-decoration: none;
    color: #000;
}
.boardList9 td img {
    vertical-align: middle;
}
.boardList9 td.address {
    padding-left: 10px;
    text-align: left;
}
.boardList9 .address {
    width: auto;
}
<%--
.displaynone {
    display: none !important;
}
--%>
.boardList9 td.empty {
    padding: 50px 0;
    text-align: center;
    font-weight: bold;
    color: #757575;
}
.btnArea {
    position: fixed;
    bottom: 0;
    left: 0;
    width: 100%;
    padding: 10px 0;
    border-top: 1px solid #d7d5d5;
    text-align: center;
    background: #fbfafa;
}
.go-pay-button {
	margin: 0;
	padding: 0;
    text-align: center;
    border: 0;
    background-color: rgba(255,255,255,.15);
}
</style>
<body id="popup">
<form>
<div class="container col-xs-12" id="id-main-contents9">
<%
	request.setCharacterEncoding("UTF-8");
	Customer loggedInUser = (Customer)session.getAttribute("logged-in-user");
	
	CustomerDao customerDao = CustomerDao.getInstance();
	List<ShippingClass> shippingClasses = customerDao.getShippingClassByNo(loggedInUser.getNo());
%>
	
	
	<div class="header9">
	        <h1>배송 주소록 관리</h1>
	</div>
	
	<div class="content9">
	     <div class="info9">
	         <h2>배송주소록 유의사항</h2>
	            <ul>
					<li>배송 주소록은 최대 10개까지 등록할 수 있으며, 별도로 등록하지 않을 경우 최근 배송 주소록 기준으로 자동 업데이트 됩니다.</li>
	                <li>자동 업데이트를 원하지 않을 경우 주소록 고정 선택을 선택하시면 선택된 주소록은 업데이트 대상에서 제외됩니다.</li>
	            </ul>
		 </div>
	
	     <div class="boardList9">
	     	  <form id="frm">
	          <table border="1" summary="">
	                <thead>
	                	<tr>
							<th scope="col" class="chk"><span class=""><input id="allCheck" onclick="goAllCheck();" value="" type="checkbox"  /></span></th>
	                        <th scope="col" class="delivery">배송지명</th>
	                        <th scope="col" class="recipient">수령인</th>
	                        <th scope="col" class="mobile">휴대전화</th>
	                        <th scope="col" class="address">주소</th>
	                        <th scope="col" class="set">배송지관리</th>
	                    </tr>
	                </thead>
	                <%
						if (!shippingClasses.isEmpty()) {
					%>
					<tbody class="addressL">
					<%
						for (ShippingClass shippingClass : shippingClasses) {
							int no = shippingClass.getShippingClassNo();
							System.out.println(no);
					%>
						<tr class="xans-record-" id="row_<%=no %>">
							<td><input name="chk" value="<%=no %>" type="checkbox"  /></td>
	                        <td><span class="authssl_ma_rcv_title_0" id="srname"><%=shippingClass.getShippingClassName() %></span></td>
	                        <td><span class="authssl_ma_rcv_name_0" id="sname-<%=no %>"><%=shippingClass.getReceiverName() %></span></td>
	                        <td><span class="authssl_ma_rcv_mobile_no_0" id="stel-<%=no %>"><%=shippingClass.getTel() %></span></td>
	                        <td class="address">(<span class="authssl_ma_rcv_zipcode_0" id="spost-<%=no %>"><%=shippingClass.getPostcode() %></span>)<span class="authssl_ma_rcv_addr1_0" id="sfaddress-<%=no %>"><%=shippingClass.getFirstAddress() %></span> <span class="authssl_ma_rcv_addr2_0" id="ssaddress-<%=no %>"><%=shippingClass.getSecondAddress() %></span></td>
	                        <td>
	                            <button class="go-pay-button" id="go-pay-button-<%=no %>" onclick="goPay(<%=no %>);">
	                            	<img src="http://img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_address_apply.gif" alt="적용" />
	                            </button>
	                        </td>
	                    </tr>
					</tbody>
					<%
						}
					} else {
						
					%>
					<tbody id="noneregister" class="displaynone">
						<tr>
							<td colspan="8" class="empty">등록된 주소가 없습니다.</td>
					    </tr>
					</tbody>
	                <%
					}
	                %>
			</table>
			</form>
		</div>
	</div>
	<div class="btnArea">
	        <button style="border:0; background: #fbfafa; padding: 1px;"><img src="http://img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_address_delete.gif" alt="선택 주소록 삭제" onclick="deleteTd();"/></button>
	        <button style="border:0; background: #fbfafa; padding: 1px;"><img src="http://img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_address_register.gif" alt="배송지 등록" onclick="goAddressListRegister(event)"></button>
	</div>
</div>
</form>
</body>
<script>
	function goAddressListRegister(e) {
		e.preventDefault();
		window.open('/semi/pay/addressListRegister.jsp','_self' , "width=800, height=541");
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
			
			if (chkorder.checked) {
				var xhr = new XMLHttpRequest();
				xhr.onreadystatechange = function() {
					if (xhr.readyState == 4 && xhr.status == 200) {
						var data = JSON.parse(xhr.responseText);		// {sno:24}				
						$("#row_" + data.sno).remove();
					}
				}
				xhr.open("GET", '/semi/pay/addressDelete.jsp?sno='+no);
				xhr.send();
			}
		}
	}
	
	
	function fn1() {
		document.getElementById("noneregister").style.display = 'none';
	}
	
	function fn2(event) {
		event.preventDefault();
		document.getElementById("order_layer_detail").style.display = 'block';
	}
	
	function goPay(no) {
		var sname = document.getElementById("sname-"+no).innerHTML;
		var stel1 = document.getElementById("stel-"+no).innerHTML;
		var spost = document.getElementById("spost-"+no).innerHTML;
		var sfaddress = document.getElementById("sfaddress-"+no).innerHTML;
		var ssaddress = document.getElementById("ssaddress-"+no).innerHTML;
		
		opener.document.getElementById("rname").value = sname;
		opener.document.getElementById("rphone2_2").value = stel1.substring(4, 8);
		opener.document.getElementById("rphone2_3").value = stel1.substring(9, 13);
		opener.document.getElementById("sample6_postcode").value = spost;
		opener.document.getElementById("sample6_address").value = sfaddress;
		opener.document.getElementById("sample6_address2").value = ssaddress;
		
		self.close();
	}
</script>
</html>