<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="ko">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:700" rel="stylesheet" type="text/css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style type="text/css">
  	div {
  		padding: 0;
  		display: block;
  	}
  	#wrap {
  		position: relative;
  		margin: 0 auto;
  		width: 100%;
  	}
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
  	.titleArea {
  		margin: 22px 0px 60px;
  	}
  	.displaynone {
  		display: none !important;
  	}
  	hr.layout {
  		display: none;
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
  	h2 {
	    display: block;
	    -webkit-margin-before: 0.83em;
	    -webkit-margin-after: 0.83em;
	    -webkit-margin-start: 0px;
	    -webkit-margin-end: 0px;
	}
	p {
	    display: block;
	    -webkit-margin-before: 1em;
	    -webkit-margin-after: 1em;
	    -webkit-margin-start: 0px;
	    -webkit-margin-end: 0px;
	}
	img {
    border: none;
    vertical-align: top;
	}
  </style>
</head>
<body>
<%@ include file="../include/uppermost-nav.jsp" %>
<div class="container col-xs-12" id="id-main-contents">
<div id="wrap">
	<div id="container">
		<div id="contents02">
			<div class="titleArea">
				<h2>company info</h2>
			</div>
			<div class="class=xans-element- xans-mall xans-mall-company">
				<div>
					<p><br></p>
					<p><br></p>
					<p>서울특별시 동대문구 장안동 430-3 광성빌딩(치헌빌딩) 6층 프홈헤드투토</p>
					<p><br></p>
					<p><br></p>
					<p>
						<img src="../images/ywj/location.png">
					</p>
				</div>
				<div class="displaynone">
					<h3>위치</h3>
					<p></p>
				</div>
			</div>
		</div>
		<hr class="layout">
	</div>
	<hr class="layout">
</div>
</div>
<%@ include file="../include/lowermost-footer.jsp" %>
</body>
</html>