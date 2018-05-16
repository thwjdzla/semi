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
	if(document.findIdForm.cust_email.value=="") {
		alert("이메일을 입력해주세요");
	       
		return false;
	}
	if(document.findIdForm.cust_name.value=="" ) {
		alert("이름을 입력해주세요");
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
    <h5>Find ID</h5>
    <p>아이디 찾기</p>
    <ul style="margin:10px 0 0 0"><li>가입시 입력하신 이메일로 아이디 찾기가 가능합니다</li>
    </ul></div>

<form id="findIdForm" name="findIdForm" onsubmit="return confirm();" action="find_id_result.jsp" method="post"  >

<div class="my-box">
       
        <fieldset>
<legend></legend>
            <p class="member"><strong>회원유형</strong> <select id="" name="" >
<option value="indi" selected="selected">개인회원</option>
</select></p>
            
	
            <strong >이름</strong> 
            <input id="cust_name" name="cust_name"  type="text"  /> <br/>   
             <strong >이메일</strong> 
            <input id="cust_email" name="cust_email"  type="text"  />        
   
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