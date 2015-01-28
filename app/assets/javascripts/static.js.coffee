$ ->
  $('#js-posts .js-post').click (e) ->
    id = $(this).parent().data('id')
    $.ajax({
      url: '/posts/surrounding/' + id
      type: 'GET'
      data:
        id: id
      success: (data) ->
        first = data[0]
        second = data[1]
        third = data[2]
        first_date = data[3]
        second_date = data[4]
        third_date = data[5]

        $('#1st .post-title').text(first['title'])
        $('#1st .post-body').text(first['body'])
        $('#1st .post-date').text(first_date)

        $('#2nd .post-title').text(second['title'])
        $('#2nd .post-body').text(second['body'])
        $('#2nd .post-date').text(second_date)

        $('#3rd .post-title').text(third['title'])
        $('#3rd .post-body').text(third['body'])
        $('#3rd .post-date').text(third_date)
    })

  $('.tab-link').click (e) ->
    $('.tab-content').removeClass('active-tab')
    clicked_tab = $(this).data('tab')
    $('#' + clicked_tab).addClass('active-tab')



  $('ul.nav a').bind 'click', (event) ->
    event.preventDefault()
    $anchor = $(this)

    $('html, body').stop().animate({
      scrollLeft: $($anchor.attr('href')).offset().left
    }, 1000)