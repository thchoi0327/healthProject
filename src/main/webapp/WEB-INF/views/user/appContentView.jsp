<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="/resources/css/user/appContentView.css">
</head>
	<body>
		<div class="appContentViewDiv">
			<label> 회원 닉네임</label>
			<p>${dto.astudentNick }</p>
			
			<label> 회원 전화 번호</label>
			<p>${fn:substring(dto.astudentTel,0,3)} - ${fn:substring(dto.astudentTel,3,7)} - ${fn:substring(dto.astudentTel,7,11)}</p>
			
			<label> 회원 레슨 날짜</label>
			<p>${dto.awantStartDate}  ~  ${dto.awantEndDate}</p>
			
			<label> 회원 레슨 시간</label>
			<p>${dto.awantTime }</p>
			
			<label> 추가 입력 사항</label>
			<textarea readonly>${dto.astudentText }</textarea>
		</div>
	</body>
</html>