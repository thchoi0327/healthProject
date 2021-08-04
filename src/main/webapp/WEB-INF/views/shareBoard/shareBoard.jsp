<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="/resources/css/shareBoard/shareBoard.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script>
 		$(function(){
			callPage(1)
		})
		
		<%-- ajax 페이지 호출  --%>
		function callPage(num) {
			$.ajax({
				url: "/shareBoardCall",
				data: { 'num': num },
				type: "POST",
				dataType: "text",
				success: function(data) {
					$('.temp').html(data);
				},
				error: function() {
					alert('페이지를 불러오는데 실패하였습니다.')
				}
			})
		}
	</script>
	
	
</head>
<body>
	<%-- 헤더 땡겨오기 --%>
	<jsp:include page="../util/mainHeader.jsp"></jsp:include>
	
	
	
	<div class="full">
    	<div class="inner">
            <div class="top">
                <div class="topinner ti01" onclick="callPage(1)"><p>구매</p></div>
                <div class="topinner ti02" onclick="callPage(2)"><p>판매</p></div>
                <div class="topinner ti03" onclick="callPage(3)"><p>빌려드려요</p></div>
                <div class="topinner ti04" onclick="callPage(4)"><p>빌려주세요</p></div>
            </div>
            <form action="/search" class="searchBox">
            	<select id="opt" name="opt">
            		<option value="shareTrade_nick">작성자 검색</option>
            		<option value="shareTrade_region">지역 검색</option>
            		<option value="shareTrade_title">제목 검색</option>
            		<option value="shareTrade_content">내용</option>
            	</select>
	            <input id="search" type="text" name="search" placeholder="검색">
	            <input type="submit" value="검색">
            </form>
            <div class="temp">
				<%-- ajax부르면 여기에 담기니까 각 jsp페이지마다(ex)01.jsp,02.jsp) 작업하면 됩니당  --%>
            </div>
        </div>
    </div>
</body>
</html>