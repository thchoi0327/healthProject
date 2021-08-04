/*이메일*/
var getMail = RegExp(/^[A-Za-z0-9_\.\-]$/);
var getIDCheck = RegExp(/^[a-zA-Z0-9]{6,16}$/);
var getPWCheck = RegExp(/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/);
var getName = RegExp(/^[가-힣]+$/);
var fmt = RegExp(/^\d{6}[1234]\d{6}$/); //형식 설정 
var nameExp = RegExp(/^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/); // 이름 유효성 검사
var nickExp = RegExp(/^[가-힣]{2,10}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/); // 닉네임 유효성 검사
var telExp = RegExp(/^?:\d{3}|\d{4}$/);
var randomNumber = '';
var checkUserState = 'false'
var idCheck = 'false';
var nickCheck = 'false';




function loadingOpen() {
	$('.loadingDiv').css("visibility", "visible");
}
function loadingClose() {
	$('.loadingDiv').css("visibility", "hidden");
}
function emailmodalOpen() {
	$('.emailNumCheck').css("visibility", "visible")
}
function emailmodalClose() {
	$('.emailNumCheck').css("visibility", "hidden")
	$('#emailCheckText').val('');
	randomNumber = ''
}
function checkUser() {
	var userNum = $('#emailCheckText').val();
	if (userNum == '') {
		alert('인증 번호를 입력해주세요.');
		return;
	}
	if (randomNumber == userNum) {
		$("#user_email1").attr("readonly", true);
		$('#user_email2').attr("disabled", true);
		$("#user_email1").css("border-bottom", "3px solid green");
		checkUserState = 'true';
		emailmodalClose()
		$('#mailBtn').css("display", "none");
		$('#user_email2').css("width", "450px");
	} else {
		alert('인증 번호가 일치하지 않습니다.')
		$('#emailCheckText').val('');
		$('#emailCheckText').focus();
	}
}



/*이메일*/
function mailCheck() {
	if ($('#user_email1').val() == '') {
		$('#user_email1').focus();
		alert('이메일을 입력해주세요.')
		return;
	}
	if ($('#userEmail2').val() == '') {
		$('#userEmail2').focus();
		alert('이메일 형식을 선택해주세요.')
		return;
	}


	// 로딩 화면 띄우기 (메일 보내는 시간이 좀 걸려서 만들었음)
	loadingOpen();

	var emailAdr = $('#user_email1').val() + '@' + $('#user_email2').val();
	$.ajax({
		url: "/user/EmailCheck",
		type: "POST",
		dataType: "JSON",
		data: { 'emailAdr': emailAdr },
		success: function(data) {
			if (data.result == 'true') {
				alert('메일을 전송하였습니다. 인증 번호를 입력해주십시오.')
				randomNumber = data.randomNum;
				loadingClose();
				emailmodalOpen();
			} else {
				alert('메일 주소를 잘 못 입력하셨습니다.')
				$('#user_email1').focus();
				loadingClose();
				emailmodalClose()
			}
		},
		error: function() {
			alert('메일 전송에 실패하였습니다.');
			loadingClose();
			emailmodalClose()
		}
	})
}

/*ID 중복 체크 */
function idmultipleCheck() {
	if ($('#user_id').val() == '') {
		$('#user_id').focus();
		alert('ID를 입력해주세요.')
		return;
	}
	//아이디 유효성검사 
	if (!getIDCheck.test($("#user_id").val())) {
		alert("아이디는 6~16글자로 특수문자 포함이 불가합니다.");
		$("#user_id").val("");
		$("#user_id").focus();
		return false;
	}
	$.ajax({
		url: "/user/idMultipleCheck",
		type: "POST",
		dataType: "JSON",
		data: {
			"user_id": $('#user_id').val()
		},
		success: function(data) {
			if (data.result == 'true') {
				alert('사용 가능한 ID 입니다')
				$("#user_id").attr("readonly", true);
				$("#user_id").css("border-bottom", "3px solid green");
				idCheck = 'true';
			} else {
				alert('이미 사용중인 ID 입니다.')
			}
		},
		error: function() {
			alert('실패')
		}
	})
}

/* 닉네임 중복체크 */
function nickmultipleCheck() {
	if ($('#user_nick').val() == '') {
		$('#user_nick').focus();
		alert('닉네임을 입력해주세요.')
		return;
	}
	if (!nickExp.test($("#user_nick").val())) {
		alert("닉네임은 2~10 한글/영어만 입력가능합니다.")
		$("#user_nick").val("");
		$("#user_nick").focus();
		return;
	}
	$.ajax({
		url: "/user/nickmultipleCheck",
		type: "POST",
		dataType: "JSON",
		data: {
			"user_nick": $('#user_nick').val()
		},
		success: function(data) {
			if (data.result == 'true') {
				alert('사용 가능한 닉네임입니다')
				$("#user_nick").attr("readonly", true);
				$("#user_nick").css("border-bottom", "3px solid green");
				nickCheck = 'true';
			} else {
				alert('이미 사용중인 닉네임입니다.')
			}
		},
		error: function() {
			alert('실패')
		}
	});
}



// 최종 보내기
function joinCheck(f) {
	//아이디 공백 확인 
	if ($("#user_id").val() == "") {
		alert("아이디를 입력해주세요.");
		$("#user_id").focus(); return false;
	}
	//이름 공백 검사 
	if ($("#user_name").val() == "") {
		alert("이름을 입력해주세요");
		$("#user_name").focus(); return false;
	}

	//비밀번호 공백 확인 
	if ($("#user_pw").val() == "") {
		alert("비밀번호를 입력해주세요.");
		$("#password").focus(); return false;
	}
	//이메일 공백 확인 
	if ($("#user_email1").val() == "") {
		alert("이메일을 입력해주세요");
		$("#user_email1").focus(); return false;
	}
	//비밀번호 확인란 공백 확인 
	if ($("#user_pw2").val() == "") {
		alert("패스워드 확인란을 입력해주세요");
		$("#user_pw2").focus(); return false;
	}
	//아이디 유효성검사 
	if (!getIDCheck.test($("#user_id").val())) {
		alert("아이디는 6~16글자로 특수문자 포함이 불가합니다.");
		$("#user_id").val("");
		$("#user_id").focus();
		return false;
	}
	//비밀번호 서로확인 
	if ($("#user_pw").val() != $("#user_pw2").val()) {
		alert("비밀번호가 일치하지 않습니다.");
		$("#user_pw").val("");
		$("#user_pw2").val("");
		$("#user_pw").focus();
		return false;
	}
	//아이디 비밀번호 같음 확인 
	if ($("#user_id").val() == $("#user_pw").val()) {
		alert("아이디와 비밀번호가 같습니다");
		$("#user_pw").val("");
		$("#user_pw").focus(); return false;
	}

	//비밀번호 유효성검사 
	if (!getPWCheck.test($("#user_pw").val())) {
		alert("비밀번호는 8~25자리 특수문자가 포함되어야합니다.");
		$("#user_pw").val("");
		$("#user_pw").focus(); return false;
	}
	//이름 유효성 검사 
	if (!nameExp.test($("#user_name").val())) {
		alert("이름은 한글만 입력이 가능합니다")
		$("#user_name").val("");
		$("#user_name").focus(); return false;
	}
	//닉네임 유효성 검사 
	if (!nickExp.test($("#user_nick").val())) {
		alert("닉네임은 한글만 입력이 가능합니다.")
		$("#user_nick").val("");
		$("#user_nick").focus(); return false;
	}
	if (idCheck == 'false') {
		alert('아이디 중복확인 해주세요.')
		$('#idCheckBtn').focus();
		return;
	}
	if (nickCheck == 'false') {
		alert('닉네임 중복확인 해주세요.')
		$('#nickCheckBtn').focus();
		return;
	}
	if (checkUserState == 'false') {
		alert('이메일 본인 인증해야합니다.')
		$('#mailBtn').focus();
		return;
	}

	// disabled 속성을 true로 해놨기때문에(이메일 인증을 마쳤는데 사용자가 이메일을 갑자기 변경하는경우가 없기위해서)
	// disabled 속성을 제거해준다 왜냐하면
	// disabled 를 걸게 되면 form 으로 넘길때 데이터 안넘어가기때문에
	var user_tel = $('#userPhone1').val() + $('#userPhone2').val() + $('#userPhone3').val();
	check_user_tel = Number(user_tel);
	// 숫자만 들어있는지 확인
	if(isNaN(check_user_tel)){
		alert('전화번호에는 숫자만 입력해주세요.')
		return;
	}
	if(user_tel.length < 11){
		alert('전화번호 11자리를 입력해주세요.')
		return;
	}
	var user_email = $('#user_email1').val() + '@' + $('#user_email2').val();
	$('#user_tel').val(user_tel);
	$('#user_email').val(user_email)
	$.ajax({
		url:"/user/newMember",
		type:"POST",
		dataType:"JSON",
		data:$(f).serialize(),
		success:function(data){
			if (data.result == 'true'){
				alert('회원가입이 성공적으로 완료되었습니다.')
				location.href="/user/rootAccess";
			}else {
				alert('회원가입에 실패하였습니다.')
			}
		},
		error:function(){
			alert('실패')
		}
	})
}












