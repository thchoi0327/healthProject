<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="/resources/css/admin/adminNoticeMsg.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script>
		function adminNoticeMsgOpen(){
			$('.adminMsgPage').css("visibility","visible")
		}
		
		function adminNoticeMsgClose(){
			$('#adminMContent').val('')
			$('.adminMsgPage').css("visibility","hidden")
		}
		
		function SendAdminMsg(f){
			if ( $('#adminMContent').val() == '' ){
				alert('내용을 입력해주세요.')
				$('#adminMContent').focus();
				return;
			}
			
			$.ajax({
				url:"/admin/adminNoticeMsg",
				data:$(f).serialize(),
				type:"post",
				dataType:"JSON",
				success:function(data){
					if (data.result == 'true'){
						alert('전체 쪽지를 발송했습니다.')
					}else{
						alert('전체 쪽지 발송에 실패하였습니다.')
					}
					adminNoticeMsgClose();
				},
				error:function(){
					alert('전체 쪽지 발송에 실패하였습니다.')
				}
			})
			
		}
	</script>
	
</head>
<body>
		<div class="adminMsgPage">
        	<form action="/admin/adminNoticeMsg" class="adminMsgBox" method="POST">
        		<div class="adminMsgBoxHeader">
        			<a><img src="/resources/img/util/adminNotice.png" class="sendMsgImg">&nbsp; 전체 공지</a>
        			<img src="/resources/img/util/close.png" class="closeMsgImg" onclick="adminNoticeMsgClose()">
        		</div>
        		<textarea class="adminMsgContentBox" name="mcontent" id="adminMContent" placeholder="전체 공지!"></textarea>
        		<input type="button" value="전송" id="adminMsgSubmitBtn" onclick="SendAdminMsg(this.form)" value="쪽지 전송">
        	</form>
        </div>
</body>
</html>