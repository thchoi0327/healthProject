<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>강사리스트 페이지</title>
		<style type="text/css">
			table,tr,td{
				border: 1px solid black;
				border-collapse: collapse;
				text-align: center;
			}
		</style>
	</head>
	<body>
	<form action="./teacher_list" method="post">
		<table>
			<tr>
				<td colspan="7">
					<h3>운동종목으로 강사 검색하기</h3> 
					<input type="text" name="search" id="search">
					<input type="submit" value="검색">
				</td>
			</tr>
			<tr>
				<td>강사 아이디</td>
				<td>강사 이름</td>
				<td>종목</td>
				<td>자기소개</td>
				<td>강습지역</td>
				<td>자격증</td>
				<td>허가여부</td>
			</tr>
			<!-- 내용 반복 시작 -->
			<c:forEach var="dto" items="${map.list }">	
			<tr>
				<td><a href="/teacher_contentView?search=${map.search }&tid=${dto.tid }">${dto.tid }</a></td>
				<td>${dto.tname }</td>
				<td>${dto.subject }</td>
				<td><a href="/teacher_contentView?search=${map.search }&tid=${dto.tid }">${dto.introduce }</a></td>
				<td>${dto.area}</td>
				<td>${dto.license }</td>
				<td>${dto.grade }</td>
			</tr>	
			</c:forEach>		
			<!-- 내용 반복 끝 -->
		</table>
		</form>
			<a href="/index"><button>인덱스로 돌아가기</button></a>
	</body>
</html>