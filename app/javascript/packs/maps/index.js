document.addEventListener("turbolinks:load", function() {
    
    var map = new GMaps({
    div: '#map',
    lat: 38.5816,
    lng: -121.4944

    });


    var songs = JSON.parse(document.querySelector("#map").dataset.songs);
    window.songs = songs;

    var bounds = new google.maps.LatLngBounds();

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
        bounds.extend(marker.position);
        }
    });
    map.fitBounds(bounds);
    // TO DO: Cluster Markers
    // var markerCluster = new MarkerClusterer(map, songs);
  
});

