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
  <script type="text/javascript">
      function deleteLend(f){
    	  if(confirm("해당 게시글을 삭제하시겠습니까?")){
    		  $(f).submit();
    	  }
      } 
      function updateOpen(){
    	  $('#shareLend_titleTemp').attr('readonly',false);
    	  $('#shareLend_regionTemp').attr('readonly',false);
    	  $('#shareLend_moneyTemp').attr('readonly',false);
    	  $('#shareLend_contentTemp').attr('readonly',false);
    	  $('#shareLend_telTemp').attr('readonly',false);
    	  
    	  $('#shareLend_titleTemp').css('border',"2px solid green");
    	  $('#shareLend_regionTemp').css('border',"2px solid green");
    	  $('#shareLend_moneyTemp').css('border',"2px solid green");
    	  $('#shareLend_contentTemp').css('border',"2px solid green");
    	  $('#shareLend_telTemp').css('border',"2px solid green");
    	  
    	  $('#updateSubmit').attr('type','button');
      }
      
      function updateClose(){
    	  $('#shareLend_titleTemp').attr('readonly',true);
    	  $('#shareLend_regionTemp').attr('readonly',true);
    	  $('#shareLend_moneyTemp').attr('readonly',true);
    	  $('#shareLend_contentTemp').attr('readonly',true);
    	  $('#shareLend_telTemp').attr('readonly',true);
    	  
       	  $('#shareLend_titleTemp').css('border',"none");
    	  $('#shareLend_regionTemp').css('border',"none");
    	  $('#shareLend_moneyTemp').css('border',"none");
    	  $('#shareLend_contentTemp').css('border',"none");
    	  $('#shareLend_telTemp').css('border',"none");
    	  
    	  $('#shareLend_titleTemp').val( $('#shareLend_title').val() );
    	  $('#shareLend_regionTemp').val ( $('#shareLend_region').val() );
    	  $('#shareLend_moneyTemp').val ( $('#shareLend_money').val() );
    	  $('#shareLend_contentTemp').val( $('#shareLend_content').val() );
    	  $('#shareLend_telTemp').val ( $('#shareLend_tel').val() );
    	  
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
    	  if ($('#shareLend_titleTemp').val() == ''){
    		  alert('제목을 입력해주세요.')
    		  $('#shareLend_titleTemp').focus();
    		  return;
    	  }
    	  
    	  if ($('#shareLend_moneyTemp').val() == ''){
    		  alert('가격을 입력해주세요.')
    		  $('#shareLend_moneyTemp').focus();
    		  return;
    	  }
    	  var tempMoneyCheck = Number($('#shareLend_moneyTemp').val());
    	  if (isNaN(tempMoneyCheck)){
    		  alert('가격에는 숫자만 입력해주세요.')
    		  $('#shareLend_moneyTemp').focus();
    		  return;
    	  }
    	  if ($('#shareLend_regionTemp').val() == ''){
    		  alert('지역을 입력해주세요.')
    		  $('#shareLend_regionTemp').focus();
    		  return;
    	  }
    	  
    	  if ($('#shareLend_contentTemp').val() == ''){
    		  alert('내용을 입력해주세요.')
    		  $('#shareLend_contentTemp').focus();
    		  return;
    	  }
    	  
    	  if ($('#shareLend_telTemp').val() == ''){
    		  alert('전화 번호를 입력해주세요.')
    		  $('#shareLend_telTemp').focus();
    		  return;
    	  }
    	  
    	  var tempTelCheck = Number( $('#shareLend_telTemp').val() );
    	  if ( isNaN(tempTelCheck) ){
    		  alert('전화번호에는 숫자만 입력해주십시오.')
    		  $('#shareLend_telTemp').focus();
    		  return;
    	  }
    	  
    	  
    	  
    	  
    	  $('#shareLend_title').val( $('#shareLend_titleTemp').val() );
    	  $('#shareLend_region').val ( $('#shareLend_regionTemp').val() );
    	  $('#shareLend_money').val ( $('#shareLend_moneyTemp').val() );
    	  $('#shareLend_content').val( $('#shareLend_contentTemp').val() );
    	  $('#shareLend_tel').val( $('#shareLend_telTemp').val() );
    	  
    	  
    	  $('#updateForm').submit(); 
      }
  </script>
</head>
<body>
	<div class="contentfull">
		<div class="contentInner">
			<div class="contentInnerLeft">
				<img src="/resources/img/uploadShare/${map.sharelenddto.shareLend_file}">
			</div>
			<form class="contentInnerRight">
				<label>닉네임</label>
				<div>${map.sharelenddto.shareLend_nick}</div>
				<label>제목</label>
				<input type="text" id="shareLend_titleTemp" value="${map.sharelenddto.shareLend_title }" readonly>
				<label>지역</label>
				<input type="text" id="shareLend_regionTemp" value="${map.sharelenddto.shareLend_region }" readonly>
				<label>가격</label>
				<input type="text" id="shareLend_moneyTemp" value="${map.sharelenddto.shareLend_money }" readonly>
				<label>전화 번호 </label>
				<input type="text" id="shareLend_telTemp" value="${map.sharelenddto.shareLend_tel }" readonly>
				<label>내용</label>
				<textarea id="shareLend_contentTemp" readonly rows="6">${map.sharelenddto.shareLend_content}</textarea>
			</form>
		</div>
		<%-- <c:if test="${(map.sharetradedto.shareTrade_nick eq sessionScope.userNick) || (not empty sessionScope.admin)}"> --%>
			<div class="btnBoxForWriter">
				<form action="/shareBoard/lendUpdate.do" id="updateForm" method="POST">
					<input type="hidden" id="shareLend_num" name="shareLend_num" value="${map.sharelenddto.shareLend_num}">
					<input type="hidden" id="shareLend_title" name="shareLend_title" value="${map.sharelenddto.shareLend_title }">
					<input type="hidden" id="shareLend_region" name="shareLend_region" value="${map.sharelenddto.shareLend_region }">
					<input type="hidden" id="shareLend_money" name="shareLend_money" value="${map.sharelenddto.shareLend_money }">
					<input type="hidden" id="shareLend_tel" name="shareLend_tel" value="${map.sharelenddto.shareLend_tel }">
					<input type="hidden" id="shareLend_content" name="shareLend_content" value="${map.sharelenddto.shareLend_content}">
					
					<input type="hidden" id="updateSubmit" onclick="updateCheck(this.f)" value="수정 완료">
				</form>
				
				<input type="button" id="updateBtn" value="수정" onclick="updateToggle()">
				
				<form action="/shareBoard/lendDelete.do" method="POST">
					<input type="hidden" name="shareLend_num" value="${map.sharelenddto.shareLend_num}">
					<input type="button" onclick="deleteLend(this.form)" value="삭제">
				</form>
				
				
			</div>
		<%-- </c:if> --%>
			<div onclick="msgBoxOpen('${map.sharelenddto.shareLend_nick}')" class="boardMsgWriteBtn">
				쪽지 보내기
			</div>
	</div>
</body>
</html>