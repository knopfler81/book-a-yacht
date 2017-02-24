$(function() {
  var autocomplete = $('.autocomplete').get(0);

  if (autocomplete) {
    new google.maps.places.Autocomplete(autocomplete, { types: ['geocode'] });
    google.maps.event.addDomListener(autocomplete, 'keydown', function(e) {
      if (e.keyCode == 13) {
        e.preventDefault(); // Do not submit the form on Enter.
      }
    });
  }
});
