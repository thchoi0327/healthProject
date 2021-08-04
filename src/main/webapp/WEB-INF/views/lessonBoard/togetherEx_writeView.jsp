<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
		<title>같이 운동해요 작성글 페이지</title>
		<link rel="stylesheet" href="/resources/css/shareBoard/shareWriteTrade.css">
		<script type="text/javascript">
			function submitCheck(f){
				
			if ( $('#subject').val() == '' ){
				alert('운동 종목을 입력해주세요')
				return;
			}
			if ( $('#subject').val() == '' ){
				alert('운동 종류을 입력해주세요')
				$('#subject').focus();
				return;
			}
			if ( $('#title').val() == '' ){
				alert('제목을 입력해주세요')
				$('#title').focus();
				return;
			}
			if ( $('#bcontent').val() == '' ){
				alert('내용을 입력해주세요')
				$('#bcontent').focus();
				return;
			}
			
			$(f).submit();
			
		}
		</script>
		<style>
			table,tr,td{
				border: none;
			}
		</style>
	</head>
	<body>
	<div class="writefull">
			<div class="labelintro"># 같이 운동해요!</div>
			
			<form action="/lessonBoard/togetherEx_write.do" method="post" enctype="multipart/form-data">
			
				<input type="hidden" name="bname" value="<%=session.getAttribute("userNick")%>" readonly>
				<table>
					<tr>
						<td width="200px"><label for="subject">운동 종류</label></td>
						<td width="800px"><input type="text" id ="subject"  name="subject" placeholder="운동 종목을 입력해주세요."></td>
					</tr>
					<tr>
						<td><label for="title">제목</label></td>
						<td><input type="text" id="title" name="title" placeholder="제목을 입력해주세요."></td>
					</tr>
					<tr>
						<td><label for='file'>사진 첨부</label></td>
						<td><input type="file" name="file" id="file" ></td>
					</tr>
					<tr>
						<td><label for="bcontent">내용</label></td>
						<td><textarea id="bcontent" name="bcontent"></textarea></td>
					</tr>
				</table>
		
				<div class="divBtnBox">
			        <input type="button" onclick="submitCheck(this.form)" class="write" value="작성완료">
		        </div>
		    </form>
		</div>
	<%-------------------------------------------------------------------------------------- --%>	
	
</html>