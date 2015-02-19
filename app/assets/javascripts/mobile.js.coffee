#= require jquery
#= require jquery_ujs
#= require bootstrap-sprockets
#= require easypaginate
#= require jssor
#= require jssor.slider

$ ->

  $.ajax({
    url: '/posts'
    type: 'GET'
    success: (data) ->
      data = data.reverse()
      $('#1st .post-title').text(data[0]['title'])
      $('#1st .post-body').text(data[0]['body'])
      $('#1st .post-date').text(data[0]['formatted_date'])

      for post, index in data
        post_data = "<li data-index='" + index + "' data-body='" + post['body'] + "' data-date='" + post['formatted_date'] + "' data-title='" + post['title'] + "' class='post-selector-li'><h3 class='js-post'><span class='list-post-title'>" + post['title'] + "</span></h3></li>"
        $('#ul-posts-list').append(post_data)

      $('#ul-posts-list li').click ->
        body = $(this).data('body')
        title = $(this).data('title')
        formatted_date = $(this).data('formatted_date')
        $('#1st .post-title').text(title)
        $('#1st .post-body').text(body)
        $('#1st .post-date').text(formatted_date)

      $('#ul-posts-list').easyPaginate({
        step: 3
      })
      
      $('#post-prev').click ->
        unless $('#section2 ol#pagination .prev').css('display') == 'none'
          $('#section2 ol#pagination .prev').click()
      $('#post-nxt').click ->
        unless $('#section2 ol#pagination .next').css('display') == 'none'
          $('#section2 ol#pagination .next').click()

  })

  $('.video').click (event) ->
    console.log 'clicked'
    youtube = "//www.youtube.com/embed/"
    video_id = $(this).data('url')
    title = $(this).data('title')
    body = $(this).data('body')

    $('#video-frame').attr('src', youtube+video_id)
    $('#video-title').text(title)
    $('#video-body').text(body)

  $('.video-preview-ul').easyPaginate({
    step: 3
  })

  $('#video-prev').click ->
    unless $('.section4 ol#pagination .prev').css('display') == 'none'
      $('.section4 ol#pagination .prev').click()
  $('#video-nxt').click ->
    unless $('.section4 ol#pagination .next').css('display') == 'none'
      $('.section4 ol#pagination .next').click()


  #photo gallery coffeescript
  $('.gallery-photo').click ->
    id = "#gallery-" + $(this).data('gallery')
    $('.modal' + id).modal()

  $('.gallery-li img').click ->
    src = $(this).data('original')
    $(this).parent().parent().parent().siblings('.modal-body').children('img').attr('src', src)

  $('.x-button').click ->
    $('.modal').modal('hide')

  #slider
  options =
    $FillMode: 1
    $ThumbnailNavigatorOptions:
      $Class: $JssorThumbnailNavigator$
      $ChanceToShow: 2
      $DisplayPieces: 10

  jssor_slider0 = new $JssorSlider$('slider0_container', options)
  jssor_slider1 = new $JssorSlider$('slider1_container', options)
  jssor_slider2 = new $JssorSlider$('slider2_container', options)
  jssor_slider3 = new $JssorSlider$('slider3_container', options)


  # tools, photos tabs
  $('.tab-link').tap (e) ->
    e.preventDefault()
    console.log 'clicked tab-link'
    $('.tab-link').removeClass('active-tab-link')
    $(this).addClass('active-tab-link')
    $('.tab-content').removeClass('active-tab')
    clicked_tab = $(this).data('tab')
    console.log clicked_tab
    $('#' + clicked_tab).addClass('active-tab')


  $('.down-arrow img').click (e) ->
    $(this).fadeOut "slow", (e) ->
      $('#cheeky-message').fadeIn("slow")