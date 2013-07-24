# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
#$(window).load ->
#  $(".gPop-gallery").each ->
#    $(this).gpop()
$(document).ready ->
  $(".subscribe").click ->
    id = $(this).attr("id")
    $.ajax(
      url: "/categories/subscribe"
      data:
        id: id
      dataType: "json"
      type: "post"
    ).success (response) ->
      if (response.status == true)
        $("##{response.id}").attr('src', '/assets/unsubscribe1.jpg')
      else
        $("##{response.id}").attr('src', '/assets/subscribe1.jpg')