<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>능력자들</title>
	<link rel="stylesheet" href="/resources/css/user/index.css">
</head>
	<body>
		<%-- 메뉴바 include --%>
		<jsp:include page="../util/indexHeader.jsp"></jsp:include>
		
		<%-- 오른쪽 화면 --%>
		<div class="MoveRight">
			<video id="rightVideo" src="/resources/mp4/introBanner.mp4"  controls></video>
		</div>
		
		<%-- 백그라운드 동영상 --%>
		<div class="full">
	    	<video autoplay loop muted><source src="/resources/mp4/intro.mp4" type="video/mp4"></video>
		</div>
		
	</body>
</html>