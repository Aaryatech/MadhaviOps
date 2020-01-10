<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Madhvi</title>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Raleway|Roboto"
	rel="stylesheet">
<link href='https://fonts.googleapis.com/css?family=VT323'
	rel='stylesheet' type='text/css'>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"
	type="text/javascript"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js" />
<link
	href="${pageContext.request.contextPath}/resources/newpos/css/saleslogin.css"
	rel="stylesheet" type="text/css" />
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
	-ms-transform: translate(-50%, -50%);
	z-index: 10000;
}
</style>
</head>

<body>
	<c:url var="checkValidEmployee" value="/checkValidEmployee" />
	<div style="color: #fff; text-align: right;">
		<a href="${pageContext.request.contextPath}/logout"><i
			class="fa fa-sign-out" aria-hidden="true"></i> Logout </a>
	</div>

	<div id="overlay2">
		<div id="text2">
			<img
				src="${pageContext.request.contextPath}/resources/newpos/images/loader.gif"
				alt="madhvi_logo">
		</div>
	</div>
	<div class="container">
		<c:forEach items="${empList}" var="empList">
			<input type="hidden" name="empId" id="empId${count.index}"
				value="${empList.frEmpId}" />
			<div class="items" id="items"
				onclick="showNumPad(${empList.frEmpId},'${empList.frEmpName}')">
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




				<div class="keypad_wrapper">

					<div style="text-align: right;">
						<i class="fa fa-times" class="modal-close" onclick="hideNumPad()"
							style="color: #FD2549;"> </i>
					</div>

					<div class="items" style="border: 0px;">

						<div class="icon-wrapper">
							<i class="fa fa-user-o " style="color: #FD2549;"></i>
						</div>

						<div class="project-name">
							<p id="selectedEmp" style="color: #FD2549;"></p>
						</div>
					
					<div class="project-name">
							<p id="error" class="error" style="color: RED; display: none;">ERROR</p>
							<p id="success" class="success" style="color: limegreen; display: none;">SUCCESS</p>
						</div>
					
					</div>

					<div>
					
					
						<input type="password" class="screen" id="screen" placeholder="Password"
							autofocus="autofocus">





					</div>




					<!-- <div class="flasher"></div> -->
					<!-- <div style="text-align: center;">
					<div class="error notification">ERROR</div>
					</div>
					
					<div class="success notification">SUCCESS</div> -->




					<!-- <div class="key">a</div>
	<div class="key">2</div>
	<div class="key">3</div>
	<div class="key">4</div>
	<div class="key">5</div>
	<div class="key">6</div>
	<div class="key">7</div>
	<div class="key">8</div>
	<div class="key">9</div>
	<div class="key last">0</div> -->

				</div>



				<!-- <a href="#" title="Close" class="modal-close" onclick="hideNumPad()"><input
					type="button" value=Close></a> -->
			</div>




		</div>
	</div>
	</div>
	<script type="text/javascript">
		$(function() {
			$(document).on("keypress", function() {
				$("#screen").focus();
			});

		});

		$('#open-container').on('shown', function() {
			$('#screen').focus();
		})

		window.pass = "~~~~";
		window.redirectURL = '${pageContext.request.contextPath}/frLoginProcess';

		function showNumPad(empId, name) {

			$.post('${checkValidEmployee}', {
				empId : empId,
				ajax : 'true'
			}, function(data) {
				//document.getElementById('screen').focus();
				window.pass = data;
			});
			var div = document.getElementById('open-modal');
			div.style.visibility = 'visible';

			div.style.opacity = '1';
			div.style.pointerEvents = "auto";
			document.getElementById('screen').focus();

			document.getElementById("selectedEmp").innerHTML = name;

		}
		function hideNumPad() {

			var div = document.getElementById('open-modal');
			div.style.visibility = 'hidden';
			div.style.opacity = '0';
			div.style.pointerEvents = "none";
			$('.screen').html('');
			window.tries = 0;
			document.getElementById('screen').value = "";

		}
		$(document).ready(function() {
			start();
		});

		function start() {

			window.tries = 0;
			$('#screen').bind('input', function() {

				var n = $(this).html();
				$('.screen').append(n);
				window.tries++;
				updateFlasher();
				validate();
			});
		}

		function updateFlasher() {

			if (window.tries <= 3) {
				var dis = window.tries * 55;
				$('.flasher').css({
					'left' : dis + 'px'
				});
			} else {
				$('.flasher').css({
					'left' : '20px',
					'display' : 'none'
				});
			}
		}

		function validate() {
			$('.error').hide();
			$('#screen').keyup(function(e) {

				if (e.keyCode == 13) {
					$('.error').hide();
					checkWin();
					$('.screen').val('');
					window.tries = 0;
					$('.flasher').css({
						'display' : 'block'
					});
				}
			});

		}

		function checkWin() {
			$('.error').hide();
			//$('.success').hide();
			
			var w = $('#screen').val();
			
			//alert(w);
			
			if (w == window.pass) {
				document.getElementById("overlay2").style.display = "block";
				$('.error').hide();
				$('.success').show().delay(5000).queue(function(n) {
					$('.error').hide();
					$('.success').hide();
					n();
					hideNumPad();
				});
				var u = window.redirectURL;
				$(location).attr('href', u);
				//document.getElementById("overlay2").style.display = "none";

			} else {
				$('.error').hide();
				$('.error').show().delay(1000).queue(function(n) {
					$('.error').hide();
					//alert("ERROR!")
					n();
				});
			}
		}
	</script>



</body>
</html>