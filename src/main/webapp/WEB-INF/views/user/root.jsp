<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="/resources/css/user/root.css">
	<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.css" /><%--SWIPER --%>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script><%--JQuery --%>
	<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script> <%--SWIPER --%>
</head>
<body>	
	<jsp:include page="../util/mainHeader.jsp"></jsp:include>
	
	
	<div class="full">
        <div class="main">
            <div class="left">
                     <div class="swiper-container">
					    <div class="swiper-wrapper">
					      <div class="swiper-slide"><a href=""><img src="/resources/img/userRootPage/userRoot02.jpg"></a></div>
					      <div class="swiper-slide"><a href=""><img src="/resources/img/userRootPage/userRoot04.jpg"></a></div>
					      <div class="swiper-slide"><a href=""><img src="/resources/img/userRootPage/userRoot03.jpg"></a></div>
					      <div class="swiper-slide"><a href=""><img src="/resources/img/userRootPage/userRoot01.jpg"></a></div>
					    </div>
					        <div class="swiper-button-next swiper-button-white"></div>
    						<div class="swiper-button-prev swiper-button-white"></div>
					  </div>
            </div>
            <div class="right">
                <a class="inner top" href="/lessonBoardAccess">능력자 찾기</a>
                <a class="inner middle" href="/shareBoardAccess">장비 공유/판매 게시판</a>
                <a class="inner bottom" href="">이용 방법</a>
            </div>
        </div>
    </div>
   <script>
     new Swiper('.swiper-container', {
        loop: true,
        centeredSlides: true,
	    autoplay: {
		    delay: 3000,
		    disableOnInteraction: false,
	    },
	    navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
      },
		});
  </script>
</body>
</html>