<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>운동소개페이지</title>
  <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	function paging(num){
		$.ajax({
			url:"/innerPaging",
			data:{'num':num},
			type:"POST",
			dataType:'html',
			success:function(data){
				$('.tempBox').html(data)
			}
				
				
		});
	}
</script>
	<link rel="stylesheet" href="/resources/css/lessonBoard/introduce.css">

</head>
<body>
<div class="tempBox">
  <img width="" height="" alt="이미지" src="/resources/img/images/TEST2.jpg" class="title_img">
   	
    <div class="container">
  
        <div class="con">
        <a href="/resources/img/images/golf2.png"><img width="300" height="300" src="/resources/img/images/golf2.png"></a>
            <input type="button" id="golf" onclick="paging(1)" value="골프">
            
            
         
            <span id="message1"></span>
            <hr>
            <ul>
                <li>능력자와 함께</li>
                <li>골프 소개</li>
                <li><a href="javascript:void(0);" onclick="paging(4)">골프 능력자리스트 </a></li>
            </ul>
        </div>
        <div>
             <a href="/resources/img/images/body.jpg"><img width="300" height="300" src="/resources/img/images/body.jpg"></a>
            <input type="button" id="health" onclick="paging(2)" value="헬스">
            <hr>
            <ul>
               <li>능력자와 함께</li>
                <li>헬스 소개</li>
                <li><a href="javascript:void(0);" onclick="paging(5)">헬스 능력자리스트 </a></li>
            </ul>
        </div>
        <div>
            <a href="/resources/img/images/soo.jpg"><img width="300" height="300" src="/resources/img/images/soo.jpg"></a>
             <input type="button" id="swim" onclick="paging(3)" value="수영">
            <hr>
            <ul>
                 <li>능력자와 함께</li>
                <li>수영 소개</li>
                <li><a href="javascript:void(0);" onclick="paging(6)">수영 능력자리스트 </a></li>
            </ul>
        </div>
    </div>
    </div>
</body>
</html>

