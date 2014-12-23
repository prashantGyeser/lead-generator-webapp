var ready;
ready = function() {

    $(document).on('click', '.keywords .remove_keyword', function() {
        event.preventDefault();

        var keyword_container = $(this).parent().prev().parent();
        var keyword_id = $(this).data("id");
        var data_to_post = {keyword_id: keyword_id};

        $.ajax({
            url : "/dashboard/keyword/remove",
            type: "POST",
            data : data_to_post,
            success: function(data, textStatus, jqXHR)
            {
                keyword_container.transition({ opacity: 0 }, function(){
                    keyword_container.empty();
                    keyword_container.append('<td><input type="text" placeholder="Enter keyword"/></td><td><a href="#" class="btn btn_primary add_keyword">Add Keyword</a></td>');
                });

                keyword_container.transition({opacity: 1});
            },
            error: function (jqXHR, textStatus, errorThrown)
            {
                alert("Something went wrong, please try again later.");
            }
        });
    });


    $(document).on('click', '.keywords .add_keyword', function() {
        event.preventDefault();

        var keyword = $(this).parent().prev().find('input').val();
        var keyword_container = $(this).parent().prev().parent();

        if (keyword.length > 0){
            var data_to_post = {term: keyword};

            $.ajax({
                url : "/dashboard/keyword/add",
                type: "POST",
                data : data_to_post,
                success: function(data, textStatus, jqXHR)
                {
                    console.log(data.term);

                    keyword_container.transition({ opacity: 0 }, function(){
                        keyword_container.empty();
                        keyword_container.append('<td class="bold">' + data.term + '</td><td><a href="#" class="remove_keyword" data-id="'+ data.id +'">Remove</a></td>');
                    });

                    keyword_container.transition({opacity: 1});
                },
                error: function (jqXHR, textStatus, errorThrown)
                {
                    alert("Something went wrong, please try again later.");
                }
            });
        }
        else{
            alert("Please add a keyword");
        }
    });

};

$(document).ready(ready);
$(document).on('page:load', ready);
