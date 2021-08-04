<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="/resources/css/shareBoard/shareBoard01.css">
	<script src="/resources/js/shareBoardTrade.js"></script>
</head>
<body>
		<div class="innerBox">
			<div class="innerListBox">
			<c:if test="${empty tradelist}">
				<div class="noBoard"># 현재 등록된 게시글이 없습니다.</div>
			</c:if>
			
			
			<c:forEach items="${tradelist }" var="dto">
				<div class="innerlist" onclick="onclick=contentView(${dto.shareTrade_num})">
					<div class="dtoImgBox">
						<img src="/resources/img/uploadShare/${dto.shareTrade_file}" class="dtoImg">
					</div>
					<div class="dtoTitle">${dto.shareTrade_title}</div>
					<div class="dtoNick">판매자 :  ${dto.shareTrade_nick}</div>
				</div>
			</c:forEach>
			</div>
			<div class="innerBtnBox" onclick="writeView()" style="background-color:#ed2823;">
	    		<div class="wirteBtn">판매 글 작성하기</div>
	    		<img src="/resources/img/util/forward.png">
	    	</div>
		</div>
</body>
</html>