#= require jquery
#= require jquery_ujs
#= require bootstrap-sprockets
#= require easypaginate
#= require jssor
#= require jssor.slider

$ ->

  $('.video').click (event) ->
    console.log 'clicked'
    youtube = "//www.youtube.com/embed/"
    video_id = $(this).data('url')
    title = $(this).data('title')
    body = $(this).data('body')

    $('#video-frame').attr('src', youtube+video_id)
    $('#video-title').html(title)
    $('#video-body').html(body)

  $('#video-prev').click ->
    unless $('.section4 ol#pagination .prev').css('display') == 'none'
      $('.section4 ol#pagination .prev').click()
  $('#video-nxt').click ->
    unless $('.section4 ol#pagination .next').css('display') == 'none'
      $('.section4 ol#pagination .next').click()

  $('.down-arrow img').click (e) ->
    $(this).fadeOut "slow", (e) ->
      $('#cheeky-message').fadeIn("slow")