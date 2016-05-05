$(function(){
    $(".addButton").click(function(){
        var parentDiv = $(this).parents('.divSame');
        var cloneDiv = $(".clone .addDicStyle").clone();
        var lol = parentDiv.attr("id");
        $("#"+lol + " .addDiv").append(cloneDiv);

        $(".deletButton").click(function(){
            $(this).parent().remove();
        })
    })
});