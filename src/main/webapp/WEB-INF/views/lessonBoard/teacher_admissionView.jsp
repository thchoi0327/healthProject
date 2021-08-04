<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>강사 등록 페이지</title>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<link rel="stylesheet" href="/resources/css/lessonBoard/teacherAdmin.css">
		<script type="text/javascript">
			function submitCheck(f){
				if ( $('#tid').val() == '' ){
					alert('로그인 후 이용할 수 있습니다.')
					return;
				}
				if ( $('#tname').val() == '' ){
					alert('로그인 후 이용할 수 있습니다.')
					return;
				}
				if ( $('#file').val() == '' ){
					alert('대표 사진을 입력해주세요 !')
					$('#file').focus();
					return ;
				}
				
				if ( $('#subject').val() == ''){
					alert('종목을 입력해주세요 !')
					$('#subject').focus();
					return;
				}
				
				if ( $('#area').val() == '' ){
					alert('지역을 입력해주세요.')
					$('#area').focus();
					return;
				}
				
				if ( $('#introduce').val() == ''){
					alert('내용을 입력해주세요 !')
					$('#introduce').focus();
					return;
				}
				
				$(f).submit();
				
			}
		</script>
	</head>
	<body>
		<form action="/lessonBoard/teacher_admission.do" class="innerFull" method="post" enctype="multipart/form-data">
			<p> # 강사 신청서 </p>
			<input type="hidden" id="tid" name="tid" value="${sessionScope.userId}">
			<input type="hidden" id="tname" name="tname" value="${sessionScope.userNick}">
			
			<label for="file">- 대표 사진 <img src="/resources/img/lessonimg/firstimg.png"></label>
			<input type="file" name="file" id="file" placeholder="대표 사진 선택">
			
			<label for="subject">- 종목 <img src="/resources/img/lessonimg/subjectimg.png"> </label>
			<input type="text" id="subject"name="subject" placeholder="종목을 입력하세요.">
			
			<label for="area">- 강습 지역을 입력해주세요 <img src="/resources/img/lessonimg/locationimg.png"> </label>
			<input type="text" name="area" id="area" placeholder="지역을 입력해주세요.">
			
			<label for="license">- 자격증<img src="/resources/img/lessonimg/licenseimg.png"></label>
			<textarea name="license" id="license" placeholder="ex ) - 생활 체육 지도자"></textarea>
			
			<label for="introduce">- 자기소개<img src="/resources/img/lessonimg/introduceimg.png"></label>
			<textarea name="introduce" id="introduce" placeholder="자신을 소개해주세요 !"></textarea>
			
			<input type="button" value="신청서 제출" id="submitBtn" onclick="submitCheck(this.form)">
		</form>
	</body>
</html>