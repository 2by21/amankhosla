#= require jquery
#= require jquery_ujs
#= require bootstrap-sprockets
#= require easypaginate

$ ->
  $.ajax({
    url: '/posts'
    type: 'GET'
    success: (data) ->
      $('#1st .post-title').text(data[0]['title'])
      $('#1st .post-body').text(data[0]['body'])
      $('#1st .post-date').text(data[0]['formatted_date'])

      # for post, index in data
      #   post_data = "<li data-index=" + index + " class='post-selector-li'><h3 class='js-post'><span class='list-post-title'>" + post['title'] + "</span> <span class='list-post-date'>" + post['formatted_date'] + "</span></h3></li>"
      #   $('#ul-posts-list').append(post_data)

      # $('#ul-posts-list li').click ->
      #   current_index = $(this).data('index')
      #   switch_posts(data, current_index)
      
      # $('#archive-btn').click ->
      #   $('.post-selector-container').show()

      # $('#ul-posts-list').easyPaginate()
      
      # $('#post-prev').click ->
      #   unless $('#section2 ol#pagination .prev').css('display') == 'none'
      #     $('#section2 ol#pagination .prev').click()
      # $('#post-nxt').click ->
      #   unless $('#section2 ol#pagination .next').css('display') == 'none'
      #     $('#section2 ol#pagination .next').click()

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

  # tools, photos tabs
  $('.tab-link').click (e) ->
    console.log 'clicked tab-link'
    $('.tab-link').removeClass('active-tab-link')
    $(this).addClass('active-tab-link')
    $('.tab-content').removeClass('active-tab')
    clicked_tab = $(this).data('tab')
    console.log clicked_tab
    $('#' + clicked_tab).addClass('active-tab')