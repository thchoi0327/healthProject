<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="/resources/css/user/contentViewMsg.css">
	<script src=""></script>
	<script>
		function DeleteMsg(f){
			if (confirm('쪽지를 삭제하시겠습니까?')){
				$(f).submit();
			}
		}
	</script>
</head>
<body>
	<div class="msgContentView">
		<div class="msgContentViewBox">
			<div class="MCVBHeader">
				<p>발신인 <img src="/resources/img/util/fromMsg.png"></p>
				<p>${msgdto.msendNick }</p>			
			</div>
			<textarea class="MCVBBody" readonly>${msgdto.mcontent}</textarea>
		</div>
		
		
		<div class="msgContentViewBtnBox">
			<%-- 관리자 공지사항엔 답장 안됨 --%>
			<c:if test="${not (msgdto.msendNick eq '관리자')}">
				<form onclick="msgBoxOpen('${msgdto.msendNick}')">답장</form>
			</c:if>
			<form action="/user/DeleteMsg.do" method="POST" onclick="DeleteMsg(this)">
				<input type="hidden" name="mid" value="${msgdto.mid }">
			삭제
			</form>
		</div>
	</div>
</body>
</html>