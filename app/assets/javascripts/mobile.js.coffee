#= require jquery
#= require jquery_ujs
#= require bootstrap-sprockets
#= require easypaginate
#= require jssor
#= require jssor.slider

$ ->
  $('.down-arrow img').click (e) ->
    $(this).fadeOut "fast", (e) ->
      $('#cheeky-message').fadeIn("fast")

  $("#video-nxt").click ->
    index = $(".showing").data('index');
    next_index = index + 1
    count = $(".video-frame").length

    if next_index < count
      $(".showing").hide();
      $(".showing").removeClass('showing');
      $(".showing").addClass('.not-showing');

      $("#video-"+next_index).show();
      $("#video-"+next_index).addClass('showing')
      $("#video-"+next_index).removeClass('not-showing')

  $("#video-prev").click ->
    index = $(".showing").data('index');
    prev_index = index - 1

    if prev_index > -1
      $(".showing").hide();
      $(".showing").removeClass('showing');
      $(".showing").addClass('.not-showing');

      $("#video-"+prev_index).show();
      $("#video-"+prev_index).addClass('showing')
      $("#video-"+prev_index).removeClass('not-showing')

    