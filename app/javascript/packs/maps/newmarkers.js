console.log("newmarkers")

document.addEventListener("turbolinks:load", function() {
    
    var map = new GMaps({
        div: '#map2',
        lat: 38.5816,
        lng: -121.4944,
        draggable: true,
        click: function(e) {
            addMarker(e);
          },

    });
    window.debugmap = map;
    var marker
    function addMarker(e) {
        if ( marker ) {
            marker.setPosition(e.latLng);
        }
        else{
        marker = map.addMarker({
            lat: e.latLng.lat(),
            lng: e.latLng.lng(),
            draggable: true,
            title: "LALA"
        }); 
        window.marker = marker;
        lat = marker.getPosition().lat();
        lng = marker.getPosition().lng();
    }
    }

    // this.addMarker({
    //     lat: -12.043333,
    //     lng: -77.028333,
    //     title: "LALA"
    // }); 

});