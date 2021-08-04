<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
		.rightfixed{
			position: fixed;
			right: 5px;
			top: 50%;
			transform:translateY(-50%);
			z-index:1;
			width: 80px;
			height: 240px;
			border: 3px solid black;
			display: flex;
			flex-direction: column;
			border-radius: 5px;
			background-color: #fff;
		}
		.rightfixed > div{
			width:100%;
			height:80px;
			display: flex;
			align-items: center;
			justify-content: center;
			border-bottom: 3px solid black;
			cursor: pointer;
		}
		.rightfixed > div:nth-child(3){
			border: none;
		}
		.rightfixed img{
			width: 50px;
			height: 50px;
		}
	</style>
</head>
<body>
	<div class="rightfixed">
		<div onclick="msgBoxOpen()">
			<img src="/resources/img/util/sendMsg.png">
		</div>
		<div></div>
		<div></div>
	</div>
</body>
</html>