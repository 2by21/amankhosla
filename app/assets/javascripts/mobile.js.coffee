#= require jquery
#= require jquery_ujs
#= require bootstrap-sprockets

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