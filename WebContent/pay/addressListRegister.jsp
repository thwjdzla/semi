<%@page import="semi.vo.Customer"%>
<%@page import="semi.dao.CustomerDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="semi.vo.ShippingClass"%>
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
input, select, textarea {
    font-size: 100%;
    font-family: "돋움",Dotum;
    color: #353535;
    vertical-align: middle;
}
a {
    text-decoration: none;
    color: #000;
}
.displaynone {
    display: none !important;
}
.boardWrite9 {
    border: 1px solid #d7d5d5;
}
.boardWrite9 table {
    table-layout: fixed;
    color: #353535;
    line-height: 1.5;
}
.boardWrite9 tbody tr:first-child th, .xans-myshop-addrregister .boardWrite tbody tr:first-child td {
    border-top: 0;
}
.boardWrite9 th {
    width: 120px;
    padding: 11px 0 9px 19px;
    border-top: 1px solid #e9e9e9;
    border-right: 1px solid #e9e9e9;
    font-weight: normal;
    text-align: left;
    vertical-align: top;
    background: #fbfafa;
    font-family: Verdana, Dotum, AppleGothic, sans-serif;
    font-size: 12px;
}
.boardWrite9 tbody tr:first-child td {
    border-top: 0;
}
#ma_rcv_title, #ma_rcv_name {
    width: 180px;
}
.boardWrite9 input {
    height: 22px;
    padding: 0 0 0 9px;
    border: 1px solid #d5d5d5;
    line-height: 22px;
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
.boardWrite9 td {
    width: auto;
    padding: 8px 0 7px 10px;
    border-top: 1px solid #e9e9e9;
    color: #757575;
    vertical-align: middle;
}
#address_zip1, #address_zip2 {
    width: 60px;
    padding: 0;
    text-align: center;
}
.boardWrite9 a {
    text-decoration: none;
}
#address_addr1, #address_addr2 {
    width: 450px;
    margin: 5px 0 0;
}
#ma_rcv_phone1, #ma_rcv_mobile_no1 {
    width: 60px;
}
.boardWrite9 select {
    margin: 0 4px 0 0;
    height: 24px;
    border: 1px solid #d5d5d5;
    font-size: 100%;
    font-family: "돋움",Dotum;
    color: #353535;
    vertical-align: middle;
}
#ma_rcv_phone2, #ma_rcv_phone3, #ma_rcv_mobile_no2, #ma_rcv_mobile_no3 {
    width: 60px;
    margin: 0 4px;
}
</style>

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
<body id="popup">
<form id ="registerform" method="post" action="add.jsp" onsubmit="checkInputField(event)">
<div class="container col-xs-12" id="id-main-contents9">
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
		
		<%
			request.setCharacterEncoding("UTF-8");
			Customer loggedInUser = (Customer)session.getAttribute("logged-in-user");
			CustomerDao customerDao = CustomerDao.getInstance();
			List<ShippingClass> shippingClasses = customerDao.getShippingClassByNo(loggedInUser.getNo());
		%>
	     <div class="boardWrite9">
            <table border="1" summary="">
				<tbody>
					<tr>
						<th scope="row">배송지명</th>
					        <td><input id="ma_rcv_title" name="class-name" fw-filter="isFill" fw-label="배송지명" fw-msg="" class="inputTypeText" placeholder="" value="" type="text"  /></td>
					</tr>
					<tr>
						<th scope="row">성명</th>
				            <td><input id="ma_rcv_name" name="rcv-name" fw-filter="isFill" fw-label="성명" fw-msg="" class="ec-member-name" placeholder="" value="" type="text"  /></td>
				    </tr>
					<tr>
						<th scope="row">주소</th>
				            <td>
								<input type="text" id="sample6_postcode" placeholder="우편번호" name="post-code">
								<img src="/semi/images/ksj/btn_zipcode.gif" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
								<input type="text" id="sample6_address" placeholder="주소" style="width: 200px;" name="post-first"></br>
								<input type="text" id="sample6_address2" placeholder="상세주소" style="width: 500px;" name="post-second">
				    </tr>
					<tr>
						<th scope="row">휴대전화</th>
						    <td>
						    	<select id="ma_rcv_mobile_no1" name="tel-first" fw-filter="isNumber&isFill" fw-label="휴대전화" fw-alone="N" fw-msg="" >
									<option value="010">010</option>
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="017">017</option>
									<option value="018">018</option>
									<option value="019">019</option>
								</select>-
								<input id="ma_rcv_mobile_no2" name="tel-second" maxlength="4" fw-filter="isNumber&isFill" fw-label="휴대전화" fw-alone="N" fw-msg="" value="" type="text"  />-
								<input id="ma_rcv_mobile_no3" name="tel-third" maxlength="4" fw-filter="isNumber&isFill" fw-label="휴대전화" fw-alone="N" fw-msg="" value="" type="text"  /></td>
				    </tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="btnArea">
	    <input type="image" src="/semi/images/ksj/btn_address_register2.gif" name="Submit" value="등록"/>
        <button style="border:0; background: #fbfafa; padding: 1px;"><img src="http://img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_address_cancel.gif" alt="취소" onclick="goAddressList(event)"/></button>
	</div>
</div>
</form>
</body>
<script>
	function goAddressList(e) {
		e.preventDefault();	
		window.open('/semi/pay/addressList.jsp','_self' , "width=800, height=541");
	}
	
	function checkInputField(event) {
		event.preventDefault();
		
		var rtitle = document.getElementById("ma_rcv_title");
		var rname = document.getElementById("ma_rcv_name");
		var rpostcode = document.getElementById("sample6_postcode");
		var raddress1 = document.getElementById("sample6_address");
		var raddress2 = document.getElementById("sample6_address2");
		var rtel2 = document.getElementById("ma_rcv_mobile_no2");
		var rtel3 = document.getElementById("ma_rcv_mobile_no3");
		
		var srtitle = rtitle.value;
		if (srtitle === "") {
			alert("배송지명을 입력하세요");
			rtitle.focus();
			return;
		}
		var srname = rname.value;
		if (srname === "") {
			alert("성명을 입력하세요");
			rname.focus();
			return;
		}
		
		var srpostcode = rpostcode.value;
		if (srpostcode === "") {
			alert("우편번호를 입력하세요");
			rpostcode.focus();
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
	
		var registerForm = document.getElementById("registerform");
		
		registerForm.submit();
	}
</script>
</html>