$ ->
  $('.book-image, .book-title, .book-section').on 'click', (e) ->
    $(e.currentTarget).parents('.book').toggleClass('book-open').toggleClass('book-closed')
