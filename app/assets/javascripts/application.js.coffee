#// This is a manifest file that'll be compiled into application.js, which will include all the files
#// listed below.
#//
#// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
#// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
#//
#// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
#// the compiled file.
#//
#// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
#// GO AFTER THE REQUIRES BELOW.
#//
#= require jquery
#= require jquery_ujs
#= require bootstrap
#= require pusher.min
#= require_tree .

$(document).ready ->
  $("#trigger").click ->
    $("#chat").toggle "fast"
    $(this).toggleClass "active"
    false

  Pusher.host = '127.0.0.1'
  Pusher.ws_port = 8080
  Pusher.wss_port = 8080
  pusher = new Pusher("74c9b81466fe7a2eb84e")
  channel = pusher.subscribe("test_channel")
  console.log pusher.connection.state
  channel.bind("my_event", (response) ->
    console.log(response)
    $('#chat-body').append("<div class='chat-mes'><strong>#{response.user['nickname']}</strong><span>#{response.message['created_at']}</span><p>#{response.message['body']}</p></div>")
    $('#message_body').val('')
  )
  $('form#new_message').bind "ajax:error", (evt, data) ->
    if data.status == 401
      document.location.href = 'http://localhost:3000/users/sign_in'

