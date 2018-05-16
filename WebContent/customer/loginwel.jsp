

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
<style type="text/css">
.my-box { border:1px solid; padding:10px; width:900px; height:250px;  }
</style>
<style type="text/css">
.my-box2 { border:1px solid; padding:10px; width:40%; height:40%;     
    }
</style>
<style type="text/css">
.my-box3 { border:1px solid; padding:10px; width:70%; height:70%;    
  }
</style>
</head>
<jsp:include page="/include/uppermost-nav.jsp" />
<body>
	
            <%
            Customer customer = (Customer) session.getAttribute("logged-in-user");
      		%>	

<h5 style="text-align:center">회원가입이 완료되었습니다</h5>

<div class="container" align="center">
	<div class="my-box">
        <div style="text-align:center" >
        
 		 	<div class="my-box2">    
    			<p>저희 쇼핑몰을 이용해 주셔서 감사합니다.</p>
    	    <div class="my-box3">  
    			<ul>
					<li>
						<strong>ID</strong><%=customer.getId() %>
					</li>
					<li>
						<strong>name</strong><%=customer.getName() %>
					</li>
					<li>
					 	 <strong>e-mail</strong><%=customer.getEmail() %>
					</li>
 				</ul>
 			 </div>
			</div>
		</div>
    <p class="button">
            <a href="http://localhost/semi/index.jsp">home</a>
    </p>
   </div>
 </div>
  <hr class="layout"/><hr class="layout"/>
  <jsp:include page="/include/lowermost-footer.jsp" />  
</body>
</html>
