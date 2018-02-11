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
        console.log ('howdy')
        if (song.latitude && song.longitude) {
            var marker = map.addMarker({
                lat: song.latitude,
                lng: song.longitude,
                title: song.adress,
                infoWindow: {
                    content: '<iframe src="https://open.spotify.com/embed/track/5RStjc42UAYI2NMY3cYpgz" width="200" height="300" frameborder="0" allowtransparency="true"></iframe>'
                }
            });
        bounds.extend(marker.position);
        }
    });
    map.fitBounds(bounds);
});

