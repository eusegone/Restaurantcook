function initialize() {
  var defaultLatLng = new google.maps.LatLng(51.504982, -0.126606);

  var mapOptions = {
    zoom: 10,
    center: defaultLatLng
  };

  var map = new google.maps.Map(document.getElementById('users-map-canvas'), mapOptions);

  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(function (position) {
      initialLocation = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
      map.setCenter(initialLocation);
      map.setZoom(16);

      var markerOptions = {
        position: {
          lat: position.coords.latitude,
          lng: position.coords.longitude
        }
      };

      var marker = new google.maps.Marker(markerOptions);
      marker.setMap(map)
    });
  }

  function ajaxSuccess(data) {

    $(data).each(function(index, restaurant) {
      var name = restaurant.name;
      var latitude = parseFloat(restaurant.latitude);
      var longitude = parseFloat(restaurant.longitude);
      var markerOptions = {
        position: {
          lat: latitude,
          lng: longitude
        }
      };
      var marker = new google.maps.Marker(markerOptions);
      marker.setMap(map);
    });
  }

  function ajaxFail(data) {
    console.log('failed restaurants ajax lookup: ', data);
  }

  function addRestaurants() {
    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(function (position) {

        $.get('/restaurants/near',
          {
            lat: position.coords.latitude,
            lng: position.coords.longitude,
            radius: 5
          })
        .success(ajaxSuccess)
        .error(ajaxFail);
      });
    }
  }

  addRestaurants();
}


$(document).ready(function() {

  if ($('#users-map-canvas').length > 0) {
    initialize();
    
  }
});