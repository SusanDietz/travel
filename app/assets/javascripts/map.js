$( document ).ready(function() {
var mapOptions = {
  center: new google.maps.LatLng(53.184562, 44.973993),
  zoom: 18,
  mapTypeId: google.maps.MapTypeId.HYBRID
};
var handler = Gmaps.build('Google');
handler.buildMap({provider: mapOptions,  internal: {id: 'map-canvas'}}, function(){
  var markers = handler.addMarkers(gmap_points)
});

  google.maps.event.addListener(handler.getMap(), 'click', function(event) {
      console.log(event.latLng);
  });

  google.maps.event.addListener(handler.getMap(), 'dblclick', function(event) {

  var description = prompt('Description','Description here');

  if  (description) {
    var newPoint = {
      name: 'lel',
      description: description,
      latitude: event.latLng.d,
      longitude: event.latLng.e
    }
    $.ajax({
      type: 'post',
      url: '/points#create',
      data: {newPoint:newPoint},
      success: (function(){
          $('.points-list').append([name, description])
        }),
    });

    description = '<div id="tag">' + description + '</div>';
    var infowindow = new google.maps.InfoWindow({
      content: description
    });
    var marker = new google.maps.Marker({
        position: event.latLng,
        map: handler.getMap(),
        title: 'Hello World!',
    });
  };
  google.maps.event.addListener(marker, 'click', function() {
    infowindow.open(handler.getMap(),marker);
    });
  });
});
