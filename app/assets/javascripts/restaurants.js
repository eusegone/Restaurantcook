var cookMaps = cookMaps || {};

$(document).ready(function() {
   $('.carousel').carousel({
       interval: 3000
   });

  var currentLatitude = parseFloat($('#latitude').text());
  var currentLongitude = parseFloat($('#longitude').text());
  
  
  cookMaps.initialize = function() {
  /*************
  MAP:
  **************/ 
  var mapOptions = {

    center: { 
      lat:  currentLatitude, 
      lng: currentLongitude
    }, 

    zoom: 14
  };

    cookMaps.restaurantsMap = new google.maps.Map(cookMaps.mapCanvas, mapOptions);

  /*************
  MARKER:
  **************/   

    // var markerOptions = {
    //   position: { 
    //     lat: currentLatitude, 
    //     lng: currentLongitude 
    //   },
    //   icon: 'http://www.terranational.com/images/help_map_markers_blue.jpg'
    // };

    // var marker = new google.maps.Marker(markerOptions);

    // marker.setMap(cookMaps.restaurantsMap);

  /*************
  NEAR:
  **************/  

    $.get('/restaurants/near', 
      { lat: currentLatitude, 
        lng: currentLongitude, 
        radius: 5 })
    .success(cookMaps.ajaxSuccess)
    .error(cookMaps.ajaxFail);

  };

  cookMaps.ajaxSuccess = function(data) {
    $(data).each(function(index, restaurant) {
      var name = restaurant.name;
      var latitude = parseFloat(restaurant.latitude);
      var longitude = parseFloat(restaurant.longitude);
      var markerOptions = {
        position: { lat: latitude, lng: longitude }
      };
      var marker = new google.maps.Marker(markerOptions);
      marker.setMap(cookMaps.restaurantsMap);
    });
  };

  cookMaps.ajaxFail = function(data) {
    console.log('failed restaurants ajax lookup: ', data);
  };

  cookMaps.mapCanvas = $('#restaurants-map-canvas')[0];
  
  if(cookMaps.mapCanvas) { cookMaps.initialize(); }
 
});

