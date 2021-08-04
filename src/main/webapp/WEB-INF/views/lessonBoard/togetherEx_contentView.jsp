<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 보기</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="/resources/css/lessonBoard/lessonContentView.css">
<script type="text/javascript">
<%-- 게시글 삭제--%>
function deleteTogether(f){
	if(confirm("게시글을 삭제하시겠습니까?")){
		$(f).submit();
	}
}

function updateOpen(){
	  $('#subjectTemp').attr('readonly',false);
	  $('#titleTemp').attr('readonly',false);
	  $('#bcontentTemp').attr('readonly',false);
	  
	  $('#updateSubmit').attr('type','button');
}

function updateClose(){
	  $('#subjectTemp').attr('readonly',true);
	  $('#titleTemp').attr('readonly',true);
	  $('#bcontentTemp').attr('readonly',true);
	  
	  $('#subjectTemp').val( $('#subject').val() );
	  $('#titleTemp').val ( $('#title').val() );
	  $('#bcontentTemp').val ( $('#bcontent').val() );
	  
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
	  if ($('#subjectTemp').val() == ''){
		  alert('운동 종목을 입력해주세요.')
		  $('#subjectTemp').focus();
		  return;
	  }
	  if ($('#titleTemp').val() == ''){
		  alert('제목을 입력해주세요.')
		  $('#titleTemp').focus();
		  return;
	  }
	  
	  if ($('#bcontentTemp').val() == ''){
		  alert('내용을 입력해주세요.')
		  $('#bcontentTemp').focus();
		  return;
	  }
	  
	  $('#subject').val( $('#subjectTemp').val() );
	  $('#title').val ( $('#titleTemp').val() );
	  $('#bcontent').val ( $('#bcontentTemp').val() );
	  
	  
	  $('#updateForm').submit(); 
  }




function commentAfterPaging(bidtemp){
	$.ajax({
		url:"/lessonBoard/together_contentView",
		type:"POST",
		data:{bid:bidtemp},
		dataType:"html",
		success:function(data){
			$('.innerBox').html(data);
		},
		error:function(){
			alert('오류')
		}
	});
}


<%-- 댓글 달기 --%>
function commentWrite(f){
	if ( $('#sname').val() == ''){
		alert('로그인 후 이용할 수 있습니다.')
		return;
	}
	
	if ( $(f.bcontent).val() == ''){
		alert('내용을 입력해주세요.')
		$(f.bcontent).focus();
		return;
	}
	
	$.ajax({
		url:"/lessonBoard/comment_Write.do",
		type:"POST",
		data:$(f).serialize(),
		dataType:"JSON",
		success:function(data){
			if (data.result == 'true'){
				alert('댓글을 등록하였습니다.')
				commentAfterPaging(${map.togetherDto.bid});
			}else{
				alert('댓글 등록에 실패하였습니다.')
			}
		},
		error:function(){
			alert('댓글 등록에 실패하였습니다.')
		}
	})
}


<%-- 댓글 삭제 --%>
function commentDelete(commentNoTemp){
	if (confirm('댓글을 삭제하시겠습니까?')){
		$.ajax({
			url:"/lessonBoard/comment_Delete.do",
			type:"POST",
			dataType:"JSON",
			data:{commentNo:commentNoTemp},
			success:function(data){
				if (data.result == 'true'){
					alert('댓글이 삭제되었습니다.')
					commentAfterPaging(${map.togetherDto.bid});
				}else {
					alert('댓글 삭제에 실패하였습니다. ')
				}
			},
			error:function(){
				alert('댓글 삭제에 실패하였습니다. ')	
			}
		})	
	}
	
}


<%-- 댓글 수정 토글 버튼 --%>
function commentUpdateToggle(f){
	if ( $(f.commentToggle).val() == '수정' ){
		
		$(f).css("border","3px solid green");
		$(f.bcontentTemp).attr("readonly",false)
		$(f.bcontentTemp).focus();
		$(f.commentHidden).attr("type","button")			
		$(f.commentToggle).val('취소')
	}else {
		$(f.bcontentTemp).val( $(f.bcontent).val() )
		
		$(f).css("border","1px solid #e8e8e8");
		$(f.bcontentTemp).attr("readonly",true)
		$(f.commentHidden).attr("type","hidden")
		$(f.commentToggle).val('수정')
	}
}



<%-- 댓글 수정 완료 --%>
function toCommentUpdate(f){
	if ( $(f.bcontentTemp).val()=='' ){
		alert('내용을 입력해주세요.')
		$(f.bcontentTemp).focus();
		return;
	}
	
	$(f.bcontent).val( $(f.bcontentTemp).val() )
	
	$.ajax({
		url:"/lessonBoard/commentUpdate.do",
		type:"POST",
		data:$(f).serialize(),
		dataType:"JSON",
		success:function(data){
			if (data.result == 'true'){
				alert('댓글을 수정하였습니다.')
				commentAfterPaging(${map.togetherDto.bid});
			}else {
				alert('댓글 수정에 실패하였습니다.')
			}
		},
		error:function(){
			alert('댓글 수정에 실패하였습니다.')
		}
		
	})
}
</script>
</head>
<body>
	<%-- 쪽지 페이지 include --%>
	<jsp:include page="../util/msgPage.jsp"></jsp:include>


	<div class="innerBox">
		<div class="introMentH1"># 같이 운동해요</div>
		<div class="contentfull">
			<div class="contentTemp">
				<div class="contentInnerleft">
					<label>닉네임</label>
					<div>${map.togetherDto.bname }</div>
					<label>운동종류</label>
					<input type="text" id="subjectTemp" value="${map.togetherDto.subject}" readonly>
					<label>제목</label>
					<input type="text" id="titleTemp" value="${map.togetherDto.title }" readonly>
					<label>내용</label>
					<textarea id="bcontentTemp" readonly rows="6">${map.togetherDto.bcontent }</textarea>
				</div>
				<div class="contentInnerRight">
				<c:choose>
				    <c:when test="${empty map.togetherDto.fileName}">
				    	
						<div class="InnerRightDiv RDment">
							<img src="/resources/img/util/noImgfile.png">
							<p>등록된 사진이 없습니다</p>
						</div>
				    </c:when>
				    <c:otherwise>
						<img class="InnerRightDiv RDImg" alt="첨부파일 이미지" src="/resources/img/uploadLesson/${map.togetherDto.fileName}">
				    </c:otherwise>
				</c:choose>
				</div>
			</div>
		</div>	
			<c:if test="${map.togetherDto.bname == sessionScope.userNick || (not empty sessionScope.admin)}">
				<div class="btnBoxForWriter">
					<form action="/lessonBoard/togetherUpdate.do" id="updateForm" method="POST" enctype="multipart/form-data">
						<input type="hidden" id="bid" name="bid" value="${map.togetherDto.bid}">
						<input type="hidden" id="subject" name="subject" value="${map.togetherDto.subject}">
						<input type="hidden" id="title" name="title" value="${map.togetherDto.title }">
						<input type="hidden" id="bcontent" name="bcontent" value="${map.togetherDto.bcontent }">
						
						<input type="hidden" id="updateSubmit" onclick="updateCheck(this.form)" value="수정 완료">
					</form>
					
					<input type="button" id="updateBtn" value="수정" onclick="updateToggle()">
					
					<form action="/lessonBoard/togetherEx_delete.do" method="POST">
						<input type="hidden" name="bid" value="${map.togetherDto.bid}">
						<input type="button" onclick="deleteTogether(this.form)" value="삭제">
					</form>
				</div>
			</c:if>
			
			<div onclick="msgBoxOpen('${map.togetherDto.bname }')" class="boardMsgWriteBtn">
				쪽지 보내기 
			</div>
		
		
		
		
		
		<div class="commentlsit">
			<c:set var="list" value="${clist}" />
			<h1 class="commentIntro">${fn:length(list) } 개의 댓글이 있습니다.</h1>
		
			<c:forEach var="dto" items="${clist}">
				<form class="commentBox">
					<input type="hidden" name="commentNo" value="${dto.commentNo}">
					<input type="hidden" name="bcontent" value="${dto.bcontent}">
					
					<div class="commentHeader">
						<p>${dto.sname}</p>
						<div class="sessionCommentBox">
							<c:if test="${dto.sname eq sessionScope.userNick || (not empty sessionScope.admin)}">
							    <input type="hidden" id="commentHidden" onclick="toCommentUpdate(this.form)" value="수정완료">
								<input type="button" id="commentToggle" onclick="commentUpdateToggle(this.form)" value="수정">
								<input type="button" onclick="commentDelete(${dto.commentNo},${map.togetherDto.bid})" value="삭제">
							</c:if>
							<p>${fn:substring(dto.bdate,5,11)} / ${fn:substring(dto.bdate,11,16)}</p>
						</div>
						
					</div>
					<div class="commentBody">
						<textarea id="bcontentTemp" readonly>${dto.bcontent}</textarea>
					</div>
				</form>
			</c:forEach>
		</div>
		
		
		<h2 class="commentWriteMent">댓글 작성</h2>
		<form class="commentWrite" method="POST">
		
			<input type="hidden" name="sname" id="sname" value="${sessionScope.userNick}">
			<input type="hidden" name="bid" id="bid" value="${map.togetherDto.bid }">
			<textarea id="bcontentComment" name="bcontent" placeholder="댓글을 입력해주세요."></textarea>
			<input type="button" onclick="commentWrite(this.form)" value="등록">
			
		</form>
	</div>
	
	
	
	
	

</body>
</html>