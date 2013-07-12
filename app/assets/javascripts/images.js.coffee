# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(document).ready ->
  $(".like").click ->
    id = $(".imglike").attr("id")
    $.ajax(
      url: "/images/like"
      data:
        id: id
      dataType: "json"
      type: "post"
    ).success (response) ->
      if (response.status == true)
        $(".imglike").attr('src', '/assets/unlike.jpg')
      else
        $(".imglike").attr('src', '/assets/like.jpg')
      $(".likecount").text(response.all_likes)

#      $(".all_likes span").text(response.all_likes)