$(document).ready(function(){

    function send_data_to_server(unprocessed_tweet_id, is_lead, parent_element){
        var unprocessed_tweet_type_data = {unprocessed_tweet_id: unprocessed_tweet_id, is_lead: is_lead}

        $.ajax({
            url : "/admin/users/set_unprocessed_tweet_type",
            type: "POST",
            data : unprocessed_tweet_type_data,
            success: function(data)
            {
                parent_element.parent().parent().parent().hide(100);
                return true;
            },
            done: function(data, textStatus, jqXHR)
            {
                console.log("Success!", data);
                console.log("The status is:", textStatus);
            },
            fail: function (jqXHR, textStatus, errorThrown)
            {
                return false;
            }
        });
    }

    $('.is_lead').click(function(e){
        unprocessed_tweet_id = $(this).attr('data-id');
        is_lead = $(this).attr('data-is-lead');

        var parent_element = $(this).parent();
        parent_element.children().hide();
        parent_element.append('<div class="ajax_loader"><img alt="Ajax loader" src="/assets/ajax-loader.gif"></div>');

        post_result = send_data_to_server(unprocessed_tweet_id, is_lead, parent_element);

    })



});