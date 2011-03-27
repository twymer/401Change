/**
 * @file
 * Put a google map in a div with the id 'map_canvas'.
 * If there is an element with the id 'submit' set up an onclick function that
 *     will get an address from the element with id 'address' and do a
 *     geolocation search on it.  Update the address and lat/lng inputs with
 *     results.
 * If markers is defined as an array, draw markers on the map.
 * If markers is a single object, the map will be draw a single movable marker.
 * markers should be defined inline in the html document or in another script
 *     file included AFTER this file.
 *
 * marker objects should have this format:
 * {
 *     lat: latitude,
 *     lng: longitute,
 *     address: address,
 *     id: id to look up in db
 *     title: title for tooltip
 * }
 */


var map;
var geocoder;
var marker = null;
var infowindow = new google.maps.InfoWindow();

var maxZoomService = new google.maps.MaxZoomService();
var tokyo = new google.maps.LatLng(35.6894875, 139.6917064);

var initialLocation;
var siberia = new google.maps.LatLng(60, 105);
var newyork = new google.maps.LatLng(40.69847032728747, -73.9514422416687);
var browserSupportFlag =  new Boolean();

/**
 * Set up the map and draw pins on it if marker is an array.
 */
function initialize() {
    // get the user's location.
    var myOptions = {
        zoom: 11,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
    geocoder = new google.maps.Geocoder();

    // we have not specified a marker, so get the user's location.
    if(marker == null){
        getUserLocation();
    }
    // drop pins on the map
    // we assume that an array will not have lat defined
    else if(marker.lat == undefined){
        avgLat = 0;
        avgLng = 0;
        for(var n = 0; n< marker.length; n++){
            var myLatlng = new google.maps.LatLng(marker[n].lat,marker[n].lng);
            var mark = new google.maps.Marker({
                position: myLatlng
                ,map: map
                ,title: marker[n].title
            });
            avgLat += marker[n].lat;
            avgLng += marker[n].lng;

            mark.markerIndex = n;

            google.maps.event.addListener(mark, 'click', viewObject);
        }

        // TODO: calculate zoom level based on locations?

        avgLat /= marker.length;
        avgLng /= marker.length;

        map.setCenter(new google.maps.LatLng(avgLat,avgLng));

    }

    // one marker specified, fill in form details.
    else{
        var myLatlng = new google.maps.LatLng(marker.lat,marker.lng);
        new google.maps.Marker({
            position: myLatlng
            ,map: map
            ,title: marker.title
        });
        map.setCenter(myLatlng);
        map.setZoom(11);
        $('#address').val(marker.address);
        $('#lat').val(marker.lat);
        $('#lng').val(marker.lng);
    }


}

function showMaxZoom(e) {
    maxZoomService.getMaxZoomAtLatLng(e.latLng, function(response) {
        if (response.status != google.maps.MaxZoomStatus.OK) {
            alert("Error in MaxZoomService");
            return;
        } else {
            alert("The maximum zoom at this location is: " + response.zoom);
        }
        map.setCenter(e.latLng);
    });


    var myOptions = {
        zoom: 8,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    var map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);

}

/**
 * Get the user's location from their browser and center the map on it.
 */
function getUserLocation(){
  // Try W3C Geolocation (Preferred)
    if(navigator.geolocation) {
        browserSupportFlag = true;
        navigator.geolocation.getCurrentPosition(function(position) {
            initialLocation = new google.maps.LatLng(position.coords.latitude,position.coords.longitude);
            map.setCenter(initialLocation);
        }, function() {
            handleNoGeolocation(browserSupportFlag);
        });
    // Try Google Gears Geolocation
    } else if (google.gears) {
        browserSupportFlag = true;
        var geo = google.gears.factory.create('beta.geolocation');
        geo.getCurrentPosition(function(position) {
            initialLocation = new google.maps.LatLng(position.latitude,position.longitude);
            map.setCenter(initialLocation);
        }, function() {
            handleNoGeoLocation(browserSupportFlag);
        });
    // Browser doesn't support Geolocation
    } else {
        browserSupportFlag = false;
        handleNoGeolocation(browserSupportFlag);
    }

    function handleNoGeolocation(errorFlag) {
    if (errorFlag == true) {
        alert("Geolocation service failed.");
        initialLocation = newyork;
    } else {
        alert("Your browser doesn't support geolocation. We've placed you in Siberia.");
        initialLocation = siberia;
    }
        map.setCenter(initialLocation);
    }
}

/**
 * Hook up the submit button to do an ajax query.
 */
$(document).ready(function(){
    $('#submit').click(function(e){
        codeAddress();
        e.preventDefault();
        return false;
    });
});


/**
 * Get the address from the address box, find the lat/lng and center the map
 * on it.
 */
function codeAddress() {
    var address = document.getElementById("address").value;
    if(address == '') return;
    geocoder.geocode( { 'address': address}, function(results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
            map.setCenter(results[0].geometry.location);
            codeLatLng(results[0].geometry.location);
        } else {
            alert("Geocode was not successful for the following reason: " + status);
        }
    });
}


/**
 * Get the google address for a lat/lng and place a marker on the map.  Also
 * allow the marker to be dragged to a new location.
 */
function codeLatLng(latlng) {
    geocoder.geocode({'latLng': latlng}, function(results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
            if (results[0]) {
                map.setZoom(11);
                marker = new google.maps.Marker({
                    position: latlng
                    ,map: map
                    ,draggable: true
                    ,title: results[0].formatted_address
                });
                google.maps.event.addListener(marker, 'dragend', updateMarkerTitle);

                // update the address value
                $('#address').val(results[0].formatted_address);
                $('#lat').val(results[0].geometry.location.lat());
                $('#lng').val(results[0].geometry.location.lng());

            }
        } else {
            alert("Geocoder failed due to: " + status);
        }
    });
}

/**
 * Update the address in the title on a marker when it is moved. Also change the
 * address in the address box and the hidden lat/lng inputs.
 */
function updateMarkerTitle(e){
    var marker = this;
    // set marker title text to new location
    geocoder.geocode({'latLng': e.latLng}, function(results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
            console.log(results);
            marker.setTitle(results[0].formatted_address);
            $('#address').val(results[0].formatted_address);
            $('#lat').val(results[0].geometry.location.lat());
            $('#lng').val(results[0].geometry.location.lng());

        } else {
            alert("Geocoder failed due to: " + status);
        }
    });
}

/**
 * Navigate to the page corresponding to the clicked marker.  
 */
function viewObject(){
//     this = marker
    window.location='someting?id='+marker[this.markerIndex];
}