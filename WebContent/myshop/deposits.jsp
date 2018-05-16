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
  #container {
    width: 1304px;
    min-height: 600px;
    margin: 0 auto;
}

#contents02 {
    width: 1000px;
    min-height: 500px;
    margin: 80px auto 80px;
}

html, body, div, dl, dt, dd, ul, ol, li, h1, h2, h3, h4, h5, h6, pre, code, form, fieldset, legend, input, textarea, p, blockquote, th, td, img {
    margin: 0;
    padding: 0;
}

div {
    display: block;
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

.xans-myshop-depositsummary {
    padding: 15px 0 15px 10px;
    border: 1px solid #ccc;
    background: #fff;
    margin: 20px 0 0;
    font-family: '맑은 고딕';
}

.xans-myshop-depositsummary ul {
    display: table;
    width: 100%;
    min-width: 756px;
    font-size: 0;
    line-height: 0;
}
.xans-myshop-depositsummary li {
    display: inline-block;
    position: relative;
    overflow: hidden;
    width: 50%;
    margin: 4px 0 5px;
    font-size: 11px;
    color: #666;
    line-height: 18px;
    vertical-align: top;
}

li {
    list-style: none;
}

.xans-myshop-depositsummary li .title {
    float: left;
    width: 30%;
    padding: 0 0 0 49px;
    font-weight: normal;
}
.xans-myshop-depositsummary li .data {
    float: right;
    width: 35%;
    padding: 0 72px 0 0;
    text-align: right;
}
.xans-myshop-deposithistorylist {
    margin: 30px 0 0;
}

.xans-myshop-deposithistorylist .btnArea {
    overflow: hidden;
    margin: 0 0 10px;
    text-align: right;
}
a {
    text-decoration: none;
    color: #000;
}
img, fieldset {
    border: none;
    vertical-align: top;
}
.xans-myshop-deposithistorylist table {
    border-collapse: separate;
    border-top: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
    color: #555;
    line-height: 1.5;
}
caption {
    display: none;
}
colgroup {
    display: table-column-group;
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

.xans-myshop-deposithistorylist table th:first-child {
    border-left: 0;
}

.xans-myshop-deposithistorylist table th {
    padding: 7px 0 5px;
    font-weight: normal;
    vertical-align: middle;
    font-size: 11px;
}

.displaynone {
    display: none !important;
}
.xans-myshop-deposithistorylist table td {
    padding: 8px 0 5px;
    border-top: 1px solid #ccc;
    text-align: center;
    vertical-align: middle;
    font-size: 11px;
}

.xans-myshop-deposithistorylist table td.right {
    padding-right: 10px;
    text-align: right;
}

.xans-myshop-deposithistorylist table td.left {
    padding-left: 10px;
    text-align: left;
}

tfoot {
    display: table-footer-group;
    vertical-align: middle;
    border-color: inherit;
}

.xans-myshop-deposithistorylist table td.noData {
    padding: 50px 0;
    text-align: center;
    font-weight: bold;
    color: #888;
}
.xans-myshop-deposithistorypaging {
    margin: 30px 0;
    text-align: center;
}
.xans-myshop-deposithistorypaging p.first {
    margin: 0 -4px 0 0;
}
a {
    text-decoration: none;
    color: #000;
}

.xans-myshop-deposithistorypaging p {
    display: inline-block;
    vertical-align: top;
}
.xans-myshop-deposithistorypaging img {
    vertical-align: top;
}

.xans-myshop-deposithistorypaging ol {
    display: inline-block;
    margin: 0 -4px;
    line-height: 0;
    vertical-align: top;
}
.xans-myshop-deposithistorypaging {
    margin: 30px 0;
    text-align: center;
}
.xans-myshop-deposithistorypaging li:first-child {
    margin-left: 0;
}
.xans-myshop-deposithistorypaging li a.this {
    color: #555;
}
.xans-myshop-deposithistorypaging p.last {
    margin: 0 0 0 -4px;
}
.xans-myshop-deposithistorypaging li {
    display: inline-block;
    margin: 0 0 0 -1px;
    font-size: 11px;
    color: #666;
    vertical-align: top;
}
.col-xs-6 p {
    display: inline-block;
    vertical-align: top;
}
  </style>
  
  
</head>
<body>
<%@ include file="/include/uppermost-nav.jsp" %>
	<div class="container">
		<div class="contents02">
			<div class="xans-element- xans-myshop xans-myshop-deposithistorypackage ">
				<div class="xans-element- xans-myshop xans-myshop-deposithead titleArea ">
					<h2 style="margin-top: 100px">DEPOSITS</h2>
					<p style="font-size: 11px">고객님의 사용가능 예치금 금액 입니다.</p>
				</div>
				
				<div class="xans-element- xans-myshop xans-myshop-depositsummary">
					<ul>
						<li>
							<strong class="title">
								누적 예치금
							</strong>
							<span class="data">
								<span id="xans_myshop_summary_all_deposit"></span>
								&nbsp;
							</span>
						</li>
						<li>
							<strong class="title">사용된 예치금</strong>
							<span class="data">
								<span class="data">
								<span id="xans_myshop_summary_all_deposit"></span>
									&nbsp;
								</span>
							</span>
						</li>
						
						<li>
							<strong class="title">사용가능 예치금</strong>
							<span class="data">
								<span class="data">
								<span id="xans_myshop_summary_all_deposit"></span>
									&nbsp;
								</span>
							</span>
						</li>
												<li>
							<strong class="title">현금환불요청 예치금</strong>
							<span class="data">
								<span class="data">
								<span id="xans_myshop_summary_all_deposit"></span>
									&nbsp;
								</span>
							</span>
						</li>
					</ul>
				</div>
				
				<div class="xans-element- xans-myshop xans-myshop-deposithistorylist">
					<div class="btnArea displayone">
						<a href="">
							<img src="" alt="예치금 현금환불 요청">
						</a>
					</div>
					
					<table border="0">
						<caption>예치금내역</caption>
						<colgroup>
							<col style="width:20%">
							<col style="width:15%">
							<col style="width:20%">
							<col style="width:auto">
						</colgroup>
						
						<thead>
							<tr>
								<th scope="col" style="text-align:center">주문날짜</th>
								<th scope="col" style="text-align:center">예치금</th>
								<th scope="col" style="text-align:center">관련 주문</th>
								<th scope="col" style="text-align:center">내용</th>
							</tr>
						</thead>
						
						<tbody class="displaynone">
							<tr>
								<td></td>
								<td class="right"></td>
								<td></td>
								<td class="left"></td>
							</tr>
							
							<tr>
								<td></td>
								<td class="right"></td>
								<td></td>
								<td class="left"></td>
							</tr>
							
							<tr>
								<td></td>
								<td class="right"></td>
								<td></td>
								<td class="left"></td>
							</tr>
						</tbody>
						
						<tfoot>
							<tr>
								<td colspan="4" class="noData">예치금내역이 없습니다.</td>
							</tr>
						</tfoot>
					</table>
				</div>
			
			
			
			
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
	</div>
		
</body>
</html>
    