<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="/resources/css/user/myPage02.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	
	<script>
		function msgPageMove(f){
			$(f).submit()
		}
		
		function myPwCheckOpen(){
			$('#pwCheck').val('');
			$('.myMiddleInner').css("display","none")
			$('.myMiddleInnerCheck').css("visibility","visible");
		}
		function myPwCheckClsoe(){
			$('.myMiddleInner').css("display","flex")
			$('.myMiddleInnerCheck').css("visibility","hidden");
			setTimeout(function(){
				myPwCheckOpen()
			},10000) <%--5분 있다가 자동으로 잠김 --%>
		}
		
		function myPagePwCheck(){
			if ($('#pwCheck').val() == '${dto.user_pw}'){
				myPwCheckClsoe();
			}else {
				alert('비밀 번호가 일치 하지 않습니다.')
				$('#pwCheck').val('');
			}
		}
		
		function enterkey() {
	        if (window.event.keyCode == 13) {
	        	myPagePwCheck();
	        }
		}
		
		function myPwOpen(){
			$('#myPwUpdateBtn').attr("type","button");
			$('#myPwUpdateOpenBtn').val('취소')
			$('#MyUser_pw').attr("readonly",false)
			$('#MyUser_pw').focus();
			$('#MyUser_pw').css("border","3px solid green")
		}
		function myPwClose(){
			$('#myPwUpdateBtn').attr("type","hidden");
			$('#myPwUpdateOpenBtn').val('수정')
			$('#MyUser_pw').attr("readonly",true)
			$('#MyUser_pw').css("border","1px solid #e8e8e8");
			$('#MyUser_pw').val('${dto.user_pw}');
			
		}
		
		function MyPwUpdateToggle(){
			if ( $('#myPwUpdateOpenBtn').val() == '수정' ){
				myPwOpen();
			}else{
				myPwClose();
			}
		}
		
		
		function myPwUpdateSubmit(f){
			var getPWCheck = RegExp(/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/);
			if (!getPWCheck.test($("#MyUser_pw").val())) {
				alert("비밀번호는 8~25자리 특수문자가 포함되어야합니다.");
				$("#MyUser_pw").val("");
				$("#MyUser_pw").focus();
				return;
			}
			if ( $('#MyUser_pw').val() == '${dto.user_pw}' ){
				alert('이 전에 사용하던 비밀번호는 이용할 수 없습니다.')
				return;
			}
			if ( confirm('비밀 번호를 수정하시겠습니까?') ){
				$(f).submit();	
			}
			
		}
		
		function viewPwText(){
			$('#MyUser_pw').attr('type','text');
		}
		function viewPassword(){
			$('#MyUser_pw').attr('type','password');	
		}
	</script>
</head>
<body>
	 <%-- 헤더 떙겨오기 --%>
	 <jsp:include page="../util/mainHeader.jsp"></jsp:include>
	 
	 <div class="full">
	 	<div class="myInnerFull">
	 		<div class="myLeft">
	 			<form action="/user/myPageAccess.do" method="POST" onclick="msgPageMove(this)" class="myForm01">쪽지</form>
	 			<form action="/user/myPageAccess02.do" method="POST" onclick="msgPageMove(this)" class="myForm02">내 정보</form>
	 			<form action="/user/myPageAccess03.do" method="POST" onclick="msgPageMove(this)" class="myForm03">신청서</form>
	 		</div>
	 		<div class="myMiddle">
	 			<div class="myMiddleInner">
		 			<label>아이디</label>
		 			<p>${dto.user_id}</p>
		 			<label>비밀번호</label>
		 			<form action="/user/changePassword.do" method="POST" class="updatePwForm">
		 				<img src="/resources/img/util/eye.png" class="viewPw" onmousedown="viewPwText()" onmouseleave="viewPassword()" onmouseup="viewPassword()">
		 				<input type="hidden" value="${dto.user_nick}" name="user_nick">
		 				<input type="password" value="${dto.user_pw }" id="MyUser_pw" name="user_pw" readonly maxlength="30">
		 				<input type="button" id="myPwUpdateOpenBtn" value="수정" onclick="MyPwUpdateToggle()">
		 				<input type="hidden" id="myPwUpdateBtn" value="수정 완료" onclick="myPwUpdateSubmit(this.form)">
		 			</form>
		 			<label>닉네임</label>
		 			<p>${dto.user_nick }</p>
		 			<label>전화 번호</label>
		 			<div class="myUserTelBox">
		 				<p>${fn:substring(dto.user_tel,0,3)}&nbsp; - </p>
		 				<p>${fn:substring(dto.user_tel,3,7)}&nbsp; - </p>
		 				<p>${fn:substring(dto.user_tel,7,11)}&nbsp;</p>
		 			</div>
		 			<label>이메일</label>
		 			<p>${dto.user_email }</p>
	 			</div>
	 			<div class="myMiddleInnerCheck">
	 				<div class="myMiddleInnerCheckPw">
	 					<p># 비밀번호 확인 후 이용 가능합니다.</p>
	 					<div class="pwCheckBox">
	 						<input type="password" id="pwCheck" maxlength="40" onkeyup="enterkey()">
	 						<input type="button" id="pwCheckBtn" onclick="myPagePwCheck()" value="">
	 					</div>
	 				</div>
	 			</div>
	 		</div>
	 		
	 		<div class="myRight">
	 			<c:choose>
		 			<c:when test="${empty tdto}">
		 				<div class="myRightImgBox">
			 				<img src="/resources/img/util/noImgfile.png" class="myRightImg">
			 				<h1> # 강사 전용 페이지 입니다.</h1>
		 				</div>
		 			</c:when>
		 			<c:otherwise>
		 			
		 			
			 			<div class="innerBox">
			 				<h1># 내 강사 정보</h1>
							<div class="innerBoxTop">
								<img src="/resources/img/uploadTeacher/${tdto.fileName}" class="topInnerImg">
								<div class="topInnerIntro">
									<label>이름</label>
									<p>${tdto.tname}</p>
									<label>종목</label>
									<p>${tdto.subject}</p>
									<label>지역</label>
									<p>${tdto.area}</p>
								</div>
								<div class="topInnerIntro">
									<label>자격증</label>
									<textarea class="licenseBox" readonly>${tdto.license}</textarea>
								</div>
							</div>
							<textarea class="innerBoxBottom" readonly>${tdto.introduce}</textarea>
						</div>
		 			
		 			</c:otherwise>
	 			</c:choose>
	 				
		 		
				
				
				
	 		</div>
	 	</div>
	 </div>
</body>
	</html>