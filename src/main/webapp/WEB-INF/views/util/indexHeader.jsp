<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<%-- 폰트 --%>
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">
	
	<link rel="stylesheet" href="resources/css/util/indexHeader.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script>
		<%-- 토글식 버튼을 위한 변수 --%>
		var check = 'BEFORE'
		var rightCheck = 'BEFORE'
		
		
		<%-- 오른쪽 화면 Open--%>
		function rightOpen(){
			topClose();
			$('.MoveRight').css("transform","translateX(0%)")
			$('.full').css("transform","translateX(-100%)")
			rightCheck = 'AFTER'
			setTimeout(function() {
				document.getElementById("rightVideo").play();
			},600)
		}
		
		<%-- 오른쪽 화면 Close--%>
		function rightClose(){
			$('.MoveRight').css("transform","translateX(100%)")
			$('.full').css("transform","translateX(0%)")
			document.getElementById("rightVideo").pause();
			rightCheck = 'BEFORE'
		}
		
		
		<%-- 상단 화면 내려옴 --%>
		function topOpen(){
			rightClose()
			$('.Move').css("transform","translateY(0%)")
			$('.full').css("transform","translateY(100%)")
			$('.nav_right').css("background-color","white")
			$('.nav_left').html("<img src='resources/img/headerimg/logo_white.png'>"+
								"<img src='resources/img/headerimg/ment_after.png'>")
			$('.nav_right').html("<img src='resources/img/headerimg/cancel.png'>")
			check = 'AFTER';
		}
		
		<%-- 상단 화면 닫음 --%>
		function topClose(){
			$('.Move').css("transform","translateY(-100%)")
			$('.full').css("transform","translateY(0%)")
			$('.nav_right').css("background-color","#ee2c3c")
			setTimeout(function() {
				$('.nav_left').html("<img src='resources/img/headerimg/logo_red.png'>"+
									"<img src='resources/img/headerimg/ment01.png'>")
				$('.nav_right').html("<img src='resources/img/headerimg/menuIcon.png'>")
			}, 1500);
			check = 'BEFORE'
		}
		
		
		<%-- 오른쪽 토글 버튼 --%>
		function RightToggle(){
			if (rightCheck == 'BEFORE'){
				rightOpen();
			}else {
				rightClose()
			}
		}
		
		<%-- 상단 화면 토글 버튼 --%>
		function TopToggle(){
			if (check == 'BEFORE'){
				topOpen()
			}else {
				topClose()
			}
		}
		
		
		
		
		
		
			<%--모달 js --%>
		function modalOpen(){
			$('.modalfull').css("visibility","visible");
		}
		
		function modalClose(){
			$('.modalfull').css("visibility","hidden");
		}
		$(function(){
			$('body').css("visibility","visible")
			$('body').css("opacity","1")
		})
		
		
		
		
		function loginCheck(f){
			var id = f.user_id.value;
			var pw = f.user_pw.value;
			if (id == ''){
				alert('아이디를 입력해주세요.')
				$(f.user_id).focus();
				return
			}
			if (pw == ''){
				alert('비밀번호를 입력해주세요.')
				$(f.user_pw).focus();
				return;
			}
			$.ajax({
			url:"/user/loginCheck",
			type:"POST",
			dataType:"JSON",
			data:$(f).serialize(),
			success:function(data){
				if (data.result == 'admin'){
					location.href="/admin/AdminAccess"					
				}else if (data.result == 'true'){
					location.href="/user/rootAccess"				
				}else {
					alert('로그인에 실패하였습니다.')
					$(f.user_id).val('');		
					$(f.user_pw).val('');		
				}
			}
		})
		}

	</script>
</head>
<body>
		 
		<%-- 상단 메뉴바 --%>
		<div class="nav" >
			<div class="nav_left" onclick="RightToggle()">
				<img src="resources/img/headerimg/logo_red.png" class="logoImg">
				<div class="nav_leftIn">
					<div id="clickme"> << Click Me ! </div>
					<img src="resources/img/headerimg/ment01.png">
				</div>
			</div>
			<div class="nav_right" onclick="TopToggle()">
				<img src="resources/img/headerimg/menuIcon.png">
			</div>
		</div>
		
		
		
		<%-- 위쪽 화면 --%>
	<div class="Move">
			<div class="Move_In">
				<div class="Move_header">
					<a>Magazine</a>
					<a>Facebook</a>	
				</div>
				<div class="Move_Body">
					<div class="Move_Body_left">
					<% if (session.getAttribute("userNick") == null){ %>
							<a onclick=" modalOpen()" class="login">로그인</a>
							<a href="/user/newMember">회원가입</a>
							<a href="/lessonBoardAccess">능력자 찾기</a>
							<a href="/shareBoardAccess">운동기구대여</a>
						<%}else { %>
							<a href="/user/myPageAccess.do">마이 페이지</a>
							<a href="/lessonBoardAccess">능력자 찾기</a>
							<a href="/shareBoardAccess">운동기구대여</a>
							<a href="/user/logout">로그아웃</a>
						<%} %>
					</div>
					<div class="Move_Body_right">
						<div class="Move_Body_rightIn">
							<img src="/resources/img/headerimg/download.png">
						<strong>MAKE∴GREATENESS</strong><br />
						위대함을 만들어 갑니다
						</div>
					</div>
				</div>
			</div>
		</div>
		
		
		<%-- 로그인 모달 --%>
		<div class="modalfull">
			<div class="loginModal">
				<div class="modal_head">
					<h1>로그인</h1>
					<img class="modalclose" src="/resources/img/headerimg/close.png" onclick=" modalClose()">
				</div>
				<div class="modal_body">
					<form id="loginForm" method="POST">
						<label for="id">아이디</label>
						<input type="text"  id="id" name="user_id" placeholder="아이디를 입력하세요" maxlength="17"><br />
						<label for="pw">비밀번호</label>
						<input type="password"  id="pw" name="user_pw" placeholder="비밀번호를 입력하세요" maxlength="30"><br />
						<div class="modal_body_foot">
							<label><input type="checkbox" name="rememberId" id="rememberId"> 자동로그인</label>
							<ul>
								<li><a href="/user/searchInfo">아이디 찾기</a></li>
								<li>|</li>
								<li><a href="/user/searchInfo">비밀번호 찾기</a></li>
							</ul>
						</div>
						<input type="button" class="submitBtn" onclick="loginCheck(this.form)" value="로그인">
					</form>
						<div class="mbf">
							<a href="#" class="mbfIn01"><img src="/resources/img/headerimg/naverIcon.png">네이버 로그인</a>
							<a href="#" class="mbfIn02"><img src="/resources/img/headerimg/kakaoIcon.png">카카오 로그인</a>
						</div>
				</div>
				<div class="modal_foot">
					<div class="modal_foot_left">신규지원자신가요?<br />지원 전 회원가입은 필수!</div>
					<div class="modal_foot_right">
						<a href="/user/newMember" class="mfr_Btn">
							회원가입 >
						</a>
					</div>
				</div>
			</div>
		</div>
	
		
		
		
		 
</body>
</html>