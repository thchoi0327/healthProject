<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>Insert title here</title>
	<link rel="stylesheet" href="/resources/css/admin/adminPage.css">
	<script>
		function SiteClose(f){
			if (confirm('!! 주의 !! 사이트를 닫으시겠습니까?')){
				f.submit();
			}
		}
		function SiteOpen(f){
			if (confirm('!! 주의 !! 사이트를 여시겠습니까?')){
				f.submit();
			}
		}
		function pageMoving(f){
			$(f).submit();
		}
	</script>
</head>
<body>
	<jsp:include page="../util/mainHeader.jsp"></jsp:include>
	<jsp:include page="./adminHeader.jsp"></jsp:include>
	
	
	<div class="full">
        <div class="adminInnerBox">
            <div class="adminIntro"># 관리자 페이지</div>
            <div class="adminInnerBox01">
                <div class="AIBLeft">
                    <form action="/admin/AdminAccess01" class="adminMenu adminMenu01" method="POST" onclick="pageMoving(this)">강사 신청서</form>
                    <form action="/admin/AdminAccess02" class="adminMenu adminMenu02" method="POST" onclick="pageMoving(this)"  >강사 리스트</form>
                    <form action="/admin/AdminAccess03" class="adminMenu adminMenu03" method="POST" onclick="pageMoving(this)" style="background-color:#fcce00">회원 리스트</form>
                </div>
                <div class="AIBCenter">
					<table>
	                	<tr height="50px;">
	                		<th>회원 이름</th>
	                		<th>회원 닉네임</th>
	                		<th>회원 아이디</th>
	                		<th>회원 이메일</th>
	                		<th>회원 성별</th>
	                	</tr>
	                	<c:if test="${empty list}">
	                		<tr>
	                			<td colspan="4" style="padding-left: 20px; height: 50px;">강사 신청 목록이 없습니다.</td>
	                		</tr>
	                	</c:if>
	                	<c:forEach var="dto" items="${list}">
							<tr>
								<td>${dto.user_name}</td>
								<td>${dto.user_nick}</td>
								<td>${dto.user_id}</td>
								<td>${dto.user_email}</td>
								<td>${dto.user_gender}</td>
							</tr>
	                	</c:forEach>
					</table>
                </div>
                <div class="AIBRight">
                	<img src="/resources/img/util/noImgfile.png" class="firstImg">
                </div>

            </div>
        </div>
    </div>
	
	
	<!-- <h1>관리자 페이지 임당</h1>
	<div class="btnBox">
		<form action="/admin/AccessForSiteClose" id="siteCloseBtn" method="POST">
			<input type="button" value="사이트 닫기" onclick="SiteClose(this.form)">
		</form>
		<form action="/admin/AccessForSiteOpen" id="siteCloseBtn" method="POST">
			<input type="button" value="사이트 열기" onclick="SiteOpen(this.form)">
		</form>
	</div> -->
</body>
</html>