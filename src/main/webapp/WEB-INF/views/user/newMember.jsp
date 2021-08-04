<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원 가입</title>
	<link rel="stylesheet" href="/resources/css/user/newMember.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="/resources/js/newMember.js"></script>
	<script>
	$(function() {
		checkUserState = 'false';
		idCheck = 'false';
		nickCheck = 'false';
		$('#user_id').val('')
		$('#user_nick').val('')
		$('#user_email').val('');
	})
	</script>	
</head>
<body>
	 <%-- 헤더 땡겨오기 --%>
	 <jsp:include page="../util/mainHeader.jsp"></jsp:include>
	 
	 
	 <%-- 로딩 화면 --%>
	<div class="loadingDiv">
        <img src="/resources/img/util/loading.png">
    </div>
    
    <%-- 메일 인증 번호 입력 modal --%>
    <div class="emailNumCheck">
        <div class="emailinnerCheck">
           <div class="innerMailHeader">
               <h2>인증번호를 입력해주세요.</h2>
               <img src="/resources/img/headerimg/close.png" onclick="emailmodalClose()">
           </div>
           <div class="innerMailBody">
	           <input type="text" placeholder="인증번호" maxlength="15" id="emailCheckText">
	           <input type="button" value="입력" onclick="checkUser()" >
           </div>
        </div>
    </div>
	
	
	
	
	<%-- 본 페이지 --%> 
	 <div class="full">
        <div class="container">
            <h1 class="intro_ment">회원가입</h1>
			<form action="/user/newMember" method="POST">
            <div class="innerBox">
                <label for="userid" class="label labelid">아이디</label>
                <div class="idBox">
                    <input type="text" id="user_id" name="user_id" placeholder="ID를 입력해주세요" maxlength="16">
                    <input type="button" id="idCheckBtn" onclick="idmultipleCheck()" value="중복확인">
                </div>
				
                <label for="user_name" class="label labelName">이름</label>
                <input type="text" id="user_name" name="user_name" placeholder="이름을 입력해주세요" maxlength="6">
    			
    			<label for="user_nick" class="label labelName">닉네임</label>
                <div class="idBox">
	                <input type="text" id="user_nick" name="user_nick" placeholder="닉네임을 입력해주세요." maxlength="8">
    	            <input type="button" id="nickCheckBtn" onclick="nickmultipleCheck()" value="중복확인">
                </div>
                
                <label for="user_pw" class="label labelPw">비밀번호</label>
                <input type="password" id="user_pw" name="user_pw" placeholder="비밀번호" maxlength="25">
                <input type="password" id="user_pw2" placeholder="비밀번호 확인" maxlength="25">

                <label for="userEmail" class="label labelEmail" >이메일</label>
                <div class="emailBox">
                	   <input type="hidden" name="user_email" id="user_email">
	                   <input type="text" id="user_email1" placeholder="이메일" maxlength="15">
	                   <p>@</p>
	                   <select id="user_email2">
	                           <option value="">이메일을 선택해주세요.</option>
	                           <option value="naver.com">naver.com</option>
	                           <option value="daum.net">daum.net</option>
	                           <option value="gmail.com">gamil.com</option>                
	                   </select>
                	<input type="button" id="mailBtn" onclick="mailCheck()" value="메일 인증하기">
                </div>
                
                
                <label for="userPhone1" class="label userPhone">핸드폰 번호</label>
                <div class="userPhoneBox">
                	<input type="hidden" name="user_tel" id="user_tel">
	                <select id="userPhone1">
	                	<option value="010">010</option>
	                	<option value="011">011</option>
	                	<option value="016">016</option>
	                </select>
	                <p>-</p>
	                <input type="text" id="userPhone2" maxlength="4" onkeyup="inputOnlyNumberFormat(this);">
	                <p>-</p>
	                <input type="text" id="userPhone3" maxlength="4" onkeyup="inputOnlyNumberFormat(this);">
                </div>
                <input type="button" id="submitBtn" value="가입하기" onclick="joinCheck(this.form)">
            </div>
            </form>
        </div>
    </div>
</body>
</html>