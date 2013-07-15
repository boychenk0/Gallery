$(document).ready(function() {
    $( ".img" ).draggable();
    $( "#droppable" ).droppable({
        drop: function( event, ui ) {
            console.log(ui.draggable.find('img').attr('src'))
            console.log(ui.draggable.find('select option:selected').val())
            src = ui.draggable.find('img').attr('src')
            category = ui.draggable.find('select option:selected').val()
            $.ajax({
                url: "parsing/create_image"
            }, {
                data: {
                    src: src,
                    category: category
                },
                dataType: "json",
                type: "post"
            }).success(function(response) {

                });
        }
    });
});
