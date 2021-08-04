<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>뷰페이지</title>
  <link rel="stylesheet" href="/resources/css/shareBoard/shareContentView.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> 
  <script type="text/javascript">
  	  var updateOpenCheck = 'false';
      function deleteTrade(f){
      	  if (confirm('게시글을 정말 삭제하시겠습니까?')){
      		  $(f).submit();
      	  }
      }
      
      function updateOpen(){
    	  $('#shareTrade_titleTemp').attr('readonly',false);
    	  $('#shareTrade_regionTemp').attr('readonly',false);
    	  $('#shareTrade_moneyTemp').attr('readonly',false);
    	  $('#shareTrade_contentTemp').attr('readonly',false);
    	  $('#shareTrade_telTemp').attr('readonly',false);
    	  
    	  $('#shareTrade_titleTemp').css('border',"2px solid green");
    	  $('#shareTrade_regionTemp').css('border',"2px solid green");
    	  $('#shareTrade_moneyTemp').css('border',"2px solid green");
    	  $('#shareTrade_contentTemp').css('border',"2px solid green");
    	  $('#shareTrade_telTemp').css('border',"2px solid green");
    	  
    	  $('#updateSubmit').attr('type','button');
    	  
      }
      
      function updateClose(){
    	  $('#shareTrade_titleTemp').attr('readonly',true);
    	  $('#shareTrade_regionTemp').attr('readonly',true);
    	  $('#shareTrade_moneyTemp').attr('readonly',true);
    	  $('#shareTrade_contentTemp').attr('readonly',true);
    	  $('#shareTrade_telTemp').attr('readonly',true);
    	  
       	  $('#shareTrade_titleTemp').css('border',"none");
    	  $('#shareTrade_regionTemp').css('border',"none");
    	  $('#shareTrade_moneyTemp').css('border',"none");
    	  $('#shareTrade_contentTemp').css('border',"none");
    	  $('#shareTrade_telTemp').css('border',"none");
    	  
    	  $('#shareTrade_titleTemp').val( $('#shareTrade_title').val() );
    	  $('#shareTrade_regionTemp').val ( $('#shareTrade_region').val() );
    	  $('#shareTrade_moneyTemp').val ( $('#shareTrade_money').val() );
    	  $('#shareTrade_contentTemp').val( $('#shareTrade_content').val() );
    	  $('#shareTrade_telTemp').val ( $('#shareTrade_tel').val() );
    	  
    	  $('#updateSubmit').attr('type','hidden');
      }
      
      function updateToggle(){
    	  if ($('#updateBtn').val() == '수정'){
    		  updateOpen();
    		  $('#updateBtn').val('취소')
    	  }else {
    		  updateClose()
    		  $('#updateBtn').val('수정')
    	  }
      }
      
      function updateCheck(f){
    	  if ($('#shareTrade_titleTemp').val() == ''){
    		  alert('제목을 입력해주세요.')
    		  $('#shareTrade_titleTemp').focus();
    		  return;
    	  }
    	  
    	  if ($('#shareTrade_moneyTemp').val() == ''){
    		  alert('가격을 입력해주세요.')
    		  $('#shareTrade_moneyTemp').focus();
    		  return;
    	  }
    	  var tempMoneyCheck = Number($('#shareTrade_moneyTemp').val());
    	  if (isNaN(tempMoneyCheck)){
    		  alert('가격에는 숫자만 입력해주세요.')
    		  $('#shareTrade_moneyTemp').focus();
    		  return;
    	  }
    	  if ($('#shareTrade_regionTemp').val() == ''){
    		  alert('지역을 입력해주세요.')
    		  $('#shareTrade_regionTemp').focus();
    		  return;
    	  }
    	  
    	  if ($('#shareTrade_contentTemp').val() == ''){
    		  alert('내용을 입력해주세요.')
    		  $('#shareTrade_contentTemp').focus();
    		  return;
    	  }
    	  
    	  if ($('#shareTrade_telTemp').val() == ''){
    		  alert('전화 번호를 입력해주세요.')
    		  $('#shareTrade_telTemp').focus();
    		  return;
    	  }
    	  
    	  var tempTelCheck = Number( $('#shareTrade_telTemp').val() );
    	  if ( isNaN(tempTelCheck) ){
    		  alert('전화번호에는 숫자만 입력해주십시오.')
    		  $('#shareTrade_telTemp').focus();
    		  return;
    	  }
    	  
    	  
    	  
    	  
    	  $('#shareTrade_title').val( $('#shareTrade_titleTemp').val() );
    	  $('#shareTrade_region').val ( $('#shareTrade_regionTemp').val() );
    	  $('#shareTrade_money').val ( $('#shareTrade_moneyTemp').val() );
    	  $('#shareTrade_content').val( $('#shareTrade_contentTemp').val() );
    	  $('#shareTrade_tel').val( $('#shareTrade_telTemp').val() );
    	  
    	  
    	  $('#updateForm').submit(); 
      }
      
      
  </script>
</head>
<body>
	<div class="contentfull">
		<div class="contentInner">
			<div class="contentInnerLeft">
				<img src="/resources/img/uploadShare/${map.sharetradedto.shareTrade_file}">
			</div>
			<form class="contentInnerRight">
				<label>닉네임</label>
				<div>${map.sharetradedto.shareTrade_nick }</div>
				<label>제목</label>
				<input type="text" id="shareTrade_titleTemp" value="${map.sharetradedto.shareTrade_title }" readonly>
				<label>지역</label>
				<input type="text" id="shareTrade_regionTemp" value="${map.sharetradedto.shareTrade_region }" readonly>
				<label>가격</label>
				<input type="text" id="shareTrade_moneyTemp" value="${map.sharetradedto.shareTrade_money}" readonly>
				<label>전화 번호 </label>
				<input type="text" id="shareTrade_telTemp" value="${map.sharetradedto.shareTrade_tel}" readonly>
				<label>내용</label>
				<textarea id="shareTrade_contentTemp" readonly rows="6">${map.sharetradedto.shareTrade_content}</textarea>
			</form>
		</div>
		<c:if test="${(map.sharetradedto.shareTrade_nick eq sessionScope.userNick) || (not empty sessionScope.admin)}">
			<div class="btnBoxForWriter">
				<form action="/shareBoard/tradeUpdate.do" id="updateForm" method="POST">
					<input type="hidden" id="shareTrade_num" name="shareTrade_num" value="${map.sharetradedto.shareTrade_num}">
					<input type="hidden" id="shareTrade_title" name="shareTrade_title" value="${map.sharetradedto.shareTrade_title }">
					<input type="hidden" id="shareTrade_region" name="shareTrade_region" value="${map.sharetradedto.shareTrade_region}">
					<input type="hidden" id="shareTrade_money" name="shareTrade_money" value="${map.sharetradedto.shareTrade_money}">
					<input type="hidden" id="shareTrade_tel" name="shareTrade_tel" value="${map.sharetradedto.shareTrade_tel}">
					<input type="hidden" id="shareTrade_content" name="shareTrade_content" value="${map.sharetradedto.shareTrade_content}">
					
					<input type="hidden" id="updateSubmit" onclick="updateCheck(this.f)" value="수정 완료">
				</form>
				
				<input type="button" id="updateBtn" value="수정" onclick="updateToggle()">
				
				<form action="/shareBoard/tradeDelete.do" method="POST">
					<input type="hidden" name="shareTrade_num" value="${map.sharetradedto.shareTrade_num}">
					<input type="button" onclick="deleteTrade(this.form)" value="삭제">
				</form>
			</div>
		</c:if>

			<div onclick="msgBoxOpen('${map.sharetradedto.shareTrade_nick }')" class="boardMsgWriteBtn">
				쪽지 보내기 
			</div>
	</div>

</body>
</html>