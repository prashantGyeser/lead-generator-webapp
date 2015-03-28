var ready;
ready = function() {

  var $citiesField = jQuery("#lead_stream_city_name");

  $citiesField.autocomplete({
    source: function (request, response) {
      jQuery.getJSON(
              "http://gd.geobytes.com/AutoCompleteCity?callback=?&q=" + request.term,
          function (data) {
            response(data);
          }
      );
    },
    minLength: 3,
    select: function (event, ui) {
      var selectedObj = ui.item;
      placeName = selectedObj.value;
      if (typeof placeName == "undefined") placeName = $citiesField.val();
      return false;
    },
    focus: function() {
// prevent value inserted on focus
      return false;
    }
  });

  $citiesField.autocomplete("option", "delay", 100);

};

$(document).ready(ready);
$(document).on('page:load', ready);


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

;
