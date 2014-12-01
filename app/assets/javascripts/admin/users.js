$(document).ready(function(){

    function send_data_to_server(unprocessed_tweet_id, is_lead){
        var unprocessed_tweet_type_data = {unprocessed_tweet_id: unprocessed_tweet_id, is_lead: is_lead}

        $.ajax({
            url : "/admin/users/set_unprocessed_tweet_type",
            type: "POST",
            data : unprocessed_tweet_type_data,
            success: function(data)
            {
                console.log("Success!", data);
            },
            done: function(data, textStatus, jqXHR)
            {
                console.log("Success!", data);
                console.log("The status is:", textStatus);
            },
            fail: function (jqXHR, textStatus, errorThrown)
            {
                console.log("Fail!", data);
                console.log("The status is:", textStatus);
            }
        });
    }


    $('.is_lead').click(function(e){
        unprocessed_tweet_id = $(this).attr('data-id');
        is_lead = $(this).attr('data-is-lead');
        post_result = send_data_to_server(unprocessed_tweet_id, is_lead);
    })



});