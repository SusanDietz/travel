$( document ).ready(function() {
  // var directionsDisplay = new google.maps.DirectionsRenderer();
  // var directionsService = new google.maps.DirectionsService();
handler = Gmaps.build('Google');
handler.buildMap({ provider: {}, internal: {id: 'map-canvas'}}, function(){
  markers = handler.addMarkers([
    {
      "lat": 53.184660,
      "lng": 44.972893,
      "picture": {
        "url": "https://addons.cdn.mozilla.net/img/uploads/addon_icons/13/13028-64.png",
        "width":  36,
        "height": 36
      },
      "infowindow": "hello!"
    }
  ]);
  handler.bounds.extendWith(markers);
  handler.fitMapToBounds();
});

  var mapOptions = {
    center: new google.maps.LatLng(53.184660, 44.972893),
    zoom: 19}



});

