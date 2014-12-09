$(document).ready(function(){
    $('.keywords a').click(function(event){
        event.preventDefault();
        //$(this).parent().prev().empty(10000);
        var keyword_container = $(this).parent().prev().parent();
        keyword_container.transition({ opacity: 0 }, function(){
            keyword_container.empty();
            keyword_container.append('<td><input type="text"/></td><td><a href="#" class="btn btn_primary">Change Keyword</a></td>');
        });

        keyword_container.transition({opacity: 1});


    });
});