//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require jquery.masonry.min
//= require welcome
//= require jquery.fitvids
//= require jquery-star-rating
//= require clips
//= require jquery.infinitescroll.min

 var videoContainer = $('#videoContainer');
function handlePlayerStateChange (state) {
switch (state) {
case 1:
alert("playing..");
case 3:
// Video has begun playing/buffering
videoContainer.cycle('pause');
alert("playing..");
break;
case 2:
case 0:
// Video has been paused/ended
alert("end..");
break;
}
}
function onYouTubePlayerReady(id){
	alert("testttt");
}
