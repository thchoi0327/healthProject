<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>       
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="/resources/css/lessonBoard/lessonBoard02.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script>
		function toWriteTeacher(){
			$.ajax({
				url:"/lessonBoard/teacher_admissionView.do",
				type:"POST",
				dataType:"html",
				success:function(data){
					if (data==''){
						alert('로그인 후 이용할 수 있습니다.');
						return;
					}
					$('.innerBox').html(data);
				},
				error:function(){
					alert('페이지를 불러오는데 실패하였습니다.')
				}
			})
		}
		function contentView(bidTemp,i){
			$.ajax({
				url:"/lessonBoard/teacher_contentView",
				data:{'bid':bidTemp,
					  'num':i	
				},
				dataType:"HTML",
				success:function(data){
					$('.innerBox').html(data);
				},
				error:function(){
					alert('페이지를 불러오는데 실패하였습니다.')
				}
			})
		}
	
	</script>
</head>
<body>
		<div class="innerBox">
			<c:if test="${empty map.list}">
				<div class="noBoard"># 현재 등록된 강사가 없습니다.</div>
			</c:if>
			
			<div class="innerListBox">
				<%int i = 0; %>
				<c:forEach var="dto" items="${map.list}">
					<div class="innerlist" onclick="contentView(${dto.bid},<%=i%>)">
						<% if (i < 4) {%>
							<img src="/resources/img/lessonimg/crowns.png" class="crown">
						<% } %>
						<div class="lessonImgBox">
							<img src="/resources/img/uploadTeacher/${dto.fileName}" class="dtoImg">
						</div>
						<div class="dtoTitle">강사 : ${dto.tname }</div>
						<div class="dtoNick">종목 : ${dto.subject}</div>
						<% i++; %>
					</div>
				</c:forEach>
			</div>
			<div class="innerBtnBox" onclick="toWriteTeacher()" style="background-color:#ed2823;">
	    		<div class="wirteBtn">강사 등록 신청</div>
	    		<img src="/resources/img/util/forward.png">
	    	</div>
		</div>
			
			
		<%-- <div class="innerBtnBox" onclick="writeView()" style="background-color:#ed2823;">
	    	<div class="wirteBtn">강사 등록 신청</div>
	    		<img src="/resources/img/util/forward.png">
	    	</div>
		</div>
		
	<form action="/lessonBoard/lessonBoard02" method="post">
		<table>
			<tr>
				<td colspan="7">
					<h3>운동종목으로 강사 검색하기</h3> 
					<input type="text" name="search" id="search">
					<input type="submit" value="검색">
				</td>
			</tr>
			<tr>
				<td>게시물 번호</td>
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
				<td>${dto.bid }</td>
				<td><a href="/teacher_contentView?search=${map.search }&bid=${dto.bid }"><img alt="첨부파일 이미지" src="/resources/img/uploadLesson/${dto.fileName}"></a></td>
				<td>${dto.tname }</td>
				<td>${dto.subject }</td>
				<td><a href="/teacher_contentView?search=${map.search }&bid=${dto.bid }">${dto.introduce }</a></td>
				<td>${dto.area}</td>
				<td>${dto.license }</td>
				<td>${dto.grade }</td>
			</tr>	
			</c:forEach>		
			<!-- 내용 반복 끝 -->
		</table>
			<a><button type="button" onclick="location.href='teacher_admissionView'">강사등록 신청하기</button></a>
		</form> --%>
		
		
		

</body>
</html>