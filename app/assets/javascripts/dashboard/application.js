// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require plugins/pace/pace.min
//= require plugins/jquery-1.8.3.min
//= require jquery_ujs
//= require plugins/modernizr
//= require plugins/jquery-ui/jquery-ui-1.10.1.custom.min
//= require plugins/boostrapv3/js/bootstrap.min
//= require plugins/jquery-scrollbar/jquery.scrollbar.min
//= require plugins/velocity/velocity.min
//= require plugins/jquery-validation/js/jquery.validate.min
//= require plugins/breakpoints
//= require plugins/jquery-character-counter/jquery.charactercounter
//= require plugins/jquery-flot/jquery.flot.animator.min
//= require plugins/jquery-flot/jquery.flot.min
//= require dashboard/core
//= require dashboard/chat
//= require dashboard/demo
//= require dashboard/lead_streams
//= require dashboard/lead
//= require dashboard/reports


$(document).ready(function(e){

  /*****************************************************************************************************************/
  /* Functions */
  /*****************************************************************************************************************/
  function remove_notification(notification_id) {
    //This function assumes the highest level element in the notification message in the ui
    // is associated with the server notification id

    // Archive the notification on the server

    var data_to_submit = {notification_id: notification_id};

    var responce;

    request = $.ajax({
      url : "/dashboard/notifications/archive",
      type: "POST",
      data : data_to_submit,
      success: function(data, textStatus, jqXHR)
      {
        // Hiding the notification
        $('#'+notification_id).hide(500);
        var notification_count = parseInt($('#notification_counter').text());
        $('#notification_counter').text((notification_count - 1))

        responce = true;
      },
      error: function (jqXHR, textStatus, errorThrown)
      {
        alert("error");
        responce = false
      }
    });

    request.done(function(data){
      set_no_website_status(responce)
    });


  }

  function set_no_website_status(result){
    if (result == true){
      $('#form_traditional_validation').hide(500);
      $('#set_website_modal').append('<div class="modal-body"><div class="alert alert-success"><button class="close" data-dismiss="alert"></button>Success:&nbsp;Added your website. </div></div>')
    }
    else{

    }


  }





  $("body").on('click', 'a.set_website', function () {
    $('#notification_id').val($(this).data("notification-id"));
  });



  //Traditional form validation sample
  $('#form_traditional_validation').submit(function(e) {
    e.preventDefault();
  }).validate({
    focusInvalid: false,
    ignore: "",
    rules: {
      websiteUrl: {
        required: true,
        url: true
      }
    },

    invalidHandler: function (event, validator) {
      //display error alert on form submit
    },

    errorPlacement: function (label, element) { // render error placement for each input type
      $('<span class="error"></span>').insertAfter(element).append(label)
      var parent = $(element).parent('.input-with-icon');
      parent.removeClass('success-control').addClass('error-control');
    },

    highlight: function (element) { // hightlight error inputs
      var parent = $(element).parent();
      parent.removeClass('success-control').addClass('error-control');
    },

    unhighlight: function (element) { // revert the change done by hightlight

    },

    success: function (label, element) {
      var parent = $(element).parent('.input-with-icon');
      parent.removeClass('error-control').addClass('success-control');
    },

    submitHandler: function (form) {

      var notification_id = $('#notification_id').val();

      var website = $('#websiteUrl').val();

      var data_to_submit = { website: website };

      $.ajax({
        url : "/dashboard/notifications/set_user_website",
        type: "POST",
        data : data_to_submit,
        success: function(data, textStatus, jqXHR)
        {
          remove_notification(notification_id);
          // Todo: Either close the modal or show a success message in the modal
        },
        error: function (jqXHR, textStatus, errorThrown)
        {
          // Todo: Show an error notification
        }
      });


      return false; // required to block normal submit when using ajax


    }
  });



});