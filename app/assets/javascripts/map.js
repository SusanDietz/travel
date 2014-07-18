$( document ).ready(function() {
  var directionsDisplay = new google.maps.DirectionsRenderer();
  var directionsService = new google.maps.DirectionsService();

    function calcRoute() {
      var origin      = new google.maps.LatLng(53.182209, 45.004350);
      var destination = new google.maps.LatLng(53.203139, 45.009586);
      var request = {
          origin:      origin,
          destination: destination,
          travelMode:  google.maps.TravelMode.DRIVING
      };
      directionsService.route(request, function(response, status) {
        if (status == google.maps.DirectionsStatus.OK) {
          directionsDisplay.setDirections(response);
        }
      });
  }

  calcRoute();

  var handler = Gmaps.build('Google');
  handler.buildMap({ internal: {id: 'map-canvas'}}, function(){
    directionsDisplay.setMap(handler.getMap());
  });
});

