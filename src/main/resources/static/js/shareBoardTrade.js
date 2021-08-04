function writeView() {
	$.ajax({
		url: "/shareBoard/write_view_trade.do",
		type: "POST",
		dataType: "html",
		success: function(data) {
			$('.innerBox').html(data);
		},
		error: function() {
			alert(1);
		}
	})
}

function contentView(num) {
	$.ajax({
		url: "/shareboard/content_view",
		type: "POST",
		data: { shareTrade_num: num },
		dataType: "html",
		success: function(data) {
			$('.innerBox').html(data);
		},
		error: function() {
			alert(1);
		}
	})
}










/*장비 빌리기 게시판 js*/
function LendWriteView(){
	$.ajax({
		url: "/shareBoard/write_view_lend.do",
		type: "POST",
		dataType: "html",
		success: function(data) {
			$('.innerBox').html(data);
		},
		error: function() {
			alert('error');
		}
	})
}
function LendcontentView(num) {
	$.ajax({
		url: "/shareboard/content_view_lend",
		type: "POST",
		data: { shareLend_num: num },
		dataType: "html",
		success: function(data) {
			$('.innerBox').html(data);
		},
		error: function() {
			alert('error');
		}
	})
}