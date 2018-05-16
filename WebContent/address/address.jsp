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
.displaynone {
    display: none !important;
}
#id-main-contents {
    width: 1000px;
    min-height: 500px;
    margin: 80px auto 100px;
    float: none;
}
.titleArea {
    margin: 22px 0px 60px;
}
.titleArea h2 {
    font-family: 'Open Sans','맑은 고딕';
    letter-spacing: 0.07em;
    font-weight: 600;
    text-transform: uppercase;
    font-size: 13px;
    color: #555;
    text-align: center;
    margin: 10px auto 15px;
}
.titleArea p {
    margin: 0 0 0 0px;
    color: #777;
    font-family: "Malgun Gothic";
    text-align: center;
    font-size: 11px;
}
#id-main-contents input, #id-main-contents select, #id-main-contents textarea {
    font-size: 100%;
    font-family: "돋움",Dotum;
    color: #353535;
    vertical-align: middle;
}
.boardList {
    margin: 20px 0 0;
    border-top: 1px solid #aaa;
    border-bottom: 1px solid #aaa;
    font-family: '맑은 고딕';
}
.boardList table {
    table-layout: fixed;
    color: #555;
    line-height: 1.5;
}
table {
    width: 100%;
    border: 0;
    border-spacing: 0;
    border-collapse: collapse;
}
.boardList th:first-child {
    border-left: 0;
}
.boardList .chk {
    width: 27px;
}
.boardList th {
    padding: 6px 0;
    font-weight: normal;
    font-size: 11px;
    border-bottom: 1px solid #aaa;
    width: auto;
}
.boardList td {
    padding: 8px 0 5px;
    text-align: center;
    vertical-align: middle;
    word-wrap: break-word;
    font-size: 11px;
}
th, td {
    border: 0 ;
    vertical-align: top;
    text-align: center ;
}
.boardList a {
    text-decoration: none;
    color: #000;
}
.boardList td.address {
    padding-left: 10px;
    text-align: left;
}
.boardList .address {
    width: auto;
}
.boardList .button {
    width: 80px;
}
.boardList .delivery {
    width: 95px;
}
.boardList .recipient {
    width: 95px;
}
.boardList .phone {
    width: 120px;
}
.boardList .mobile {
    width: 120px;
}
.boardList .set {
    width: 76px;
}
.boardList td img {
    vertical-align: middle;
}
.boardList td.empty {
    padding: 50px 0;
    text-align: center;
    font-weight: bold;
    color: #757575;
}
.btnArea {
    overflow: hidden;
    padding: 10px 0 0;
    text-align: right;
    margin-bottom: 70px;
}
.btnArea span.left {
    float: left;
}
.help {
    margin: 100px 0 0;
    line-height: 18px;
    font-family: "Malgun Gothic";
}
.help h3 {
    padding: 9px 0 6px 0;
    color: #555;
    font-size: 11px;
    font-weight: bold;
}
.help .content {
    padding: 0 0px 11px;
}
.help .content ul {
    margin: 15px 0 0 0px;
    padding: 0;
    font-size: 12px;
}
.help .content li {
    list-style: none;
    color: #777;
    font-size: 11px;
}
</style>
<body>
<%@ include file="/include/uppermost-nav.jsp" %>
<div class="container col-xs-12" id="id-main-contents">
	<div class="titleArea" align="center" style="margin-bottom: 60px;">
		<div align="center" style="height:200px;"></div>
	    <h2 style="margin-top: 100px; ">Address List</h2>
	    <p style="font-size:11px;">자주 쓰는 배송지를 등록 관리하실 수 있습니다.</p>
	</div>
	<form id="frmAddr" name="" action="/exec/front/Myshop/Addr/?mode=Delete&return_url=%2Fmyshop%2Faddr%2Flist.html" method="post" enctype="multipart/form-data" style="width: 1000px;" >
	<input id="__address_addr1" name="__address_addr1" value="" type="hidden"  />
	<input id="__city_name" name="__city_name" value="" type="hidden"  />
	<input id="__state_name" name="__state_name" value="" type="hidden"  />
	<input id="__use_foreign_country_list" name="__use_foreign_country_list" value="F" type="hidden"  />
	<input id="__ma_rcv_contry_code" name="__ma_rcv_contry_code" value="" type="hidden"  />
	<input id="__country" name="__country" value="" type="hidden"  />
	<input id="__province" name="__province" value="" type="hidden"  />
	<input id="__city" name="__city" value="" type="hidden"  />
	<input id="__district" name="__district" value="" type="hidden"  />
	<input id="is_display_phone" name="is_display_phone" value="" type="hidden"  />
	<input id="is_display_mobile" name="is_display_mobile" value="" type="hidden"  />
	<input id="sUseCountryNumberFlag" name="sUseCountryNumberFlag" value="T" type="hidden"  /><div class="xans-element- xans-myshop xans-myshop-addrlist"><!--
	        $return_url = /myshop/addr/list.html
	    -->
	<div class="boardList">
	        <table border="1" summary="">
	            <thead><tr>
	<th scope="col" class="chk"><span class=""><input id="allCheck" onclick="myshopAddr.checkAll(this)" value="" type="checkbox" style="margin-top: 0px ; " /></span></th>
	                    <th scope="col" class="button">주소록 고정</th>
	                    <th scope="col" class="delivery">배송지명</th>
	                    <th scope="col" class="recipient">수령인</th>
	                    <th scope="col" class="phone">일반전화</th>
	                    <th scope="col" class="mobile">휴대전화</th>
	                    <th scope="col" class="address">주소</th>
	                    <th scope="col" class="set">수정</th>
	                </tr></thead>
	<tbody class="">
	<tr class="xans-record-">
	<td><input name="ma_idx[]" value="186260" type="checkbox"  /></td>
	                    <td><a href="/exec/front/Myshop/Addr/?mode=Fix&ma_idx=186260&ma_fixed_flag=T&return_url=%2Fmyshop%2Faddr%2Flist.html"><img src="/semi/images/ksj/address2.jpg" class="displaynone" alt="해제"/><img src="/semi/images/ksj/address1.jpg" class="" alt="고정"/></a></td>
	                    <td><span class="authssl_ma_rcv_title_0">중앙hta</span></td>
	                    <td><span class="authssl_ma_rcv_name_0">김소정</span></td>
	                    <td><span class="authssl_ma_rcv_phone_0">02-1111-1111</span></td>
	                    <td><span class="authssl_ma_rcv_mobile_no_0">010-1111-1111</span></td>
	                    <td class="address">(<span class="authssl_ma_rcv_zipcode_0">03134</span>)<span class="authssl_ma_rcv_addr1_0">서울특별시 종로구 율곡로10길 105 (봉익동)</span> <span class="authssl_ma_rcv_addr2_0">디아망4층 중앙hta</span></td>
	                    <td><a href="modify.html?ma_idx=186260"><img src="/semi/images/ksj/address3.jpg" class="" alt="수정"/></a></td>
	                </tr>
	</tbody>
	<tbody class="displaynone"><tr>
	<td colspan="8" class="empty">등록된 주소가 없습니다.</td>
	                </tr></tbody>
	</table>
	</div>
	<div class="btnArea">
	        <span class="left ">
	            <a href="#none" onclick="myshopAddr.deleteAddress(); return false;"><img src="/semi/images/ksj/address4.jpg" alt="선택 주소록 삭제"/></a>
	        </span>
	        <a href="register.html"><img src="/semi/images/ksj/address5.jpg" alt="배송지 등록"/></a>
	    </div>
	</div>
	</form>
	<div class="help">
    	<h3>배송주소록 유의사항</h3>
    	<div class="content">
	        <ul><li class="item1">배송 주소록은 최대 10개까지 등록할 수 있으며, 별도로 등록하지 않을 경우 최근 배송 주소록 기준으로 자동 업데이트 됩니다.</li>
	            <li class="item2">자동 업데이트를 원하지 않을 경우 주소록 고정 선택을 선택하시면 선택된 주소록은 업데이트 대상에서 제외됩니다.</li>
	        </ul>
	    </div>
	</div>
</div>
<%@ include file="/include/lowermost-footer.jsp" %>
</body>
</html>