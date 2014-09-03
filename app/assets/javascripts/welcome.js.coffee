reload_masonry = ->
	$('#item_box_container').masonry({
    itemSelector : '.item_box',
    isAnimated: true,
    isFitWidth: true
  });
  $('#item_box_container').infinitescroll(
    {
      navSelector : '.pagination',
      nextSelector : '.pagination a.next_page',
      itemSelector : '.item_box',
      loading: {
        finishedMsg: 'No more pages to load.',
        img: 'http://i.imgur.com/6RMhx.gif'
      }
    },
    (newElements ) ->
      $newElems = $( newElements ).css({ opacity: 0 });
      $newElems.imagesLoaded ->
        $newElems.animate({ opacity: 1 });
        $('#item_box_container').masonry( 'appended', $newElems, true );
        FB.XFBML.parse();
        $('input[type=radio].star').rating();
  ); 
$ ->  
  reload_masonry
  window.setTimeout(reload_masonry, 100);
  window.setTimeout(reload_masonry, 300);
  window.setTimeout(reload_masonry, 1000);
  window.setTimeout(reload_masonry, 2000);
  window.setTimeout(reload_masonry, 3000);

$ ->
  $('.item_box_container a').click (e) ->
    $('.modal-body').remove()
    $('.modal-header').after("<div class=\"modal-body\"><object style=\"height: 390px; width: 640px\"><param name=\"movie\" value=\"http://www.youtube.com/v/93vLLh5rAiM?version=3&feature=player_detailpage\"><param name=\"allowFullScreen\" value=\"true\"><param name=\"allowScriptAccess\" value=\"always\"><embed src=\"http://www.youtube.com/v/93vLLh5rAiM?version=3&feature=player_detailpage\" type=\"application/x-shockwave-flash\" allowfullscreen=\"true\" allowScriptAccess=\"always\" width=\"640\" height=\"360\"></object></div>")