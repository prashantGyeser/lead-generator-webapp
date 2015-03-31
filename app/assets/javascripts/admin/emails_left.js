$(document).ready(function(){
  $('#create_new_lead_stream').submit(function(e){
    e.preventDefault();

    var data_to_submit = $(this).serialize();

    $.ajax({
      url : "/admin/emails_left/create_lead_stream",
      type: "POST",
      data : data_to_submit,
      success: function(data, textStatus, jqXHR)
      {
        alert("Woohoo!")
      },
      error: function (jqXHR, textStatus, errorThrown)
      {
        alert("Something went wrong try again")
      }
    });

  })
});