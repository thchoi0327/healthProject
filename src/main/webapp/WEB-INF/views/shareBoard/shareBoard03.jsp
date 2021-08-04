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
				<c:if test="${empty lendlist}">
					<div class="noBoard"># 현재 등록된 게시글이 없습니다.</div>
				</c:if>
			
				<c:forEach items="${lendlist}" var="dto">
					<div class="innerlist" onclick="LendcontentView(${dto.shareLend_num})">
						<div class="dtoImgBox">
							<img src="/resources/img/uploadShare/${dto.shareLend_file}" class="dtoImg">
						</div>
						<div class="dtoTitle">${dto.shareLend_title}</div>
						<div class="dtoNick">대여자 : ${dto.shareLend_nick}</div>
					</div>
				</c:forEach>
			</div>
		    <div class="innerBtnBox" onclick="LendWriteView()" style="background-color: #fcce00">
    			<div class="wirteBtn">빌려드려요</div>
    			<img src="/resources/img/util/forward.png">
    		</div>
		</div>
	    
	</body>
</html>