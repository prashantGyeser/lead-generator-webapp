$(document).ready(function(){

    $('#submit_category').click(function(){
        var new_category = $('#category_field').val();

        if (new_category.length === 0) {
            alert("Please add a category. It is blank right now!");
        }
        else {
            data_to_post = {name: new_category};
            $.post( "/admin/sample_category/create", data_to_post ,function( response,status ) {
                console.log(response);
                console.log(status);

                var list_item_to_append = '<li><div class="row"><div class="col-md-12"><div class="tweet"><span class="bold screen_name"><a href="categories/' + response.id + '">' + new_category + '</a></span></div></div></div></li>'

                $('.opportunities ul').append(list_item_to_append);

            });
        }

    });


    $('#submit_sample_lead').click(function(event){
        event.preventDefault();
        var sample_screen_name = $('#sample_screen_name').val();
        var sample_lead = $('#sample_lead').val();
        var category_id = $(this).data('category-id');

        data_to_post = {sample_category_id: category_id, tweet: sample_lead, screen_name: sample_screen_name};

        $.post("/admin/sample_lead/create", data_to_post, function( response,status ){
            console.log(response);
            console.log(status);

            list_item_to_append = '<li><div class="row"><div class="col-md-12"><div class="tweet"><span class="bold screen_name" style="margin-bottom: 10px;">' + response.screen_name + '</span><p>' + response.tweet + '</p></div></div></div></li>'

            $('.opportunities ul').append(list_item_to_append);

        });
    });


});