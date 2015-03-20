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
//= require dashboard/core
//= require dashboard/chat
//= require dashboard/demo
//= require dashboard/lead_streams
//= require dashboard/lead


$(document).ready(function(e){

  //Traditional form validation sample
  $('#form_traditional_validation').validate({
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

      $('#1').hide(500);

    }
  });

});