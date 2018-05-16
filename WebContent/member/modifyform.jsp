<%@page import="semi.vo.Customer"%>
<%@page import="java.util.List"%>
<%@page import="semi.dao.CustomerDao"%>
<%@page import="semi.vo.PasswordHint"%>
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
  <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script type="text/javascript"> 




function execDaumPostcode() {

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
			
            document.getElementById('loanPostNo').value = data.zonecode; //5자리 새우편번호 사용

            document.getElementById('loanAddr1').value = fullAddr;



            // 커서를 상세주소 필드로 이동한다.

            document.getElementById('loanAddr2').focus();

             

        },

     theme: {

	}

    }).open({

    	popupName: 'postcodePopup'

    });

}

</script>

<script type="text/javascript"> 
$(function(){	

	$(document).ready(function(){

		$('select[name=emailSelection]').change(function() {

			if($(this).val()=="1"){

				$('#email2').val("");
				$("#email2").attr("readonly", false);

			} else {

				$('#email2').val($(this).val());
				$("#email2").attr("readonly", true);


			}

		});

	});

});
</script>


<style type="text/css">
.my-box5 { border:1px solid; padding:10px; }
</style>

<style type="text/css">
.my-box6{ border:1px solid; padding:10px;  }
</style>

   
<script type="text/javascript"> 

function confirm(joinForm) {
	
	var cust_id = document.getElementById("cust_id").value;
	var cust_password = document.getElementById("cust_password").value;
	var cust_password2 = document.getElementById("cust_password2").value;
	
	var cust_name = document.getElementById("cust_name").value;
	var loanPostNo = document.getElementById("loanPostNo").value;
	var loanAddr2 = document.getElementById("loanAddr2").value;
	var cust_phone2 = document.getElementById("cust_phone2").value;
	var cust_phone3 = document.getElementById("cust_phone3").value;
	var cust_email = document.getElementById("cust_email").value;
	
	if(cust_id =="") {
		alert("아이디를 입력해주세요");

		return false;
	} 
	if(cust_password =="") {
		alert("비밀번호를 입력해주세요");

		return false;
	} 
	if(cust_password2 =="") {
		alert("비밀번호확인칸을 입력해주세요");

		return false;
	}
	if(cust_password2 != cust_password2) {
		alert("두 비밀번호를 동일 하게 입력해주세요");

		return false;
	}
	
	
	if(cust_name =="") {
		alert("이름을 입력해주세요");

		return false;
	} 
	if(loanPostNo =="") {
		alert("주소를 입력해주세요");

		return false;
	} 
	if(loanAddr2 =="") {
		alert("상세주소를 입력해주세요");

		return false;
	} 
	if(cust_phone2 =="") {
		alert("핸드폰번호를 입력해주세요");

		return false;
	} 
	if(cust_phone3 =="") {
		alert("핸드폰번호를 입력해주세요");

		return false;
	} 
	if(cust_email2 =="" ) {
		alert("이메일을 입력해주세요");

		return false;
	} 
    return true;
}
</script>

</head>

<body>
<% 
CustomerDao customerDao = CustomerDao.getInstance();
Customer customers = (Customer) session.getAttribute("logged-in-user");

if(customers == null){
	response.sendRedirect("/semi/index.jsp");
	return;
}
%>


<jsp:include page="/include/uppermost-nav.jsp"  />

<div class="container" align="left">
<div id="wrap">    
<div id="container">    
<div id="contents02">
<div class="titleArea" id="id-main-contents">

    <h4 style="text-align:center" ><font color="#181407" >JOIN US</font></h4>
</div>


<form id="joinForm" name="joinForm"  onsubmit="return confirm(this);" action="modify.jsp" method="post"  >

<div class="xans-element- xans-member xans-member-join ">
	<div class="boardWrite type" >
        <table border="1" summary="">
			<caption></caption>
        	<tbody>
				<tr>
					<th scope="row" >회원구분 </th>
               	 	<td><input id="member_type0" name="member_type"  value="p" type="radio" checked="checked" ><label>개인회원</label></td>
            	</tr>
			</tbody>
		</table>
	</div>
	</div>
<h5  style="text-align:left"  >기본정보</h5>
        <table border="1" summary="">

	<caption></caption>
        <tbody>
			<tr>
				<th scope="row">아이디 </th>
                <td><input type="text" name="cust_id"  class="" value="<%=customers.getId()%>"  id="cust_id" readonly="readonly" />
                <input type="button" value="중복확인" onClick="confirmid()"/>
            </tr>
			<tr>
				<th scope="row">비밀번호 </th>
                <td><input id="cust_password" name="cust_password" maxlength="16" value="" type="password"  /> (영문 대소문자/숫자 4자~16자)</td>
            	<td id="pwsame" style="color:red;"></td>
            </tr>
			<tr>
				<th scope="row">비밀번호 확인 </th>
                <td><input id="cust_password2" name="cust_password2"   maxlength="16" value="" type="password"  /></td>
            </tr>
       
            <%             
            PasswordHint passwordHint2 = new PasswordHint();
            List<PasswordHint> passwordHint = customerDao.quesstion();
            int no = customers.getNo();

            PasswordHint ph =  customerDao.myQuestion(no);
		

			%>
			<tr>
			<%
			if(passwordHint.isEmpty()) {
			%>
			
			<%
				} else { 	
			%>		
				<th scope="row">비밀번호 확인 질문 </th>
                <td>
                <select id="hint" name="custpasswordconfirm">
                  <option value="<%=ph.getQuestionNo()%>"><%=ph.getQuestionContents() %></option>
           <%   for(PasswordHint p : passwordHint) {
           
        	   %> 
				<option value="<%=p.getQuestionNo()%>"><%=p.getQuestionContents()%></option>
       		 <%
            }
			%>
			  </select>
			   <%
				}
			  %>
			  </td>
            </tr>
			<tr>
				<th scope="row">비밀번호 확인 답변 </th>
                <td><input id="cust_passwordconfirm" name="cust_ane" class="inputTypeText"  type="text" value="<%=ph.getAnswer()%>"  /></td>
            </tr>
			<tr>
				<th scope="row" id="nameTitle">이름 </th>
                <td>
                    <span id="nameContents"><input id="cust_name" name="cust_name"  class="ec-member-name" maxlength="30" value="<%=customers.getName() %>" type="text" readonly="readonly" /></span>
                </td>
            </tr>
			<tr id="nation">
			<tr>
				<th scope="row">주소 </th>
                <td>
                <input type="text" id="loanPostNo" name="cust_addres" value="<%= customers.getPostcode()%>" readonly="readonly"><img src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/btn_zipcode.gif" alt="우편번호" onclick="execDaumPostcode()" /><br/> 	
      			<input type="text" id="loanAddr1" name="cust_addres1" value="<%= customers.getFirstAddress()%>" readonly="readonly"> <br>
				<input type="text" id="loanAddr2" name="cust_addres2"value="<%= customers.getSecondAddress()%>" > <br>
                </td>
            </tr>
			<tr>			
           	 </tr>
           	 <% 
           	 	String str =customers.getTel();
           	 	String[] phone = str.split("-");
           	 	String phone1 = phone[0];
           		String phone2 = phone[1];
           		String phone3 = phone[2];
           	 %>
			 <tr>
			
				<th scope="row">휴대전화 </th>
               	    <td><select id="mobile1" name="cust_phone" value="<%=phone1 %>">
					<option value="010">010</option>
					<option value="011">011</option>
					<option value="016">016</option>
					<option value="017">017</option>
					<option value="018">018</option>
					<option value="019">019</option>
						</select>-<input id="cust_phone2" name="cust_phone2" maxlength="4"  type="text" value="<%=phone2 %>" />-<input id="cust_phone3" name="cust_phone3" maxlength="4"  value="<%=phone3 %>" type="text"  /></td>
            </tr>
			<tr class="">
					<th scope="row">SMS 수신여부 </th>
                	<td><label for=is_sms0><input id="is_sms0" name="is_sms" class="ec-base-chk" value="T" type="checkbox"  />동의함</label><p>쇼핑몰에서 제공하는 유익한 이벤트 소식을 SMS로 받으실 수 있습니다.</p>
                	</td>
            </tr>
            
				<tr>
					<th scope="row">이메일 </th>
               			 <td><input id="cust_email" name="cust_email"   type="text"  />@<input id="email2" name="cust_email2" type="text"  /><select id="emailSelection" name="emailSelection">
							<option value="" selected="selected">- 이메일 선택 -</option>
							<option value="naver.com">naver.com</option>
							<option value="daum.net">daum.net</option>
							<option value="nate.com">nate.com</option>
							<option value="hotmail.com">hotmail.com</option>
							<option value="yahoo.com">yahoo.com</option>
							<option value="empas.com">empas.com</option>
							<option value="korea.com">korea.com</option>
							<option value="dreamwiz.com">dreamwiz.com</option>
							<option value="gmail.com">gmail.com</option>
							<option value="1"  >직접입력</option>
					</select>
				</td>
            </tr>
			<tr class="">
				<th scope="row">이메일 수신여부 </th>
                <td><label for=is_news_mail0><input id="is_news_mail0" name="is_news_mail"  class="ec-base-chk" value="T" type="checkbox"  />동의함</label><p>쇼핑몰에서 제공하는 유익한 이벤트 소식을 이메일로 받으실 수 있습니다.</p>
                </td>
            </tr>
			  <tr class="">
						<th scope="row">평생회원</th>
          		 <td>
						<input id="is_lifetime0" name="is_lifetime" value="T" type="radio"  /><label for="is_lifetime0" >동의함</label>
						<input id="is_lifetime1" name="is_lifetime" value="F" type="radio" checked="checked"  /><label for="is_lifetime1" >동의안함</label>
        		    <ul class="txtDesc">
						<li>평생회원으로 가입하시면 <strong>프롬헤드투토</strong> 회원 탈퇴시까지는 휴면회원으로 전환되지 않으며, 고객님의 개인정보가 탈퇴시까지 안전하게 보관됩니다.</li>
						<li class="displaynone">지금 평생회원으로 가입하시면 쿠폰혜택을 드립니다. (쿠폰혜택을 받으신 경우, 3개월간 평생회원을 유지하셔야 합니다.)</li>
		  	 		</ul>
			

	
<h3>개인정보 취급 위탁 동의(선택)</h3>
    <div class="my-box5">
        <div class="my-box6">
                아래 내용의 동의 여부는 회원가입에 영향을 미치지 않습니다. 단, 동의 거부시 서비스 이용에 제한이 있을 수 있습니다.<br />
		    카카오톡 사용자일 경우 안내 메시지를 카카오톡으로 보내 드립니다<br />
	<br />
		- 위탁받는 자(수탁업체) :CJ대한통운<br />
		- 위탁업무의 내용:상품배송<br />
	<br />
		- 위탁받는 자(수탁업체) :LG CNS<br />
		- 위탁업무의 내용:카카오톡중개서비스<br />
	<br />
	<br />
	<br />
	<br />
         </div>
            <p class="check"><span>개인정보 취급 위탁에 동의하십니까?</span> <input id="" name=""  type="checkbox"  /><label for="agree_consignment_check0" >동의함</label></p>
        </div>
   
    
	<div class="btnArea center">
	
        <input type="submit" class="btn btn-primary" onclick="confirm()" id="submit" value="회원정보수정" />
        <a href="" class="btn btn-primary">취소</a>
       
        <span class="float:right">
            <a href="deletecustomer.jsp?id=<%=customers.getId()%>"  class="btn btn-primary">회원탈퇴</a>
        </span>
       
    </div>
    
         
    	</tbody>
			</table>
			</form>
		</div>
		</div>
</div>
    </div> 

        <hr class="layout"/><hr class="layout"/>


<jsp:include page="/include/lowermost-footer.jsp" />  
</body>
</html>