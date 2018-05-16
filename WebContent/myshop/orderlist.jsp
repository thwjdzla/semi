<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="semi.vo.Customer"%>
<%@page import="semi.dao.OrderDao"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.TreeMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="semi.vo.OrderDetail"%>

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
	
	.titleArea h3{
		font-family: 'Open Sans' , '맑은고딕'';
		letter-spacing:0.07em;
		font-weight:600;
		text-transform:uppercase;
		font-size:10px;
		color:#555;
		text-align:center;
		margin:10px auto 15px;
	}
	
	fieldset{
		margin: 20px 0 0;
	    padding: 23px 20px;
	    border: 1px solid #ccc;
	    font-family: '맑은 고딕';
	}
.col-xs-6 p {
    display: inline-block;
    vertical-align: top;
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
  </style>
  
  
  
</head>
<body onload="today();">
<%@ include file="/include/uppermost-nav.jsp" %>
<div class="container" id="id-main-contents">
	<div class="titleArea">
		<h2 style="margin-top: 200px; ">ORDER LIST</h2>
		<h3>주문내역조회</h3>
	
		<%
		
		
		
		
		Customer customer = (Customer) session.getAttribute("logged-in-user");
		
		String begin =  request.getParameter("begin");
		String end = request.getParameter("end");
		
		
		
		DateFormat sdFormat = new SimpleDateFormat("yyyy-MM-dd");
		OrderDao dao = OrderDao.getInstance();
		Map<String, Object> indexRange = new HashMap<>();
		
		
		if(begin == null){
			Date nowDate = new Date();
			begin =  sdFormat.format(nowDate);
			end =  sdFormat.format(nowDate);
		} 
		
		indexRange.put("begin", begin + "00:00:00");
		indexRange.put("end", end + "23:59:59");
		indexRange.put("customer", customer.getNo());

		
		
		
		final int rows = 5;
		String current = request.getParameter("pageno");
		if (current == null) {
			current = "1";
		}
		int currentPage = Integer.parseInt(current);
		int records;
		int pages = 0;
		int beginIndex = (currentPage -1) * rows + 1;
		int endIndex = currentPage * rows;
		
		records = dao.getOrderListCount(indexRange);
		pages = (int)Math.ceil((double)records/rows);

		indexRange.put("beginIndex", beginIndex);
		indexRange.put("endIndex", endIndex);
		
		List<OrderDetail> items = dao.getOrderListByPage(indexRange);
		
		Map<String, Object> count = new HashMap<>();
		count.put("begin", begin);
		count.put("end", end);
		count.put("no", customer.getNo());
		
		int ordercount = dao.ordercount(count);
		int ordercancelcount = dao.cancelcount(count);
		
		
		%>
		
		
	</div>
	<div class="container" >
		<div class="row">
			<div class="col-xs-2">
				<h2 style="font-size:13px">주문내역조회(<%=ordercount %>)</h2>
			</div>
			<div class="col-xs-4">
				<h2 style="font-size:13px">취소/반품/교환 내역(<%=ordercancelcount %>)</h2>
			</div>
		</div>
		
		<div class="row">
			<div class="col-xs-12">
				<div class="panel"></div>
			</div>
		</div>
		
		<div class="panel panel-default">
		<div class="row">
			<form method="GET" id="daysearch" action="orderlist.jsp">
			<div class="col-xs-12" style="margin-top:10px; margin-bottom:10px">
			<div class="col-xs-4">
			
				<div class="btn-group">
						<img src="../images/mypage/day-1-off.gif" onclick="testInnerHTML(1);" id="img-btn-1" style="cursor: pointer;">
						<img src="../images/mypage/day-2-off.gif" onclick="testInnerHTML(2);" style="cursor: pointer;"  id="img-btn-2">
						<img src="../images/mypage/day-3-off.gif" onclick="testInnerHTML(3);" style="cursor: pointer;"  id="img-btn-3">
						<img src="../images/mypage/day-4-off.gif" onclick="testInnerHTML(4);" style="cursor: pointer;"  id="img-btn-4">
						<img src="../images/mypage/day-5-off.gif" onclick="testInnerHTML(5);" style="cursor: pointer;"  id="img-btn-5">
				</div>
			</div>
			<div class="col-xs-6">
				<input type="hidden"  id="pno" name="pno" value="1" />
				<input id="start_date" name="begin" size="10" value="<%=begin!=null?begin: "" %>"  type="text">
				~
				<input id="end_date" name="end" size="10"  value="<%=end!=null?end:""%>"  type="text">
				<input type="submit" class="btn btn-primary" value="조회" id="search"/>
			</div>
			</form>
			</div>
			</div>
		</div>
		
		
		<div class="row">
				<div class="col-xs-12">
					<ul>
						<li>기본적으로 최근 3개월간의 자료가 조회되며, 기간 검색시 지난 주문내역을 조회하실 수 있습니다.</li>
						<li>주문번호를 클릭하시면 해당 주문에 대한 상세내역을 확인하실 수 있습니다.</li>
					</ul>
				</div>
		</div>
		
		<div class="row">
			<h2 style="font-size: 13px">ORDER PRODUCT INFO</h2>
			
<div class="xans-element- xans-myshop xans-myshop-wishlist xans-record-">

			<%--if(장바구니가 안비었으면) --%>
			<%if(items != null){%>
			<table style="border-left:0px solid white; border-right:white;" border="1" bordercolor="lightgray" summary class="displaynone" height="250px" width="100%"  border-left="0">
				<caption>관심상품 목록</caption>
				<colgroup class="xans-element- xans-board xans-board-listheader-1002 xans-board-listheader xans-board-1002 ">
						<col style="width:135px">
						<col style="width:90px">
						<col style="width:381px">
						<col style="width:60px">
						<col style="width:110px">
						<col style="width:110px">
						<col style="width:110px">
					</colgroup>
				
				<thead>
					<tr height="50px" >
						<th scope="col" class="orderno" style="text-align:center;font-size:10px;">주문일자<br>[주문번호]</th>
						<th scope="col" class="image" style="text-align:center;font-size:10px;">이미지</th>
						<th scope="col" class="productcontent" style="text-align:center;font-size:10px;">상품정보</th>
						<th scope="col" class="amount" style="text-align:center;font-size:10px;">수량</th>
						<th scope="col" class="price" style="text-align:center;font-size:10px;">상품구매금액</th>
						<th scope="col" class="orderstatus" style="text-align:center;font-size:10px;">주문처리상태</th>
						<th scope="col" class="cancel" style="text-align:center;font-size:10px;">취소/교환/반품</th>
					</tr>
				</thead>

				<tbody class="xans-element- xans-myshop xans-myshop-wishlistitem" id="orders-tbody">
					
					<%
					
					TreeMap<Integer, List<OrderDetail>> map = new TreeMap<>();
					
					int prevOrderNo = -1;

					for(OrderDetail item : items){
						int currentOrdersNo = item.getOrderNo();
						
							if(prevOrderNo == currentOrdersNo){
								
								List<OrderDetail> itemsmap = map.get(currentOrdersNo);	
								itemsmap.add(item);
								map.put(currentOrdersNo, itemsmap);
								
							} else {
								
								List<OrderDetail> itemsmap = new ArrayList<>();
								itemsmap.add(item);
								map.put(currentOrdersNo, itemsmap);
								prevOrderNo = currentOrdersNo;
								
							}
					}
					
					Set<Integer> orderNos = map.keySet();
					for(int orderNo : orderNos){					
						List<OrderDetail> orderItems = map.get(orderNo);
						int rowCount = orderItems.size();

						boolean isFirst = true; 
						for(OrderDetail item : orderItems) {
					%>
						<tr class="xans-record-" id="ordertable">
					<%

							if(isFirst){
								%>
								<td rowspan="<%=rowCount%>" id="ordercancel">
								<p style="text-align:center;"><%=item.getOrderNo() %></p>
								<%
									if(!"주문취소".equals(item.getOrderStatus())){
								%>
								<a href="javascript:cancel(<%=item.getOrderNo() %>);"><img id="cancel-"<%=item.getOrderNo() %> src="../images/mypage/cancel.gif" style="cursor: pointer;margin-left: auto; margin-right: auto; display: block;"></a>
								<%} else {%>
									<p style="text-align:center;"><%=item.getOrderCalcelDate() %> </p>
								<%} %>
								</td>
								<%
								isFirst = false;
							}
						%>
						<td class="image" style="text-align:center">
							<a href="http://localhost/semi/product/detail.jsp?pro-no=<%=item.getProductNo() %>">
							<img src="../images/products/<%=item.getOrderImage() %>"  width="60" height="85" /></a>
						</td>
						<td class="productcontent">
							<a href="http://localhost/semi/product/detail.jsp?pro-no=<%=item.getProductNo() %>" >
								<strong><%=item.getProductName() %></strong>
							</a>
							<ul class="xans-element- xans-myshop xans-myshop-optionall option">
								<il class="xans-record-">
									<strong class="displaynone" style="text-align:center;font-size:15px;"><%%></strong>
									<p style="text-align:left; font-size:13px;">[옵션: <%=(item.getProductColor() == null ? "없음" :  item.getProductColor())%>]</p>
								</il>
							</ul>
						</td>
						<td class="amount"  style="text-align:center;">
							<strong ><%=item.getOrderQty()%></strong>
						</td>
						<td class="price" style="text-align:center; font-size:15px;">
							<strong  ><%=item.getOrderPrice()%>원</strong>
						</td>
						
						<td class="orderstatus" style="text-align:center;font-size:15px;">
							<%=item.getOrderStatus() %>
						</td>
						<td class="cancel" style="text-align:center;font-size:10px;"><%=(item.getOrderCancel() == null ? "-" : item.getOrderCancel()) %></td>
					</tr>
						<%
							
						}
					}
						%>
					
				</tbody>
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
					<%
						for (int index=1; index<=pages; index++) {
					%>
						<li style="list-style:none;display:inline; ">
							<a href="javascript:paging(<%=index %>);" id="pageno"><%=index %></a>
						</li>
					<%
						}
					%>
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
				
					<%} else {%>
					<p class="empty" style="text-align:center">주문상품 목록이 없습니다.</p>
					<%}%>
				<div class="col-xs-3"></div>
			</div>	
		</div>
	</div>
	
	
	
</body>
<script type="text/javascript">
	var pagingno = 1;

	function cancel(no){
		var xhr = new XMLHttpRequest();

		var begin = document.getElementById("start_date").value;
		var end = document.getElementById("end_date").value;
		
		
		
		
		xhr.open("GET", "orderlistcancel.jsp?pageno=" + pagingno  + "&orderno=" + no
				+ "&begin=" + begin + "&end=" + end);
		xhr.send();
		

		
		xhr.onreadystatechange = function() {
			if(xhr.readyState == 4 && xhr.status == 200){
				
				var jsonData = xhr.responseText;
				

				var orders = JSON.parse(jsonData);					
				
				var row = "";
				for (var orderNo in orders) {
					var items = orders[orderNo];
					
					var rowsCount = items.length;
					var isFirst = true; 
					for (var i=0; i<items.length; i++) {
						var item = items[i];
						
						row += "<tr class='xans-record-' id='ordertable'>";
						if (isFirst) {
							row+= "<td rowspan=" + rowsCount + " id='ordercancel'>";
							row += "<p style='text-align:center;'>"+orderNo+"</p>";
							isFirst = false;
							
							if('주문취소' != item.orderStatus) {
								row += "<a href='javascript:cancel("+orderNo+");'><img id='cancel-"+orderNo+"'  src='../images/mypage/cancel.gif' style='cursor: pointer;margin-left: auto; margin-right: auto; display: block;'></a>";
							} else {
								row += "<p style='text-align:center;'>"+item.orderDate+" </p>";
							}
							row += "</td>";
						} 
						row += "<td class='image' style='text-align:center'>";
						row += "<a href='http://localhost/semi/product/detail.jsp?pro-no="+item.productNo +"'>";
						row += "<img src='../images/products/"+item.orderImage+"'  width='60' height='85' /></a>";
						row += "</td>";
						row += "<td class='productcontent'>";
						row += "<a href='http://localhost/semi/product/detail.jsp?pro-no="+item.productNo+"' >";
						row += "<strong>"+item.productName+"</strong>";
						row += "</a>";
						row += "<ul class='xans-element- xans-myshop xans-myshop-optionall option'>";
						row += "<il class='xans-record-'>";
						row += "<strong class='displaynone' style='text-align:center;font-size:15px;'></strong>";
						row += "<p style='text-align:left; font-size:13px;'>[옵션: "+(item.productColor == null ? '없음' :  item.productColor)+"]</p>";
						row += "</il>";
						row += "</ul>";
						row += "</td>";
						row += "<td class='amount'  style='text-align:center;'>";
						row += "<strong >"+item.orderQty+"</strong>";
						row += "</td>";
						row += "<td class='price' style='text-align:center; font-size:15px;'>";
						row += "<strong>"+item.orderPrice+"원</strong>";
						row += "</td>";
						row += "<td class='orderstatus' style='text-align:center;font-size:15px;'>";
						row += item.orderStatus;
						row += "</td>";
						row += "<td class='cancel' style='text-align:center;font-size:10px;'>"+(item.orderCancel == null ? '-' : item.orderCancel)+"</td>";
						row += "</tr>";

					
					}
				}
				
				document.getElementById("orders-tbody").innerHTML = row;

			}
		}
		
		
	}

	
	function paging(no){
		
		var xhr = new XMLHttpRequest();
		
		var begin = document.getElementById("start_date").value;
		var end = document.getElementById("end_date").value;
		pagingno = no;
		xhr.open("GET","orderlistpaging.jsp?pageno=" + no + "&begin=" + begin + "&end=" + end);
		xhr.send();
		
		
		
		xhr.onreadystatechange = function() {
				if(xhr.readyState == 4 && xhr.status == 200){
					var jsonData = xhr.responseText;
					
					var orders = JSON.parse(jsonData);	
					console.log(pagingno);

					
					var row = "";
					for (var orderNo in orders) {
						var items = orders[orderNo];
						
						var rowsCount = items.length;
						var isFirst = true; 
						for (var i=0; i<items.length; i++) {
							var item = items[i];
							
							row += "<tr class='xans-record-' id='ordertable'>";
							if (isFirst) {
								row+= "<td rowspan=" + rowsCount + " id='ordercancel'>";
								row += "<p style='text-align:center;'>"+orderNo+"</p>";
								isFirst = false;
								
								if('주문취소' != item.orderStatus) {
									row += "<a href='javascript:cancel("+orderNo+")'><img id='cancel-"+orderNo+"'  src='../images/mypage/cancel.gif' style='cursor: pointer;margin-left: auto; margin-right: auto; display: block;'></a>";
								} else {
									row += "<p style='text-align:center;'>"+item.orderDate+" </p>";
								}
								row += "</td>";
							} 
							
							row += "<td class='image' style='text-align:center'>";
							row += "<a href='http://localhost/semi/product/detail.jsp?pro-no="+item.productNo +"'>";
							row += "<img src='../images/products/"+item.orderImage+"'  width='60' height='85' /></a>";
							row += "</td>";
							row += "<td class='productcontent'>";
							row += "<a href='http://localhost/semi/product/detail.jsp?pro-no="+item.productNo+"' >";
							row += "<strong>"+item.productName+"</strong>";
							row += "</a>";
							row += "<ul class='xans-element- xans-myshop xans-myshop-optionall option'>";
							row += "<il class='xans-record-'>";
							row += "<strong class='displaynone' style='text-align:center;font-size:15px;'></strong>";
							row += "<p style='text-align:left; font-size:13px;'>[옵션: "+(item.productColor == null ? '없음' :  item.productColor)+"]</p>";
							row += "</il>";
							row += "</ul>";
							row += "</td>";
							row += "<td class='amount'  style='text-align:center;'>";
							row += "<strong >"+item.orderQty+"</strong>";
							row += "</td>";
							row += "<td class='price' style='text-align:center; font-size:15px;'>";
							row += "<strong>"+item.orderPrice+"원</strong>";
							row += "</td>";
							row += "<td class='orderstatus' style='text-align:center;font-size:15px;'>";
							row += item.orderStatus;
							row += "</td>";
							row += "<td class='cancel' style='text-align:center;font-size:10px;'>"+(item.orderCancel == null ? '-' : item.orderCancel)+"</td>";
							row += "</tr>";
						}
					}
					
					document.getElementById("orders-tbody").innerHTML = row;
			}
		}
	}

	var daymonth = 0;
  function testInnerHTML(no){
	  	daymonth = no;
		for(var i = 1; i <= 5;i++){
			var off = document.getElementById("img-btn-" + i);
			var imageNameoff = off.getAttribute("src");
			imageNameoff = imageNameoff.replace("on", "off");
			
			off.setAttribute("src", imageNameoff);
		}
	  
		var el = document.getElementById("img-btn-" + no);
		
		var imageName = el.getAttribute("src");
		
		var isSelected = false;
		if (imageName.indexOf("on") != -1) {
			isSelected = true;
			imageName = imageName.replace("on", "off");
		} else {
			isSelected = false;
			imageName = imageName.replace("off", "on");
		}
	

		var yyyy = "";
		var mm = "";
		var dd = "";
		
		if (!isSelected) {
			var today = new Date();
			if (no == 1) {
				yyyy = today.getFullYear();
				mm = today.getMonth() + 1;
				dd = today.getDate();
			} else if (no == 2) {
				yyyy = today.getFullYear();
				mm = today.getMonth() + 1;
				dd = today.getDate() - 7;
				
				if(dd < 0){
					mm = mm - 1;
					if(mm % 2){
						dd = dd + 31;	
					} else {
						dd = dd + 30;
					}
				}
			} else if(no == 3){
				yyyy = today.getFullYear();
				mm = today.getMonth();
				
				if(mm < 0){
					yyyy = yyyy - 1;
					if(mm % 2){
						dd = dd + 31;	
					} else {
						dd = dd + 30;
					}
				}
				
				dd = today.getDate();
			} else if(no == 4){
				yyyy = today.getFullYear();
				mm = today.getMonth() - 2;
				
				if(mm < 0){
					yyyy = yyyy - 1;
					mm += 12;
				}
				
				dd = today.getDate();
				
			} else if(no == 5){
				yyyy = today.getFullYear();
				mm = today.getMonth() - 5;
				dd = today.getDate();
				
				if(mm < 0){
					yyyy = yyyy - 1;
					mm += 12;
				}
				dd = today.getDate();
			}
			
			today = yyyy;
			
			if(mm < 10){
				today += "-0" + mm;
			} else {
				today += "-" + mm;
			}
			
			if(dd < 10){
				today += "-0" + dd;
			} else {
				today += "-" + dd;
			}

		} 
		
		if(no == 1)
			document.getElementById("end_date").value = today;
		
		document.getElementById("start_date").value = today;
		
		el.setAttribute("src", imageName);
	}

	function orderlist(){
		var start = document.getElementById("start_date");
		var end = document.getElementById("end_date");
		
	   	
		
		
		
	}

	function today(){
		
		if (document.getElementById("start_date").value =="") {
			var today = new Date();
			
			var yyyy = today.getFullYear();
			var mm = today.getMonth() + 1;
			var dd = today.getDate();
			
			if(mm < 10){
				today = yyyy + "-0" +  mm;
			}else{
				today = yyyy + "-" +  mm;
			}
			
			if(dd < 10){
				today += "-0" + dd;
			} else {
				today += "-" + dd;
			}
	
			document.getElementById("start_date").value = today;
			
			today = "";
			
			if(mm < 10){
				today = yyyy + "-0" +  mm;
			}else{
				today = yyyy + "-" +  mm;
			}
			
			dd = dd+1;
			if(dd < 10){
				today += "-0" + dd;
			} else {
				today += "-" + dd;
			}
			
			document.getElementById("end_date").value = today;
			var search = document.forms["daysearch"].submit();		
			
			el.setAttribute("src", imageName);
			
				
			
		}
		
		
		
	}

  </script>


</html>
    