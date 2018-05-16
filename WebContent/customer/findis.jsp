

<%@page import="java.util.List"%>
<%@page import="semi.vo.Customer"%>
<%@page import="semi.dao.CustomerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	
<%

	String Email = request.getParameter("cust_email");
	String name = request.getParameter("cust_name");

	CustomerDao customerDao = CustomerDao.getInstance();
	Customer customer  =  customerDao.getCustomerByEmail(Email);

	if(customer == null ) {
%>
			<script>
			alert("해당회원이존재하지않습니다");
			 history.go(-1)
			</script>		
<%
	return ;
	}
	else { %>			
</head>
	<body>
		<div id="wrap">    
			<div id="container">    
				<div id="contents02">
					<div class="titleArea">
    <h2>Find ID</h2>
    <p>아이디 찾기</p>
		</div>
			<div class="xans-element- xans-member xans-member-findidresult"><div class="">
        <p class="desc">아이디 찾기가 완료 되었습니다.</p>
        <div class="memberInfo">
            <p class="info">저희 쇼핑몰를 이용해주셔서 감사합니다.<br/>다음정보로 가입된 아이디가 총 <span>1</span>개 있습니다.</p>
            <ul>
				<li>이름 : <strong><span class="authssl_name"><%=customer.getName() %></span></strong></li>
                <li>이메일 :<strong> <span class="authssl_searchInfo"><%=customer.getEmail() %></span></strong></li>
                <li><label><input type='radio' name='fid' onclick="set_findpwdid(<%=customer.getId()%> , 'indi' );" checked /> <span class='id'><%=customer.getId() %></span> <span class='gaip'>( 개인회원 )</span></label><br /></li>
                <li>고객님 즐거운 쇼핑 하세요!</li>
            </ul>
</div>
<%
}
%>

        <p class="copy">
            고객님의 아이디 찾기가 성공적으로 이루어졌습니다. 항상 고객님의 <br/>
            즐겁고 편리한 쇼핑을 위해 최선의 노력을 다하는 쇼핑몰이 되도록 하겠습니다.
        </p>
        <p class="button">
            <a href="" class="">로그인</a>
            <a href="" class="">비밀번호 찾기</a></p>
    </div>
</div>
        </div><hr class="layout"/></div><hr class="layout"/></div>
</body>

</html>
