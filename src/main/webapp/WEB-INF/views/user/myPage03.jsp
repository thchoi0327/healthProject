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
		function callAppContent(aidTemp){
			$.ajax({
				url:"/user/appContentView.do",
				data:{'aid':aidTemp},
				type:"POST",
				dataType:"html",
				success:function(data){
					$('.msgtd').css("border","1px solid #e8e8e8")
					$('.msg'+aidTemp).css("border","3px solid green");
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
	 			<form action="/user/myPageAccess.do" method="POST" onclick="msgPageMove(this)" class="myForm01">쪽지</form>
	 			<form action="/user/myPageAccess02.do" method="POST" onclick="msgPageMove(this)" class="myForm02">내 정보</form>
	 			<form action="/user/myPageAccess03.do" method="POST" onclick="msgPageMove(this)" class="myForm03" style="background-color:#fcce00;">신청서</form>
	 		</div>
	 		<div class="myMiddle">
	 			<table>
	 				<tr>
	 					<th height="50px">보낸 이</th>
	 					<th>내용</th>
	 				</tr>
	 				<c:if test="${sessionScope.user_grade eq '0' }">
						<td colspan="2">회원님은 강사가 아닙니다.</td>	 				
	 				</c:if>
	 				<c:if test="${empty alist}">
	 					<td>현재 요청된 신청서가 없습니다.</td>
	 				</c:if>
		 				<c:forEach var="adto" items="${alist}">
		 					<tr height="40px">
		 						<td class="msgtd msg${adto.aid}"><a>${adto.astudentNick}</a></td>
		 						<td class="msgtd msg${adto.aid}" onclick="callAppContent('${adto.aid}')"><a>${adto.astudentText}</a></td>
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