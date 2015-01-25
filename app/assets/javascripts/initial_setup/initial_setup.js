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


