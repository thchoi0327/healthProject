<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="/resources/css/admin/teacherView.css">
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
			<div>
				<form></form>
			</div>
		</div>
	</body>
</html>