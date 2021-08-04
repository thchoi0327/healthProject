<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/user/searchUser.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
        function viewDivId(){
            $('.searchPw').css("display","none")
            $('.searchId').css("display","flex")
            $('.SHleftSpan').css("display","block")
            $('.SHRightSpan').css("display","none")
        }
        function viewDivPw(){
            $('.searchId').css("display","none")
            $('.searchPw').css("display","flex")
            $('.SHleftSpan').css("display","none")
            $('.SHRightSpan').css("display","block")
        }

        
        function searchIdCheck(f){
        	if ( $('#user_nameID').val() == '' ){
        		alert('이름을 입력해주세요.');
        		$('#user_nameID').focus()
        		return;
        	}
        	if ( $('#user_emailID').val() == '' ){
        		alert('이메일을 입력해주세요.');
        		$('#user_emailID').focus()
        		return;
        	}
        	if ( $('#user_tel').val() == '' ){
        		alert('전화번호를 입력해주세요.');
        		$('#user_telID').focus()
        		return;
        	}
        	
        	user_telTemp = Number( $('#user_telID').val() );
        	if ( isNaN(user_telTemp) ){
        		alert("전화번호 입력칸에는 '-'를 제외한 숫자만 입력해주세요.")
        		return;
        	}
        	
        	if( $('#user_telID').val().length < 11){
        		alert('전화번호 11자리를 정확하게 입력해주세요.');
        		return;
        	}
        	loadingOpen()
        	$(f).submit();
        }
        
        function searchPwCheck(f){
        	if ( $('#user_namePw').val() == '' ){
        		alert('이름을 입력해주세요.');
        		$('#user_namePw').focus()
        		return;
        	}
        	if ( $('#user_idPw').val() == '' ){
        		alert('아이디를 입력해주세요.');
        		$('#user_idPw').focus()
        		return;
        	}
        	if ( $('#user_emailPw').val() == '' ){
        		alert('이메일을 입력해주세요.');
        		$('#user_emailPw').focus()
        		return;
        	}
        	loadingOpen()
        	$(f).submit();
        }
        
        function loadingOpen() {
        	$('.loadingDiv').css("visibility", "visible");
        }
        
    </script>
</head>
<body>
	<%-- 헤더 땡겨오기 --%>
	<jsp:include page="../util/mainHeader.jsp"></jsp:include>
	
	<%-- 로딩 화면 --%>
	<div class="loadingDiv">
        <img src="/resources/img/util/loading.png">
    </div>
	
	<div class="searchMain">
		<div class="searchHeader">
			<div class="SHleft" onclick="viewDivId()">
				<h1>ID찾기</h1>
				<span class="SHleftSpan"></span>
			</div>
			<div class="SHright" onclick="viewDivPw()">
				<h1>PW찾기</h1>
				<span class="SHRightSpan"></span>
			</div>
		</div>
		<form action="/util/searchId" class="searchBody searchId" method="POST">
			<h1># 아이디 찾기</h1>
			<label for="user_nameID">성명</label>
			<input type="text" id="user_nameID" name="user_name" placeholder="성명을 입력해주세요." maxlength="10">
			<label for="user_emailID">이메일 주소</label>
			<input type="text" id="user_emailID" name="user_email" placeholder="이메일 주소를 입력해주세요." maxlength="40">
			<label for="user_telID">전화번호</label>
			<input type="text" id="user_telID" name="user_tel" placeholder="'-'를 제외한 핸드폰 번호 11자리를 입력해주세요." maxlength="11">
			
			<input type="button" onclick="searchIdCheck(this.form)" value="완료">
		</form>
		<form action="/util/searchPw" class="searchBody searchPw" method="POST">
			<h1># 비밀번호 찾기</h1>
			<label for="user_namePw">성명</label>
			<input type="text" id="user_namePw" name="user_name" placeholder="성명을 입력해주세요." maxlength="10">
			<label for="user_idPw">아이디</label>
			<input type="text" id="user_idPw" name="user_id" placeholder="'-'를 제외한 핸드폰 번호 11자리를 입력해주세요." maxlength="11">
			<label for="user_emailPw">이메일</label>
			<input type="text" id="user_emailPw" name="user_email" placeholder="이메일 주소를 입력해주세요." maxlength="40">
			
			<input type="button" onclick="searchPwCheck(this.form)" value="완료">
		</form>

	</div>
</body>
</html>