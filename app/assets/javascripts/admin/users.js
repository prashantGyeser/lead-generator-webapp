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

    });


    $('#submit_keyword').click(function(){
        var new_keyword = $('#keyword_field').val();
        var lead_stream_id = $(this).data("lead-stream-id");

        if (new_keyword.length === 0) {
            alert("Please add a keyword. It is blank right now!");
        }
        else {
            data_to_post = {term: new_keyword, lead_stream_id: lead_stream_id};
            $.post( "/admin/users/lead_streams/keywords", data_to_post ,function( response,status ) {
              console.log(response);
              console.log(status);

                //$('.keyword_list ul').append('<li class="bold admin_created"><a href="//admin/users/lead_streams/keywords/' + response.id + '">' + response.term + '</a></li>')

              $('.keywords').append('<span style="margin-left: 15px; color: #1ABC9C">' + response.term + '</span>')




            });
        }

    });


    $('.set_sample_category a').click(function(event){

        event.preventDefault();

        var set_sample_category_form = $(this).parent();
        var data_to_post = set_sample_category_form.serializeArray();

        $.post( "/admin/users/set_sample_category", data_to_post ,function( response,status ) {
            console.log(response);
            console.log(status);

            if(status === "success")
            {
                set_sample_category_form.hide().animate(1000);
            }
            else
            {

            }


        });

    });


  $('.sample_category a.set').click(function(e){
    e.preventDefault();
    $('#sample_category_user_id').val($(this).data('user-id'));
  });

  $('#store_sample_category').click(function(e){
    event.preventDefault();

    var set_sample_category_form = $(this).parent();
    var data_to_post = set_sample_category_form.serializeArray();

    var inst = $.remodal.lookup[$('[data-remodal-id=modal]').data('remodal')];


    $.post( "/admin/users/set_sample_category", data_to_post ,function( response,status ) {
      console.log(response);
      console.log(status);

      if(status === "success")
      {
        //set_sample_category_form.hide().animate(1000);
        var user_id = $('#sample_category_user_id').val();
        td_to_hide = 'td#' + user_id;

        $(td_to_hide).children().hide();

        inst.close();
      }
      else
      {
        alert("Something went wrong, let me know and I will have a look at it");
      }
    });

  });


  $('.not_working').click(function(e){

    var keyword_id = $(this).data("id");
    // Todo: Send the data to the server and mark the keyword as not working

    $.post( "/admin/users/set_not_working_keyword", {keyword_id: keyword_id} ,function( response,status ) {
      console.log(response);
      console.log(status);

      if(status === "success")
      {
        alert("Marked keyword as not working!");
      }
      else
      {
        alert("Something went wrong, let me know and I will have a look at it");
      }
    });


  })


});