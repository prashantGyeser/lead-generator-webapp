$(document).ready(function(){
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


    $('.reply').click(function(event){
        event.preventDefault();

        var screen_name = $(this).data('screen-name');
        var lead_id = $(this).data('lead-id');

        $('#lead_being_replied_to').val(lead_id);
        $('#replying_to').text(screen_name);

    });

    $('#send_reply_button').click(function(event){
        event.preventDefault();

        var lead_id = $('#lead_being_replied_to').val();

        $('.sidebar-right').removeClass('sidebar-open');
        $('#'+lead_id).children().hide();
        $('#'+lead_id).children('.reply_sent_status_hidden').removeClass('reply_sent_status_hidden').show();

    });

});