       var tiles = L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
				maxZoom: 18
			}),
			latlng = L.latLng(46.11, 14.83);

		var map = L.map('map', {center: latlng, zoom: 8, layers: [tiles]});

		var markers = L.markerClusterGroup();
		
		for (var i = 0; i < data.places.length; i++) {
			var dataPlaces = data.places[i];
			var dataPlacesPlace = dataPlaces.place;
			var lat = dataPlaces.latitude;
			var ltg = dataPlaces.longitude;
			var marker = L.marker(new L.LatLng(lat, ltg));
			var listItems = '<ul class="infoWindow">' + '<p>' + dataPlacesPlace + ':</p>'
                  for (var j = 0; j < data.places[i].persons.length; j++) {
                      var persons = 
                        listItems = listItems + '<li><a href="person.html?id=' + data.places[i].persons[j].id + '" target="_blank">' + data.places[i].persons[j].name + '</a></li>'
                      }
                  listItems = listItems + '</ul>';
                  
			marker.bindPopup(listItems);
			markers.addLayer(marker);
		}

		map.addLayer(markers);