<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Madhvi</title>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" >
<link href="https://fonts.googleapis.com/css?family=Raleway|Roboto" rel="stylesheet">
<link href='https://fonts.googleapis.com/css?family=VT323' rel='stylesheet' type='text/css'>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"/>
<link href="${pageContext.request.contextPath}/resources/newpos/css/saleslogin.css" rel="stylesheet" type="text/css" />
<style type="text/css">
#overlay2 {
	position: fixed;
	display: none;
	width: 100%;
	height: 100%;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background-color: rgba(239, 219, 219, 0.5);
	z-index: 10000;
	cursor: pointer;
}

#text2 {
	position: absolute;
	top: 50%;
	left: 50%;
	font-size: 25px;
	color: white;
	transform: translate(-50%, -50%);
	-ms-transform: translate(-50%, -50%);z-index: 10000;
}

</style>
</head>

<body>
<c:url var="checkValidEmployee" value="/checkValidEmployee" />
		<div style="color:#fff;text-align: right;"><a href="${pageContext.request.contextPath}/logout"><i class="fa fa-sign-out" aria-hidden="true"></i> Logout </a></div>

		<div id="overlay2">
			<div id="text2">
				<img
					src="${pageContext.request.contextPath}/resources/newpos/images/loader.gif"
					alt="madhvi_logo">
			</div>
		</div>
<div class="container">
<c:forEach items="${empList}" var="empList">
<input type="hidden" name="empId" id="empId${count.index}" value="${empList.frEmpId}" />
<div class="items" onclick="showNumPad(${empList.frEmpId})">
    <div class="icon-wrapper">
      <i class="fa fa-user-o "></i>
    </div>
    <div class="project-name">
      <p>${empList.frEmpName}</p>
    </div>
  </div>
</c:forEach>
  
 <div id="open-modal" class="modal-window">
  <div>
  
     <div class="keypad_wrapper">    <a href="#" title="Close" class="modal-close" onclick="hideNumPad()">Close</a>
	<div class="screen"></div>
	<div class="flasher"></div>
	<div class="error notification">ERROR</div>
	<div class="success notification">SUCCESS</div>
	
	<div class="key">1</div>
	<div class="key">2</div>
	<div class="key">3</div>
	<div class="key">4</div>
	<div class="key">5</div>
	<div class="key">6</div>
	<div class="key">7</div>
	<div class="key">8</div>
	<div class="key">9</div>
	<div class="key last">0</div>
	
</div></div>
</div>
</div>
<script type="text/javascript">

window.pass = "~~~~";
window.redirectURL = '${pageContext.request.contextPath}/frLoginProcess';

function showNumPad(empId)
{
	            $.post('${checkValidEmployee}',
				{
		            empId: empId,
					ajax: 'true'
				},
				function(data) {
					window.pass =data;
				});
	var div = document.getElementById('open-modal');
	div.style.visibility = 'visible';
	div.style.opacity = '1';
	div.style.pointerEvents = "auto";

}
function hideNumPad()
{
	var div = document.getElementById('open-modal');
	div.style.visibility = 'hidden';
	div.style.opacity = '0';
	div.style.pointerEvents = "none";
	$('.screen').html('');	window.tries = 0;

}
$(document).ready(function() {
	start();
});


function start(){
	window.tries = 0;
	
	$(".key").click(function(){
		var n = $(this).html();
		$('.screen').append( n );
		window.tries++;
		updateFlasher();
		validate();
	});
}

function updateFlasher(){
	if (window.tries <=3){
		var dis = window.tries * 55;
		$('.flasher').css({
			'left' : dis + 'px'
		});
	}
	else{
		$('.flasher').css({
			'left' : '20px',
			'display' : 'none'
		});
	}
}

function validate(){
	if (window.tries >= 4){
		checkWin();
		$('.screen').html('');
		window.tries = 0;
		$('.flasher').css({
			'display' : 'block'
		});
	}
	else{
		
	}
}

function checkWin(){
	var w = $('.screen').html();
	if (w == window.pass){
		document.getElementById("overlay2").style.display = "block";

		$('.success').show().delay(5000).queue(function(n) {
			$('.success').hide(); n();	hideNumPad();
		});
		var u = window.redirectURL;
		$(location).attr('href', u );
		//document.getElementById("overlay2").style.display = "none";
	
	}
	else{
		$('.error').show().delay(1000).queue(function(n) {
			$('.error').hide(); n();
		});
	}
}
</script>
</body>
</html>