<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="/resources/css/shareBoard/shareBoard01.css">
</head>
<body>
	<div class="innerBox">
		<table>
			<tr>
				<td>카테고리</td>
				<td>사진</td>
				<td>사진 이름</td>
				<td>작성자</td>
				<td>제목</td>
				<td>날짜</td>
			</tr>
			<c:forEach items="${list }" var="dto">
			<tr>
				<td>${dto.shareTrade_category}</td>
				<td><img src="/resources/img/upload/${dto.shareTrade_file}" style= "width: 50px; height: 50px;"></td>
				<td>${dto.shareTrade_file}</td>
				<td>작성자 : ${dto.shareTrade_nick}</td>
				<td><a href="/content_view?shareTrade_num=${dto.shareTrade_num}">제목 : ${dto.shareTrade_title}</a></td>
				<td>작성일 : ${dto.shareTrade_date}</td>
			</tr>
			</c:forEach>
		</table>
	</div>
    <a href="/write_view"><div>쓰기</div></a>

</body>
</html>