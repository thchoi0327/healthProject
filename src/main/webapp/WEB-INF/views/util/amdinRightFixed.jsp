<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
		.adminRightFiexd{
			position: fixed;
			right: 5px;
			top: 50%;
			transform:translateY(-50%);
			z-index:1;
			width: 80px;
			height: 320px;
			border: 3px solid black;
			display: flex;
			flex-direction: column;
			border-radius: 5px;
			background-color: #fff;
		}
		.adminRightFiexd > div{
			width:100%;
			height:80px;
			display: flex;
			align-items: center;
			justify-content: center;
			border-bottom: 3px solid black;
			cursor: pointer;
		}
		.adminRightFiexd > div:nth-child(4){
			border: none;
		}
		.adminRightFiexd img{
			width: 50px;
			height: 50px;
		}
	</style>
</head>
<body>
	<div class="adminRightFiexd">
		<div onclick="adminNoticeMsgOpen()">
			<img src="/resources/img/util/adminNotice.png">
		</div>
		<div onclick="msgBoxOpen()">
			<img src="/resources/img/util/sendMsg.png">
		</div>
		<div></div>
		<div></div>
	</div>
</body>
</html>