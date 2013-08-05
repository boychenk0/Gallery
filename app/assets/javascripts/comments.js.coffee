$(document).ready ->
  $("form#new_comment").bind("ajax:success", (evt, data, status, xhr) ->
    console.log data.comment.created_at
    $('#comments-body').prepend("<div class='com'><strong>#{data.user.nickname}</strong><span> #{data.date}</span><hr><p class='reviev-text'>#{data.comment.body}</p></div>");
    $('#comment_body').val("")
    if ($('.com').length>5)
      $('.com:last').remove()
  ).bind "ajax:error", (evt, data) ->
    if data.status == 401
      document.location.href = 'http://localhost:3000/users/sign_in'