$(document).ready ->
  $("form#new_comment").bind "ajax:success", (evt, data, status, xhr) ->
    console.log data
    $('#comments-error').html("#{data.errors.body}")
#    console.log dat
##    console.log data
##    $('#comments-body').prepend("<div class='com'><strong>#{data.user.nickname}</strong><span> #{data.date}</span><hr><p class='reviev-text'>#{data.comment.body}</p></div>");
##    $('#comment_body').val("")
##    if ($('.com').length>5)
##      $('.com:last').remove()
##  ).bind "ajax:error", (evt, data) ->
##    if data.status == 401
##      document.location.href = 'http://localhost:3000/users/sign_in'
#  $('form#new_comment').live 'ajax:success', (event,data) ->
#    $('#comments-body').html(data.html) if(data.success == true)