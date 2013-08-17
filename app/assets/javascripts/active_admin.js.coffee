root = exports ? this
root.create_image = (ui) ->
  console.log $(ui).parent().find("img").attr("src")
  console.log $(ui).parent().find("select option:selected").val()
  src = $(ui).parent().find("img").attr("src")
  category = $(ui).parent().find("select option:selected").val()
  parent = $(ui).parent().attr("id")
  $.ajax(
    url: "parse/create_image"
    data:
      src: src
      category: category
      parent: parent
    dataType: "json"
    type: "post"
  ).success (response) ->
    $("#" + response.parent).remove()