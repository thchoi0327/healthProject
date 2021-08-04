<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="/resources/css/user/myPage.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script>
		function callMsgContent(midTemp){
			$.ajax({
				url:"/user/myPageMsgView",
				data:{'mid':midTemp},
				type:"POST",
				dataType:"html",
				success:function(data){
					$('.msgtd').css("border","1px solid #e8e8e8")
					$('.msg'+midTemp).css("border","3px solid green");
					$('.myRight').html(data)
				},
				error:function(){
					
					alert('페이지를 불러오는데 실패하였습니다.')
				}
			})
		}
		
		function msgPageMove(f){
			$(f).submit()
		}
	</script>
</head>
<body>
	 <%-- 헤더 떙겨오기 --%>
	 <jsp:include page="../util/mainHeader.jsp"></jsp:include>
	 
	 
	 <div class="full">
	 	<div class="myInnerFull">
	 		<div class="myLeft">
	 			<form action="/user/myPageAccess.do" method="POST" onclick="msgPageMove(this)" class="myForm01" style="background-color:#fcce00;">쪽지</form>
	 			<form action="/user/myPageAccess02.do" method="POST" onclick="msgPageMove(this)" class="myForm02">내 정보</form>
	 			<form action="/user/myPageAccess03.do" method="POST" onclick="msgPageMove(this)" class="myForm03">신청서</form>
	 		</div>
	 		<div class="myMiddle">
	 			<%-- <div class="middleNav"></div> --%>
	 			<table>
	 				<tr>
	 					<th height="50px">보낸 이</th>
	 					<th>내용</th>
	 					<th>구분</th>
	 				</tr>
	 				<c:forEach var="mdto" items="${mlist}">
	 					<tr height="40px">
	 						<td class="msgtd msg${mdto.mid}"><a>${mdto.msendNick}<c:if test="${mdto.msendNick eq '관리자'}">
	 							<img src="/resources/img/util/siren.png" style="width: 25px; height: 25px;">
	 						</c:if></a></td>
	 						<td class="msgtd msg${mdto.mid}" onclick="callMsgContent('${mdto.mid}')"><a>${mdto.mcontent}</a></td>
	 						<td class="msgtd msg${mdto.mid}">
	 							<c:choose>
	 								<c:when test="${mdto.mcategory == 0}">
	 									대기
	 								</c:when>
	 								<c:otherwise>
	 									읽음
	 								</c:otherwise>
	 							</c:choose>
	 						</td>
	 					</tr>
	 				</c:forEach>
	 			</table>
	 		</div>
	 		
	 		<div class="myRight">
	 			<img src="/resources/img/util/noImgfile.png" class="myRightImg">
	 		</div>
	 	</div>
	 </div>
</body>
</html>