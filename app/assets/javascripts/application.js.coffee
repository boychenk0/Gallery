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
#= require pusher
#= require jquery.gpop.js
#= require_tree .

#$(document).ready ->
#  Pusher.host = 'localhost:8080'
#  Pusher.ws_port = 8080;
#  Pusher.wss_port = 8080;
#  pusher = new Pusher('1c81fd8f32b04884c7ac10a7df682973', { encrypted: false })
#  channel = pusher.subscribe('test-channel')
#
#  channel.bind "test-event",(response)->
#    alert(response)
#    $('#chat .message').text(response.comment)
#  console.log response


#фронтенд:
#Pusher.host = host;
#Pusher.ws_port = ws_port;
#var pusher = new Pusher(app_key);
#var channel = pusher.subscribe("test-channel", {encrypted: false})
#channel.bind("test-event", function(response){
#console.log(response)
#})
#бэкэнд:
#Pusher.host   = host
#Pusher.port   = api_port
#Pusher.app_id = 1 #любой можно подставить
#Pusher.key = Settings.jagan.app_key
#Pusher.secret = Settings.jagan.app_secret
#Pusher.encrypted = false
#
#Pusher["test-channel"].trigger("test-event", {message: "hello"})

