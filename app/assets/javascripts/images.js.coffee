# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(document).ready ->
  $(".like").click ->
    id = $(".imglike").attr("id")
    $.ajax
      url: "/images/like"
      data:
        id: id
      dataType: "json"
      type: "post"
      success: (response) ->
        if (response.status == true)
          $(".imglike").attr('src', '/assets/unlike.jpg')
        else
          $(".imglike").attr('src', '/assets/like.jpg')
        $(".likecount").text(response.all_likes)
      error: (xhr, ajaxOptions, thrownError) ->
        document.location.href = 'http://localhost:3000/users/sign_in'
#  create_image = (ui) ->
#  console.log $(ui).parent().find("img").attr("src")
#  console.log $(ui).parent().find("select option:selected").val()
#  src = $(ui).parent().find("img").attr("src")
#  category = $(ui).parent().find("select option:selected").val()
#  parent = $(ui).parent().attr("id")
#  $.ajax(
#    url: "parsing/create_image"
#    data:
#      src: src
#      category: category
#      parent: parent
#
#    dataType: "json"
#    type: "post"
#  ).success (response) ->
#    $("#" + response.parent).remove()
