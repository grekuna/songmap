document.addEventListener("turbolinks:load", function() {


    
    var map = new GMaps({
        div: '#map',
        lat: 38.5816,
        lng: -121.4944,
        markerClusterer: function(map) {
            options = {
              gridSize: 40
            }
   
            return new MarkerClusterer(map, [], options);
          }
        });
   


    var songs = JSON.parse(document.querySelector("#map").dataset.songs);
    window.songs = songs;

    var bounds = new google.maps.LatLngBounds();

    var markers = [];
    songs.forEach(function(song){
        if (song.latitude && song.longitude) {
            var marker = map.addMarker({
                lat: song.latitude,
                lng: song.longitude,
                title: song.address,
                infoWindow: {
                    content: `<iframe src="https://open.spotify.com/embed/track/${song.spotifyurl}" width="300" height="80" frameborder="0" allowtransparency="true"></iframe>`
                }
                
            });
            markers.push(marker);
            window.markers = markers;
            bounds.extend(marker.position);
        }
    });
    map.fitBounds(bounds);

    var options = {
        imagePath: '../../../assets/images'
    };
  

});

