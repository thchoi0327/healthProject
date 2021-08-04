<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<link rel="stylesheet" href="resources/css/lessonBoard/lessonBoard.css">
	<script>
	<%--페이지 로드되면 바로 01번(운동소개)불러오기--%>
	$(function(){
		callPage(1);
	})
	
	<%-- ajax 페이지 불러오기 --%>
	function callPage(num) {
		$.ajax({
			url: "/lessonBoardCall",
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
	<%-- 헤더 떙겨오기 --%>
	<jsp:include page="../util/mainHeader.jsp"></jsp:include>
	
	<div class="full">
    	<div class="inner">
            <div class="top">
                <div class="topinner ti01" onclick="callPage(1)"><p>운동소개</p></div>
                <div class="topinner ti02" onclick="callPage(2)"><p>능력자 소개</p></div>
                <div class="topinner ti03" onclick="callPage(3)"><p>같이 운동해요</p></div>
                <div class="topinner ti04" onclick="callPage(4)"><p>운동 QnA</p></div>
            </div>
            <div class="temp">
            	<%-- 여기에 ajax로 들어옵니당 --%>
            
            
            
            </div>
        </div>
    </div>
</body>
</html>