<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="/resources/css/lessonBoard/lessonBoard04.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script>
		function writeToQnA(){
			$.ajax({
				url:"/lessonBoard/question_writeView.do",
				type:"POST",
				dataType:"html",
				success:function(data){
					if (data == ''){
						alert('로그인 후 글 작성가능합니다.')
						return;
					}
					$('.innerDiv').html(data);
				},
				error:function(){
					alert('페이지를 불러오는데 실패하였습니다.')
				}
			})
		}
		function toQnaContent(num){
			$.ajax({
				url:"/lessonBoard/question_contentView",
				data:{bid:num},
				type:"POST",
				dataType:"html",
				success:function(data){
					$('.innerDiv').html(data)
				},
				error:function(){
					alert('페이지를 불러오는데 실패하였습니다.')
				}
				
			})
		}
	
	</script>
</head>
<body>
	<div class="innerDiv">
		<%-- innerDiv 안에서 만들면 됩니당 ~~~ --%>
		<div class="innerDivTemp04">
			<div class="logoBoard"> # 운동 QnA 게시판</div>
			<h3>종목으로 질문 검색하기</h3> 
			<input type="text" name="search" id="search">
			<input type="submit" value="검색">
			
			<table class="innerTable">
				<tr height="50px">
					<th width="150px">작성자</th>
					<th width="680px">제목</th>
					<th width="100px">종목</th>
					<th width="170px">날짜</th>
					<th width="100px">조회수</th>
				</tr>
				<c:if test="${fn:length(map.list) eq 0}">
					<tr>
						<td colspan="5"> 현재 등록된 게시글이 없습니다.</td>
					</tr>
				</c:if>
				
				
				<!-- 내용 반복 시작 -->
				<c:forEach var="dto" items="${map.list}">	
				<tr>
					<td class="tableTdNick">${dto.bname }</td>
					<td class="tableTdTitle"><a <%-- href="/question_contentView?search=${map.search }&bid=${dto.bid }"  --%>onclick="toQnaContent( ${dto.bid} )">${dto.title }</a></td>
					<td class="tableTdSubject">${dto.subject }</td>
					<td class="tableTdDate">${fn:substring(dto.bdate,0,11)} / ${fn:substring(dto.bdate,11,16)}</td>
					<td class="tableTdHit">${dto.bhit }</td>
				</tr>	
				</c:forEach>		
				<!-- 내용 반복 끝 -->
			</table>
			
			
			<div class="innerBtnBox" style="background-color: #ed2823" onclick="writeToQnA()">
				<div class="wirteBtn">QnA 글쓰기</div>
    			<img src="/resources/img/util/forward.png">
			</div>
		</div>
	</div>
</body>
</html>