<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<link rel="stylesheet" href="/resources/css/util/msgPage.css">
	<script>
	    function msgBoxOpen(nick){
 	    	<c:if test="${empty sessionScope.userId}">
	    		alert('로그인 후 이용할 수 있습니다.')
	    		return;
            </c:if>
            
            $('#mReceiveNickMsg').val(nick);
            $('#mContentMsg').focus();
            $('.messagePage').css("visibility","visible")
        }

        function msgBoxClose(){
        	$('#mReceiveNickMsg').val('')
        	$('#mContentMsg').val('')
            $('.messagePage').css("visibility","hidden");
        }
        
        
        function SendMsg(f){
        	if ( $('#mSendNickMsg').val() == '' ){
        		alert('로그인 후 이용해주세요.')
        		return
        	}
        	if ( $('#mReceiveNickMsg').val() == '' ){
        		alert('받는 사람을 입력해주세요.')
        		$('#mReceiveNickMsg').focus();
        		return
        	}
        	if ( $('#mContentMsg').val() == '' ){
        		alert('내용을 입력해주세요.')
        		$('#mContentMsg').focus();
        		return
        	}
        	
        	$.ajax({
        		url:"/msg/sendMsg",
        		data:$(f).serialize(),
        		type:"POST",
        		dataType:"JSON",
        		success:function(data){
        			if (data.result == 'NoUser'){
        				alert('존재하지 않는 회원입니다.')
        				$('#mReceiveNick').focus();
        				return;
        			}
        			if (data.result == 'true'){
        				alert('쪽지를 발송하였습니다.')
        			}else {
        				alert('쪽지 발송에 실패하였습니다.')
        			}
        			msgBoxClose()
        		}
        	})
        	
        }
    </script>
</head>
	<body>
	
		<div class="messagePage">
        	<form class="msgBox" method="POST">
        		<div class="msgBoxHeader">
        			<img src="/resources/img/util/sendMsg.png" class="sendMsgImg">
        			<img src="/resources/img/util/close.png" class="closeMsgImg" onclick="msgBoxClose()">
        		</div>
        		
        		<div class="sendToBox">
        			<label>받는 이</label>
        			<input type="text" name="mreceiveNick" id="mReceiveNickMsg" >
        			<input type="hidden" name="msendNick" id="mSendNickMsg" value="${sessionScope.userNick}">
        		</div>
        		
        		<textarea class="msgContentBox" name="mcontent" id="mContentMsg" placeholder="내용을 입력해주세요 !"></textarea>
        		<input type="button" value="전송" id="msgSubmitBtn" onclick="SendMsg(this.form)" value="쪽지 전송">
        	</form>

    	</div>
	</body>
</html>