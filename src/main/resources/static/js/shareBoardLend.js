function writeView() {
	$.ajax({
		url: "/shareBoard/write_view.do",
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