<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>Insert title here</title>
	<style>
		*{
			margin: 0;
			padding: 0;
			box-sizing: border-box;
		}

		.sorryBox{
			width:100vw;
			height:100vh;
			position: fixed;
			z-index:9999;
			background-color:white;
			left:50%;
			top:50%;
			transform:translate(-50%,-50%);

			
		}
		.mentBox{
			position:relative;
			left:50%;
			top:50%;
			width:600px;
			height:400px;
			transform:translate(-50%,-50%);
			display: flex;
			flex-direction: column;
			align-items: center;
			justify-content: space-between;
			border: 5px solid #26292d;
			border-radius: 15px;
			padding:20px;
		}
		.mentBox > img{
			width: 300px;
			height: 300px;
		}
	</style>
</head>
	<body>
		<div class="sorryBox">
			<div class="mentBox">
				<h1>죄송합니다. 사이트 점검 중입니다.</h1>
				<img src="/resources/img/util/siteClose.png">
			</div>
		</div>
	</body>
</html>