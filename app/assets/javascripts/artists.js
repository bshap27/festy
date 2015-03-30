$(function(){
	letterListener();
});

function letterListener(){
	$('.letter_link').on("click", showArtists);
}

function showArtists(e){
	e.preventDefault();

	var url = $(this).attr("href");

	$.ajax(url, {
		"method": 'get',
		"dataType": "script"
	});
}