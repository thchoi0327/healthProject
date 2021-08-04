<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script>
		function adminSiteClose(f){
			if ( confirm('!주의 사이트를 닫으시겠습니까?') ){
				$(f).submit();
			}
		}
		function adminSiteOpen(f){
			if ( confirm('!주의 사이트를 여시겠습니까?') ){
				$(f).submit();
			}
		}
	
	</script>
	<style>
		.adminHeaderDiv{
			position: fixed;
			z-index:999;
			top:100px;
			left:50%;
			transform:translateX(-50%);
			width: 150px;
			height: 59px;
			border: 3px solid black;
			border-radius: 5px;
			display: flex;
			
		}
		
		.adminHeaderDiv > form{
			width: 75px;
			height: 100%;
			display: flex;
			align-items: center;
			justify-content: center;
			cursor: pointer;
			
		}
		.adminHeaderDiv > form > img{
			width: 47px;
			height: 47px;
		}
		.adminHeaderSiteClose{
			border-right:3px solid black;
		}
	</style>
</head>
	<body>
		<div class="adminHeaderDiv">
			<form class="adminHeaderSiteClose" action="/admin/AccessForSiteClose" onclick="adminSiteClose(this)" method="POST">
				<img src="/resources/img/util/siren.png">
			</form>
			<form class="adminHeaderSiteOpen"action="/admin/AccessForSiteOpen" onclick="adminSiteOpen(this)" method="POST">
				<img src="/resources/img/util/open.png">
			</form>
			
		</div>	
	</body>
</html>