var sentPoint;
$( document ).ready(function() {
  var directionsDisplay;
  var directionsService = new google.maps.DirectionsService();
  var mapOptions = {
    center: new google.maps.LatLng(53.184562, 44.973993),
    zoom: 18,
  };
  map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);


  directionsDisplay = new google.maps.DirectionsRenderer();
  directionsDisplay.setMap(map);

  if (gmap_points.length > 1) {
    var start = new google.maps.LatLng(gmap_points[0].lat, gmap_points[0].lng);
    var end = new google.maps.LatLng(gmap_points[gmap_points.length-1].lat, gmap_points[gmap_points.length-1].lng);
    var waypoints = [];
    var  waypoint;
    for (var i=1; i<gmap_points.length-1; i++) {
      waypoint = new google.maps.LatLng(gmap_points[i].lat, gmap_points[i].lng);
      waypoints.push({
        location: waypoint,
        stopover: true
      });
    };
    var request = {
        origin: start,
        destination: end,
        waypoints: waypoints,
        travelMode: google.maps.TravelMode.DRIVING
    };
    directionsService.route(request, function(response, status) {
      if (status == google.maps.DirectionsStatus.OK) {
        directionsDisplay.setDirections(response);
      }
    });
  };

  google.maps.event.addListener(map, 'dblclick', function(event) {
    var description = prompt('Description','Description here');
    if  (description) {
      sentPoint = {
        name: name,
        description: description,
        latitude: event.latLng.d,
        longitude: event.latLng.e
      }

      $.ajax({
        type: 'post',
        url: window.location+'/points#new',
        data: {point: sentPoint},
        dataType: 'script',
        success: (function(){
          }),
      });

      description = '<div id="tag">' + description + '</div>';
      var infowindow = new google.maps.InfoWindow({
        content: description
      });
      var marker = new google.maps.Marker({
          position: event.latLng,
          map: map,
          title: name,
      });
      google.maps.event.addListener(marker, 'click', function() {
        infowindow.open(map.getMap(),marker);
      });
    };
  });

});


