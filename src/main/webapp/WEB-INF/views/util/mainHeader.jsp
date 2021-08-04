<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<%-- 폰트 --%>
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">
		
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<link rel="stylesheet" href="/resources/css/util/mainHeader.css">
	
	<script>
	<%-- 토글식 버튼을 위한 변수 --%>
	var check = 'BEFORE'
	<%-- 상단 화면 내려옴 --%>
	function topOpen(){
		$('.Move').css("transform","translateY(0%)")
		$('.nav').css("background-color","#ed2823")
		$('.nav').css("border","none")
		$('.nav_right').css("background-color","white")
		$('.nav_left').html("<img src='/resources/img/headerimg/logo_white.png'>"+
							"<img src='/resources/img/headerimg/ment_after.png'>")
		$('.nav_right').html("<img src='/resources/img/headerimg/cancel.png'>")
		$('.full').css("transform","translateY(100%)")
		check = 'AFTER';
	}
	
	<%-- 상단 화면 닫음 --%>
	function topClose(){
		$('.Move').css("transform","translateY(-100%)")
		$('.full').css("transform","translateY(0%)")
		$('.nav_right').css("background-color","#ee2c3c")
		setTimeout(function() {
			$('.nav_left').html("<img src='/resources/img/headerimg/logo_red.png'>"+
								"<img src='/resources/img/headerimg/ment01.png'>")
			$('.nav_right').html("<img src='/resources/img/headerimg/menuIcon.png'>")
			$('.nav').css("background-color","#fff")
			$('.nav').css("border-bottom","1px solid #ddd")
		}, 2000);
		check = 'BEFORE'
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

	
	function loginCheck(f){
		if (f.user_id.value == ''){
			alert('아이디를 입력해주세요.')
			$(f.user_id).focus();
			return;
		}
		if (f.user_pw.value == ''){
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
				if (data.result == 'true'){
					location.href="/user/rootAccess";			
				}else {
					alert('로그인에 실패하였습니다.')
					$(f.user_id).val('');		
					$(f.user_pw).val('');		
				}
			}
		})
		
	}
	$(function(){
		<c:if test="${not empty sessionScope.userNick}">
			$.ajax({
				url:"/msg/countMsg",
				type:"post",
				dataType:"JSON",
				data:{mReceiveNick:'${sessionScope.userNick}'},
				success:function(data){
					$('.messageCount').html(data.count)
				},
			})
		</c:if>
	})
	
	
	function sessionNULL(){
		<c:if test="${empty sessionScope.userNick}">
			alert('로그인 후 이용해주십시오.')
			return true;
		</c:if>
	}
	
	function loginEnterkey() {
        if (window.event.keyCode == 13) {
        	$('.submitBtn').trigger("click");
        }
	}
	
	</script>
</head>
<body>
	
	
	<jsp:include page="./msgPage.jsp"></jsp:include>
	
	<%-- 관리자일때는 다른 메뉴바가 보임 --%>
	<c:if test="${not empty sessionScope.userNick}">
		<c:choose>
			<c:when test="${sessionScope.userNick eq '관리자' }">
				<jsp:include page="../admin/adminNoticeMsg.jsp"></jsp:include>
				<jsp:include page="./amdinRightFixed.jsp"></jsp:include>
			</c:when>
			<c:otherwise>
				<jsp:include page="./rightFixed.jsp"></jsp:include>
			</c:otherwise>
		</c:choose>
	</c:if>
	


	<div class="nav">
		<a href="/user/rootAccess" class="nav_left" >
			<img src="/resources/img/headerimg/logo_red.png" >
			<img src="/resources/img/headerimg/ment01.png">
		</a>
		<div class="nav_right_menu">
			<% if (session.getAttribute("userNick") != null){ %>
				<div class="nav_right_message01">
					<a href="/user/myPageAccess.do" >
						<img src="/resources/img/headerimg/message.png">
						<div class="messageCount">0</div>
					</a>
				</div>
			<%} %>
			<div class="nav_right" onclick="TopToggle()">
				<img src="/resources/img/headerimg/menuIcon.png">
			</div>
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
							<a onclick="modalOpen()" class="login">로그인</a>
							<a href="/user/newMember">회원가입</a>
							<a href="/lessonBoardAccess">능력자 찾기</a>
							<a href="/shareBoardAccess">운동기구대여</a>
						<%}else { %>
							<c:choose>
								<c:when test="${sessionScope.userNick eq '관리자' }">
									<a href="/admin/AdminAccess01">관리자 페이지</a>
								</c:when>
								<c:otherwise>
									<a href="/user/myPageAccess.do">마이 페이지</a>	
								</c:otherwise>
							</c:choose>
							
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
					<img class="modalclose" src="/resources/img/headerimg/close.png" onclick="modalClose()">
				</div>
				<div class="modal_body">
					<form id="loginForm" method="POST">
						<label for="id">아이디</label>
						<input type="text"  id="id" name="user_id" placeholder="아이디를 입력하세요" maxlength="17"><br />
						<label for="pw">비밀번호</label>
						<input type="password"  id="pw" name="user_pw" placeholder="비밀번호를 입력하세요" maxlength="30" onkeyup="loginEnterkey()"><br />
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