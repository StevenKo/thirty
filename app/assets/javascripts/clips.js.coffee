$ ->
  $(".video-container").fitVids();
  $(".video-container").fitVids({ customSelector: "iframe[src^='http://socialcam.com']"});

$ ->
  $(".video-show-container").fitVids();
  $(".video-show-container").fitVids({ customSelector: "iframe[src^='http://socialcam.com']"});

$ ->
  $('.star a').click (e) ->
    form = $(this).parent().attr('id');
    $("input##{form}").attr('checked','checked');
    id = $("input##{form}").data('clip');
    $("#submit_#{id}").submit();
   