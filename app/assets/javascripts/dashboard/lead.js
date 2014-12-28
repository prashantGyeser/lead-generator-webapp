var ready;
ready = function() {

    $('.not_lead').click(function(event){
        event.preventDefault();

        var lead_id = $(this).data("lead-id");
        data_to_post = {lead_id: lead_id};

        var button_clicked = $(this);

        $.ajax({
            url : "dashboard/leads/mark_non_lead",
            type: "POST",
            data : data_to_post,
            success: function(data, textStatus, jqXHR)
            {
                button_clicked.parent().parent().parent().parent().hide(200);
            },
            error: function (jqXHR, textStatus, errorThrown)
            {
                alert("Something went wrong, please try again later.");
            }
        });

    });

    $('#reply_message').simplyCountable({
        counter:            '#message_character_count',
        countType:          'characters',
        maxCount:           120,
        strictMax:          true,
        countDirection:     'down',
        safeClass:          'safe',
        overClass:          'over',
        thousandSeparator:  ',',
        onOverCount:        function(count, countable, counter){},
        onSafeCount:        function(count, countable, counter){},
        onMaxCount:         function(count, countable, counter){}
    });

    $('.sample').click(function(e){
        e.preventDefault();
        alert("This is only sample data, as soon as we find opportunities using the keywords you provided, we will send you an email");
    })


    $('.reply').click(function(event){
        event.preventDefault();

        var screen_name = $(this).data('screen-name');
        var lead_id = $(this).data('lead-id');

        $('#lead_being_replied_to').val(lead_id);
        $('#replying_to').text(screen_name);

        $('li').removeClass('replying');
        $(this).parent().parent().parent().parent().addClass('replying');

    });

    $('#send_reply_button').click(function(event){
        event.preventDefault();

        var lead_id = $('#lead_being_replied_to').val();
        var reply_message = $('#reply_message').val();

        var data_to_post = {lead_id: lead_id, message: reply_message};

        $.ajax({
            url : "dashboard/leads/send_reply",
            type: "POST",
            data : data_to_post,
            success: function(data, textStatus, jqXHR)
            {
                console.log("Done!");
                $('.sidebar-right').removeClass('sidebar-open');
                $('#'+lead_id).children().hide(200);
                $('#'+lead_id).children('.reply_sent_status_hidden').removeClass('reply_sent_status_hidden').show();
                $('li').removeClass('replying', 20000);
            },
            error: function (jqXHR, textStatus, errorThrown)
            {
                alert("Something went wrong, please try again later.");
            }
        });




    });



};

$(document).ready(ready);
$(document).on('page:load', ready);


