<%@page import="semi.vo.Customer"%>
<%@page import="semi.dao.CustomerDao"%>
<%@page import="java.util.List"%>
<%@page import="semi.vo.PasswordHint"%>
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

<script type="text/javascript"> 

function confirm() {
	if(document.findIdForm.cust_id.value=="") {
		alert("아이디를 입력해주세요");
	       
		return false;
	}
	if(document.findIdForm.cust_email.value=="") {
		alert("이메일을 입력해주세요");
	       
		return false;
	}
	if(document.findIdForm.cust_name.value=="" ) {
		alert("이름을 입력해주세요");
		return false;
	}
	if(document.findIdForm.custpasswordconfirm.value=="" ) {
		alert("질문 답변을 입력해주세요");
		return false;
	}
	else 
		return true

}
</script>
<style>
<style type="text/css">
.my-box { border:1px solid; padding:10px;   }
</style>
</head>
<jsp:include page="/include/uppermost-nav.jsp" />
<body>
<div id="container" align="center">    
<div class="titleArea" id="id-main-contents">

    <p>비밀번호 찾기</p>
    <ul style="margin:10px 0 0 0"><li></li>
    </ul></div>

<form id="findIdForm" name="findIdForm" onsubmit="return confirm();" action="findpawsord.jsp" method="post"  >

<div class="my-box">
       
        <fieldset>
<legend></legend>
            <p class="member"><strong>회원유형</strong> <select id="" name="" >
<option value="indi" selected="selected">개인회원</option>
</select></p>

 <%
 String id = request.getParameter("id");
 CustomerDao customerDao = CustomerDao.getInstance();
 Customer customer = customerDao.login(id);
 List<PasswordHint> passwordHint = customerDao.quesstion();
 %>           
			<strong >아이디</strong> 
            <input id="cust_id" name="cust_id"  type="text"  value="<%=customer.getId()%>"/> <br/>  
            <strong >이름</strong> 
            <input id="cust_name" name="cust_name"  type="text"  /> <br/>   
             <strong >이메일</strong> 
            <input id="cust_email" name="cust_email"  type="text"  /> <br/>        
			<%
			if(passwordHint.isEmpty()) {
			%>
			<%
				} else { 	
			%>		
				<strong >비밀번호 질문 </strong>
                <select id="hint" name="custpasswordconfirm2">
                 
           <%  
           for(PasswordHint p : passwordHint) {
           
        	   %> 
				<option value="<%=p.getQuestionNo()%>"><%=p.getQuestionContents()%></option>
				
       		 <%
            }
			%>   
			</select> </br>
			   <%
				}
			  %>
            <strong >비밀번호답변</strong> 
            <input id="custpasswordconfirm" name="custpasswordconfirm"  type="text"  />  
   
   
            <p class="button ">
                <div class="btnArea center">
        <input type="submit" class="btn btn-primary"  id="submit"   value="확인" />
    </div>
  
        </fieldset>
</div>

</form>
</div>
<jsp:include page="/include/lowermost-footer.jsp" /> 
</body>
</html>