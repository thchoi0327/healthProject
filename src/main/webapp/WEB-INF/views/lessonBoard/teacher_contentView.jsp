<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>강사상세페이지</title>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<link rel="stylesheet" href="/resources/css/lessonBoard/teacherContentView.css">
	<script type="text/javascript">
	function writeReview(f) {
	 	if ( $("#sname").val() == '') {
			alert("로그인 후 이용할 수 있습니다.");
			$("#sname").focus();
			return;
		}
		if ($("#rating").val() == '' ) {
			alert("내용을 입력해주세요.");
			$("#rating").focus();
			return;
		}
		
		if ( $('#score').val() =='' ){
			alert('별점을 작성해주세요 !')
			$('#score').focus();
			return;
		}
		if ( $('#bid').val() == ''){
			alert('error')
			return;
		}
		if ( $('#subject').val() == ''){
			alert('error')
			return;
		}
		if ( $('#tname').val() == ''){
			alert('error');
			return;
		}
		$.ajax({
			url:"/lessonBoard/review_write.do",
			type:"POST",
			dataType:"html",
			data:$(f).serialize(),
			success:function(data){
				$('.teacherInnerFull').html(data)
			},
			error:function(){
				alert('에러')
			}
		})
	}
	
	
	
	
	
	
	
	
	function applicationOpen(){
		$('.applicationDiv').css("visibility","visible")
	}
	function applicationClose(){
		$('.applicationDiv').css("visibility","hidden")
		$('#awantStartDate').val('');
		$('#awanEndDate').val('');
		$('#awantTime').val('');
		$('#astudentText').val('');
	}
	function applicationSubmit(f){
		if ( $('#astudentNick').val == '' ){
			alert('로그인 후 이용해주세요.')
			return;
		}
		
		if ( $('#awantStartDate').val() == '' ){
			alert('강습 시작 날짜를 입력해주세요.')
			$('#awantStartDate').focus();
			return;
		}
		if ( $('#awantEndDate').val() == '' ){
			alert('강습 종료 날짜를 입력해주세요.')
			$('#awanEndDate').focus();
			return;
		}
		if ( $('#awantTime').val() == '' ){
			alert(' 원하시는 시간을 입력해주세요.')
			$('#awantTime').focus();
			return;
		}
		
		
		if ( confirm('신청서를 제출하시겠습니까?') ){
			
			$.ajax({
				url:"/lessonBoard/applicationWrite.do",
				data:$(f).serialize(),
				type:"POST",
				success:function(data){
					if (data.result == 'true'){
						alert('수강 신청서 제출에 성공하였습니다.')
					}else {
						alert('수강 신청서 제출에 실패하였습니다.')	
					}
				},
				error:function(){
					alert('수강 신청서 제출에 실패하였습니다.')
				},
				complete:function(){
					applicationClose();
				}
			})
			
		}
		
	}
</script>
</head>
<body>
	<jsp:include page="../util/msgPage.jsp"></jsp:include>

	<c:set var="tdto" value="${map.tdto}" />
	
	<%-- 신청서 팝업창 --%>
	<div class="applicationDiv">
		<form class="applicationInner">
			<div class="applicationInnerTop">
				<div class="applicationInnerMent">
					# 수강 신청서
				</div>
				<div class="applicationInnerClose" onclick="applicationClose()" >
					<img src="/resources/img/util/close.png" style="width: 30px; height: 30px;">
				</div>
			</div>
			
			<input type="hidden" name="ateacherNick" id="ateacherNick" value="${tdto.tname}">
			<input type="hidden" name="astudentNick" id="astudentNick" value="${sessionScope.userNick }">
			<input type="hidden" name="astudentTel"  id="astudentTel" value="${sessionScope.userTel }">
			<label> 원하는 날짜를 선택해주세요</label>
			<div class="applicationDateBox">
				<input type="date" name="awantStartDate" id="awantStartDate">
				&nbsp;~&nbsp;
				<input type="date" name="awantEndDate" id="awantEndDate">
			</div>
			
			<label> 원하는 시간을 입력해주세요</label>
			<input type="text" name="awantTime" id="awantTime" placeholder="ex ) 6시 ~ 8시 " maxlength="20">
			
			<label> 추가 입력 정보 사항</label>
			<textarea name="astudentText" id="astudentText" placeholder=" ex ) 강사에게 하고싶은 말을 자유롭게 적어주세요 !" maxlength="100"></textarea>
			
			<input type="button" onclick="applicationSubmit(this.form)" value="제출하기" id="applicationBtn">
		</form>
	</div>
	
	
	
	
	
	
	
	
	
	
	
	
	<div class="teacherInnerFull">
		<div class="tInnerTop">
			<div class="teacherimgBox">
				<c:if test="${num < 4}">
					<img src="/resources/img/lessonimg/crowns.png" class="crownImg">
				</c:if>
				<img src="/resources/img/uploadTeacher/${tdto.fileName}" class="teacherImg">
			</div>
			<div class="teacherIntro">
				<label>강사명</label>
				<p>${tdto.tname}</p>
				<label>운동종류</label>
				<p>${tdto.subject}</p>
				<label>지역</label>
				<p>${tdto.area}</p>
				<label>포인트</label>
				<p>${tdto.point} Point</p>
			</div>
		</div>
		<div class="InnerMiddle">
			<textarea class="teacherIMLeft" readonly>${tdto.introduce }</textarea>
			<textarea class="teacherIMRight" readonly>${tdto.license }</textarea>
		</div>
		
		<div class="boardBtnBox">
			<div class="boardMsgWriteBtn" onclick="applicationOpen()">
				신청서 작성
			</div>
			<div class="boardMsgWriteBtn"  onclick="msgBoxOpen('${tdto.tname}')">
				쪽지 보내기 
			</div>
		</div>
		
		
		
		
		
		<%-- 리뷰  --%>
		<div class="InnerBottom">
			<div class="noReviewMent"># 현재 ${fn:length(map.rlist)} 개의 리뷰가 있습니다.</div>
			<c:forEach var="rdto" items="${map.rlist }">
				<div class="reviewList">
					<div class="reviewTop">
						<div>${rdto.sname }</div>
						<div class="scoreStar">
							<c:forEach begin="1" end="${rdto.score}">
								<img src="/resources/img/lessonimg/star.png">
							</c:forEach>
						</div>
							
					</div>
					<textarea readonly class="reviewlistContent">${rdto.rating}</textarea>
				</div>
			</c:forEach>
			
			
			
			
			
			
			<%---- 리뷰 작성 --%>
			<form class="writeReviewBox">
					<input type="hidden" name="num" value="${num}">
					<input type="hidden" name="bid" id="bid" value="${map.tdto.bid}">
					<input type="hidden" name="subject" id="subject" value="${map.tdto.subject }">
					<input type="hidden" name="tname" id="tname" value="${map.tdto.tname }">
					<input type="hidden" name="sname" id="sname" value="${sessionScope.userNick }">
					<div class="writeReviewInnerTop">
						<select name="score" id="score">
							<option value="">별점을 작성해주세요 !</option>
							<option value="5" title="/resources/img/lessonimg/star.png">5점</option>
							<option value="4" class="option04">4점</option>
							<option value="3" class="option03">3점</option>
							<option value="2" class="option02">2점</option>
							<option value="1" class="option01">1점</option>
						</select>
						<textarea name="rating" id="rating" placeholder="내용을 입력해주세요 !"></textarea>
					</div>
					<input type="button" id="reviewWriteBtn" onclick="writeReview(this.form)" value="리뷰 작성">
			</form>
		</div>
	</div>

</body>
</html>