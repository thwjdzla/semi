
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>

  <title>Bootstrap Template</title>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>





</head>
<body>
<div id="container">   
<div id="contents02">
<div id="wrap">    


<form id="member_form_4021674551" name=""  method="post" action="login.jsp" >
<input id="returnUrl" name="returnUrl" value="/index.html" type="hidden"  />
<input id="forbidIpUrl" name="forbidIpUrl" value="/index.html" type="hidden"  />
<input id="certificationUrl" name="certificationUrl" value="/intro/adult_certification.html?returnUrl=" type="hidden"  />
<input id="sIsSnsCheckid" name="sIsSnsCheckid" value="" type="hidden"  />
<input id="sProvider" name="sProvider" value="" type="hidden"  /><div class="xans-element- xans-member xans-member-login "><!--
        $defaultReturnUrl = /index.html
        $forbidIpUrl = member/adminFail.html
    -->
<h3></h3>
<%
		String fail = request.getParameter("fail");
			
			if (fail != null && "invalid".equals(fail)) {
		%>
			<script>
			alert("아이디 또는 비밀번호가 올바르지 않습니다");
			document.location.href = "main.jsp";
			</script>
			
		<%
			} else if (fail != null && "deny".equals(fail)) {
		%>
			<a href="main.jsp"></a>
		<%
			}
		%>
		
<div class="login">

 <fieldset>
  <jsp:include page="/include/uppermost-nav.jsp" />
<div class="loginpart" id="id-main-contents">
         <p style="font-weight:bold; padding-bottom:10px; color: #333;">MEMBER LOGIN</p>
           <label class="" ><span class=""></span><input type="text" placeholder="ID" style='width:90px; border-right:0px;' readonly  ><input type="text" name="cust_id"  class=""  value="" style='border-left:0px;'  /></label></br>
           <label class=""><span></span><input type="text" placeholder="PASSWORD" style='width:90px; border-right:0px;' readonly  ><input type="password" name="cust_passwd" value="" style='border-left:0px;'/></label>
 		 <p class="security">

                
  			     <input type="submit" class="btn btn-primary" value="login" />
            </div>              
            <div class="joinpart">
            <div class="join-btn">
                <p style="font-weight:bold; color: #333;">WELCOME JOIN!</p>
                <p style="margin-top:10px;  color: #333;">아직 회원이 아니신가요?</p>   
                <p style="margin-top:2px; color: #333;">회원가입하시면 다양한 혜택을 받아보실 수 있습니다.</p>   
                <a href="loginform.jsp">join us</a>
            </div>
       <p style="margin: 10px auto 0;">
             <a href="findidform.jsp" style="color: #333;">FIND ID</a> /
             <a href="findpawsord.jsp" style="color: #333;">FIND PASSWORD</a>
       </p>
       </div>
       </fieldset>
       </div>
       </div>
       </form>
        </div><hr class="layout"/></div><hr class="layout"/></div>
       <jsp:include page="/include/lowermost-footer.jsp" />
</body>
</html>
