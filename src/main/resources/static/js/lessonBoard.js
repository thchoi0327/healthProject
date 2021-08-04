function callPage(num) {
	$.ajax({
		url: "/lessonBoardCall",
		data: { 'num': num },
		type: "POST",
		dataType: "text",
		success: function(data) {
			$('.temp').html(data);
		},
		error: function() {
			alert('페이지를 불러오는데 실패하였습니다.')
		}
	})
}