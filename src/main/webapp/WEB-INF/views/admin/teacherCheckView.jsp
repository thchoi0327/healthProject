<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="/resources/css/admin/teacherView.css">
	<script>
		function techerUpdateOk(f){
			if (confirm('해당 신청을 승인하시겠습니까?')){
				$(f).submit();
			}
		}
		function techerDeleteOk(f){
			if (confirm('해당 신청을 거절하시겠습니까?')){
				$(f).submit();
			}
		}
	</script>
</head>
	<body>
		<div class="innerBox">
			<div class="innerBoxTop">
				<img src="/resources/img/uploadTeacher/${dto.fileName}" class="topInnerImg">
				<div class="topInnerIntro">
					<label>이름</label>
					<p>${dto.tname}</p>
					<label>종목</label>
					<p>${dto.subject}</p>
					<label>지역</label>
					<p>${dto.area}</p>
				</div>
				<div class="topInnerIntro">
					<label>자격증</label>
					<textarea class="licenseBox" readonly>${dto.license}</textarea>
				</div>
			</div>
			<textarea class="innerBoxBottom" readonly>${dto.introduce}</textarea>
			<div class="teacherOkBtnBox">
				<form action="/admin/teacherOk" method="POST" onclick="techerUpdateOk(this)" class="techerOkBtn btnOk">
					<input type="hidden" name="tname" value="${dto.tname}">
					<input type="hidden" name="bid" value="${dto.bid}">
					승인
				</form>
				<form action="/admin/teacherDelete" method="POST" onclick="techerDeleteOk(this)" class="techerOkBtn">
					<input type="hidden" name="page" value="1">
					<input type="hidden" name="bid" value="${dto.bid}">
					거절
				</form>
			</div>
		</div>
	</body>
</html>