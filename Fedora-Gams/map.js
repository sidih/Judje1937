function initialize() {
        
        var map, infowindow, marker, listItems;
        
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 4,
          center: new google.maps.LatLng(46.11, 14.83),
          mapTypeId: google.maps.MapTypeId.ROADMAP
        });

        var markers = [];
        
        for (var i = 0; i < data.places.length; i++) {
        
          var dataPlaces = data.places[i];
          var dataPlacesPlace = dataPlaces.place;
          var latLng = new google.maps.LatLng(dataPlaces.latitude,
              dataPlaces.longitude);
              
          var marker = new google.maps.Marker({
            position: latLng,
            title: dataPlacesPlace
          });
          markers.push(marker);
          
          
          
          (function(i, marker, dataPlacesPlace) {
              google.maps.event.addListener(marker, 'click', function() {
                  listItems = '<ul class="infoWindow">' + '<p>' + dataPlacesPlace + ':</p>'
                  for (var j = 0; j < data.places[i].persons.length; j++) {
                      var persons = 
                        listItems = listItems + '<li><a href="http://fedora.sistory.si/fedora/objects/o:Judje1937/methods/sdef:TEI/get?context=' + data.places[i].persons[j].id + '" target="_blank">' + data.places[i].persons[j].name + '</a></li>'
                      }
                  listItems = listItems + '</ul>';
                  var infowindow = new google.maps.InfoWindow({
                      content: listItems
                  });
                  infowindow.open(map, marker);
            })
          })(i, marker, dataPlacesPlace);
          
        }
        
        var markerCluster = new MarkerClusterer(map, markers);
        
      }
      google.maps.event.addDomListener(window, 'load', initialize);
