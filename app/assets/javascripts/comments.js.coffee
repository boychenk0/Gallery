$(document).ready ->
  $("form#new_comment").bind("ajax:success", (evt, data, status, xhr) ->
    $('#comments-body').prepend("<div class='com'><strong>#{escape_javascript @comment.user.email}</strong><span>#{escape_javascript @comment.created_at.strftime("%Y-%m-%d %H:%M")}</span><hr><p class='reviev-text'>#{escape_javascript @comment.body}</p></div>");
    $('#comment_body').val("")
    if ($('.com').length>5)
      $('.com:last').remove()
  ).bind "ajax:error", (evt, data) ->
    if data.status == 401
      document.location.href = 'http://localhost:3000/users/sign_in'