<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>Insert title here</title>
	<link rel="stylesheet" href="/resources/css/admin/adminPage.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script>
		function siteClose(f){
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
		
		function deleteTeacher(f){
			if (confirm('강사를 삭제하시겠습니까?')){
				$(f).submit();
			}
		}
		
		function teacherView(bidTemp){
			$('.trbid').css("border","1px solid #e8e8e8")
			$('.trbid').css("text-align","left")
			$('.'+bidTemp).css("border","3px solid green")
			$('.'+bidTemp).css("text-align","center")
			
			$.ajax({
				url:"/admin/teacherView",
				type:"POST",
				data:{bid:bidTemp},
				dataType:"html",
				success:function(data){
					$('.AIBRight').html(data)
				},
				error:function(){
					alert('페이지를 불러오는데 실패하였습니다.')
				}
			})
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
                    <form action="/admin/AdminAccess02" class="adminMenu adminMenu02" method="POST" onclick="pageMoving(this)" style="background-color:#fcce00" >강사 리스트</form>
                    <form action="/admin/AdminAccess03" class="adminMenu adminMenu03" method="POST" onclick="pageMoving(this)" >회원 리스트</form>
                </div>
                <div class="AIBCenter">
					<table>
	                	<tr height="50px;">
	                		<th>이름</th>
	                		<th>아이디</th>
	                		<th>종목</th>
	                		<th>지역</th>
	                		<th>x</th>
	                	</tr>
	                	<c:if test="${empty list}">
	                		<tr height="40px">
	                			<td colspan="4" style="padding-left: 20px; height: 50px;">강사 목록이 없습니다.</td>
	                		</tr>
	                	</c:if>
	                	<c:forEach var="dto" items="${list}">
							<tr height="40px">
								<td class="trbid ${dto.bid}" onclick="teacherView(${dto.bid})">${dto.tname}</td>
								<td class="trbid ${dto.bid}" onclick="teacherView(${dto.bid})">${dto.tid}</td>
								<td class="trbid ${dto.bid}" onclick="teacherView(${dto.bid})">${dto.subject}</td>
								<td class="trbid ${dto.bid}" onclick="teacherView(${dto.bid})">${dto.area}</td>
								<td>
									<form action="/admin/teacherDelete" method="POST">
										<input type="hidden" name="tname" value="${dto.tname }">
										<input type="hidden" name="bid" value="${dto.bid}">
										<input type="hidden" name="page" value="2">
										<input type="button" value="삭제" onclick="deleteTeacher(this.form)">
									</form>
								</td>
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