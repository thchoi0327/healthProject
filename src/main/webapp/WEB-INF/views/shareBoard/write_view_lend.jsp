<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>글쓰기</title>
  <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
  <link rel="stylesheet" href="/resources/css/shareBoard/shareWriteTrade.css">
    <script>
       function writeCheck(f){
    	   if (sessionNULL()){ return };
    	   
    	   if($("#shareLend_title").val()==""){
    		   alert("제목을 입력해주세요.")
    		   $("#shareLend_title").focus();
    		   return false;
    	   }
	    	  
    	   if($("#shareLend_money").val()==""){
    		   alert("가격을 입력해주세요.")
    		   $("#shareLend_money").focus();
    		   return false;
    	   }
    	   if($("#shareLend_money").val()==""){
    		   alert("금액을 꼭 적으셔야 합니다")
    		   $("#shareLend_money").focus();
    		   return false;
    	   }
    	   var tempPrice = Number($("#shareLend_money").val());
    	   if (isNaN(tempPrice)){
    		   alert('가격에는 숫자만 입력해주세요.')
    		   $("#shareLend_money").focus();
    		   return;
    	   }
    	   if($("#shareLend_region").val()==""){
    		   alert("지역을 입력해주세요.")
    		   $("#shareLend_region").focus();
    		   return false;
    	   }
    	   if($("#file").val()==""){
    		   alert("사진을 등록해주세요.")
    		   $("#shareLend_file").focus();
    		   return false;
    	   }
    	   if($("#shareLend_content").val()==""){
    		   alert("내용을 입력해주세요.")
    		   $("#shareLend_content").focus();
    		   return false;
    	   }
    	   
    	   $(f).submit();
       }
    	  
    </script>
</head>
<body>
	
	<div class="writefull">
		<div class="labelintro"># 대여 / 공유 글 작성</div>
		
		<form action="/shareBoard/write_lend.do" id="writelendform" method="post" enctype="multipart/form-data">
		
			<input type="hidden" name="shareLend_id" value="${sessionScope.userId }">
			<input type="hidden" name="shareLend_nick" value="<%=session.getAttribute("userNick")%>" readonly>
			<input type="hidden" name="shareLend_tel" value="${sessionScope.userTel}">
			<table>
				<tr>
					<td width="200px"><label for="shareLend_title">제목</label></td>
					<td width="800px"><input type="text" id ="shareLend_title"  name="shareLend_title" placeholder="제목을 입력해주세요."></td>
				</tr>
				<tr>
					<td><label for="shareLend_category">카테고리</label></td>
					<td>
						<select id="shareLend_category" name="shareLend_category">
							<option value="">카테고리를 선택해주세요</option>
							<option value="빌림">빌리고 싶어요</option>
							<option value="빌려줌">빌려드려요</option>
						</select>
					</td>
				</tr>
				<tr>
					<td><label for="shareLend_money">가격</label></td>
					<td><input type="text" id="shareLend_money" name="shareLend_money" placeholder="숫자만 입력해주세요."></td>
				</tr>
				<tr>
					<td><label for="shareLend_region">주소</label></td>
					<td><input type="text" id="shareLend_region" name="shareLend_region" placeholder="주소를 입력해주세요."></td>
				</tr>
				<tr>
					<td><label for='shareLend_file'>사진 첨부</label></td>
					<td><input type="file" name="file" id="file" ></td>
				</tr>
				<tr>
					<td><label for="shareLend_content">내용</label></td>
					<td><textarea id="shareLend_content" name="shareLend_content"></textarea></td>
				</tr>
			</table>
	
			<div class="divBtnBox">
		        <input type="button" onclick="writeCheck(this.form)" class="write" value="작성완료">
	        </div>
	    </form>
	
	 </div>
	
</body>
</html>