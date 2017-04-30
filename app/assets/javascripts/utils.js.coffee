window.scroll_to = (id, event) ->
  event.preventDefault()
  $("#collapse-menu").collapse('hide')
  if id == "top"
    $("html, body").animate({scrollTop: 0})  
  else
    object = $("##{id}")
    $("html, body").animate({scrollTop: object.offset().top - 25})