$( window ).load ->
  if $('body').hasClass('sidescroll')
    width = 0
    $('.section').each ->
      width += $(this).width()
    $('body').width(width + 20)

$ ->
  #$('.landing-logo').glow({ radius: 300, color: "#ffffff" })

  $('html, body, *').mousewheel (e, delta) ->
    this.scrollLeft -= (delta * 10);
    e.preventDefault();

  #post coffeescript
  switch_posts = (data, index) ->
    if index == 0
      left = data[0]
      center = data[1]
      right = data[2]
    else if index == data.length - 1
      left = data[data.length-3]
      center = data[data.length-2]
      right = data[data.length-1]
    else
      left = data[index-1]
      center = data[index]
      right = data[index+1]

    $('#1st .post-title').html(left['title'])
    $('#1st .post-body').html(left['body'])
    $('#1st .post-date').html(left['formatted_date'])

    $('#2nd .post-title').html(center['title'])
    $('#2nd .post-body').html(center['body'])
    $('#2nd .post-date').html(center['formatted_date'])

    $('#3rd .post-title').html(right['title'])
    $('#3rd .post-body').html(right['body'])
    $('#3rd .post-date').html(right['formatted_date'])

  $.ajax({
    url: '/posts'
    type: 'GET'
    success: (data) ->
      $('#1st .post-title').html(data[0]['title'])
      $('#1st .post-body').html(data[0]['body'])
      $('#1st .post-date').html(data[0]['formatted_date'])

      $('#2nd .post-title').html(data[1]['title'])
      $('#2nd .post-body').html(data[1]['body'])
      $('#2nd .post-date').html(data[1]['formatted_date'])

      $('#3rd .post-title').html(data[2]['title'])
      $('#3rd .post-body').html(data[2]['body'])
      $('#3rd .post-date').html(data[2]['formatted_date'])

      for post, index in data
        post_data = "<li data-index=" + index + " class='post-selector-li'><h3 class='js-post'><span class='list-post-title'>" + post['title'] + "</span> <span class='list-post-date'>" + post['formatted_date'] + "</span></h3></li>"
        $('#ul-posts-list').append(post_data)

      $('#ul-posts-list li').click ->
        current_index = $(this).data('index')
        switch_posts(data, current_index)
      
      $('#archive-btn').click ->
        $('.post-selector-container').toggle()

      $('#ul-posts-list').easyPaginate()
      
      $('#post-prev').click ->
        unless $('#section2 ol#pagination .prev').css('display') == 'none'
          $('#section2 ol#pagination .prev').click()
      $('#post-nxt').click ->
        unless $('#section2 ol#pagination .next').css('display') == 'none'
          $('#section2 ol#pagination .next').click()

  })

  #photo gallery coffeescript
  $('.gallery-photo').click ->
    id = "#gallery-" + $(this).data('gallery')
    $('.modal' + id).modal()

  $('.gallery-li img').click ->
    src = $(this).data('original')
    $(this).parent().parent().parent().siblings('.modal-body').children('img').attr('src', src)

  $('.x-button').click ->
    $('.modal').modal('hide')
    
  # video coffeescript

  $('.video').click (event) ->
    youtube = "//www.youtube.com/embed/"
    video_id = $(this).data('url')
    title = $(this).data('title')
    body = $(this).data('body')

    $('#video-frame').attr('src', youtube+video_id)
    $('#video-title').html(title)
    $('#video-body').html(body)

  # Tabs coffescript

  $('.tab-link').click (e) ->
    $('.tab-link').removeClass('active-tab-link')
    $(this).addClass('active-tab-link')
    $('.tab-content').removeClass('active-tab')
    clicked_tab = $(this).data('tab')
    $('#' + clicked_tab).addClass('active-tab')

  $('.video-preview-ul').easyPaginate()
      
  $('#video-prev').click ->
    unless $('#section6 ol#pagination .prev').css('display') == 'none'
      $('#section6 ol#pagination .prev').click()
  $('#video-nxt').click ->
    unless $('#section6 ol#pagination .next').css('display') == 'none'
      $('#section6 ol#pagination .next').click()

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

  #shows/clinics tables coffeescript
  # $('.shows-table').DataTable({
  #   autoWidth: false
  #   paging: false
  #   scrollY: "60vh"
  #   searching: false
  #   bAutoWidth: false
  #   aoColumns : [ { sWidth: '50px' }, { sWidth: '300px' }, { sWidth: '250px' }, { sWidth: '30px' } ]  
  # })

  # $('.clinics-table').DataTable({
  #   autoWidth: false
  #   paging: false
  #   scrollY: "60vh"
  #   searching: false
  #   bAutoWidth: false
  #   aoColumns : [ { sWidth: '50px' }, { sWidth: '300px' }, { sWidth: '250px' }, { sWidth: '30px' } ]  
  # })

  $('.clinics-wrapper').hide()

  $('#shows-link, #clinics-link').click ->
    $('.clinics-wrapper').toggle()
    $('.shows-wrapper').toggle()
    $(this).toggleClass('hovered')
    $(this).siblings().toggleClass('hovered')




  # $('#shows-link').hover( 
  #   ->  $(this).addClass('hovered-shows')
  #   ->  $(this).removeClass('hovered-shows') unless $('.shows-wrapper').is(':visible')
  # )

  # $('#clinics-link').hover( 
  #   ->  $(this).addClass('hovered-clinics')
  #   ->  $(this).removeClass('hovered-clinics') unless $('.clinics-wrapper').is(':visible')
  # )

  $('#first-twinkle').hide()
  $('#second-twinkle').hide()
  $('#third-twinkle').hide()

  $('.star').hover ->
    console.log($(this))
    $(this).fadeOut "fast", ->
      if $(this).attr('id') == 'first-egg'
        $('#first-twinkle').fadeIn 'slow', ->
          $('#first-twinkle').fadeOut('fast')
          $(this).fadeIn('slow')
      else if $(this).attr('id') == 'second-egg'
        $('#second-twinkle').fadeIn 'slow', ->
          $('#second-twinkle').fadeOut('fast')
          $(this).fadeIn('slow')
      else
        $('#third-twinkle').fadeIn 'slow', ->
          $('#third-twinkle').fadeOut('fast')
          $(this).fadeIn('slow')


