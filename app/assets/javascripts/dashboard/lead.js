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
});