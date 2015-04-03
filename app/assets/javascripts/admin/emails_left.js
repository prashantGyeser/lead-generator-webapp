$(document).ready(function(){

  $('.new_stream').click(function(){
    var email_left_id = $(this).data("email-left-id");
    $('#email_left_id').val(email_left_id);
  });

  $('#create_new_lead_stream').submit(function(e){
    e.preventDefault();

    var data_to_submit = $(this).serialize();

    $.ajax({
      url : "/admin/emails_left/create_lead_stream",
      type: "POST",
      data : data_to_submit,
      success: function(data, textStatus, jqXHR)
      {
        location.reload();
      },
      error: function (jqXHR, textStatus, errorThrown)
      {
        alert("Something went wrong try again! Make sure the city is set for the user.");
        console.log(jqXHR);
      }
    });

  })
});