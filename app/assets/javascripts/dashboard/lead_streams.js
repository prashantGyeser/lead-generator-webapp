var ready;
ready = function() {

  function get_keywords(lead_stream_id)
  {
    var modal_body = $(".modal-body")
    var keywords;

    var jqxhr = $.get( "/dashboard/lead_streams/get_keywords/" + lead_stream_id , function(data, status) {
      keywords = data;
    })
        .fail(function() {
          alert( "Something went wrong, please try again later" );
        });

    // Set another completion function for the request above
    jqxhr.always(function() {
      if (jQuery.isEmptyObject(keywords)){
        modal_body.empty();
        modal_body.append('<div class="alert"><button class="close" data-dismiss="alert"></button>Info:&nbsp;Looks like you have not set any keywords yet! </div>');
      }
      else{
        modal_body.empty();
        modal_body.append('<table class="table table-striped" id="keyword_table"></table>');

        var table = $('#keyword_table');
        console.log(keywords);
        keywords.forEach( function (keyword){
          console.log(keyword.term);
          table.append('<tr><td>'+ keyword.term +'</td><td><a href="#" class="text-error" data-id="' + keyword.id + '">Delete</a></td></tr>')
        });

      }
    });



  }

  function delete_keyword(keyword_id)
  {

  }

  function add_keyword(lead_stream_id, term)
  {

  }


  $('.edit-stream').click(function(e){
    e.preventDefault();

    var lead_stream_id = $(this).data("id");

    // Todo: Set the value of the lead stream being edited
    // Getting the keywords for the selected lead stream
    var keywords = get_keywords(lead_stream_id);
    console.log(keywords);

    // Todo: Get the keywords for the paticular lead stream

    // Todo: Allow a user to delete a keyword

    // Todo: Allow a user to add a new keyword for a lead stream

    // Todo: Allow a user to modify the lead stream


  })

};

$(document).ready(ready);
$(document).on('page:load', ready);